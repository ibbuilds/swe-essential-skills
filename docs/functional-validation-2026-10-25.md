# Functional validation of the eighteen SWE workflows

On 25 October 2026, fresh executors used the installed skills on synthetic
planning, implementation, review and delivery tasks. They produced actual plans,
corrected code, tests and a package. Independent artifact checks and source review
assessed the outcomes. Initial source: SWE `0f8d5e4`, with PM `853a4cd` where
applicable. The additional consequential-retry holdout used this candidate's
client-reference clarification.

## Procedure coverage and observed results

| SWE skill | Completed procedure and evidence |
| --- | --- |
| Project Planning | A planning-only turn produced an executable plan without implementation or runtime probes; the authorized next turn implemented it without another approval gate |
| Product Discovery | Synthesized observed incidents, reported effort and unsupported estimates without inventing demand or reopening the chosen local product |
| Product Definition | Preserved the coordinator-only audience and first useful slice, excluding unrequested payments, member accounts and remote services |
| Software Requirements | Applied the owner's later cleanup/cancellation decisions, superseded the affected old rule and updated symmetric boundary cases, coexistence and recovery implications |
| Software Architecture | Located the reservation invariant at a real transaction boundary and separated authentication, local state and proposed hosting; design remained distinct from deployment |
| Software Construction | Implemented the accepted SQLite slice in its existing module; retained legacy consumers, supplied smoke tests and a reusable plan |
| Backend Engineering | Enforced trusted principal/write authority, tenant scoping, error precedence and conditional writes; independent executable checks passed |
| Data Engineering | Preserved exact records and unrelated tables through additive migration, idempotent upgrade, injected rollback/retry and caller-transaction protection |
| Client Engineering | Repaired stale requests, A-B-A generations, pending saves, later draft preservation, timeout states and snapshot isolation; separate holdout exercised consequential retry admission |
| Software Debugging | Reproduced the stale result and invoice rejection before repair, identified causal state/query boundaries and reran meaningful regression checks |
| Software Verification | Used real SQLite and controlled promises, preserving failure signals and testing final artifacts instead of accepting test presence or metadata as success |
| Software Review | Found cross-tenant exposure, incompatible export tuples and an actual wrong-version ZIP; identified weakened tests without changing reviewed inputs |
| Software Performance | Measured a repeated-membership bottleneck, preserved the contract and compared identical 40,000/80,000-ID workloads before/after |
| Software Security | Corrected the authoritative tenant query and checked legitimate, foreign-ID, unauthenticated and exact-identity paths with real SQLite |
| Platform Engineering | Evaluated the supplied hosting proposal's ephemeral storage, exposure and unchosen spend; produced a local verification path without pretending a generated plan was provisioned |
| Software Delivery | Built the corrected version-2 ZIP, verified its digest and imported its actual extracted code in an isolated consumer |
| Software Operations | Produced an incident handoff distinguishing liveness from a failing export, unknown rollback effects and unsafe snapshot restore; did not claim recovery from inspection |
| Software Evolution | Added the chosen new function name while preserving the existing name as an alias, its consumer contract and the measured algorithm; retained historical timing identity |

Ordinary tasks selected relevant subsets. Direct controls explicitly invoked
Requirements, Security, Evolution and the added client holdout. This is not a
native implicit-routing benchmark for eighteen individual prompts.

## Executable outcomes

- **SQLite:** 19 executor tests passed. The existing independent
  [notes-store checker](../evaluations/sqlite-notes/README.md) then passed all
  12 frozen contract checks on Python 3.11.9 / SQLite 3.45.1, independently of the
  executor's Python 3.12.14 / SQLite 3.53.1 run.
- **Editor:** 13 executor tests and 12 independent controlled-promise checks
  passed. Rejection, success ordering, account epochs, pending writes, later
  edits, ambiguous outcome and detached snapshots were covered without timing
  sleeps. No browser-rendering or accessibility claim follows from this module.
- **Package:** the executor ran 11 checks against extracted ZIP code; the
  reviewer added 10 independent package/consumer checks. The 1,060-byte artifact
  hash was `5270cb0aa988f6cdcb51978e54ac6de84da482237b5619ddcb3f4ddeeee70200`.
  The installed report binary was unavailable; the specified two-variable
  consumer contract was executed instead.
- **Matching:** semantic checks included 150 deterministic oracle comparisons,
  tiny/empty inputs, order, exact strings and input preservation. The compatible
  alias stage passed five tests. Existing expensive timing evidence was not
  relabeled as a new run after the alias-only change.

On the matching fixture, three-run medians changed from 17.6068 seconds to
7.8513 milliseconds for the same representative workload and accepted outputs.
This is a local algorithm measurement with sequential samples and limited
environment control, not a causal estimate of skill benefit, model speed or
production latency.

An independent source audit covered all eighteen entrypoints and 39 references.
It found no confirmed material procedural defect requiring a broad rewrite. It
supported the narrow retry-admission example described next; no finding quota or
extra universal lifecycle step was introduced.

## Added consequential retry case

The original editor task prohibited automatic retries. It passed that contract.
A later held-out condition used a non-idempotent saver and a manual second
submission after commit-then-timeout; the earlier controller produced two mock
effects. That is a new acceptance condition, not a retroactive failure score.

The client reference now explains that an unknown status must control the actual
mutation entry point where retries are unsafe, including user-triggered paths.
It preserves retries under an already verified idempotent operation contract.
The underlying source is Malcolm Featonby's
[AWS Builders' Library article](https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/).
The handler-level example is this suite's application of that source, not copied
implementation or a new framework.

The new executor reproduced the duplicate effect, then delivered a guard with
10 passing tests. The reviewer independently passed the held-out effect-count
check and all 12 original controller checks against the corrected module.
The original seed still fails the new acceptance check for the intended reason.
The optional [task and checker](../evaluations/unknown-write/TASK.md) retain that
failure and permit replay without a model request.

A separate positive control supplied a service with a verified same-ID/payload
deduplication contract. Its executor preserved the caller's ID instead of
generating an attempt-specific one. Six tests passed: safe lost-response retry
had one effect, changed intent was rejected, and a new intentional operation
remained possible. This checks that the clarification does not become a blanket
ban on valid retries.

## Method and limits

This uses the artifact/trace distinction in
[OpenAI's skill-evaluation method](https://developers.openai.com/blog/eval-skills)
and [Anthropic's evaluation guidance](https://www.anthropic.com/research/demystifying-evals-for-ai-agents).
Raw tasks and acceptance contracts were supplied before execution. Executors did
not receive the reviewer's hidden checks. Follow-ups reused each worker's
relevant established context; no production mutation, paid model API, package
installation or external evidence upload was needed.

The cases provide bounded application and executable correctness evidence.
Cooperative execution records are not an exhaustive security trace. The source
audit is static; planning is not deployment; operational analysis is not restored
service. These are not randomized matched model trials and do not establish
general token, billing, supervision or quality gains over an unguided baseline.
Current provider/version details still require the actual project's primary
documentation. Normal skill use runs no evaluation machinery.
