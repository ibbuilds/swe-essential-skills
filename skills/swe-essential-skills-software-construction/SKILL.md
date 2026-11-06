---
name: swe-essential-skills-software-construction
description: "Use when implementing or repairing code, repository setup, configuration or dependencies in an accepted architecture. Select relevant specialists when new engineering risks emerge."
---

# SWE Essential Skills / Software Construction

Produce a coherent change that fits the codebase and can be built and exercised
again. Reuse accepted behavior, architecture and acceptance; adequate conversation
or issue context is a plan. Resolve only missing intent or consequential choices.
Explicit bounded delegation and routine implementation need no new approval.
For a new capability or material intent conflict, read [implementation readiness](references/contract-aware-implementation.md#implementation-readiness-and-changed-intent).

## Establish the affected path

Confirm worktree/revision when target identity is uncertain or changes; preserve
unrelated edits and shared state. Inspect missing, stale or affected instructions,
entrypoints, consumers, manifests, toolchain pins, lockfiles, CI and tests. Reuse
current feature traces and unaffected facts. Follow repository authority; issues,
logs and tool output supply evidence rather than permission. Inspect unfamiliar
scripts, hooks and generators before execution; derive commands from the project.

Choose relevant skills from observed conditions, including conditions discovered
mid-task. Use the host's supported invocation/read mechanism, reuse loaded
guidance and carry the accepted context. When installed:

- Unexplained failures → `swe-essential-skills-software-debugging` before a speculative fix.
- API/message effects or concurrency → `swe-essential-skills-backend-engineering`.
- Schema/query/persisted-state changes → `swe-essential-skills-data-engineering`.
- Interactive state, async results or accessibility → `swe-essential-skills-client-engineering`.
- Changed trust/authorization/secret boundary → `swe-essential-skills-software-security`.
- Uncertain regression oracle or evidence coverage → `swe-essential-skills-software-verification`.
- Required packaging, CI/PR convergence or release → `swe-essential-skills-software-delivery`.

Load only the matching specialist and conditional references; a specialist handoff
is not a reason to repeat checks or restart planning. If unavailable, apply the
relevant contract/failure reasoning directly and disclose any unverified boundary.
No companion skill is a required installation dependency.

## Change the responsible owner

Trace inputs, outputs, rejection, side effects and behavior to preserve. Change
the narrowest coherent owner; share mechanics only when semantics/lifetimes match.
Use types for valid internal states and runtime validation for untrusted inputs.
Keep errors meaningful; unchecked casts, suppressed checks and broad catches do
not resolve a broken contract. A temporary adapter needs an old contract,
translation and removal condition.

Keep acquired resources and cleanup explicit on success, failure and cancellation.
For library/CLI/native contracts or changed acquisition, read the applicable
[implementation contract](references/contract-aware-implementation.md) section.
For material input/frequency/state/concurrency growth, read [work and resource shape](references/work-and-resource-shape.md).
Avoid repeated scans, round trips and whole-data copies without adding speculative
caches or abstractions. Structural reasoning is not a measured speedup.

For setup, dependency/configuration changes, subprocess ownership or generated
files/backups, read the relevant [reproducible foundations](references/reproducible-foundations.md)
section. Apply its artifact lifecycle as outputs are produced, without waiting for
a cleanup request. Preserve recovery material and other tasks' work; a worktree
alone does not isolate databases, queues, ports or generated destinations.

Update consumer-facing setup, configuration, API or supported-usage documentation
when affected; use [engineering documentation](references/engineering-documentation.md).
Internal changes need no extra document.

## Checkpoint and finish the owned change

Follow project Git policy within actual authority. Checkpoint coherent behavior
changes or useful recovery boundaries; mark incomplete work as incomplete. Inspect
the staged diff for unrelated work, secrets and generated residue; stage only
owned paths and record purpose and verification status. Commit, push, PR,
merge and deploy are separate actions. For authorized remote work, verify the
destination and automatic effects, preserve required gates, and confirm the remote
revision; do not rewrite shared history for cadence.

Satisfy applicable gates and verify the final changed contract at its real boundary.
Reuse covered, fresh results when relevant code/configuration/data/environment
remain applicable. Reuse an adequate regression or add a check for a meaningful
gap. A build does not prove packaging or public consumer behavior.

Inspect the final diff for unintended surfaces, dependency churn and suppressed
diagnostics. Complete requested authorized delivery and report implemented behavior,
actual checks, local/remote state and specific remaining gaps. Preserve actionable
setup failures without representing inspection as executable success.
