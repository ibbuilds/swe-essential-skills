"""Regression checks for the optional acceptance checker's fail-closed wrapper."""
import contextlib
import importlib.util
import io
from pathlib import Path
import sys
import tempfile
import unittest
from unittest import mock


CHECKER = Path(__file__).resolve().parents[1] / "evaluations/sqlite-notes/check.py"
# Only satisfies the loader's export gate; deliberately not an implementation.
STUB = "\n".join(
    f"{name} = lambda *args, **kwargs: None"
    for name in ("create_v1", "legacy_list_notes", "Principal", "migrate",
                 "list_notes", "archive_note")
)


class EvaluationCheckerTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        spec = importlib.util.spec_from_file_location("acceptance_checker", CHECKER)
        self.checker = importlib.util.module_from_spec(spec)
        with mock.patch.object(sys, "dont_write_bytecode", True):
            spec.loader.exec_module(self.checker)
        # main registers the candidate for dataclass support; restore this too.
        previous = sys.modules.get("submitted_notes")
        def restore_module():
            if previous is None:
                sys.modules.pop("submitted_notes", None)
            else:
                sys.modules["submitted_notes"] = previous
        self.addCleanup(restore_module)

    def candidate(self, source):
        path = self.root / "notes.py"
        path.write_text(source, encoding="utf-8")
        return path

    def run_checker(self, path):
        out, err = io.StringIO(), io.StringIO()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
            status = self.checker.main([str(path)])
        self.assertNotIn("PASS:", out.getvalue())
        return status

    def test_missing_candidate_rejected(self):
        self.assertEqual(self.run_checker(self.root / "missing.py"), 2)

    def test_empty_candidate_rejected(self):
        self.assertEqual(self.run_checker(self.candidate("")), 2)

    def test_import_exit_zero_rejected(self):
        self.assertEqual(self.run_checker(self.candidate("raise SystemExit(0)")), 2)

    def test_zero_suite_rejected(self):
        with mock.patch.object(unittest.defaultTestLoader, "loadTestsFromTestCase",
                               return_value=unittest.TestSuite()):
            self.assertEqual(self.run_checker(self.candidate(STUB)), 2)

    def test_import_creates_no_bytecode_without_B(self):
        with mock.patch.object(sys, "dont_write_bytecode", False):
            self.assertEqual(self.run_checker(self.candidate("")), 2)
            self.assertFalse(sys.dont_write_bytecode)
        self.assertFalse((self.root / "__pycache__").exists())

    def test_unicode_target_diagnostic_on_ascii_console(self):
        path = self.root / "雪.py"
        path.write_text(STUB, encoding="utf-8")
        # An unresolved alias exercises path normalization on every platform.
        child = self.root / "child"
        child.mkdir()
        path = child / ".." / path.name
        # Exercise wrapper success without embedding a reference implementation.
        suite = unittest.TestSuite(
            unittest.FunctionTestCase(lambda: None)
            for _ in range(self.checker.EXPECTED_CHECKS)
        )
        raw = io.BytesIO()
        console = io.TextIOWrapper(raw, encoding="ascii", errors="strict")
        try:
            with mock.patch.object(unittest.defaultTestLoader, "loadTestsFromTestCase",
                                   return_value=suite):
                with contextlib.redirect_stdout(console), contextlib.redirect_stderr(io.StringIO()):
                    self.assertEqual(self.checker.main([str(path)]), 0)
            console.flush()
            output = raw.getvalue().decode("ascii")
            self.assertIn(f"TARGET={ascii(str(path.resolve(strict=True)))}", output)
            self.assertIn("PASS: 12 deterministic checks", output)
        finally:
            console.close()

    def test_prior_bytecode_setting_restored_on_failures(self):
        for previous in (False, True):
            for source in ("", "raise SystemExit(0)"):
                with self.subTest(previous=previous, source=source):
                    with mock.patch.object(sys, "dont_write_bytecode", previous):
                        self.assertEqual(self.run_checker(self.candidate(source)), 2)
                        self.assertIs(sys.dont_write_bytecode, previous)


if __name__ == "__main__":
    unittest.main()
