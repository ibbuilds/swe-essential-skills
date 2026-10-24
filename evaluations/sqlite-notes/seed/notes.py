"""Synthetic acceptance-case seed. No production data or auth integration."""
import sqlite3


def create_v1(conn: sqlite3.Connection) -> None:
    """Initialize an empty synthetic legacy store; setup only, not migration."""
    conn.execute(
        "CREATE TABLE notes (id INTEGER PRIMARY KEY, "
        "tenant_id TEXT NOT NULL, body TEXT NOT NULL)"
    )
    conn.execute("PRAGMA user_version = 1")
    conn.commit()


def legacy_list_notes(conn: sqlite3.Connection) -> list[tuple[int, str, str]]:
    """Privileged legacy inspection; never a user-facing authenticated API."""
    return conn.execute(
        "SELECT id, tenant_id, body FROM notes ORDER BY id"
    ).fetchall()
