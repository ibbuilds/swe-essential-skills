---
name: software-verification
description: Design and run proportionate software verification while implementing or changing behavior, selecting tests from requirements, invariants, contracts, and failure risks. Use for test strategy, regression coverage, acceptance evidence, or assessing what existing checks actually prove.
---

# Software verification

Choose evidence for the claim, not a ceremonial test count. Verification informs implementation: use it to clarify ambiguous behavior, expose missing seams, and distinguish correct results from merely executable code. No universal test-first mandate or exemption from testing applies.

## Derive meaningful checks

Reuse accepted requirements and existing tests. Identify the changed observable behavior, invariants that must remain true, affected consumers, and plausible costly failures. Turn those into examples and counterexamples before or during implementation. Resolve only ambiguities that change the expected outcome.

For each important claim, decide what observation could falsify it. Examples: retries do not duplicate an operation; an unauthorized identity cannot read another tenant's record; a CLI emits valid machine-readable output on stdout while diagnostics stay on stderr; an older client still understands a new server response. Assertions should encode these contracts rather than mirror helper implementation or compare incidental formatting.

Choose input classes deliberately: boundaries, invalid/absent values, transitions, relevant combinations, concurrency, and partial failures. Do not generate every permutation when equivalence classes suffice. Property-based or metamorphic checks help when many inputs share an invariant and individual expected outputs are expensive; retain reproducible seeds and trustworthy oracles.

## Choose the evidence layer

Use the narrowest layer that can expose the failure without mocking away its cause:

- **Unit:** pure logic, transformations, state transitions, and precise edge cases. Fakes can control time or dependencies, but tests of fake behavior do not prove the real dependency contract.
- **Integration:** actual interaction with storage, serialization, queues, runtime components, filesystem, or platform interfaces. Isolate test resources; a worktree does not isolate a database or port.
- **Contract/compatibility:** producer/consumer agreements, schema, protocols, supported versions, API/ABI, command output, and packaging boundaries. Schema validation alone may miss semantic incompatibility.
- **End-to-end:** a few important journeys across real boundaries, including material failure/recovery paths. Avoid duplicating every unit permutation in a slow, fragile harness.
- **Manual/exploratory/device:** behavior requiring human judgment, physical interaction, assistive technology, visual fidelity, or unavailable automation. Record setup/actions/outcomes sufficiently to repeat; manual evidence is neither worthless nor a substitute for unrelated automated gates.

Read [test-design-cases.md](references/test-design-cases.md) for illustrative invariants, oracle design, concurrency, platform, and compatibility cases. Choose layers by the defect mechanism; no universal pyramid or fixed coverage percentage is an acceptance rule.

## Run checks that mean what they claim

Discover the project's actual commands, framework/runtime versions, fixtures, environment needs, and mandatory gates. Inspect unfamiliar scripts before executing them. Use version-appropriate official documentation when flags or semantics are uncertain. Distinguish read-only/dry-run checks from integration or infrastructure tests that mutate resources, transmit data, or incur cost; obtain required authorization before those actions.

During iteration, run focused checks for the changed behavior and its dependencies. Before completion, run the applicable required gates and broaden by blast radius: shared API changes merit consumer checks; a local copy change does not automatically require every infrastructure test. Never replace a required gate with a convenient subset without explicit accepted authority.

When adding a regression, demonstrate where practical that it fails against the original defect and passes with the correction. This can use a safe temporary copy or targeted reversal; never overwrite unrelated changes. Check why it failed: missing setup, syntax errors, and unrelated failures do not establish sensitivity to the bug.

Keep time, randomness, locale, external services, and fixtures controlled enough for meaningful repeatability. Use deterministic barriers for ordering where possible, not unexplained sleep increases. Diagnose flaky or failing checks instead of silently retrying until green. If failure predates the change, establish that with a suitable baseline comparison and report it; pre-existing does not mean irrelevant.

## State the coverage boundary

Inspect the final revision after the last edit; stale results do not prove newly changed behavior. Summarize the checks actually run, their outcomes, and what important behavior remains untested or blocked. Distinguish static analysis, build success, behavioral tests, rendered interaction, and deployment evidence. A skipped test is not a pass; a green suite does not establish security, accessibility, performance, or correctness outside its assertions.

Coverage reports can locate unexercised paths but not prove strong assertions. Use targeted mutation or intentional fault injection when useful and safe to assess a critical oracle. Do not invent model-evaluation results, device observations, screenshots, or test success that was not observed.
