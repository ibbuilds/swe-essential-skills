from pathlib import Path
import tempfile
import json
import subprocess
import sys
import unittest

import yaml

from scripts.validate_skills import load_yaml, validate


class PortabilityTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.folder = self.root / "skills" / "swe-essential-skills-example"
        self.folder.mkdir(parents=True)
        (self.folder / "agents").mkdir()
        (self.folder / "agents" / "openai.yaml").write_text(
            'interface:\n  display_name: "swe-essential-skills-example"\n'
            '  short_description: "Apply a useful example workflow"\n', encoding="utf-8"
        )

    def skill(self, body="Useful instructions."):
        (self.folder / "SKILL.md").write_text(
            "---\nname: swe-essential-skills-example\ndescription: A useful workflow.\n---\n" + body,
            encoding="utf-8",
        )

    def test_self_contained_reference(self):
        (self.folder / "guide.md").write_text("Guidance.", encoding="utf-8")
        self.skill("[Read](guide.md#section) [Source](https://example.com)")
        self.assertEqual(validate(self.root), [])

    def test_missing_reference_rejected(self):
        self.skill("[Missing](missing.md)")
        self.assertTrue(validate(self.root))

    def test_existing_reference_outside_skill_rejected(self):
        (self.root / "shared.md").write_text("Shared.", encoding="utf-8")
        self.skill("[Shared](../../shared.md)")
        self.assertTrue(validate(self.root))

    def test_invalid_metadata_rejected(self):
        (self.folder / "SKILL.md").write_text("---\n- not-a-mapping\n---\nText.", encoding="utf-8")
        self.assertTrue(validate(self.root))

    def test_unprefixed_identity_rejected(self):
        self.skill()
        old_folder = self.folder.with_name("example")
        self.folder.rename(old_folder)
        entry = old_folder / "SKILL.md"
        entry.write_text(entry.read_text().replace("swe-essential-skills-example", "example"))
        self.assertTrue(any("repository prefix" in error for error in validate(self.root)))

    def test_previous_publisher_prefix_rejected(self):
        self.skill()
        old_folder = self.folder.with_name("ibbuilds-swe-example")
        self.folder.rename(old_folder)
        entry = old_folder / "SKILL.md"
        entry.write_text(entry.read_text().replace("swe-essential-skills-example", "ibbuilds-swe-example"))
        self.assertTrue(any("repository prefix" in error for error in validate(self.root)))

    def test_readable_display_alias_rejected(self):
        self.skill()
        ui = self.folder / "agents" / "openai.yaml"
        ui.write_text(ui.read_text().replace("swe-essential-skills-example", "SWE Essential Skills / Example"))
        self.assertTrue(any("display name" in error for error in validate(self.root)))

    def test_name_folder_mismatch_rejected(self):
        self.skill()
        self.folder.rename(self.folder.with_name("swe-essential-skills-other"))
        self.assertTrue(any("match folder" in error for error in validate(self.root)))

    def test_unbranded_presentation_rejected(self):
        self.skill()
        ui = self.folder / "agents" / "openai.yaml"
        ui.write_text(ui.read_text().replace("swe-essential-skills-example", "Example"))
        self.assertTrue(any("display name" in error for error in validate(self.root)))

    def test_missing_presentation_rejected(self):
        self.skill()
        (self.folder / "agents" / "openai.yaml").unlink()
        self.assertTrue(validate(self.root))

    def test_unusable_short_description_rejected(self):
        self.skill()
        ui = self.folder / "agents" / "openai.yaml"
        ui.write_text(ui.read_text().replace("Apply a useful example workflow", ""))
        self.assertTrue(any("short description" in error for error in validate(self.root)))

    def test_invalid_reference_encoding_is_reported_without_aborting(self):
        self.skill("[Read](guide.md) [Missing](missing.md)")
        (self.folder / "guide.md").write_bytes(b"\xff")
        errors = validate(self.root)
        self.assertTrue(any("guide.md: cannot read Markdown" in error for error in errors))
        self.assertTrue(any("missing reference: missing.md" in error for error in errors))

    def test_malformed_url_is_reported_and_later_links_are_checked(self):
        self.skill("[Malformed](https://[broken) [Missing](missing.md)")
        errors = validate(self.root)
        self.assertTrue(any("invalid or unreadable reference https://[broken" in error for error in errors))
        self.assertTrue(any("missing reference: missing.md" in error for error in errors))

    def test_deep_yaml_is_reported_and_later_skills_checked(self):
        self.skill()
        first = self.folder / "SKILL.md"
        original = first.read_text(encoding="utf-8")
        ui = self.folder / "agents/openai.yaml"
        original_ui = ui.read_text(encoding="utf-8")
        later = self.root / "skills/swe-essential-skills-later/SKILL.md"
        later.parent.mkdir()
        later.write_text("---\n- not-a-mapping\n---\nInstructions.\n", encoding="utf-8")
        valid = self.root / "skills/swe-essential-skills-valid/SKILL.md"
        valid.parent.mkdir()
        valid.write_text(original.replace(self.folder.name, valid.parent.name), encoding="utf-8")
        (valid.parent / "agents").mkdir()
        (valid.parent / "agents/openai.yaml").write_text(
            original_ui.replace(self.folder.name, valid.parent.name), encoding="utf-8")
        code = ("import json, sys; from pathlib import Path; "
                "from scripts.validate_skills import load_yaml, validate; "
                "print(json.dumps(validate(Path(sys.argv[1]))))")
        for location in ("frontmatter", "ui"):
            with self.subTest(location=location):
                first.write_text(original, encoding="utf-8")
                ui.write_text(original_ui, encoding="utf-8")
                if location == "frontmatter":
                    first.write_text("---\n" + "[" * 1100 + "\n---\nInstructions.\n", encoding="utf-8")
                else:
                    ui.write_text("[" * 1100, encoding="utf-8")
                run = subprocess.run([sys.executable, "-c", code, str(self.root)],
                                     cwd=Path(__file__).resolve().parents[1],
                                     capture_output=True, text=True, timeout=10)
                self.assertEqual(run.returncode, 0, run.stderr)
                self.assertEqual(run.stderr, "")
                errors = json.loads(run.stdout)
                self.assertEqual(len(errors), 2)
                self.assertIn(f"{first.relative_to(self.root)}: YAML nesting exceeds parser capacity:", errors[0])
                self.assertIn("maximum recursion depth exceeded", errors[0])
                self.assertIn(f"{later.relative_to(self.root)}: frontmatter must be a mapping", errors[1])
                self.assertLess(len(run.stdout), 1000)

    def test_frontmatter_delimiters_are_lines_not_inline_tokens(self):
        self.skill()
        entry = self.folder / "SKILL.md"
        original = entry.read_text(encoding="utf-8")
        entry.write_text(original.replace("A useful workflow.",
                                         '"Handle --- separators in Markdown."'),
                         encoding="utf-8")
        self.assertEqual(validate(self.root), [])

    def test_missing_closing_frontmatter_delimiter_is_rejected(self):
        self.skill()
        entry = self.folder / "SKILL.md"
        entry.write_text("---\nname: swe-essential-skills-example\n"
                         'description: "Handle --- separators."\nInstructions.\n',
                         encoding="utf-8")
        self.assertTrue(any("missing YAML frontmatter" in error for error in validate(self.root)))

    def test_empty_body_is_rejected_after_line_delimited_frontmatter(self):
        for body in ("", " \n\t"):
            with self.subTest(body=body):
                self.skill(body)
                self.assertTrue(any("missing skill instructions" in error for error in validate(self.root)))

    def test_whole_body_after_frontmatter_is_preserved(self):
        # A later Markdown horizontal rule must not truncate the instructions.
        self.skill("\n---\n[Missing](missing.md)\n")
        self.assertTrue(any("missing reference: missing.md" in error for error in validate(self.root)))
        self.skill("\n---\nUseful instructions after a horizontal rule.\n")
        self.assertEqual(validate(self.root), [])

    def test_portable_metadata_contract_without_root_extension_allowlist(self):
        self.skill()
        first = self.folder / "SKILL.md"
        # These enforce the portable spec, not every host's coercion behavior:
        # Codex accepts blank metadata and numeric short-description scalars.
        invalid = ("metadata: wrong\n", "metadata: null\n", "metadata:\n",
                   "metadata: []\n", "metadata: {author: [wrong]}\n",
                   "metadata: {short-description: {nested: wrong}}\n",
                   "metadata: {short-description: 123}\n",
                   "metadata: {enabled: true}\n", "metadata: {1: value}\n")
        valid = ("", "metadata: {}\n",
                 "metadata: {author: example, version: '1.0', short-description: '123'}\n",
                 "defaults: &defaults {author: example, version: '1.0'}\n"
                 "metadata: {<<: *defaults, author: other}\n",
                 "extra: &author example\nmetadata: {author: *author}\n",
                 "unknown-extension: {nested: [1, true]}\nlicense: MIT\n"
                 "compatibility: Requires Python.\nallowed-tools: Read\n")
        for extra in invalid + valid:
            with self.subTest(extra=extra):
                rejected = extra in invalid
                first.write_text(f"---\nname: {first.parent.name}\n"
                                 "description: A useful workflow.\n" + extra +
                                 "---\nUseful instructions.\n", encoding="utf-8")
                errors = validate(self.root)
                self.assertEqual(bool(errors), rejected, errors)
                if rejected:
                    self.assertIn("metadata must map string keys to string values", errors[0])

    def test_description_content_and_portable_character_limit(self):
        self.skill()
        first = self.folder / "SKILL.md"
        # Codex preserves long descriptions; 1024 is the portable spec limit.
        # Whitespace-only descriptions also fail the released host's loader.
        for description, rejected in (("   ", True), ("\t\n", True),
                                      ("💡" * 1024, False), ("💡" * 1025, True),
                                      ("  Useful description.  ", False)):
            with self.subTest(length=len(description), rejected=rejected):
                first.write_text(f"---\nname: {first.parent.name}\n"
                                 f"description: {json.dumps(description, ensure_ascii=False)}\n"
                                 "---\nUseful instructions.\n", encoding="utf-8")
                errors = validate(self.root)
                self.assertEqual(bool(errors), rejected, errors)
                if rejected:
                    self.assertIn("description must be nonempty text under 1,025 characters", errors[0])

    def test_duplicate_frontmatter_is_reported_and_later_skills_checked(self):
        self.skill()
        first = self.folder / "SKILL.md"
        original = first.read_text(encoding="utf-8")
        later = self.root / "skills/swe-essential-skills-later/SKILL.md"
        later.parent.mkdir()
        later.write_text("---\n- not-a-mapping\n---\nInstructions.\n", encoding="utf-8")
        for key, value in (("name", self.folder.name),
                           ("description", "A useful workflow."),
                           ('"description"', "A useful workflow.")):
            with self.subTest(key=key):
                first.write_text(original.replace("---\n", f"---\n{key}: {value}\n", 1),
                                 encoding="utf-8")
                errors = validate(self.root)
                self.assertEqual(len(errors), 2)
                self.assertIn(str(first.relative_to(self.root)), errors[0])
                self.assertIn("duplicate explicit key", errors[0])
                self.assertIn("line", errors[0])
                self.assertIn("frontmatter must be a mapping", errors[1])

    def test_explicit_duplicate_string_keys_in_yaml_mappings_are_rejected(self):
        for raw in (
            "name: first\nname: second\n",
            'description: first\n"description": second\n',
            "interface: {display_name: first, display_name: second}\n",
            "defaults: &base {author: first, author: second}\nmetadata: {<<: *base}\n",
            "&key description: first\n*key: second\n",
        ):
            with self.subTest(raw=raw):
                with self.assertRaisesRegex(yaml.YAMLError, "duplicate explicit key"):
                    load_yaml(raw)

    def test_yaml_preserves_optional_fields_aliases_and_merge_overrides(self):
        raw = ("name: &name swe-essential-skills-example\n"
               "description: A useful workflow.\nlicense: MIT\n"
               "compatibility: Requires Python.\nallowed-tools: Read\n"
               "metadata: &defaults {author: example, version: '1.0'}\n"
               "copy: *defaults\n"
               "override: {<<: *defaults, author: other}\n"
               "second: {<<: *defaults, version: '2.0'}\n"
               "alias: *name\n")
        parsed = load_yaml(raw)
        self.assertEqual(parsed["copy"], parsed["metadata"])
        self.assertEqual(parsed["override"], {"author": "other", "version": "1.0"})
        self.assertEqual(parsed["second"], {"author": "example", "version": "2.0"})
        self.assertEqual(parsed["alias"], parsed["name"])
        cycle = load_yaml("metadata: &cycle {self: *cycle}\n")
        self.assertIs(cycle["metadata"]["self"], cycle["metadata"])
        self.skill("Useful instructions.")
        entry = self.folder / "SKILL.md"
        entry.write_text("---\n" + raw + "---\nUseful instructions.\n", encoding="utf-8")
        self.assertEqual(validate(self.root), [])

    def test_empty_pack_rejected(self):
        self.assertTrue(validate(self.root))


if __name__ == "__main__":
    unittest.main()
