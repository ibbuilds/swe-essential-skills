---
name: swe-essential-skills-software-debugging
description: Diagnose reproducible, intermittent, or production-only software failures using reliable signals, distinguishing experiments, and causal tracing before choosing a fix. Use for unexplained incorrect behavior, crashes, flaky failures, regressions, or finding related instances of a confirmed defect.
---

# SWE Essential Skills / Software Debugging

Reuse existing evidence, reproductions, and technical decisions without a separate planning ceremony. Choose observations that reduce uncertainty, not changes based on resemblance to a familiar bug.

## Establish a trustworthy failure signal

Capture expected versus actual behavior, input/context, versions/configuration, and the smallest observable check distinguishing them: assertion, replay, CLI output/exit code, device trace, metric, or UI interaction. Verify it fails for the reported reason; a test that cannot start is not a reproduction.

For intermittent failures, record frequency and timing/concurrency; one passing run does not establish a fix. Control seeds, clocks, scheduling, and dependencies where feasible without removing the suspected mechanism. Without a reproduction, bound the hypothesis, seek discriminating evidence, and leave the cause unconfirmed.

Before replay, check for writes, charges, messages, hardware movement, or production changes. Prefer sanitized fixtures, isolation, and read-only inspection. A timeout may hide a committed operation: reconcile uncertain outcomes before retrying. Debugging grants no mutation authority.

## Locate the first broken assumption

Trace input to incorrect result across relevant callers, processes, queues, persistence, caches, and clients. At consequential boundaries, compare inputs/outputs against the expected invariant. Correlate identities, versions, and operation IDs; unsynchronized timestamps alone do not establish event order.

Use recent changes and known-good paths as leads, not proof. Read suspect dependency contracts at the project's actual version; obtain commands from repository configuration. Avoid installing tools or upgrading dependencies merely to test a guess.

If the cause remains unknown, state a specific hypothesis and predicted observation, compare plausible alternatives, and choose the cheapest safe distinguishing experiment: controlled input, boundary instrumentation, isolated dependency, deterministic interleaving, or version comparison. Change one relevant factor where practical. If a trustworthy reproduction or source trace directly demonstrates defect and cause, skip artificial alternative hypotheses: make the focused correction and regression check if repair is authorized; otherwise report the supported cause, correction direction, and proposed check. Keep temporary instrumentation narrow, redact sensitive data, and remove or intentionally retain it.

Update contradicted hypotheses rather than stacking speculative patches. After several failed patches, revisit the failure model and architecture boundary; a fixed attempt count does not justify a rewrite.

Use [investigation-patterns.md](references/investigation-patterns.md) for races, flaky tests, distributed outcomes, native/resource failures, non-reproducible incidents, or searches for variants of a confirmed defect.

## Fix the cause and verify the claim

Correct the boundary responsible for the violated invariant. Use fallbacks, retries, catch-alls, delays, or relaxed assertions only with justified semantics: they may mask failures or create duplicates. Distinguish containment (reduces impact), workaround (avoids the path), and causal fix.

Where practical, add a regression exposing the original behavior that fails without the correction for the right reason. Rerun the original signal and affected neighboring-contract checks. Respect mandatory repository gates; choose broader verification by impact, not a universal full-suite rule.

Before reporting resolution, inspect the actual final diff for diagnostic residue and unintended behavior changes. Report supported cause, correction, actual checks, and remaining uncertainty. If blocked, preserve the exact signal, leading hypotheses, next discriminating experiment, and required access/input; do not claim a fix.
