# Baseline and change impact

Use this for requirements that have multiple consumers, consequential operational effects or an agreement that must survive revisions. Do not create a traceability platform for a one-line correction.

## Reuse the project's records

An issue, contract definition or versioned specification can be the requirement owner. Reuse existing identifiers, document anchors, pull-request links and test names. For a material requirement retain the agreed statement and acceptance, source/rationale, decision owner, agreement revision and unresolved assumptions. Distinguish proposed, agreed, superseded and implemented/verified status; “implemented” alone does not mean accepted or evidenced.

Trace selectively but meaningfully:

- Backward: what need, obligation or incident explains this requirement? If it is derived from a design choice, record that origin and review implications rather than presenting it as a stakeholder demand.
- Forward: which boundary/design decision owns it, where is it implemented, which checks establish it, and which release or operational observations matter?

Links must carry enough meaning to locate the affected contract, not just point to a huge repository. Tests that cover several requirements can link to each; do not force a one-test-per-requirement model. Review orphaned obligations with no implementation/evidence and unexplained behavior with no intended purpose. An orphan is a question to resolve, not automatic permission to delete code.

## Assess a change before accepting its consequences

Compare old and proposed meaning, including which previously valid inputs or transitions change. Follow relevant links to consumers, schemas, stored data, dependencies, security assumptions and operational procedures. Look for unlinked consumers through repository search, interface inventories and authorized runtime evidence when appropriate; the existing trace can be incomplete.

Identify design/code/test updates, migration needs, mixed-version behavior, rollout order, recovery limits and support documentation. Reassess feasibility and assurance obligations where their assumptions change. Separate proposed impact from confirmed evidence. Obtain the applicable owner's acceptance before replacing an agreed consequential contract, and preserve the prior version and rationale.

After authorized implementation, attach actual evidence to the relevant revision and mark gaps honestly. Review changed links and stale assertions: keeping a test name while changing its oracle does not preserve the old acceptance proof. Update the agreed baseline through the project's existing process; no extra approval board is implied.

## Reconcile a partial specification change

When applying an accepted delta to an existing issue, contract or specification,
read the current target and the selected delta together. Identify additions,
modifications, removals and renames by their actual requirement or scenario;
apply only the authorized selection. A partial delta is not a replacement for
the whole baseline. Preserve unrelated requirements, scenarios and concurrent
edits, including those absent from the proposal's older snapshot.

Resolve overlapping changes against the current agreement before overwriting
them. A missing modification target, conflicting duplicate addition or ambiguous
rename is a conflict to resolve, not permission to invent or silently replace a
requirement. If a requested operation is already applied, avoid duplication or
another rewrite. Delete only what the accepted removal covers; an empty section
does not itself authorize deleting a document with other useful content.

Review the resulting semantic diff: intended changes are present, retained
obligations survive, and links still identify the right requirement. Keep
accepted specification state separate from implementation and verification
state. Use the existing records and workflow; this does not require OpenSpec,
new document scaffolding or an additional approval for an already accepted delta.

## Case: retention change

An approved change reduces active-record retention. Impact is not limited to one cleanup job: identify replicas, derived stores, exports, backups, legal holds if applicable, users' recovery expectations and deletion audit needs. Confirm precise scope and exceptions with responsible owners rather than interpreting retention law. Assess whether restoration could resurrect expired data and what behavior must follow.

Link the revised requirement to storage/deletion design, cleanup implementation, age-boundary and exception checks, restoration handling and operational evidence. If a downstream export cannot meet the revised requirement, report that affected obligation as unresolved; do not mark the whole change complete because the primary table is clean.

## Case: local wording correction

A UI label changes without changing its meaning or behavior. The accepted issue, localized resource and applicable check may provide all necessary continuity. Do not invent requirement IDs, a formal baseline document or an architecture review unless actual project obligations require them.

## Expert reference

[SEBoK: Requirements Management](https://sebokwiki.org/wiki/Requirements_Management) provides the basis for controlled requirement evolution and traceability supporting impact analysis. This lightweight software adaptation does not prescribe a specific tool, document hierarchy or lifecycle model.

[OpenSpec's semantic spec synchronization](https://github.com/Fission-AI/OpenSpec/blob/6d04a1b58dedc95729d34e4f223d9d483aae210a/skills/openspec-sync-specs/SKILL.md)
informs the selective delta procedure; its CLI, store setup and deletion policy
are not imported.
