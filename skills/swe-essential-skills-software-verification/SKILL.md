---
name: swe-essential-skills-software-verification
description: Choose verification evidence for changed contracts, regression risks or acceptance gaps. Use when test strategy needs judgment; running an established check recipe needs no new strategy.
---

# SWE Essential Skills / Software Verification

Choose evidence for the claim, not a ceremonial test count. Verification can clarify behavior and expose missing seams during implementation. No universal test-first mandate or exemption from testing applies. Preserve applicable required gates.

## Choose checks that can falsify the claim

Reuse accepted requirements and existing tests. Identify changed observable behavior, preserved invariants, affected consumers and plausible costly failures. Resolve only ambiguity that changes the expected outcome. Assertions should encode contracts rather than mirror helpers, incidental formatting or wording.

Choose the narrowest evidence layer that exposes the defect without mocking away its cause: pure logic at unit level, real dependencies at integration boundaries, actual consumer contracts and a few critical end-to-end journeys where needed. Use manual/device evidence for claims requiring those observations. A screenshot is not interaction evidence; a headless CLI needs no browser check. No universal pyramid or coverage percentage is an acceptance rule.

For uncertain method/oracle, input classes, concurrency, compatibility, repair comparisons or a tiny edit, read only the applicable [test design cases](references/test-design-cases.md). A wording-only edit may need inspection rather than a new literal-string test; a one-line authorization or financial change can require adverse tests. Size and reversibility alone do not decide verification.

Read [lifecycle assurance](references/lifecycle-assurance.md) when actual assurance/acceptance-readiness questions remain unresolved or regulatory/cross-lifecycle obligations apply. Risk alone does not require a whole-lifecycle review or separate plan for every edit.

## Run only applicable or missing checks

Reuse known commands, fixtures, environment facts and mandatory-gate requirements. Discover missing details and refresh those affected by code, configuration, data, runtime or environment changes. Inspect unfamiliar scripts before execution; use version-appropriate official documentation when semantics are uncertain. Classify resource mutations, transmission and cost before execution and obtain required authority.

Before using a running browser, device, API or service as evidence, confirm it contains the intended build and configuration. A familiar URL, port or checkout can serve a stale artifact or another task's process. Use available process/build/source identity, not an obligatory rebuild or installation; reuse it until affected. If identity cannot be established, report that limitation.

During iteration, run focused checks when current evidence no longer covers changed behavior/dependencies. Another skill activation is not a rerun trigger. Reuse results with sufficient coverage, unchanged relevant code/configuration/data/environment and permitted gate freshness. Before completion, satisfy applicable gates and run missing or invalidated checks; broaden by blast radius. Never replace a required gate with a convenient subset without accepted authority.

For a regression, demonstrate where practical that the same triggering input and behavioral property fail for the original defect and pass after correction. Use an isolated copy or safe reversal without overwriting unrelated work. Inspect harness changes separately; setup errors and unrelated failures do not demonstrate sensitivity. Existing adequate repair evidence needs no repeat mutation or runner.

Diagnose failures and flakiness rather than retrying to green. Control relevant time, randomness, scheduling and fixtures; a pre-existing failure needs baseline evidence and remains reportable. Preserve real exit status, identity/context and actionable diagnostics while keeping routine output compact. Command count alone establishes neither subscription usage nor token savings; do not replace a useful cheap check with speculation.

## Finish with an evidence boundary

Trace changes since each result to confirm it applies to the final relevant state; a revision change alone does not invalidate unaffected evidence. Report actual checks and outcomes, required gates still failed/missing, and important behavior untested or blocked. Distinguish inspection, static analysis, build, behavior, rendered interaction and deployment evidence.

A skipped test is not a pass. Coverage can locate unexercised paths but cannot prove assertions are strong; use safe targeted fault injection only when it resolves a meaningful oracle gap. Green checks do not establish security, accessibility, performance or correctness beyond their assertions. Do not invent evaluation results, device observations, screenshots or success.
