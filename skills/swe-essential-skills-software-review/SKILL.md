---
name: swe-essential-skills-software-review
description: "Use when asked to review a concrete diff, code change or PR for defects, or assess a revised correction. Review the specified revision; source changes and publication require their own scope."
---

# SWE Essential Skills / Software Review

Judge a concrete change against its intended behavior and surrounding contracts.
Return findings privately unless publication is authorized. A review request
permits inspection and safe scoped checks; repairs, dependency installation,
external mutations, approval and merge need their own scope.

## Establish one review snapshot

Identify repository, requested paths/comparison, base and head. For a branch,
choose merge-base or direct-tip comparison according to the request. Account for
staged, unstaged and relevant untracked changes separately. Confirm the actual
changed-file list, including renames, deletions, configuration, dependencies and
generated output. Read source and line numbers from the same snapshot; when head
changes, distinguish old evidence from the new revision. Preserve shared work.

Reuse applicable requirements, repository instructions, source context, native
review coverage and check results. Investigate unresolved coverage or decisive
claims rather than launching another full pass automatically. A requested
independent review still receives an independent pass. Prior findings and green
statuses are evidence to examine, not conclusions to inherit. Identify unavailable
patch/context precisely.

## Trace the changed contract

Start with the most consequential behavior. Follow a representative input through
the changed decision, side effects, return and caller handling; compare with the
base and intended behavior. Locate real consumers/tests of changed public
functions, schemas, events, commands and defaults. Include neighboring validation,
authorization, retries, resource cleanup and invariant ownership. Check alternate
callers, implementations and serialization paths; absence of local references
cannot prove there are no external consumers.

Choose adverse paths that could invalidate the contract. For behavioral,
compatibility, security, performance or maintenance risks, and for changed tests,
waivers or CI gates, read [review lenses](references/review-lenses.md). These are
conditional lenses, not five separate review passes. If a consequential trust
boundary exceeds this review's methods, load installed
`swe-essential-skills-software-security`; for uncertain stored-data recovery, use
`swe-essential-skills-data-engineering`. Use the host's supported skill mechanism,
preserve read-only scope and reuse current evidence. With no specialist available,
report the exact gap.

## Try to disprove each candidate

Inspect caller guarantees, actual framework/version semantics, guards, error
handling and supported configurations. Distinguish a new regression, an existing
defect exposed by the change and an unrelated issue. A setup failure is not a
reproduction. Inspect whether a test reaches the path and whether its assertions
would detect the claimed failure.

Prefer a short causal demonstration: condition → changed operation → observable
wrong result. A source trace can suffice. Safe focused checks may use isolated
scratch outputs within existing authority, without altering reviewed source or
shared state. Inspect unfamiliar commands and propose checks requiring additional
authority rather than running them.

Classify supported defects as findings, consequential unknowns as questions,
preferences as optional suggestions and disproved concerns as dropped. Deduplicate
one cause. Rank by impact and realistic reachability; confidence describes evidence
strength. Neither a quota of findings nor a perfect reviewer score is the goal.

## Finish against the current revision

Recheck snapshot identity and cited locations. For a correction, inspect the new
diff and affected paths to determine whether the cause remains, moved or was
fixed. Keep unresolved concerns tied to current evidence.

A single review ends after its scoped pass. An explicitly requested repeated
review needs a revision/event and meaningful time/round bound; report partial
results on its bound, unavailable integration or authority limit.

Lead with actionable findings: problem/impact, file and tight line location,
trigger, violated contract, causal evidence, confidence/assumptions and focused
correction or regression scenario. Separate questions and preferences. State
base/head or patch identity once, reviewed coverage, actual checks and limitations.
If no supported finding remains, say so for this scope without universal claims.
