from pathlib import Path
import tempfile
import unittest

from scripts.validate_skills import validate


class PortabilityTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.folder = self.root / "skills" / "example"
        self.folder.mkdir(parents=True)

    def skill(self, body="Useful instructions."):
        (self.folder / "SKILL.md").write_text(
            "---\nname: example\ndescription: A useful workflow.\n---\n" + body,
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

    def test_empty_pack_rejected(self):
        self.assertTrue(validate(self.root))


if __name__ == "__main__":
    unittest.main()
