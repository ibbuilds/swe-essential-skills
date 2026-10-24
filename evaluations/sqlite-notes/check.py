"""Deterministic synthetic acceptance checks; see TASK.md for the full contract.

This imports and executes candidate Python, NOT a sandbox. Review candidate code
and use an appropriately isolated environment. Standard library only.
"""
import argparse
import dataclasses
import importlib.util
import pathlib
import sqlite3
import sys
import tempfile
import unittest

notes = None
EXPECTED_CHECKS = 12


ROWS = [(9, "alpha", "雪\n' ; DROP TABLE notes; --"),
        (3, "beta", "foreign synthetic body"), (1, "alpha", ""),
        (8, "t'enant雪", "literal")]


def snapshot(conn):
    return (conn.execute("PRAGMA user_version").fetchone(),
            conn.execute("SELECT type,name,tbl_name,sql FROM sqlite_master ORDER BY type,name").fetchall(),
            conn.execute("PRAGMA table_info(notes)").fetchall(),
            conn.execute("SELECT * FROM notes ORDER BY id").fetchall(),
            conn.execute("SELECT * FROM sentinel ORDER BY value").fetchall())


class ContractTests(unittest.TestCase):
    def fresh(self, rows=ROWS, path=":memory:"):
        conn = sqlite3.connect(path)
        self.addCleanup(conn.close)
        notes.create_v1(conn)
        conn.execute("CREATE TABLE sentinel(value TEXT)")
        conn.execute("INSERT INTO sentinel VALUES ('unrelated')")
        conn.executemany("INSERT INTO notes(id,tenant_id,body) VALUES (?,?,?)", rows)
        conn.commit()
        return conn

    def test_01_migration_exact_preservation_and_constraints(self):
        conn = self.fresh()
        before = notes.legacy_list_notes(conn)
        notes.migrate(conn)
        self.assertEqual(notes.legacy_list_notes(conn), before)
        self.assertEqual(conn.execute("SELECT * FROM sentinel").fetchall(), [("unrelated",)])
        self.assertEqual(conn.execute("PRAGMA user_version").fetchone(), (2,))
        self.assertEqual(conn.execute("SELECT DISTINCT archived FROM notes").fetchall(), [(0,)])
        conn.execute("INSERT INTO notes(id,tenant_id,body) VALUES (20,'alpha','old writer')")
        conn.commit()
        self.assertEqual(conn.execute("SELECT archived FROM notes WHERE id=20").fetchone(), (0,))
        for invalid in (None, 2):
            with self.assertRaises(sqlite3.IntegrityError):
                conn.execute("INSERT INTO notes(id,tenant_id,body,archived) VALUES (30,'alpha','x',?)", (invalid,))
            conn.rollback()
        self.assertFalse(conn.in_transaction)

    def test_02_empty_and_idempotent(self):
        conn = self.fresh(rows=[])
        notes.migrate(conn)
        self.assertEqual(notes.list_notes(conn, notes.Principal("alpha", False)), [])
        conn.execute("INSERT INTO notes VALUES (1,'alpha','archived',1)")
        conn.commit()
        before = snapshot(conn)
        def forbidden():
            self.fail("idempotent v2 migration called callback")
        notes.migrate(conn, after_schema_change=forbidden)
        self.assertEqual(snapshot(conn), before)
        self.assertFalse(conn.in_transaction)

    def test_03_fault_atomicity_and_retry(self):
        conn = self.fresh()
        before = snapshot(conn)
        calls = []
        class SyntheticFailure(Exception):
            pass
        sentinel = SyntheticFailure("synthetic migration interruption")
        def fault():
            calls.append(True)
            self.assertTrue(conn.in_transaction)
            self.assertIn("archived", [r[1] for r in conn.execute("PRAGMA table_info(notes)")])
            raise sentinel
        with self.assertRaises(SyntheticFailure) as raised:
            notes.migrate(conn, after_schema_change=fault)
        self.assertIs(raised.exception, sentinel)
        self.assertEqual(calls, [True])
        self.assertFalse(conn.in_transaction)
        self.assertEqual(snapshot(conn), before)
        notes.migrate(conn)
        self.assertEqual(notes.list_notes(conn, notes.Principal("alpha", True)), [(1, ""), (9, ROWS[0][2])])

    def test_04_success_callback_once(self):
        conn = self.fresh()
        calls = []
        def callback():
            self.assertTrue(conn.in_transaction)
            calls.append(1)
        notes.migrate(conn, after_schema_change=callback)
        self.assertEqual(calls, [1])
        self.assertFalse(conn.in_transaction)

    def test_05_unsupported_version(self):
        conn = self.fresh()
        for version in (0, 3, 99):
            conn.execute(f"PRAGMA user_version={version}")  # fixed harness integers
            before = snapshot(conn)
            with self.assertRaises(ValueError):
                notes.migrate(conn)
            self.assertEqual(snapshot(conn), before)
            self.assertFalse(conn.in_transaction)

    def test_06_read_scope_exact_identifiers_and_reuse(self):
        conn = self.fresh()
        notes.migrate(conn)
        for tenant, expected in [("alpha", [(1, ""), (9, ROWS[0][2])]),
                                 ("beta", [(3, "foreign synthetic body")]),
                                 ("t'enant雪", [(8, "literal")]),
                                 ("' OR 1=1 --", []), (" alpha", [])]:
            self.assertEqual(notes.list_notes(conn, notes.Principal(tenant, False)), expected)
            self.assertFalse(conn.in_transaction)

    def test_07_archive_scope_and_denial(self):
        conn = self.fresh()
        notes.migrate(conn)
        writer, reader = notes.Principal("alpha", True), notes.Principal("alpha", False)
        before = snapshot(conn)
        for note_id in (3, 123456):
            self.assertIs(notes.archive_note(conn, writer, note_id), False)
            self.assertEqual(snapshot(conn), before)
        for note_id in (1, 3, 123456, "invalid"):
            with self.assertRaises(PermissionError) as raised:
                notes.archive_note(conn, reader, note_id)
            self.assertNotIn("foreign synthetic body", str(raised.exception))
            self.assertEqual(snapshot(conn), before)
        self.assertIs(notes.archive_note(conn, writer, 1), True)
        after = snapshot(conn)
        self.assertIs(notes.archive_note(conn, writer, 1), False)
        self.assertEqual(snapshot(conn), after)
        self.assertEqual(notes.list_notes(conn, writer), [(9, ROWS[0][2])])
        self.assertEqual(notes.list_notes(conn, notes.Principal("beta", True)), [(3, "foreign synthetic body")])
        self.assertFalse(conn.in_transaction)

    def test_08_context_validation(self):
        conn = self.fresh()
        notes.migrate(conn)
        before = snapshot(conn)
        factories = [lambda: None, lambda: object(), lambda: "alpha",
                     lambda: notes.Principal("", True), lambda: notes.Principal(None, True),
                     lambda: notes.Principal(12, True), lambda: notes.Principal("alpha", 1),
                     lambda: notes.Principal("alpha", "yes")]
        # Rejecting invalid fields at dataclass construction is also safe.
        for factory in factories:
            for operation in (lambda p: notes.list_notes(conn, p),
                              lambda p: notes.archive_note(conn, p, 1)):
                with self.assertRaises(PermissionError):
                    operation(factory())
                self.assertEqual(snapshot(conn), before)
                self.assertFalse(conn.in_transaction)
        actor = notes.Principal("alpha", True)
        self.assertTrue(dataclasses.is_dataclass(actor))
        with self.assertRaises(dataclasses.FrozenInstanceError):
            actor.tenant_id = "beta"

    def test_09_invalid_writer_note_ids(self):
        conn = self.fresh()
        notes.migrate(conn)
        before = snapshot(conn)
        for bad in (True, False, None, "1", "1 OR 1=1", 1.0, []):
            with self.assertRaises(ValueError):
                notes.archive_note(conn, notes.Principal("alpha", True), bad)
            self.assertEqual(snapshot(conn), before)
            self.assertFalse(conn.in_transaction)

    def test_10_v1_new_api_refusal(self):
        conn = self.fresh()
        before = snapshot(conn)
        actor = notes.Principal("alpha", True)
        for operation in (lambda: notes.list_notes(conn, actor),
                          lambda: notes.archive_note(conn, actor, 1)):
            with self.assertRaises(ValueError):
                operation()
            self.assertEqual(snapshot(conn), before)
            self.assertFalse(conn.in_transaction)

    def test_11_caller_transaction_ownership(self):
        conn = self.fresh()
        notes.migrate(conn)
        actor = notes.Principal("alpha", True)
        for operation in (lambda: notes.migrate(conn), lambda: notes.list_notes(conn, actor),
                          lambda: notes.archive_note(conn, actor, 1),
                          lambda: notes.archive_note(conn, None, "bad")):
            conn.execute("INSERT INTO sentinel VALUES ('pending')")
            before = snapshot(conn)
            with self.assertRaises(RuntimeError):
                operation()
            self.assertTrue(conn.in_transaction)
            self.assertEqual(snapshot(conn), before)
            conn.rollback()
            self.assertEqual(conn.execute("SELECT * FROM sentinel").fetchall(), [("unrelated",)])

    def test_12_archive_disk_persistence(self):
        with tempfile.TemporaryDirectory(prefix="synthetic-notes-review-") as tmp:
            path = str(pathlib.Path(tmp) / "notes.sqlite")
            conn = self.fresh(path=path)
            notes.migrate(conn)
            self.assertIs(notes.archive_note(conn, notes.Principal("alpha", True), 9), True)
            self.assertFalse(conn.in_transaction)
            other = sqlite3.connect(path)
            try:
                self.assertEqual(other.execute("SELECT archived FROM notes WHERE id=9").fetchone(), (1,))
                self.assertEqual(other.execute("SELECT body FROM notes WHERE id=3").fetchone(), ("foreign synthetic body",))
            finally:
                other.close()
            conn.close()


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("module", type=pathlib.Path, help="path to candidate notes.py")
    args = parser.parse_args(argv)
    global notes
    previous_bytecode_setting = sys.dont_write_bytecode
    sys.dont_write_bytecode = True
    try:
        target = args.module.resolve(strict=True)
        if not target.is_file() or target.suffix != ".py":
            raise ValueError("candidate must be an existing .py file")
        spec = importlib.util.spec_from_file_location("submitted_notes", target)
        if spec is None or spec.loader is None:
            raise ValueError("cannot load candidate module")
        notes = importlib.util.module_from_spec(spec)
        sys.modules[spec.name] = notes  # dataclasses resolves its module here
        spec.loader.exec_module(notes)
        for name in ("create_v1", "legacy_list_notes", "Principal", "migrate",
                     "list_notes", "archive_note"):
            if not callable(getattr(notes, name, None)):
                raise ValueError(f"missing/non-callable required export: {name}")
        suite = unittest.defaultTestLoader.loadTestsFromTestCase(ContractTests)
        if suite.countTestCases() != EXPECTED_CHECKS:
            raise RuntimeError("unexpected check count; refusing empty/partial acceptance")
        print(f"TARGET={ascii(str(target))}", flush=True)
        print(f"PYTHON={sys.version.split()[0]} SQLITE={sqlite3.sqlite_version}", flush=True)
        result = unittest.TextTestRunner(verbosity=2).run(suite)
        if (result.testsRun != EXPECTED_CHECKS or not result.wasSuccessful()
                or result.skipped or result.expectedFailures):
            print("FAIL: not all required checks executed and passed", file=sys.stderr)
            return 1
        print(f"PASS: {result.testsRun} deterministic checks (not full certification)")
        return 0
    except BaseException as exc:
        # Includes accidental sys.exit(0) at import or during a test: never PASS.
        # This is failure handling, not protection against hostile Python code.
        print(f"FAIL: checker/candidate raised {type(exc).__name__}: {exc}", file=sys.stderr)
        return 2
    finally:
        sys.dont_write_bytecode = previous_bytecode_setting


if __name__ == "__main__":
    raise SystemExit(main())
