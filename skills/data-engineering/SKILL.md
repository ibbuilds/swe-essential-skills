---
name: data-engineering
description: Design and change persistent schemas, investigate query behavior, and perform compatible migrations, backfills and recovery planning. Use when correctness depends on stored-data invariants, query plans, rollout compatibility or data lifecycle, across the project's actual datastore rather than a default database.
---

# Data engineering

Treat schema, writers, readers and operational procedures as one data contract. A migration that exits successfully can still corrupt meaning, block traffic or break old consumers.

## Establish the data model and invariant

Inspect schema definitions, migrations, queries, access controls, fixtures and the application versions that read or write the data. Identify authoritative records, derived views, caches, external copies and background writers. Determine scale, growth, write contention, retention and recovery requirements from evidence; do not assume sample data resembles production.

Define identity, uniqueness, relationship ownership, null/absent semantics, units, time interpretation and deletion behavior. Express invariants with datastore constraints where supported, and explain application enforcement when they cannot be represented there. A pre-insert existence check alone is not a uniqueness guarantee under concurrency.

Keep tenant scope and access policy in the model and queries. Inspect service-role or privileged paths that may bypass row-level controls. Minimize sensitive data, including migration logs and exported fixtures; define retention and removal propagation where the task changes data lifecycle.

For schema tradeoffs and query investigation, read [model and query investigation](references/model-and-query-investigation.md).

## Separate logical change from physical execution

Name the behavior delta and every affected reader/writer. Determine whether old and new application versions overlap, whether the datastore rewrites or locks large objects, and whether the migration framework wraps operations in transactions. Use project/version documentation to verify online-DDL, index-build and constraint-validation behavior; do not transplant PostgreSQL commands into another engine.

Prefer a compatible transition when components cannot change atomically: expand capability, adapt writers/readers, backfill, validate, cut over, then remove obsolete structures after the compatibility window closes. This is a technique, not a mandatory sequence for a disposable local database.

For production-sized migrations, online changes or backfills, read [migration and backfill execution](references/migration-and-backfill-execution.md). Before destructive changes or claims of recoverability, read [recovery and reconciliation](references/recovery-and-reconciliation.md).

## Verify meaning and performance

Check the relevant invariant with counts, constraints, reconciliations or sampled value comparisons—not just schema existence. Check boundary cases such as nulls, duplicate keys, invalid legacy rows, time zones and concurrent writes as applicable. Include representative application reads/writes and access-denied cases after the change.

For query changes compare plans and actual behavior on representative distributions, with resource and side-effect limits. A faster empty-table query is not evidence for production performance. Inspect write cost and lock behavior when adding indexes; an index can improve reads while making ingestion or storage worse.

## Execute only within the authorized environment

Verify target identity and scope before mutations. Distinguish read-only inspection, dry-run/planning, staging execution and production application. Some explain/profiling modes execute the query; read-only-looking commands can acquire consequential locks. Do not run a write plan, backfill, restore or production load test merely to gather evidence without its required authorization.

Leave the actual result: changes and compatibility state, executed verification, failed or skipped checks, remaining backfill/cutover work, and recovery limitations. Never equate a backup file, a dry run or a reversible schema script with proven data recovery.
