---
name: swe-essential-skills-software-review
description: Review a code change, diff or PR for supported defects without editing it. Use for revision-specific review; repairs, test implementation and dedicated threat audits have separate workflows.
---

# SWE Essential Skills / Software Review

Judge a concrete change against its intended behavior and surrounding contracts. Review is not permission to repair files, publish comments, approve a pull request, or merge. Return findings privately unless the user separately authorizes another action. Do not mutate code to demonstrate a defect during a read-only review.

Reuse an applicable native review rather than automatically launching a second
full pass. Investigate unresolved coverage or findings, while verifying decisive
claims as described below; a user-requested independent review is a different task.

## Establish what is being reviewed

Identify the repository, requested comparison, base and head revisions, and any selected paths. For branch changes, distinguish the branch's changes since its merge base from a direct comparison of two tips; choose the comparison matching the request. For an uncommitted patch, account separately for staged, unstaged, and relevant untracked files. Do not silently treat the current checkout as the requested PR head or switch a shared checkout.

Reuse trustworthy purpose, requirements, repository instructions, reported checks, and source context already tied to the reviewed revision; re-open what is missing, changed, or needed to decide a finding rather than rebuilding the entire context. Confirm the actual diff and changed-file list, including deletions, renames, configuration, dependency and generated artifacts. Independently verify decisive assertions against the relevant source, contracts, or observed checks: prior findings, descriptions, and green statuses are leads, not conclusions to inherit uncritically. Where only a partial patch is available, name the unavailable context rather than inventing it.

Record a stable revision identity or patch snapshot. Read source, tests, callers, and line numbers from that same snapshot. If another actor changes the head, distinguish old evidence from the new state; never combine old source with new line numbers and call it one review.

## Follow the changed behavior

Start with the most consequential changed contract, not necessarily the first file. Trace one representative input through the changed decision, downstream side effects, returned result, and caller handling. Compare that path with the base implementation and required behavior. Then select adverse paths that could invalidate the contract.

For each changed public function, schema, event, command, or configuration default, locate real consumers and relevant tests. Inspect neighboring code beyond the diff where it supplies validation, authorization, cleanup, retries, or invariants. Search for alternate call sites, implementations and serialization paths before declaring a local behavior safe or broken. Do not assume an absent search match proves there are no external consumers.

Use several lenses on this traced path, proportionate to its risk:

- **Behavior:** boundary values, missing/invalid input, state transitions, error propagation, ordering, cancellation, and resource cleanup. For timeouts, determine whether the operation actually stops or merely stops waiting; a caller retry after a committed side effect can duplicate work.
- **Contracts and architecture:** compatibility with supported clients, ownership boundaries, transaction scope and recovery. Trace old persisted records through new readers and new records through older readers where rollback or rolling deployment requires it. Consider mixed application revisions, queued old events, caches, migration ordering, and defaults, not only a fresh installation.
- **Security:** follow changed trust boundaries and sensitive flows; check whether real callers can bypass the assumed guard or broaden access. State a reachable abuse condition rather than reporting suspicious syntax alone. A deeper audit may be needed; this review is not one by implication.
- **Performance:** relate added work to input size, concurrency, hot-path frequency and resource limits. Show why a query-per-item, retained buffer, blocking operation, or unbounded retry is consequential in this context. Do not label unfamiliar code slow without a plausible mechanism; measurements may remain required.
- **Maintainability:** look for conflicting sources of truth, hidden coupling, unclear ownership or misleading control flow that materially increases error risk. Explain the concrete maintenance consequence and a focused improvement; personal naming or architectural preferences are not defects.

Inspect tests as evidence of these contracts, not simply as present or absent. Determine whether their setup reaches the changed path and whether their assertions would detect the proposed failure. Recommend a specific missing scenario when it matters; do not demand an arbitrary coverage percentage or reproduce the entire verification workflow.

When tests, acceptance budgets, CI gates, exclusions or waiver records change,
compare their meaning with the accepted baseline. Look for lost assertions,
skipped/deleted checks, broader suppressions, relaxed thresholds or new exceptions.
Distinguish an equivalent or stronger replacement and an authorized requirement
change from unapproved weakening. Explain the concrete guarantee lost; a removed
assertion or a matching keyword alone is not a defect. Green checks do not prove
the original acceptance bar survived. Unchanged controls need no new audit.

## Turn suspicions into defensible findings

For each candidate, try to disprove it before reporting it. Inspect the caller's guarantees, framework/version semantics, guards, error handlers and supported configurations. Compare the base behavior: distinguish newly introduced regressions, pre-existing defects exposed by the change, and unrelated problems. A test failure caused by missing setup is not a product defect.

Prefer a short causal demonstration: triggering condition → changed operation → observable wrong result. A source trace may suffice. Safe, focused checks may use isolated temporary outputs or caches within existing authority, provided they do not alter the reviewed source or interfere with shared state. Inspect unfamiliar commands first. A read-only review does not itself authorize modifying the reviewed checkout, installing dependencies, contacting live services, exposing private data, or changing shared or external resources. Propose checks requiring additional authority rather than executing them; report unexecuted checks as proposals.

Classify candidate outcomes explicitly:

- A supported defect becomes a finding, prioritized by impact and realistic reachability.
- A consequential unknown becomes a question or limitation, with the missing fact that would settle it.
- A style preference remains an optional suggestion, if useful at all.
- A disproved concern is dropped; retain its decisive evidence when explaining a disputed or previously reported finding.

Deduplicate symptoms with the same cause. Confidence describes evidence strength, not impact: an uncertain catastrophe is not automatically a confirmed critical defect. Do not manufacture findings to fill a quota, alter correct code to satisfy a reviewer score, or dismiss a report merely because tests pass.

## Finish against the actual revision

Before reporting, recheck that the target identity has not changed and that each cited location still supports its claim. When reviewing a correction, inspect the new diff and affected paths, not just whether the original line disappeared; determine whether the cause is fixed, moved, or still reachable. Keep unresolved earlier concerns attached to their current evidence rather than considering outdated comments resolved automatically.

A single requested review ends after the scoped pass. For an explicitly requested repeated review, agree on the revision/event being awaited and a meaningful bound on rounds or elapsed time. Reassess changed paths after each revision; do not spin waiting for a perfect score. If the bound, timeout, missing capability, or authority boundary is reached, report the partial state and exact remaining action instead of claiming completion or expanding scope.

Lead the result with actionable findings, ordered by consequence. Each finding should include:

- A concise problem statement and impact/priority using the project's convention when available.
- The file and smallest useful line range (or symbol when lines are unavailable). State the common reviewed revision or patch identity once for the report; repeat it for a finding only if its snapshot differs.
- The triggering condition, violated contract, consequence, and supporting trace or observed check.
- Confidence and any material assumption; a focused correction direction or regression scenario when useful.

Separate questions and optional suggestions from defects. Close with the base/head or patch identity, reviewed paths/contracts, checks actually performed and outcomes, and material scopes not reviewed. If there are no supported findings, say so for this scope and revision; do not claim universal correctness, successful deployment, or that unrun checks passed.
