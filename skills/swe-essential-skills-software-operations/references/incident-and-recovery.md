# Incident diagnosis and recovery

## Establish impact and containment

Record first known failure, affected operations/users/versions, ongoing damage and recent changes; separate facts from hypotheses. Use existing incident ownership and channels. External notifications require their own authority.

Check whether retries, writes, replication or exports amplify damage. Compare narrow containment options—pausing a consumer, disabling one feature, rate limiting a source, reverting compatible code—against interruption and data effects. Permission to diagnose does not authorize stopping production. If authority is missing, report the exact proposed action/target and continue safe investigation.

Preserve minimal useful configuration/revision/log evidence without secrets or unnecessary personal data. Do not erase queues, force database recovery or clear device state simply to make an error disappear.

## Diagnose with distinguishing checks

Form plausible causes and choose a check that separates them. Trace one failed operation through relevant ingress, queue, worker, storage and dependency boundaries. Verify telemetry freshness and version coverage.

Example: growing queue age may mean exhausted workers, slow downstream work or a producer surge. Compare arrival/completion rates, occupancy and downstream latency. Adding workers can help CPU-bound throughput but worsen a saturated database; do not scale from the queue graph alone.

Prefer safe read-only checks when they answer the question. Reproduce risky failures through isolated replay or bounded synthetic cases. Avoid changing several variables at once: it destroys causal information and complicates recovery.

## Recover and verify

Inspect state before retrying: the previous attempt may have partially succeeded. Account for duplicate messages, irreversible effects, incomplete migrations and ordering. Use idempotent repair or explicit reconciliation when replay is unsafe.

After authorized recovery, repeat the user-visible failure signal and inspect integrity, backlog trend, errors/latency and dependency health. Startup alone is insufficient; cached success can hide a failed write path. Choose the observation period from workload cycles and telemetry delay rather than an arbitrary timer.

When mitigation fails, preserve its result and revise the hypothesis. Stop/escalate when further action exceeds authority, risks integrity or requires unavailable expertise; do not loop through destructive retries.

Build a factual onset/detection/recovery timeline. Separate root cause, contributing conditions and unknowns. Identify why prevention, detection or recovery failed and choose a verifiable corrective action rather than “be more careful.” Reconcile damaged data or explicitly transfer that work; a green dashboard does not close those obligations. Verify temporary controls and workarounds before declaring recovery complete.
