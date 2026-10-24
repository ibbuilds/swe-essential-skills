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
