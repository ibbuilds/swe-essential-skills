# One project through the suite

This is an illustrative workflow, **not an executed agent test**. Use the names
below through your host's supported skill invocation. Installing skills makes
them available; it does not run every stage or guarantee automatic selection.

## Start with what you have

Suppose you want an internal tool for reviewing documents. You already have a
brief describing reviewers and an approval journey. Supply that brief or its
accessible location, then ask:

> Use project-planning to review this brief. Reuse settled decisions, identify
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

## Different task, different entry

- **A known small bug:** start with debugging or construction; reuse existing
  behavior/acceptance. No new product interview is needed.
- **A code review only:** start with software-review. Findings are not permission
  to edit, publish comments or merge.
- **A database migration:** start with data-engineering plus delivery where
  transition matters; existing product direction need not be reopened.
- **An incident:** start with operations/debugging and authorized containment;
  do not delay recovery to create a greenfield project plan.
- **An unclear new product:** start with project-planning; discovery and definition
  are available where their specific decisions are missing.

## What this does not prove

This walkthrough checks the intended ownership and handoffs. Real activation,
question quality, implementation quality and net usage savings depend on the host,
model, task and actual behavior. Those are not established by this example or the
repository's structural checks.
