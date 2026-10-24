"""Public contract smoke checks; participants add their own focused coverage."""
import sqlite3
import unittest

import notes


class SmokeTests(unittest.TestCase):
    def setUp(self):
        self.conn = sqlite3.connect(":memory:")
        self.addCleanup(self.conn.close)
        notes.create_v1(self.conn)
        self.conn.executemany(
            "INSERT INTO notes(id, tenant_id, body) VALUES (?, ?, ?)",
            [(1, "alpha", "one"), (2, "beta", "two"), (4, "alpha", "four")],
        )
        self.conn.commit()

    def test_migration_and_scoped_archive(self):
        before = notes.legacy_list_notes(self.conn)
        notes.migrate(self.conn)
        self.assertEqual(notes.legacy_list_notes(self.conn), before)
        self.assertEqual(self.conn.execute("PRAGMA user_version").fetchone()[0], 2)
        actor = notes.Principal("alpha", True)
        self.assertEqual(notes.list_notes(self.conn, actor), [(1, "one"), (4, "four")])
        self.assertFalse(notes.archive_note(self.conn, actor, 2))
        self.assertTrue(notes.archive_note(self.conn, actor, 1))
        self.assertEqual(notes.list_notes(self.conn, actor), [(4, "four")])
        with self.assertRaises(PermissionError):
            notes.archive_note(self.conn, notes.Principal("alpha", False), 4)
        self.assertFalse(self.conn.in_transaction)

    def test_migration_failure_retry(self):
        before = notes.legacy_list_notes(self.conn)
        class InjectedFailure(Exception):
            pass
        def fail():
            raise InjectedFailure("synthetic fault")
        with self.assertRaises(InjectedFailure):
            notes.migrate(self.conn, after_schema_change=fail)
        self.assertEqual(notes.legacy_list_notes(self.conn), before)
        self.assertEqual(self.conn.execute("PRAGMA user_version").fetchone()[0], 1)
        self.assertNotIn("archived", [row[1] for row in self.conn.execute("PRAGMA table_info(notes)")])
        self.assertFalse(self.conn.in_transaction)
        notes.migrate(self.conn)
        self.assertEqual(self.conn.execute("PRAGMA user_version").fetchone()[0], 2)


if __name__ == "__main__":
    unittest.main()
