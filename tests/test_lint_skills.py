import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "scripts"))

import lint_skills  # noqa: E402

GOOD_DESCRIPTION = 'Bug diagnosis. Use when the user says "debug this" or "why is this failing", even when the fix looks obvious.'


class LintTestCase(unittest.TestCase):
    def setUp(self):
        self._tmp = tempfile.TemporaryDirectory()
        self.root = Path(self._tmp.name)
        (self.root / "skills").mkdir()
        (self.root / "evals").mkdir()

    def tearDown(self):
        self._tmp.cleanup()

    def write(self, relative, text):
        path = self.root / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")
        return path

    def skill(self, name, frontmatter, body="Reproduce the failure before changing code.\n"):
        return self.write(f"skills/{name}/SKILL.md", f"---\n{frontmatter}\n---\n\n{body}")

    def eval_case(self, name, grader="---\ntype: llm\n---\n\nPASS if it reproduces the failure first.\n"):
        self.write(f"evals/{name}/prompt.md", "---\nmax_turns: 4\n---\n\nDebug this failing test.\n")
        if grader is not None:
            self.write(f"evals/{name}/graders/criteria.md", grader)

    def problems(self):
        problems, _, _ = lint_skills.lint_repo(self.root)
        return problems

    def assertOneProblem(self, fragment):
        problems = self.problems()
        self.assertEqual(len(problems), 1, problems)
        self.assertIn(fragment, problems[0])


class SkillTests(LintTestCase):
    def test_valid_model_invoked_skill_with_trigger_case_passes(self):
        self.skill("debug", f"name: debug\ndescription: {GOOD_DESCRIPTION!r}")
        self.eval_case("debug-trigger-direct-1")
        self.assertEqual(self.problems(), [])

    def test_empty_repository_passes(self):
        self.assertEqual(lint_skills.lint_repo(self.root), ([], 0, 0))

    def test_model_invoked_description_needs_use_when(self):
        self.skill("debug", "description: Diagnoses bugs.")
        self.eval_case("debug-trigger-direct-1")
        self.assertOneProblem("'Use when'")

    def test_user_invoked_skill_needs_no_trigger_phrase_or_case(self):
        self.skill("ship", "description: Prepare the current branch for a pull request.\ndisable-model-invocation: true")
        self.assertEqual(self.problems(), [])

    def test_model_invoked_skill_needs_trigger_case(self):
        self.skill("debug", f"description: {GOOD_DESCRIPTION!r}")
        self.assertOneProblem("debug-trigger-")

    def test_long_description_is_rejected(self):
        self.skill("debug", f"description: 'Use when {'x' * 500}'")
        self.eval_case("debug-trigger-direct-1")
        self.assertOneProblem("characters")

    def test_multi_line_description_is_rejected(self):
        self.skill("debug", "description: Use when the user says debug this,\n  even when the fix looks obvious.")
        self.eval_case("debug-trigger-direct-1")
        self.assertOneProblem("single line")

    def test_block_scalar_description_is_rejected(self):
        self.skill("debug", "description: >\n  Use when the user says debug this.")
        self.eval_case("debug-trigger-direct-1")
        self.assertOneProblem("single line")

    def test_unquoted_colon_reports_yaml_error(self):
        self.skill("debug", "description: Use when: the user says debug this")
        self.assertOneProblem("not valid YAML")

    def test_missing_frontmatter_is_reported(self):
        self.write("skills/debug/SKILL.md", "# Debug\n")
        self.assertOneProblem("missing YAML frontmatter")

    def test_name_must_match_folder(self):
        self.skill("debug", f"name: debugging\ndescription: {GOOD_DESCRIPTION!r}")
        self.eval_case("debug-trigger-direct-1")
        self.assertOneProblem("must match the folder name")

    def test_plugin_name_prefix_is_rejected(self):
        self.write(".claude-plugin/plugin.json", '{"name": "demo-pack"}')
        self.skill("demo-pack-debug", "description: x\ndisable-model-invocation: true")
        self.assertOneProblem("repeat the plugin name")

    def test_prefix_check_needs_a_plugin_manifest(self):
        self.skill("demo-pack-debug", "description: x\ndisable-model-invocation: true")
        self.assertEqual(self.problems(), [])

    def test_names_longer_than_three_words_are_rejected(self):
        self.skill("one-two-three-four", "description: x\ndisable-model-invocation: true")
        self.assertOneProblem("at most three words")

    def test_word_budget_depends_on_type(self):
        body = "word " * 600
        self.skill("tdd", "description: x\ndisable-model-invocation: true", body)
        self.assertOneProblem("budget")
        self.skill("tdd", "description: x\ndisable-model-invocation: true\nmetadata:\n  type: discipline", body)
        self.assertEqual(self.problems(), [])

    def test_unknown_type_is_rejected(self):
        self.skill("debug", "description: x\ndisable-model-invocation: true\nmetadata:\n  type: workflow")
        self.assertOneProblem("metadata.type")

    def test_byte_cap(self):
        self.skill("debug", "description: x\ndisable-model-invocation: true\nmetadata:\n  type: discipline", "a" * 21_000)
        self.assertOneProblem("hard cap")

    def test_at_link_is_rejected_but_scoped_packages_are_not(self):
        self.skill("debug", "description: x\ndisable-model-invocation: true", "Read @REFERENCE.md first. Install @types/node.\n")
        self.assertOneProblem("force-loads")

    def test_links_must_exist_and_stay_inside_the_skill(self):
        self.skill("debug", "description: x\ndisable-model-invocation: true", "See [format](FORMAT.md) and [web](https://example.com).\n")
        self.assertOneProblem("missing file")
        self.write("skills/debug/FORMAT.md", "Format\n")
        self.assertEqual(self.problems(), [])
        self.write("skills/other/SKILL.md", "---\ndescription: x\ndisable-model-invocation: true\n---\n")
        self.skill("debug", "description: x\ndisable-model-invocation: true", "See [other](../other/SKILL.md).\n")
        self.assertOneProblem("leaves the skill folder")

    def test_reference_files_stay_one_level_deep(self):
        self.skill("debug", "description: x\ndisable-model-invocation: true")
        self.write("skills/debug/assets/TEMPLATE.md", "ok\n")
        self.assertEqual(self.problems(), [])
        self.write("skills/debug/references/DEEP.md", "nested\n")
        self.assertOneProblem("nested")

    def test_crlf_files_are_accepted(self):
        path = self.skill("debug", "description: x\ndisable-model-invocation: true")
        path.write_bytes(path.read_bytes().replace(b"\n", b"\r\n"))
        self.assertEqual(self.problems(), [])


class EvalCaseTests(LintTestCase):
    def test_case_needs_a_grader(self):
        self.eval_case("debug-trigger-direct-1", grader=None)
        self.assertOneProblem("at least one grader")

    def test_grader_type_must_be_known(self):
        self.eval_case("debug-trigger-direct-1", grader="---\ntype: judge\n---\n")
        self.assertOneProblem("type must be one of")

    def test_command_grader_only_in_shell_cases(self):
        grader = "---\ntype: command\nrun: bash check.sh\n---\n"
        self.eval_case("debug-trigger-direct-1", grader=grader)
        self.assertOneProblem("type must be one of")
        self.write("evals-shell/debug-behavior-1/prompt.md", "---\nmax_turns: 4\n---\n\nDebug this.\n")
        self.write("evals-shell/debug-behavior-1/graders/check.md", grader)
        self.assertEqual(len(self.problems()), 1)

    def test_case_needs_a_prompt(self):
        self.write("evals/empty-case/graders/criteria.md", "---\ntype: llm\n---\nPASS\n")
        self.assertOneProblem("prompt.md or case.yaml")

    def test_skill_grader_must_be_namespaced(self):
        self.write(".claude-plugin/plugin.json", '{"name": "demo-pack"}')
        bare = "---\ntype: tool_used\ntool: Skill\ninput_match: '\"skill\"\\s*:\\s*\"(?:[\\w-]+:)?debug\"'\n---\n"
        self.eval_case("debug-trigger-direct-1", grader=bare)
        self.assertOneProblem("demo-pack:<skill>")

    def test_namespaced_skill_grader_passes(self):
        self.write(".claude-plugin/plugin.json", '{"name": "demo-pack"}')
        named = "---\ntype: tool_used\ntool: Skill\ninput_match: '\"skill\"\\s*:\\s*\"demo-pack:debug\"'\n---\n"
        self.eval_case("debug-trigger-direct-1", grader=named)
        self.assertEqual(self.problems(), [])

    def test_results_folder_is_ignored(self):
        self.write("evals/results/2026/report.html", "<html></html>")
        self.assertEqual(self.problems(), [])


if __name__ == "__main__":
    unittest.main()
