---
name: software-operations
description: Diagnose operational failures, design useful telemetry and service expectations, handle incidents and support cases, or verify capacity and restoration. Adapt to CLI, native, device and batch products rather than assuming an online service.
---

# Software operations

Make the system observable, recoverable and supportable using evidence from the affected behavior. Consume existing runbooks and operational ownership; do not infer production access, credential availability or permission for disruptive action.

## Choose the operational question

- **Active incident:** read [incident-and-recovery.md](references/incident-and-recovery.md); contain impact before pursuing a perfect explanation.
- **Telemetry/readiness:** connect user-visible failure to a signal and response using the guidance below.
- **Support case:** establish affected version/platform, expected behavior, minimal reproduction, redacted diagnostics and workaround; distinguish a local configuration/data issue from broad impact.
- **Capacity/restore:** read [capacity-and-restore.md](references/capacity-and-restore.md).

Establish the actual artifact/version, environment, relevant configuration, recent changes and observation times. A green dashboard does not override a reproducible failed operation. If a tool or account is missing, specify the observation/action blocked and continue supported analysis; do not invent telemetry.

## Instrument a decision, not a dashboard

For each critical operation, choose success, failure, duration, workload and saturation signals that distinguish plausible causes. Instrument meaningful boundaries rather than indiscriminately logging every function.

- **Metrics:** use bounded dimensions; arbitrary URLs, user IDs and request IDs can create unbounded cardinality or disclose data. Define units, aggregation and missing-data behavior.
- **Logs:** retain stable event meaning, component/version, outcome and useful correlation; redact credentials and sensitive payloads at emission. Avoid duplicate alarming stack traces at every layer.
- **Traces:** propagate correlation across asynchronous boundaries where supported. Sampling means absent spans do not prove an operation did not run.
- **Health:** distinguish alive, ready for work and able to complete the critical operation. A liveness probe coupled to a flaky dependency can turn degradation into a restart storm.

For a service with a real reliability objective, define an SLI around eligible operations or time intervals, its data source and exclusions. Select a target/window from service expectations, not a memorized number. Track error-budget consumption or another actionable degradation measure with traffic and telemetry-delay context. Low-volume services may need synthetic critical-path checks and longer observation instead of noisy short-window ratios.

For batch jobs, measure freshness, deadlines, missing/duplicate records and backlog age. For CLI/native/device software, prioritize actionable local diagnostics, crash/update evidence and recovery instructions; remote telemetry must respect consent and privacy requirements. A local command does not need an online-service SLO merely to be maintainable.

## Make alerts actionable

A page should name an actionable symptom, likely scope and first discriminating check. Use existing routing and ownership. Set urgency by user impact and how quickly damage grows; nonurgent maintenance belongs in a durable work queue.

Test alert logic and routing through an authorized mechanism. Account for missing data, ingestion delay, transient versus sustained failures, maintenance and duplicates. Do not fix an incident by muting evidence; a suppression needs scope and an end condition. Confirm the alert recovers after the underlying condition is repaired.

## Turn diagnosis into supportable change

Correlate timestamps and identifiers across components, checking clocks/time zones. Compare affected and unaffected versions, tenants, machines or inputs to isolate the failing boundary. Request narrow redacted samples rather than full user databases/logs.

Separate mitigation from cause correction. A successful restart proves something about recovery, not the cause. Add the narrow regression, instrumentation or runbook step that detects recurrence or makes recovery safer. Verify the original failure signal and a healthy path.

Leave useful facts: impact, current health, evidence, mitigation/fix, residual risks and required owner/action. A runbook needs prerequisites, a diagnostic decision, expected result, safe recovery and verification—not unexplained commands. Keep credentials out of runbooks and reports.
