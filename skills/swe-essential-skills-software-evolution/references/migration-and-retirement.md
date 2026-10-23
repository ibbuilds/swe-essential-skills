# Migrations, deprecations and retirement

## Model coexistence

List producers, consumers, stored representations and update control. Include offline clients, pinned libraries, scheduled jobs, plugins and delayed messages. Identify version combinations that must work and observable migration progress without unnecessary personal data collection.

Prefer expand → migrate → contract when versions coexist:

1. Add compatible representation/behavior. Define source of truth and conflict rules; naive dual writes diverge on partial failure.
2. Introduce tolerant readers/adapters and compatible producers in dependency-safe order. Define handling of unknown fields/versions where relevant.
3. Migrate state in bounded restartable batches. Track failures, support idempotent retry or reconciliation, and assess locks/load/concurrent writes.
4. Verify meaning as well as counts: invariants, missing/duplicate records, sampled equivalence and consumer success/error behavior. Job completion is not consistency proof.
5. Switch authoritative paths after adequate evidence; retain an understood recovery route until the irreversible boundary is accepted.
6. Remove old behavior/state after consumers migrate or the agreed compatibility promise ends. Check old-format queued messages and infrequent jobs first.

**Example:** Replacing a string status with an object affects stored rows, old mobile clients and delayed messages. Define old-reader mapping, how new statuses degrade for old clients, and how old writers avoid erasing new information. Test these mixed-version cases before deleting the string.

After old data deletion or introduction of values unrepresentable in the old format, code rollback may not recover the system. Deliberately choose retained mappings, roll-forward repair or tested restore/reconciliation. Reverting a commit does not reverse external effects.

## Deprecation

Use normal API/release channels for replacement, behavior delta, supported overlap and removal conditions. Publishing notices or contacting consumers requires relevant authority; prepare material when sending is not authorized.

Verify consumers can perform the task with the replacement, including failure semantics. Add targeted warnings/usage signals where useful without log flooding or sensitive identifiers. Coordinate removal by consumer readiness or explicit supported-lifetime policy, not an arbitrary timer. No recent traffic is weak evidence for annual jobs, offline clients and rare recovery paths. If a consumer cannot move, decide on an adapter, extended compatibility or explicit breaking boundary rather than silently stranding it.

## Retirement

Establish replacement/closure for consumers, retained-data ownership, export/deletion obligations and recovery/retention decisions. Inspect deployed resources, scheduled tasks, queues, integrations, endpoints/domains, credentials, monitoring and billing; deleting the repository leaves these behind.

Stop new work in controlled order, drain or reconcile outstanding effects, disable entrypoints and verify consumers no longer depend on them. Revoke credentials/remove resources only within authorized scope after checking shared ownership. Premature alert removal can conceal a failed shutdown.

Confirm no orphan jobs run, no endpoint serves unintended stale data, and retained data/backups have accountable access/expiry policies. Verify the retired path's expected response and the replacement's critical flow. Report residual resources/data and incomplete consumer transitions rather than claiming retirement from one successful deletion command.
