# Core workflow checks — 24 October 2026

**Both ordinary and explicitly instructed conditions completed the tested planning
and engineering tasks. No incremental quality or overall efficiency benefit was
established.** These are own-suite functional observations, separate from the
external studies in [empirical evidence](empirical-evidence.md), not claims about
all SWE skills or production readiness.

## Capabilities observed

A three-turn planning pair began without an existing plan. Both participants
created usable plans, incorporated partial answers, preserved settled choices,
progressed while access and capacity remained unresolved, and narrowed proposals
to the eventual resource limit. Recommendations remained distinct from owner
approval; neither executed the proposed evaluation. Independent review scored
both **16/16**, with no observed critical flags, repeated settled-choice requests
or unnecessary planning gates. The applied condition received PM Task Coordination
and SWE Project Planning. Different proposed tasks and remaining choices do not
establish user-effort savings.

A separate brownfield engineering pair planned, implemented, tested and delivered
a synthetic SQLite notes change. Both scored **20/20**. Each passed **12 frozen
contract checks and three additional independent reviewer probes** on first
review execution. Observed capabilities included exact existing-data preservation,
additive legacy compatibility, tenant-scoped reads and writes, trusted-principal
and permission checks, caller-transaction protection, atomic migration failure
rollback/retry, and durable archive persistence. Participant suites independently
passed 14 and 16 tests; more test methods were not treated as better quality.
Neither participant suite explicitly covered empty migration; the frozen checker
supplied that evidence instead.

The API assumes trusted caller-supplied principals and trusted maintenance callbacks;
it does not authenticate users. Concurrent writers, hostile database files,
production restore, mixed deployment and post-success downgrade were outside scope.

The optional [SQLite notes maintainer case](../evaluations/sqlite-notes/README.md)
packages the **12 contract checks**, not the three historical reviewer-added
probes. Those probes remain a distinct part of the historical review evidence.
The case is a bounded conformance exercise, not a mandatory installation step,
new runtime workflow or reproduction of the full matched experiment.

## Improvements and the held candidate

Real helper review separately supported two narrow PM changes:
[PR #40](https://github.com/ibbuilds/pm-essential-skills/pull/40) normalizes an invalid
capture-output path failure without running the producer;
[PR #41](https://github.com/ibbuilds/pm-essential-skills/pull/41) emits lossless UTF-8
stdout with surrogate safety and retains non-UTF-8 fallback. One fixed synthetic
Unicode sample fell from **828 to 740 bytes**; this is not a general savings rate.
Raw streams and stored summary behavior were preserved.

A later [PM coordination clarification](https://github.com/ibbuilds/pm-essential-skills/pull/42)
distinguishes notification-only messages, supported task admission and completion.
One bounded cloud-host follow-up resumed an existing owner and returned its
read-only verification result; four additional admission cases were reasoning
checks, not live integrations. This adds no new tool or installer and does not
guarantee adherence on other hosts.

A held-out Project Planning candidate passed observable behavior gates on two
cases but remains **held, not shipped as an optimization**. It returned 2,117 fewer
instruction/read bytes while writing 2,764 more work bytes, with the same 11
operations per arm. These overlapping categories cannot be summed into a usage
total; no overall efficiency gain was demonstrated.

## Additional applied workflows

Three later checks used SWE `6b878299` and PM `16e66f01` where relevant.
Each had one fresh applied participant and independent review, not a comparison
arm. First outcomes, adverse observations and original acceptance rules were
retained. These extend functional coverage, not the matched-pair effect estimate.

### Operations and coordination: containment, not restoration

Over two fixed turns, the agent inspected a synthetic failed release, performed
already-authorized read-only containment, and verified that all 120 retained
records remained. It distinguished green liveness from a still-failing v2 export.
A previously timed-out non-idempotent rollback remained UNKNOWN and was not
retried. The owner had not chosen the recovery strategy; the agent delivered a
blocked handoff instead of choosing a destructive rollback, inventing approval,
or continuing to poll after the second instruction.

Independent review passed all seven frozen functional gates. It also retained
**two compliance blemishes**: the same necessary pending question appeared in an
interim message and a drafted update, and the handoff lacked explicit source-file
citations. The existing coordination instruction already prohibits repeated
pending questions; this observation did not justify another instruction or a
favorable rerun. Recorded workload was 15 observer calls, including one call
containing three simulator commands. This is not production recovery evidence.

### Client engineering: asynchronous state repair

A small dependency-free JavaScript module passed **22/22 frozen contract checks**
on its first controller acceptance run, with independent source review finding
no contract defect. It correctly handled latest-request ordering, account epochs
including A-to-B-to-A transitions, retained data on refresh errors, single-save
gating, ambiguous timeout outcomes, explicit reconciliation, and protection of
edits made since the original save. No automatic mutation retry was added.

The participant's retained local logs show 4/33 baseline checks passing with
three unhandled-rejection warnings, then 33/33 on the repaired module. Historical
identity of its local test source was not independently established; the separate
22-check controller was frozen and hash-verified. These are deterministic local
logic checks, not rendered UI, accessibility, transport, authorization, backend
idempotency, deployment or native skill-selection evidence.

### Review and debugging: real repair, failed frozen acceptance

A historical PM capture-helper replay correctly identified and reproduced a
Python 3.12 symlink-loop failure before editing, left a clean control unchanged,
repaired the real loop, and passed all ten local tests. Its new regression failed
the original source for the intended cause. However, the frozen oracle passed
only **2/3**, and the full frozen acceptance **failed**. That result is retained.

Independent adjudication found a public-task/controller mismatch: the task asked
for the real loop repair while preserving unrelated programming failures; the
controller additionally expected normalization of a bare mocked resolution
RuntimeError without the real loop's ELOOP context. The submitted narrower guard
met the reported real-loop behavior but not that broader frozen rule. No
retrospective oracle adjustment, participant repair or rerun turned it into a
pass. Future use of such a case must disclose the exact boundary policy before
launch. This finding concerns evaluation validity as well as implementation;
it is not evidence that the reported real loop remained broken.

That adjudication separately reproduced a current PM API edge case: a custom
PathLike provider's programming RuntimeError was misclassified as an input
ValueError because path construction was inside the resolution handler. The
scoped correction moves construction outside that handler, preserving the
historically tested resolution normalization. An unmocked regression fails before
the correction and passes after it; no producer or output artifact is created.
This is an API diagnostic correction, not a normal string-path outage or savings
measurement. It does not change the failed historical trial's result.

All three checks used cooperative records, not an isolation/security boundary.
They establish neither exhaustive absence of unrecorded actions nor incremental
skill benefit, actual human minutes or provider token/billing savings.

## Provenance and limits

The planning pair used PM `108e228` and SWE `6d2cf828`; engineering used PM
`5c0df50` and the same SWE revision. PM revision `940c127` includes PRs #40/#41;
that is not the source revision of every frozen run. These frozen pairs do not evaluate the later Task Coordination clarification
or native skill selection; SWE runtime instruction bodies remain unchanged.

These were fresh cloud agents, not the user's actual Codex session or native
installation/selection tests. Quality judgments preceded mapping/cost disclosure,
but output labels and instruction references made blinding partial. Each core
comparison was one pair, with no outcome-selected reruns. The holdout also had a
real prelaunch sequencing deviation: scratch behavioral checks and exact bootstrap
persistence followed the first launch. Later successful checks do not erase it.
Cooperative instrumentation does not establish exhaustive absence of off-tool
activity. Setup, reads and writes are observed workload, not provider billing,
tokens or measured human minutes; controller/reviewer overhead is separate.
