---
name: software-requirements
description: Resolve material ambiguity, conflicting needs, acceptance gaps or consequential requirement changes in software. Elicit and validate engineering contracts and their change impact; clear local changes with adequate acceptance need no new requirements workflow. Not for marketing strategy or generic task management.
---

# Software requirements

Establish what the software must do and what must remain true before committing to a consequential interpretation. Reuse the accepted goal, existing issues, specifications, contracts and decisions. Do not restart product positioning or require a specification phase before every small edit. Requirements, design, implementation and validation can develop together in useful increments. If the current request and established contracts already settle the changed behavior and acceptance, use them directly rather than repeating elicitation or producing another specification.

## Connect to the project plan

Consume the existing product problem, users, scope, outcomes and decisions before
expanding engineering requirements. If a supplied plan is incomplete, distinguish
missing product intent from missing technical detail: resolve only the former
with the appropriate product owner; investigate the latter from available
sources and engineering evidence. Do not treat a polished PDF or complete-looking
template as proof that consequential decisions are settled. Carry the clarified
contract back into the same authoritative plan instead of creating a competing
specification. A missing product-plan document does not invalidate adequate existing intent
and acceptance, including for substantial ongoing work. Investigate or ask only
for gaps material to the changed contract.

## Recover the need and its context

Identify the affected system boundary, actual users and their environment, external systems, and people who operate, support, secure or retire it. Include indirect consumers: scheduled jobs, library callers, administrators, assistive-technology users and older client versions where relevant. Trace a representative journey through its inputs, decisions, state changes and outcomes, including failure and recovery.

Inspect applicable code, tests, interface definitions, incidents, support evidence and existing commitments. Label each statement by what it establishes: an approved need, an observed behavior, a proposed interpretation, or an assumption. Legacy behavior and tests are evidence, not automatic proof of intended policy. Follow an explicit current decision from the authorized requirement owner, updating the prior baseline and affected acceptance criteria. If it conflicts with an external commitment or obligation that owner cannot change, explain the conflict and seek the needed decision rather than silently overriding either. Preserve the source and the person or role able to resolve a disputed expectation. Do not contact stakeholders, expose their data or modify shared records without applicable authorization.

Use [elicitation and conflict cases](references/elicitation-and-conflicts.md) when intent, terminology or sources disagree. Ask targeted questions whose answers change behavior or acceptance; continue reversible work that does not depend on the answer.

## Express the contract, not a preferred solution

Describe the relevant categories, not a mandatory checklist for every change:

- **Functional behavior:** actor, trigger, preconditions, inputs, result, state changes and rejection/error behavior.
- **Invariants:** conditions preserved across concurrency, retries, interruption and recovery, not merely a successful sequence.
- **Interfaces and data:** producers/consumers, identity and authorization, formats and semantic meaning, units, ordering, compatibility, ownership, retention and deletion where applicable.
- **Quality and operational needs:** workload/environment, observable response, measurement boundary and agreed limit; availability, accessibility, resource use, recovery, diagnosability or support needs as relevant.
- **Constraints:** actual platforms, deployment authority, supported versions, integration commitments, hardware and assurance obligations. Distinguish a mandated constraint from a convenient design proposal.

Use consistent domain terms; define ambiguous states such as “saved,” “confirmed,” “deleted” or “available.” Split independently changeable obligations, while keeping related conditions together. Give consequential requirements an existing stable identifier or link and enough rationale to preserve their meaning. Avoid invented thresholds, default loss tolerances and implied security policies. Mark unresolved values explicitly rather than disguising them as acceptance criteria.

## Reconcile and check feasibility

Make conflicts explicit with a concrete counterexample: under what condition can the requested obligations not both hold? Compare options and their user, data, operational and implementation consequences. When conflicting sources have unresolved authority or intent, obtain the decision from the appropriate owner rather than choosing by recency, prominence or implementation convenience. Do not request approval again for an already explicit authorized change. Record unresolved assumptions, their consequences and what would confirm or replace them.

Separate mandatory obligations from negotiable scope, and importance from delivery order. Check dependencies, interoperability, resource limits and feasibility proportionately. Use a focused prototype, representative measurement, consumer check or expert review when it can decide a material uncertainty; record its limitations. An experiment can establish feasibility, not stakeholder acceptance. Escalate an infeasible combination with alternatives instead of silently weakening it.

For safety, regulatory or contractual assurance, identify potentially applicable obligations, jurisdiction/system classification, responsible specialists and required evidence. Verify applicability and versions with authoritative sources and qualified owners. Do not invent legal interpretations, waive obligations, or claim certification from this workflow. Requirements for physical hazards or high-consequence systems may need system-level analysis and independent assurance beyond ordinary software tests.

## Validate meaning and acceptance

Walk the proposed behavior through representative users' and operators' scenarios, including adverse states. Check that it addresses the accepted need, is consistent with other obligations, is feasible, and has an observable acceptance method. Distinguish validating the intended requirement with its owner from later verifying an implementation against it; passing a test of a misunderstood requirement proves neither suitability nor agreement.

For each material requirement identify the evidence, conditions, expected result and acceptance owner. Test, inspection, analysis, demonstration or representative user evaluation may be appropriate; do not force every claim into a unit test. Read [acceptance and validation](references/acceptance-and-validation.md) for measurable examples and unresolved-target handling. Proposed examples and unrun checks are not observed evidence.

## Preserve decisions through change

Capture the agreed scope/version, source, acceptance and unresolved items in the project's existing issue, document or repository convention. A small correction may need only a precise issue and regression; a consequential multi-party contract needs a reviewable baseline. Baseline means an identifiable agreement, not a frozen waterfall phase or permission to implement/deploy.

Connect important requirements to their design/contract owner, implementation, verification and operational evidence as appropriate. Use existing links and identifiers, not a parallel tracker. On change, follow those connections in both directions: affected consumers, assumptions, tests, migrations, rollout coexistence, recovery and support. Reconfirm changed acceptance with its owner and retain why an obligation was replaced or retired. See [baseline and change impact](references/baseline-and-change-impact.md).

Leave a usable engineering handoff: agreed behavior and constraints, concrete acceptance, affected contracts, material unresolved decisions and evidence needed next. Architecture chooses the solution, construction implements it, verification establishes evidence, and operations observes it in service; none should have to guess which requirements are still proposals.
