# One project through the suite

This is an illustrative workflow, **not an executed agent test**. Use the names
below through your host's supported skill invocation. Installing skills makes
them available; it does not run every stage or guarantee automatic selection.

## Joining an ongoing project

If you are already implementing an agreed feature, continue that work. The
conversation, issue, accepted decisions and affected code may already provide
what is needed; do not request a replacement plan or scan the entire repository
just because the suite was installed. This also applies to substantial work,
not only small corrections. Reuse current evidence and inspect only missing,
stale or affected facts. A new chat should recover the available handoff and
current relevant state, not replay discovery.

If a new decision becomes material, resolve that specific gap before dependent
work. For example, adding external access to an internal feature may require an
authorization decision; changing an internal implementation does not inherently
reopen the product's audience or positioning. Continue independent agreed work.
This is task-sensitive assistance, not a user-selected rigid operating mode.

## Start with what you have

Suppose you want an internal tool for reviewing documents. You already have a
brief describing reviewers and an approval journey. Supply that brief or its
accessible location, then ask:

> Use swe-essential-skills-project-planning to review this brief. Reuse settled decisions, identify
> consequential gaps, and help me choose the remaining product and engineering
> decisions before implementing anything. Keep questions specific and concise.

If you only have the idea, describe the intended problem and constraints instead.
The agent should help develop the plan, not make you fill in a giant form.

## What useful progress looks like

1. **Recover the plan.** Read the actual accessible brief. Say what it settles,
   which portions could not be read, and what remains uncertain. Do not ask who
   the reviewers are if the supplied brief already says so.
2. **Resolve the missing product decision.** If guests might access private
   documents and the brief is silent, explain the options and consequence. The
   user chooses. Do not silently assume public links or reject all guest access.
   Product discovery/definition can deepen missing problem, positioning or scope
   work, but should not repeat a complete accepted brief.
3. **Establish engineering readiness.** Requirements turn the chosen journey into
   observable behavior, authorization, data and failure contracts. Architecture
   presents meaningful stack/system tradeoffs if still open. Data retention,
   recovery and hosting constraints are considered before they lock in the wrong
   design, not postponed merely because deployment occurs later.
4. **Keep one plan.** Update the existing authorized plan with accepted choices,
   proposals, acceptance, dependencies and unresolved risks. Link supporting
   detail rather than making a second brief for every skill. An unreadable PDF
   does not become a magically saved or edited plan.
5. **Prepare a coherent slice.** An initial upload-and-review journey may be useful
   only if access control and failure handling make it meaningful. A feasibility
   spike instead answers a specific uncertainty and is not a production feature.
   Identify what is ready and what remains blocked; do independent authorized
   work without guessing the blocked decision.
6. **Implement when requested.** Construction and the relevant client/backend/data
   guidance reuse that plan. They preserve project conventions, avoid unnecessary
   computation/IO and do not redesign the product silently. Verification uses
   existing suitable checks plus meaningful gaps; debugging investigates actual
   failures rather than stacking speculative fixes.
7. **Checkpoint and deliver.** With the applicable authority, commit/push coherent
   changes to the correct branch. A push, merge and production deployment are
   distinct actions. Delivery verifies the real artifact and environment;
   operations establishes support, useful signals and recovery. Neither green CI
   nor a successful upload proves the complete user journey works.
8. **Feed results back.** If implementation reveals a constraint that changes the
   plan, show the tradeoff and obtain the owner's changed choice. Update the
   affected acceptance and dependencies, not every historical planning phase.

## Expected continuity, not another mandatory template

The next step should be able to recover: accepted goal/scope, applicable source,
user-owned decisions, affected contracts, next slice/acceptance, current evidence
and blockers. Preserve those in the existing project record when useful. Do not
paste the entire conversation or all skill files into each handoff.

A useful update is concrete: “The brief settles reviewer roles. Guest access is
still undecided and changes document permissions; here are the options.” A poor
update repeats the whole brief, claims research that did not happen, or says
“everything is ready” while concealing the missing decision.

## Route to the smallest useful owner and finish the request

Skills supply optional, complementary methods. Select the owner of the unresolved
work and add another method only for a real gap; no request must traverse all 18.
Use adequate built-in capabilities and project checks rather than duplicate passes.

| Ordinary request | Start with | Concrete finish evidence |
| --- | --- | --- |
| Wording that preserves meaning and behavior | Construction only if implementation guidance is useful | Inspect the changed usage and final diff; preserve required checks and relevant rendering/localization checks. No new literal-string test or repeat of unaffected behavioral checks is needed by default. |
| Clear feature or local behavior change | Construction and the affected domain owner if needed | Requested behavior works at its real boundary, plausible regressions are checked, and authorized delivery is complete. Adequate acceptance and delegated choices need no new planning phase. |
| Known defect | Construction; debugging when cause is unexplained | Correct the owner, reproduce the defect where practical, and verify the changed and plausibly affected contracts. |
| Test strategy gap | Verification | Evidence that can refute the claim, relevant required gates satisfied, precise remaining limits. Running an established recipe needs no new strategy. |
| Code review only | Review | Revision-specific supported findings or a scoped no-findings result; no repair, publication or merge without authority. |
| Data migration or compatibility transition | Data engineering or evolution; delivery when rollout matters | Preserved data/consumer invariants, executed checks, actual transition state and remaining cutover/recovery work. |
| Incident | Operations/debugging and authorized containment | Current impact/health, observed recovery and remaining cause or restoration uncertainty. Do not delay containment for a new plan. |
| Unclear new product or consequential expansion | Project planning; discovery/definition only for their unresolved decisions | One usable direction and ready slice, or the specific owner decision/evidence blocking it. Respect bounded delegation. |
| Build, release or deployment | Delivery within existing authority | Intended artifact/target identity, consumer/runtime evidence and actual publication/deployment status; a successful upload alone is insufficient. |

For authorized Git work, stage only owned changes after reviewing staged paths
and diff; preserve unrelated user work. Commit coherent behavior or recovery
boundaries, combining adjacent trivial edits. Push when requested or needed by
the authorized remote workflow after checking branch, remote and automatic
effects; verify the resulting remote revision. Commit, push, PR, merge and deploy
remain separate actions. Report any blocked step as local versus remote state.

Reuse valid test evidence across skill handoffs and wording-only follow-ups;
rerun only missing/invalidated checks or gates whose freshness requires it. Finish
when the requested behavior and authorized delivery are complete with adequate
evidence, or identify the precise unresolved action instead of claiming completion.

## What this does not prove

This walkthrough checks the intended ownership and handoffs. Real activation,
question quality, implementation quality and net usage savings depend on the host,
model, task and actual behavior. Those are not established by this example or the
repository's structural checks.
