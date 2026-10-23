from pathlib import Path
import tempfile
import unittest

from scripts.validate_skills import validate


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

    def test_empty_pack_rejected(self):
        self.assertTrue(validate(self.root))


if __name__ == "__main__":
    unittest.main()
