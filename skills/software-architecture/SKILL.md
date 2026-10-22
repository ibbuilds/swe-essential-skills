---
name: software-architecture
description: Translate accepted goals into technical requirements, system boundaries and architecture decisions for new systems or consequential changes to existing software. Use for feasibility, quality attributes, interface ownership and architecture tradeoffs, not product strategy or routine local edits.
---

# Software architecture

Make the design implementable under the actual constraints. Consume the existing brief and decisions; do not prescribe a stack, distributed architecture, or a new specification ceremony.

## Recover the product direction

For a new project or consequential change, establish the intended users/problem,
accepted outcomes, scope and constraints from the existing plan before choosing
a stack or system structure. If these are unsettled, resolve the material product
decision through focused planning rather than making architecture decide product
strategy implicitly. Reuse adequate decisions; do not reopen positioning for a
local technical change. Record a proposed technical option as a proposal until
its consequential tradeoffs are accepted by the authorized owner.

## Establish what must hold

Reuse the current task’s established operation trace and repository facts where still applicable. Before proposing new boundaries, inspect missing, stale or affected entrypoints, dependencies, storage, deployments and tests; trace input through state changes to output where not already established. Distinguish intended design from observed behavior. Identify callers and independently deployed consumers, including jobs and administration tools.

Convert ambiguous requirements into observable examples. Separate functional behavior, invariants, quality attributes and hard constraints:

- A functional example describes input, preconditions, output and persistent effects, including rejection behavior.
- An invariant holds across competing operations and failures, not only a successful request.
- A quality attribute names a workload or failure, an observable response and an agreed bound. “Fast” is not a target; a response-time percentile requires representative load and a measurement boundary. Do not invent the bound.
- Constraints include supported runtimes/devices, compatibility, residency, offline operation, deployment authority, team capabilities and existing ownership.

Ask only about unresolved facts that change a consequential design choice. If work can proceed reversibly, state the assumption and keep it local. Do not silently choose loss tolerance, authorization policy or destructive migration semantics for the user.

## Choose boundaries from pressure, not fashion

Start with the smallest structure that supports the required ownership and failure isolation. Keep behavior and the data invariants it enforces together unless a concrete constraint justifies distribution. Name each boundary's owner, contract, state, trust level and failure behavior. Separate domain policy from transport or vendor adapters when this makes replacement or testing materially easier; avoid speculative layers for one uncomplicated caller.

Keep an adequate existing design; compare plausible alternatives against the strongest constraints only for unresolved consequential choices, including operating and migration costs. For a consequential choice, preserve a compact decision near the existing design documentation: context, alternatives, decision, accepted disadvantages and evidence that would reopen it. A local correction may need only a code explanation.

For significant uncertainty, build/buy/reuse economics or competing options, read [decision investigation](references/decision-investigation.md). For service, library, CLI, native or embedded constraints, read the relevant sections of [platform boundaries](references/platform-boundaries.md).

## Design the unsuccessful operation too

At every external or trust boundary identify invalid input, unauthorized access, cancellation, timeout, partial success and unavailability. Decide who owns retries and whether repeated execution is safe. Distinguish authoritative state from caches and derived views. A sequence spanning independently committed stores needs explicit reconciliation or compensation; a diagram cannot make it atomic.

Check compatibility during transition, not just the final design: which old and new components coexist, how data is read and written, how cutover is observed, and which changes can actually be undone. Include a deletion/deprecation path for replaced interfaces and resources when applicable.

## Make implementation possible

Reuse the request, issue and task context for implementation: affected modules/contracts, invariant ownership, acceptance cases, dependencies and unresolved risks. Fill gaps; create a separate handoff only when durable coordination needs it. Order implementation by genuine dependencies and uncertainty reduction, not by a compulsory layer-by-layer workflow. Prefer an end-to-end useful slice when it exercises the highest-risk integration early.

Reuse task-local design evidence only where it covers the disputed property and relevant code, configuration, data and environment remain applicable; honor required gate freshness. A skill handoff alone needs no rerun. For gaps or changed behavior, use evidence suited to the disputed property: compile a consumer for API compatibility, exercise an interruption for recovery, measure a realistic workload for performance. Record what the design predicts separately from what a spike or test demonstrated. Avoid calling a design production-ready because its happy path runs.
