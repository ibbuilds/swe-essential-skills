# Migration and backfill execution

## Prepare a compatibility map

List old/new readers, writers, jobs, imports, exports and analytical consumers. For each stage identify what each can read and write. Decide which source wins if old and new representations disagree. Application rollback must remain compatible with the schema and values already written; a down migration that drops new data is not a safe rollback.

Inspect the actual engine/version and migration tool for lock modes, transaction wrapping, statement limits, index build behavior and restart semantics. Estimate affected size and available disk, log/WAL, replica lag and connection capacity using approved observations. Rehearse with representative data and invalid legacy cases where feasible. Set stop/abort conditions from service limits or agreed budgets, not arbitrary universal percentages.

## Stage the change

- Add compatible structures before requiring them from old callers. Nullable columns or optional fields can support transition, but only if missing data is explicitly handled.
- Introduce writers with a defined source of truth. Dual writing creates divergence if writes can partially fail; use the same transaction where possible or a durable repair/reconciliation path.
- Backfill historical records with a restartable progress model. Prefer stable key ranges or checkpoints to drifting offsets. Bound batches and transaction duration to control contention and recovery cost.
- Protect concurrent updates. Use version predicates, timestamps with valid ordering semantics, or a recomputation design so an old backfill snapshot cannot overwrite newer values.
- Validate completion and correctness, not merely “all batches ran.” Reconcile eligible versus converted records, invalid exceptions, nulls, duplicates and value equivalence as applicable.
- Switch reads and then tighten constraints when safe. Observe compatibility before removing old writers or fields. Confirm deployed consumers and scheduled jobs, not just code search in one repository.

Checkpoints must advance only after the batch's durable effect. A retry should not double-apply arithmetic, issue external effects twice or skip a partially processed range. Record failed rows with safe identifiers and reasons; silently skipping them produces a deceptively green run.

## Diagnose operational failure

If blocking appears, identify blocker/waiter relationships and long transactions before increasing timeouts. If replication lag or log growth rises, inspect batch rate and transaction size; pause safely using the checkpoint rather than repeatedly restarting from zero. If a batch fails deterministically, isolate the data condition and decide whether to repair, quarantine or halt under the invariant. Do not disable constraints just to complete a migration without resolving their violated meaning.

After interruption, inspect durable progress and schema state before rerunning. Migration frameworks differ in whether a failed operation rolls back wholly, partially or not at all. A manually edited migration-history row is not proof the schema matches its claimed version.

## Illustrative migration branches

### Add required normalized email

Before creating uniqueness, determine normalization rules and discover collisions under the intended collation and tenant scope. Adding a unique constraint first can fail or block unexpectedly; silently dropping duplicate accounts is unacceptable. Expand with a compatible field, resolve collisions through an authorized policy, backfill without overwriting concurrent edits, then validate and enforce. Include imports and background writers in the transition.

### Rename a widely used column

For an offline local database, a direct rename may suffice. During a rolling service deployment, old binaries may still use the old name. Use a compatibility mechanism supported by the stack or stage a new representation and coordinated cutover. Test old-reader/new-writer and new-reader/old-writer combinations. Remove compatibility only when old consumers are no longer active.

### Backfill a derived account balance

A naive overwrite from an old snapshot can erase newly posted transactions. Identify a consistent source position or use an incremental reconciliation model that accounts for new events. Verify per-account totals and overall reconciliation at a declared cutoff. A row count matching the account count does not prove the balances are correct.
