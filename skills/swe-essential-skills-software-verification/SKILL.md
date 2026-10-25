---
name: swe-essential-skills-software-verification
description: Choose verification evidence for changed contracts, regression risks or acceptance gaps. Use when test strategy needs judgment; running an established check recipe needs no new strategy.
---

# SWE Essential Skills / Software Verification

Choose evidence for the claim, not a ceremonial test count. Verification informs implementation: use it to clarify ambiguous behavior, expose missing seams, and distinguish correct results from merely executable code. No universal test-first mandate or exemption from testing applies.

Read the relevant sections of [lifecycle-assurance.md](references/lifecycle-assurance.md) when actual assurance or acceptance-readiness questions remain unresolved, or applicable regulatory/cross-lifecycle obligations require them. Use it to connect claims, accountable acceptance and evidence; risk alone does not require a whole-lifecycle review or a separate assurance plan for every edit. Preserve all applicable required gates.

## Derive meaningful checks

Reuse accepted requirements and existing tests. Identify the changed observable behavior, invariants that must remain true, affected consumers, and plausible costly failures. Turn those into examples and counterexamples before or during implementation. Resolve only ambiguities that change the expected outcome.

For each important claim, decide what observation could falsify it. Examples: retries do not duplicate an operation; an unauthorized identity cannot read another tenant's record; a CLI emits valid machine-readable output on stdout while diagnostics stay on stderr; an older client still understands a new server response. Assertions should encode these contracts rather than mirror helper implementation or compare incidental formatting.

Choose input classes deliberately: boundaries, invalid/absent values, transitions, relevant combinations, concurrency, and partial failures. Do not generate every permutation when equivalence classes suffice. Property-based or metamorphic checks help when many inputs share an invariant and individual expected outputs are expensive; use trustworthy oracles and retain failing inputs or event sequences with relevant versions and replay metadata, not a seed alone.

## Choose the evidence layer

Use the narrowest layer that can expose the failure without mocking away its cause:

- **Unit:** pure logic, transformations, state transitions, and precise edge cases. Fakes can control time or dependencies, but tests of fake behavior do not prove the real dependency contract.
- **Integration:** actual interaction with storage, serialization, queues, runtime components, filesystem, or platform interfaces. Isolate test resources; a worktree does not isolate a database or port.
- **Contract/compatibility:** producer/consumer agreements, schema, protocols, supported versions, API/ABI, command output, and packaging boundaries. Schema validation alone may miss semantic incompatibility.
- **End-to-end:** a few important journeys across real boundaries, including material failure/recovery paths. Avoid duplicating every unit permutation in a slow, fragile harness.
- **Manual/exploratory/device:** behavior requiring human judgment, physical interaction, assistive technology, visual fidelity, or unavailable automation. Record setup/actions/outcomes sufficiently to repeat; manual evidence is neither worthless nor a substitute for unrelated automated gates.

When the method or oracle is uncertain, read only the relevant sections of [test-design-cases.md](references/test-design-cases.md) for illustrative invariants, oracle design, repair comparisons, concurrency, platform, or compatibility cases. Choose layers by the defect mechanism; no universal pyramid or fixed coverage percentage is an acceptance rule.

## Run checks that mean what they claim

Reuse applicable known checks, commands, fixtures, environment facts, and mandatory-gate requirements. Discover missing details or recheck those affected by code, configuration, data, runtime, or environment changes. Inspect unfamiliar scripts before executing them. Use version-appropriate official documentation when flags or semantics are uncertain. Distinguish read-only/dry-run checks from integration or infrastructure tests that mutate resources, transmit data, or incur cost; obtain required authorization before those actions.

Before treating browser, device, API-probe or running-service results as evidence,
confirm the target actually contains the intended code/build and configuration.
A familiar port, URL or checkout revision can point to a stale artifact or another
task's process. Use available process/build/source identity, not an obligatory
rebuild or tool installation; recheck when that identity changes. If it cannot be
established, state the limitation rather than attributing the result to this change.

During iteration, run focused checks for changed behavior and its dependencies when existing evidence no longer covers them. Another skill activation is not a reason to repeat a check: reuse observed results whose relevant code, configuration, data, and environment still match, subject to the gate's freshness requirements. Before completion, ensure applicable required gates are satisfied and run any missing or invalidated ones. Broaden by blast radius: shared API changes merit consumer checks; a local copy change does not automatically require every infrastructure test. Never replace a required gate with a convenient subset without explicit accepted authority.

When adding a regression, demonstrate where practical that it fails against the original defect and passes with the correction. This can use a safe temporary copy or targeted reversal; never overwrite unrelated changes. Check why it failed: missing setup, syntax errors, and unrelated failures do not establish sensitivity to the bug.

For baseline-versus-patch repair evidence, preserve the triggering input and behavior-based property being checked; inspect harness changes separately from the repair.

Keep routine successful command output compact; retain the exit status and enough
identity/context to know what ran. For failure, inspect the relevant diagnostic
and its cause rather than repeatedly returning the whole log. Preserve access to
full evidence when needed; output reduction must not hide failures or change a
command's exit status. Shell execution costs time and compute; its returned output
and subsequent agent analysis also consume context. Do not infer subscription
usage or token savings from test count alone, or skip a needed cheap check to
replace it with speculative reasoning.

Keep time, randomness, locale, external services, and fixtures controlled enough for meaningful repeatability. Use deterministic barriers for ordering where possible, not unexplained sleep increases. Diagnose flaky or failing checks instead of silently retrying until green. If failure predates the change, establish that with a suitable baseline comparison and report it; pre-existing does not mean irrelevant.

## State the coverage boundary

Check that evidence applies to the final revision, tracing relevant changes since each result rather than invalidating unrelated checks solely because the revision identity changed; stale results do not prove newly changed behavior. Summarize the checks actually run, their outcomes, and what important behavior remains untested or blocked. Distinguish static analysis, build success, behavioral tests, rendered interaction, and deployment evidence. A skipped test is not a pass; a green suite does not establish security, accessibility, performance, or correctness outside its assertions.

Coverage reports can locate unexercised paths but not prove strong assertions. Use targeted mutation or intentional fault injection when useful and safe to assess a critical oracle. Do not invent model-evaluation results, device observations, screenshots, or test success that was not observed.
