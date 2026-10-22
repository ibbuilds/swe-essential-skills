---
name: project-planning
description: Establish or reconcile a coherent product-to-engineering plan before implementing a new project or consequential expansion. Reuse existing plans, resolve material gaps, and prepare a buildable first slice. Not a mandatory planning phase for trivial fixes or already-defined local changes.
---

# Project planning

Help the user reach a coherent plan before dependent implementation commitments, starting with the problem and product rather than a preferred stack. Keep the process proportional: a small new tool can need a short brief, while a multi-party system needs durable decisions and explicit risks. Planning is iterative, not a promise to settle the entire lifecycle upfront.

## Choose the right entry point

Use this workflow for an explicit planning request, a new product/project, or an expansion that changes the product direction, major boundaries or delivery commitments. If the user clearly requests a structured project, proceed without asking permission to plan again. If a vague idea might mean brainstorming rather than starting a project, ask briefly whether they want to explore the idea or develop a structured plan; do not silently start implementation. A routine bug fix, styling correction or sufficiently defined local change should use its existing contract directly.

This skill supplies instructions when selected; it does not install chat-start hooks, monitor conversations or guarantee host activation. It works independently: complementary skills such as product-discovery, product-definition, software-requirements or software-architecture may deepen a relevant decision when available, but are not prerequisites. Hand over established context and the specific unresolved decision, not an instruction to restart their whole workflow.

## Recover and reuse the starting point

First use the current conversation and available project evidence. Ask for an existing plan only if none is already available; accept a PDF, Markdown document, link, MCP-accessible record, gist, repository plan or a rough description. Read the actual accessible contents, not just their title or URL. For imported, fragmented or conflicting plans, read [plan intake](references/plan-intake.md). If access is blocked, name the missing source and request an accessible copy or relevant excerpt; continue only the independent work. Never imply an unread document was reviewed.

Preserve the user's chosen goal, constraints and established decisions. Distinguish:

- **Intent:** what the user or authorized owner wants and has accepted.
- **Evidence:** what a source, observation or experiment actually establishes, with its scope and date/version where material.
- **Proposal:** an option awaiting a decision, not an approved requirement.
- **Assumption or unknown:** what is not established, its consequence and the evidence or decision needed.

Existing code demonstrates behavior, not necessarily intended product policy. A polished plan is not evidence of demand or feasibility. Resolve authority conflicts explicitly; do not overwrite an accepted decision simply because another document is newer.

## Establish product direction before selecting the solution

Recover or help formulate the intended users, their problem and current alternatives; why this project is worth doing; desired outcome and success evidence; core journeys; scope and non-goals; and real constraints such as timing, resources or obligations. For an existing product, carry forward the accepted strategy and inspect only what this change challenges. Avoid reopening settled positioning or requiring market research for every utility.

Develop missing product discovery, strategy and definition through concrete options and representative scenarios. Keep claims about users, demand or differentiation separate from hypotheses. When uncertainty could invalidate the project, propose the smallest useful validation: a workflow walkthrough, prototype, user feedback or feasibility experiment, with a question and decision it can inform. Obtain authorization before contacting people, spending money or sharing artifacts. Do not invent research results, success thresholds or stakeholder agreement.

Once the product direction is coherent enough, derive the engineering implications: required behavior and acceptance, system and trust boundaries, data lifecycle, integrations, quality needs, architecture choices and delivery approach. Do not let an arbitrary technology choice silently define the product. Conversely, surface technical constraints that require revisiting scope or strategy rather than pretending the stages never interact.

## Audit material gaps, not every possible question

Compare the evidence with the next commitment. Use [gap coverage and readiness](references/gap-coverage-and-readiness.md) when the plan is incomplete, consequential or spans several lifecycle concerns. It provides a coverage lens, not a questionnaire to paste into chat.

Prioritize gaps by the harm of guessing and the cost of later reversal:

- **Resolve before commitment:** a missing decision changes the product's purpose, acceptance, authorization, sensitive-data handling, irreversible effects or a major dependency.
- **Investigate early:** uncertainty threatens feasibility or creates substantial rework; define a bounded experiment or decision task.
- **Proceed provisionally:** a reversible detail can use a clearly labeled assumption, with a revisit trigger.
- **Defer deliberately:** a later-stage concern has no current design consequence; retain its owner or checkpoint before it becomes binding.

Before asking a candidate question, check the supplied plan and prior answers for
its answer, including relevant linked sections or tables. Use already established
source references rather than repeatedly rereading the entire collection. An
unreadable or uninspected section is an access/coverage gap, not proof that the
user omitted the answer; disclose the specific limit. If sources already answer
it consistently, use that answer. If they conflict, ask about the conflict rather
than restarting the question from scratch.

Inspect discoverable facts rather than asking the user to supply them. Ask only the highest-leverage unresolved questions that cannot be answered from available context. Group independent questions when that helps; resolve upstream choices before asking questions that depend on them. Offer a reasoned recommendation or alternatives where useful, and explain why the question matters and what its answer unblocks. Each gap can be answered, investigated, handled with a safe provisional assumption, deferred to its decision point or dropped as irrelevant; an interview is not the only path. Do not repeat answered questions, demand exhaustive questionnaires or block independent reversible exploration while awaiting one decision. Unknowns may remain; consequential unowned risks may not be disguised as certainty.

## Maintain one usable plan and a buildable slice

Use the project's existing canonical artifact and format. For a new or fragmented plan, read [usable plan shape](references/usable-plan-shape.md); adapt its compact structure rather than generating all sections mechanically. Keep durable decisions, sources, open risks, dependencies and next actions together or linked. A private local draft is preferable to creating an unrequested shared tracker. Plan approval is not permission to publish, deploy, buy services or mutate external systems.

Identify the first useful end-to-end slice, with behavior and acceptance, relevant design/contracts, dependencies, verification approach and the risks it resolves. A learning spike instead needs a specific uncertainty, bounded scope, success/failure evidence and a decision afterward; do not call a spike a shipped feature.

Begin implementation only when that slice has enough agreed intent and concrete acceptance to avoid consequential guessing, its blocking risks are resolved or explicitly accepted by the appropriate owner, and the requested implementation is authorized. A request only for a plan ends with the usable plan and next decision, not unsolicited coding. Do not require a separate approval ritual when the user's request and existing authority already authorize proceeding.

## Reconcile transitions and changes

At discovery → definition → design → build → verification → release → operations, review what is changing and the evidence needed for the next commitment; do not treat these as mandatory sequential phases. Carry forward still-valid decisions and evidence. Before dependent commitments, inspect applicable UX/accessibility, security/privacy, data, deployment and operational implications, including migrations, coexistence, rollback/recovery and ownership. The depth should follow exposure and reversibility, not the presence of a heading in a template.

When implementation, a test, user feedback or an incident contradicts the plan, identify the affected assumption or requirement and its downstream effects. Update acceptance, design, sequencing, security/data decisions, release and support plans where affected; record the reason and superseded decision. Reopen only the impacted choices. Escalate scope or risk acceptance to the appropriate owner without silently weakening the goal or restarting all discovery.

Keep the user informed at meaningful decision and outcome boundaries: what the
plan establishes, a consequential recommendation and its reason, the unresolved
choice that needs them, or a material change/blocker. Make assumptions and changes
to agreed scope visible before dependent commitment, not only in a final report.
This is concise decision transparency, not narration of every read or a second
approval ceremony. Respect the user's desired update cadence.

Report the useful result first: current direction, material gaps or decisions, ready slice and immediate next action. Then link the durable plan and supporting evidence if available. State what remains unknown, proposed or unverified; a completed plan is neither a verified implementation nor a production-readiness claim.
