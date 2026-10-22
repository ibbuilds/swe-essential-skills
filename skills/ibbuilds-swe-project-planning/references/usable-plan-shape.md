# Usable plan shape

Use when actual planning or coordination needs a durable artifact or consolidation. Adequate conversational decisions can support ongoing work without a separate plan document; missing paperwork alone does not activate this workflow. Fit the existing artifact and audience; combine or omit sections that add no decision value. A small project can express this in a page. A larger project can link existing specifications and decisions instead of duplicating them.

## Compact plan

1. **Direction:** intended users and problem, why this approach is worth pursuing, desired outcome and evidence of success. Separate validated evidence from hypotheses.
2. **Definition:** core journey, in/out scope, acceptance examples, constraints and relevant nonfunctional needs. Keep proposed thresholds visibly provisional.
3. **Solution decisions:** appropriate system/data/trust boundaries, reuse/integration choices, important tradeoffs and reasons. Identify decisions not yet made rather than filling them with a default stack.
4. **Delivery slices:** first useful slice, later dependencies, acceptance and verification evidence. Prefer sequence and decision points over invented dates or effort estimates; label estimates and their basis when requested.
5. **Lifecycle implications:** material security/privacy, accessibility, data, rollout/recovery, support and operating implications, linked to specialist detail only when needed.
6. **Open decisions and risks:** unknown or assumption, consequence, resolving evidence/owner, next action and revisit trigger or latest safe decision point.
7. **Decision provenance:** source links or identifiers, accepted versus proposed status, material decision owner, and a short record of changed/superseded choices.

Each next action should make clear what result it establishes. “Research backend” is weak; “Check whether the existing provider supports required regional retention before choosing storage” identifies the decision, dependency and stopping condition. Do not fabricate owners, deadlines, agreements or measurements.

## Reconcile dependent slices before committing to them

Where separate tasks or components share an interface, compare what the producer
plans to provide with what the consumer expects: operation or event name,
fields/types/units, identity and authorization context, error/retry behavior,
version and availability/order assumptions. A dependency arrow alone does not
establish compatibility. Resolve a concrete mismatch at the existing contract
owner before dependent implementation; ask the user only for an unresolved
user-owned decision, not a fact already settled by the authoritative contract.

Use one short discrepancy per affected interface in the existing plan when useful,
not a compulsory new contract matrix for every task. Preserve supported old/new
combinations where delivery spans versions. A single local change with no shared
boundary needs no cross-task reconciliation exercise.

## Keeping the plan durable

Use stable links to authoritative requirements, design decisions, implementation and verification when coordination warrants them. Avoid maintaining a second roadmap or copying a long specification into every handoff. Save in an authorized project location; otherwise provide the plan directly and identify a proposed location without claiming it was saved.

On a material change, update the affected decision and downstream acceptance/dependencies, retaining its reason and source. Mark displaced decisions as superseded instead of leaving two contradictory active instructions. The plan should let a later reader tell what is agreed, what evidence exists, what is provisional and what they can do next without re-interviewing the user.
