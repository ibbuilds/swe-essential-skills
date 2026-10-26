# Close a requested PR or CI repair loop

Use when the task requires carrying a change through CI or repeated feedback.
A single review or local fix does not automatically start a monitoring loop.
Reuse the project's workflow and the user's existing authorization for repair,
push, merge and publication; these remain distinct actions. No automatic public
comments, approvals, reruns, paid jobs or deployment follow from this reference.

## Establish the current target and remaining work

Bind the PR, comparison base, head, event and required checks to provider evidence.
Resolve actual check/run/job identifiers before retrieving bounded diagnostics;
a workflow name alone can select an older run or another event. Do not invent
provider IDs or treat unavailable or still-pending logs as a passing check.
Review current unresolved feedback against the actual code and intended contract;
neither reviewer confidence nor an outdated conversation proves a defect or fix.

Classify what remains:

- **Actionable defect:** a supported failure in the owned change, with a cause
  and focused repair path. Diagnose before editing or rerunning.
- **Pending execution:** checks still queued or running. Wait within the task's
  useful bound; back off when state is unchanged instead of repeatedly rereading
  all logs or pushing unchanged code to retrigger work.
- **Environment or provider problem:** establish the missing prerequisite,
  unavailable evidence or external outage. A justified authorized rerun can help;
  repeated retries without new evidence do not establish a fix.
- **Human or policy gate:** review approval, draft state, conflict, protected
  branch rule or missing authority. Resolve what is authorized; report the exact
  remaining gate without bypassing it or changing policy to obtain green status.

## Repair and refresh only affected evidence

Make a coherent correction, verify its changed contract and required local gates,
then checkpoint/push when authorized and useful for remote verification. Preserve
unrelated work. Confirm the resulting remote head and reevaluate its applicable
checks and affected feedback. A new revision does not erase an unresolved concern
or invalidate every unaffected fact; freshness requirements still govern gates.

Before declaring readiness, inspect the provider's required-check set for this
revision and event. Missing, cancelled or skipped checks are not success unless
the established policy explicitly permits that state. Keep optional/non-voting
checks distinct. An aggregate green badge and silence from a bot are insufficient.
Use fresh post-check feedback when the workflow produces it, without an endless
wait for hypothetical future comments. Merge only within existing authority and
after the actual merge requirements are met; verify the resulting target state.

Stop on the agreed completion condition, a meaningful time/round bound, or a
specific unavailable capability/decision. Report the current revision, observed
checks, completed remote actions and exact remaining work. Do not call “awaiting
approval,” “checks pending,” or “changes only local” complete.

## Source mechanisms and adaptation limits

[Sentry iterate-pr](https://github.com/getsentry/skills/blob/d12f250460ffd961f549dbebf7eeb0cf4afd4c2e/skills/iterate-pr/SKILL.md)
informs actionable failure/feedback convergence.
[OpenAI gh-fix-ci](https://github.com/openai/skills/blob/49f948faa9258a0c61caceaf225e179651397431/skills/.curated/gh-fix-ci/SKILL.md)
informs targeted failure diagnostics. Use available supported integrations;
neither a particular CLI nor upstream helper behavior overrides revision identity,
cancelled-check semantics, permissions or this repository's completion criteria.
