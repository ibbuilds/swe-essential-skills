---
type: llm
focus: trace
---

PASS if the run (its migration files and final reply) adds the column as nullable, backfills it in batches (bounded UPDATEs by id range or similar), confirms no NULLs remain (a count query, or a CHECK constraint added NOT VALID and then validated), and only then adds NOT NULL.
FAIL if it backfills all rows in one UPDATE, or adds NOT NULL in the same step as the backfill or before it.
