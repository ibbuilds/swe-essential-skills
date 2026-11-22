import json
import re
import unittest
from pathlib import Path

HOOKS = Path(__file__).resolve().parent.parent / "hooks" / "hooks.json"


class SessionStartHookTest(unittest.TestCase):
    def setUp(self):
        self.entries = json.loads(HOOKS.read_text(encoding="utf-8"))["hooks"]["SessionStart"]

    def matches(self, source):
        return [e for e in self.entries if re.fullmatch(e.get("matcher", ".*"), source)]

    def test_reminder_runs_when_context_is_fresh(self):
        for source in ("startup", "clear", "compact"):
            self.assertEqual(len(self.matches(source)), 1, source)

    def test_reminder_skips_resume_where_transcript_has_it(self):
        self.assertEqual(self.matches("resume"), [])

    def test_reminder_uses_namespaced_skill_names(self):
        command = self.entries[0]["hooks"][0]["command"]
        for skill in ("tdd", "diagnose", "deps", "done"):
            self.assertIn(f"swe-essential-skills:{skill}", command)


if __name__ == "__main__":
    unittest.main()
