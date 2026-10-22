---
name: software-debugging
description: Diagnose reproducible, intermittent, or production-only software failures using reliable signals, distinguishing experiments, and causal tracing before choosing a fix. Use for unexplained incorrect behavior, crashes, flaky failures, and regressions.
---

# Software debugging

Make the next observation reduce uncertainty. Avoid changing code merely because it resembles a familiar bug. Reuse existing incident evidence, reproduction steps, and technical decisions; no separate planning ceremony is required.

## Establish a trustworthy failure signal

Capture expected versus actual behavior, affected input/context, relevant versions/configuration, and the smallest observable check that distinguishes them. A signal may be a failing assertion, replay, CLI output/exit code, device trace, metric, or demonstrated UI interaction. Ensure it fails for the reported reason: a test that cannot start is not yet a reproduction.

For intermittent failures, record observed frequency and relevant timing/concurrency instead of calling a single passing run a fix. Control seeds, clocks, scheduling, and dependencies where feasible without removing the suspected mechanism. If reproduction is unavailable, explicitly work from a bounded hypothesis and collect the next discriminating evidence; do not claim a confirmed cause.

Before replaying an operation, determine whether it writes data, charges money, sends messages, moves hardware, or changes production. Prefer sanitized fixtures, isolated environments, and read-only inspection. A timeout may mean the operation committed without an acknowledgment. Reconcile uncertain outcomes before retrying; debugging does not grant mutation authority.

## Locate the first broken assumption

Trace the path from input to incorrect result across relevant callers, processes, queues, persistence, caches, and clients. At each consequential boundary ask what entered, what exited, and which invariant should have held. Correlate identities, versions, and operation IDs; do not infer event order solely from unsynchronized timestamps.

Inspect recent changes and a known-good path when available, but treat proximity as a lead, not proof. Read the contracts of suspect dependencies at the project's actual version. Obtain commands from repository configuration; avoid installing tools or upgrading dependencies simply to test a guess.

When causality remains unresolved, state a specific hypothesis with a predicted observation and compare plausible competing explanations. Choose the cheapest safe experiment that distinguishes them: a controlled input, boundary instrumentation, isolated dependency, deterministic interleaving, or version comparison. Change one relevant factor where practical. If a trustworthy reproduction or source trace already directly demonstrates the defect and its cause, proceed to the focused correction and regression check when repair is authorized; otherwise report the supported cause, correction direction and proposed check. Do not manufacture an alternative hypothesis merely to perform an investigation ritual. Keep any temporary instrumentation narrow, redact sensitive data, and remove or intentionally retain it after investigation.

When evidence contradicts the hypothesis, update it. Do not stack speculative patches until the symptom disappears. If several patches fail, step back to the failure model and architecture boundary; a fixed attempt count is not a reason to declare a rewrite necessary.

Use [investigation-patterns.md](references/investigation-patterns.md) when dealing with races, flaky tests, distributed outcomes, native/resource failures, or non-reproducible incidents.

## Fix the cause and verify the claim

Choose a correction at the boundary responsible for the violated invariant. A fallback, retry, catch-all, delay, or relaxed assertion may mask the failure or create duplicates; use one only with justified semantics. Distinguish containment (reduces impact), workaround (avoids the path), and causal fix.

Where practical, add a regression that exposes the original behavior and fails without the correction for the right reason. Then rerun the original signal and checks for affected neighboring contracts. Respect mandatory repository gates; broader verification depends on impact, not a universal full-suite rule.

Before reporting resolution, inspect the final diff for diagnostic residue and unintended behavior changes. State the supported cause, correction, actual checks and remaining uncertainty. If blocked, preserve the exact signal, leading hypotheses, discriminating next experiment, and required access or input rather than claiming the bug is fixed.
