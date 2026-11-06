"""Protect this suite's intended automatic discovery without claiming selection."""
from pathlib import Path
import unittest

import yaml


class SuiteInvocationTests(unittest.TestCase):
    def test_all_shipped_skills_allow_implicit_invocation(self):
        root = Path(__file__).resolve().parents[1]
        files = sorted((root / "skills").glob("*/agents/openai.yaml"))
        self.assertEqual(len(files), 18)
        for path in files:
            with self.subTest(skill=path.parent.parent.name):
                metadata = yaml.safe_load(path.read_text(encoding="utf-8"))
                self.assertIs(metadata.get("policy", {}).get("allow_implicit_invocation"), True)


if __name__ == "__main__":
    unittest.main()
