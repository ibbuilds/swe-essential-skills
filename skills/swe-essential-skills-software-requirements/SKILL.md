---
name: swe-essential-skills-software-requirements
description: "Use when software behavior, policy, conflicting requirements or acceptance remain ambiguous, or a plan needs a requested stress test (grill me). Clear accepted changes can proceed directly."
---

# SWE Essential Skills / Software Requirements

Establish the changed behavior and invariant before committing to a consequential
interpretation. Reuse accepted goals, issues, specifications, contracts and
existing decisions. Clear accepted changes proceed directly; neither task size
nor a missing formal document requires another interview or specification phase.

For an explicit plan challenge, use [design interview](references/design-interview.md),
including question dependencies, stakeholder questionnaires and domain language.
A deliberate challenge may examine an accepted plan.

## Recover the disputed contract

Start with existing product intent, users, scope, outcomes and constraints. Read
actual supplied material. Separate missing product intent from missing technical
evidence: resolve the former with its owner and investigate the latter. If
product direction itself remains unsettled, use installed `swe-essential-skills-product-definition` through the host's supported mechanism when useful; carry settled choices
instead of restarting discovery. Without it, resolve the specific choice directly.

Trace a representative journey through input, decisions, state and outcome,
including rejection and recovery. Identify affected users, operators and indirect
consumers such as jobs, older clients, library callers and assistive technology.
Inspect relevant code, contracts, tests, incidents and support evidence; observed
legacy behavior or an old test is not automatically intended policy.

Label approved need, observed behavior, proposed interpretation and assumption.
An explicit change by the authorized owner can replace a prior agreement; retain
its rationale and affected acceptance. If an external commitment exceeds that
owner's authority, identify the conflict and needed decision. Existing knowledge
records do not authorize outreach or changes to shared data.

For conflicting terms, sources or intent, read [elicitation and conflict cases](references/elicitation-and-conflicts.md).
Ask only material unresolved choices or unavailable facts. Present a concrete case,
options, consequence and recommendation; use permitted selectable input when it
fits and accept clear written answers or bounded delegation. Continue independent
work while prerequisite choices remain pending.

## Express observable behavior

Use the relevant contract dimensions, not a questionnaire for every task:

- Functional inputs, preconditions, outputs, state effects and rejected/error paths.
- Invariants across concurrency, retries, interruption and recovery.
- Interface/data identity, authorization, formats, units, ordering, compatibility,
  ownership, retention and deletion where affected.
- Quality/operational response under an actual workload and environment, with
  agreed limits, measurement boundary and required evidence.
- Actual platform, integration, deployment, hardware and assurance constraints.

Define terms whose meaning changes outcomes: saved, confirmed, deleted, available.
Split independently changeable obligations while retaining related conditions.
Reuse existing identifiers and retain material rationale. Mark missing values and
their consequences; an implementation preference or invented threshold is not a
requirement.

## Reconcile and validate

For incompatible obligations, state the condition under which both cannot hold
and compare feasible alternatives. Resolve authority/intent with the appropriate
owner, respecting already explicit decisions. Check dependencies, interoperability,
resource bounds and feasibility proportionately. A targeted prototype or consumer
check can establish feasibility; it cannot establish stakeholder agreement.

Walk representative and adverse scenarios through the proposed behavior. For a
material obligation identify conditions, expected observation, evidence method
and acceptance owner. Read [acceptance and validation](references/acceptance-and-validation.md)
for ambiguous targets or assurance obligations. Tests, inspection, demonstration,
analysis and authorized human evaluation answer different claims. Verify safety,
regulatory and contractual applicability with authoritative sources and qualified
owners; ordinary tests do not certify compliance.

## Carry agreement through change

Maintain the current issue, specification or contract rather than creating a
competing record. Preserve agreed/proposed status and accepted removals. Read
[baseline and change impact](references/baseline-and-change-impact.md) for partial
specification deltas or consequential multi-consumer changes. Trace affected
implementation, tests, old/new consumers, migrations, rollout and recovery.
Reconcile altered acceptance and retain why an obligation was replaced.

Leave agreed behavior/constraints, decisive acceptance cases, affected owners,
material unresolved choices and missing evidence. Distinguish a suitable agreed
requirement from an implementation merely passing tests against a misunderstood
one. Finish the requested requirements work without implying implementation,
publication or deployment occurred.
