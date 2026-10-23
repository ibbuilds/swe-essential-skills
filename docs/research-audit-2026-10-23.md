# Evidence-led engineering comparison: 23 October 2026

Compared with `951cebc0c0529330a152aefe54234a757c863841`, after the
repository-name correction. These are small additions to existing skills, not
new lifecycle phases or a claim that instructions eliminate agent mistakes.

## Selected mechanisms

| Existing owner | Specific gap closed | When extra work is unnecessary |
| --- | --- | --- |
| Verification | An expected rejection must fail on success; the runner must observe asynchronous assertions | An existing, correctly completed native rejection assertion already provides this |
| Delivery | An aggregate gate must represent the intended conditional set, not merely report success for supplied results | Reuse an established applicable mapping; deliberately excluded jobs remain legitimate |
| Delivery | Retained signatures/provenance must be checked against artifact bytes and trusted release expectations | No new signing adoption, verifier installation or network action without need/authority |
| Performance | An invalidation boundary must survive pending old fills, eviction and lost tracking | Respect immutable data and explicitly accepted bounded-staleness contracts |
| Architecture | A settled structural boundary can use proportionate mechanical enforcement, with real scope and reviewed exceptions | Existing compiler enforcement or absence of consequential drift may need no new rule |

These prevent identifiable false-confidence or rework paths. Their net effect on
tokens and real task quality has not been measured. Conditional details remain in
the owning references; there is no new dispatcher, service or dependency.

## Evidence supporting the adaptations

### Tests that pass without establishing the expected failure

[Jest's async-testing documentation](https://github.com/jestjs/jest/blob/61050e9323e742539dc2360236671110e37329e6/docs/TestingAsyncCode.md)
explains why missing completion tracking or catch-only assertions can give false
confidence. Our [test-design examples](../skills/swe-essential-skills-software-verification/references/test-design-cases.md)
make that failure explicit without requiring assertion counts or another runner.

[GitHub's status-check guidance](https://github.com/github/docs/blob/481d4e35beb53953e277d0b11ba4a18f8c8ade4f/content/pull-requests/how-tos/merge-and-close-pull-requests/troubleshooting-required-status-checks.md)
and the inspected [alls-green input normalizer](https://github.com/re-actors/alls-green/blob/4e78578a7b19b206c347573cad0c89f175a0f115/src/normalize_needed_jobs_status.py)
distinguish available outcomes from the set a release actually requires.
The [delivery example](../skills/swe-essential-skills-software-delivery/references/configuration-baselines.md)
covers an omitted integration job and a legitimate conditional exclusion. No
third-party action or second job registry was imported.

### Provenance is evidence, not an acceptance policy by itself

The approved [SLSA v1.2 verification procedure](https://slsa.dev/spec/v1.2/verifying-artifacts)
and [GitHub CLI verification policy](https://github.com/cli/cli/blob/ed84a97a559956853e4464fee3c0ff4262a0d6ac/pkg/cmd/attestation/verify/policy.go)
bind actual bytes to trusted producer and build expectations. The delivery skill
now distinguishes retention from that check.

The [TanStack postmortem](https://tanstack.com/blog/npm-supply-chain-compromise-postmortem)
(May 2026) and [SLSA's analysis](https://slsa.dev/blog/2026/05/mini-shai-hulud-what-slsa-can-and-cannot-do)
also show the limit: the expected pipeline can itself be compromised. We did not
claim identity verification would have prevented that incident. A small adjacent
clarification tracks cache writers/readers across trust boundaries; a matching
key or read-only workflow token alone does not establish trusted executable input.

### Cache invalidation includes work already in flight

Current [Redis caching documentation](https://redis.io/docs/latest/develop/use/client-side-caching/)
and inspected [redis-py connection logic](https://github.com/redis/redis-py/blob/742b52151e527c0df20b7046fb092c045d38d203/redis/connection.py)
provide concrete pending-fill and tracking-loss mechanisms.
The [performance reference](../skills/swe-essential-skills-software-performance/references/measurement-and-optimization.md)
adapts the invariant, not Redis code: preserve the declared freshness boundary
when a delayed fill completes. It does not impose immediate consistency,
unbounded tombstones, global flushing or a second cache protocol.

### Architectural rules need meaningful scope and deliberate baselines

[Flink's connector rules](https://github.com/apache/flink/blob/8d01380ff5bf9892462ef9808b1b56fd9723f54d/flink-architecture-tests/flink-architecture-tests-production/src/main/java/org/apache/flink/architecture/rules/ConnectorRules.java)
demonstrate bounded structural rules with explicit exceptions.
[ArchUnit's freezing implementation](https://github.com/TNG/ArchUnit/blob/5f0884eb24991b46c20dff1d8876c5d3792fcfe2/archunit/src/main/java/com/tngtech/archunit/library/freeze/FreezingArchRule.java)
shows why regenerating a baseline can accept new violations.
[Go's internal-package enforcement](https://github.com/golang/go/blob/addee8c2130be905557bc68a5237eea54c8fe194/src/cmd/go/internal/load/pkg.go)
is a counterexample to adding another linter when native enforcement suffices.

The [architecture reference](../skills/swe-essential-skills-software-architecture/references/decision-investigation.md)
therefore checks allowed/forbidden cases, scope disappearance and narrow debt
exceptions. It does not prescribe Flink's architecture or OpenAI's
[six-layer example](https://openai.com/index/harness-engineering/).
This repository already enforces one real boundary: skill references must remain
inside their independently portable folder. No additional checker was warranted.

## Rejected duplication and evidence limits

- Existing requirements, idempotency, migration, recovery, permission and lifecycle
  procedures were compared directly; broad replacement checklists would repeat
  them rather than close a demonstrated gap.
- The suspected UI-short-description routing regression was disproved by tracing
  released Codex parser/provider code. UI descriptions were left intact.
- No fixed full-suite testing policy, universal architecture framework, signing
  rollout, cache service, agent fanout or autonomous cleanup was added.
- [Authored review cases](review-scenarios.md) include positive and skip cases.
  Local metadata/link checks and source review do not establish model adherence,
  runtime host activation, cryptographic verification or measured token savings.

Sources were inspected as pinned implementations or current primary references.
Recent implementation snapshots corroborate established engineering principles;
their commit dates do not mean the underlying mechanisms were invented that day.
No upstream project was executed, user host changed, or paid model evaluation run.


## Extended error-handling comparison

### Safe retries require more than an idempotent operation

Go's pinned [replayability cases](https://github.com/golang/go/blob/addee8c2130be905557bc68a5237eea54c8fe194/src/net/http/transport_test.go#L6203-L6268)
reject an idempotency-marked request with an unreconstructable body. Its
[transport logic](https://github.com/golang/go/blob/addee8c2130be905557bc68a5237eea54c8fe194/src/net/http/transport.go#L802-L868)
separates eligibility from reconstruction. grpc-go's
[streaming retry cases](https://github.com/grpc/grpc-go/blob/6ce1c873d713459706a2aa887fe83a183e758be3/test/retry_test.go#L350-L451)
cover replay before commitment and refusal after output/header exposure or
buffer exhaustion. Those commitment rules are protocol-specific examples, not
universal HTTP rules.

The [backend retry reference](../skills/swe-essential-skills-backend-engineering/references/concurrency-and-delivery.md)
now distinguishes operation identity, reproducible request bytes and partial
consumer output. It reuses native facilities and permits failure rather than
requiring recovery or unbounded buffering.

### Per-call limits and shared overload are different scopes

The existing suite already limits attempts, concurrency and overload. A narrow
clarification distinguishes those from aggregate retry admission. grpc-go's
[throttling test](https://github.com/grpc/grpc-go/blob/6ce1c873d713459706a2aa887fe83a183e758be3/test/retry_test.go#L116-L184)
changes retries across calls while the per-call policy stays fixed.
[AWS's current retry guidance](https://docs.aws.amazon.com/sdkref/latest/guide/feature-retry-behavior.html)
describes collateral throttling from a shared adaptive client. Conversely,
[botocore's per-client quota registration](https://github.com/boto/botocore/blob/ad2d126de9ea0f209d32867e233a183356f4d814/botocore/retries/standard.py#L52-L110)
supports the inference that splitting clients can multiply independent budgets
against one bottleneck. No particular client partition, numeric defaults,
2026 opt-in behavior or new quota infrastructure is prescribed.

These tests were inspected, not executed. The additions target identifiable
corruption, duplication and overload paths; net token savings remain unmeasured.


### Error-handler placement does not establish delivery

[React's current boundary contract](https://react.dev/reference/react/Component#catching-rendering-errors-with-an-error-boundary)
distinguishes render failures from ordinary event/async failures. Its supported
transition mechanisms provide important exceptions, so the client reference now
asks which owner actually receives a rejection rather than mandating catches
around all asynchronous code.

[Starlette's exception documentation](https://starlette.dev/exceptions/) and
[pinned error middleware](https://github.com/Kludex/starlette/blob/61123a5c76ebb9d5786758008945c4fbbb380bf6/starlette/middleware/errors.py#L149-L186)
show that replacement responses are conditional on response start. Its
[paired handler/background-task cases](https://github.com/Kludex/starlette/blob/61123a5c76ebb9d5786758008945c4fbbb380bf6/tests/middleware/test_errors.py)
contrast a pre-response 500 with a 204 already sent before a background failure.
The backend addition preserves the project's actual acceptance/completion
contract; no universal queue or job-status system is introduced.


### Cleanup must preserve ownership and useful failure evidence

[Python 3.15's intermediate-acquisition recipe](https://docs.python.org/3.15/library/contextlib.html#cleaning-up-in-an-enter-implementation)
and [Java SE 26 resource statements](https://docs.oracle.com/javase/specs/jls/se26/html/jls-14.html#jls-14.20.3)
show why cleanup must cover successfully acquired resources even when later
initialization fails. Native failure precedence differs: Python's
[3.15.1 contextlib test](https://github.com/python/cpython/blob/v3.15.1/Lib/test/test_contextlib.py#L1062-L1092)
retains the body failure as context beneath cleanup failure, whereas Java
suppresses close failures behind an existing body/initializer failure.

[Current cancellation documentation](https://docs.python.org/3.15/library/asyncio-task.html#task-cancellation)
and [combined cancellation/cleanup tests](https://github.com/python/cpython/blob/v3.15.1/Lib/test/test_asyncio/test_taskgroups.py#L264-L286)
qualify any universal 'always rethrow cancellation' rule. The construction
reference preserves native semantics and deliberate cancellation consumption;
it does not demand a custom exception framework or every interleaving on every
edit. These upstream assertions were inspected, not executed.


### Fault injection must change the artifact actually exercised

[Matt Pocock's current diagnosing-bugs procedure](https://github.com/mattpocock/skills/blob/5beb35b040e3de97e54fa9e386d7e42d15c295c2/skills/engineering/diagnosing-bugs/SKILL.md)
checks an intended forced fault against a pristine copy. A small verification
clarification adopts the underlying evidence requirement: a no-op substitution,
unloaded build or unrelated setup failure cannot establish sensitivity to that
fault. Existing trustworthy red-green evidence can suffice; no mandatory
mutation framework, hypothesis count or Git reversal was imported.

Broader [GSD diagnosis](https://github.com/open-gsd/gsd-core/blob/8e5d649f5368b9b6797db9ad6972904d8c47c78c/agents/gsd-debugger.md)
and [Addy Osmani error-recovery guidance](https://github.com/addyosmani/agent-skills/blob/aeac41d4d005999432bb7312f7ff06383a91d59d/skills/debugging-and-error-recovery/SKILL.md)
were also compared. Existing diagnosis/repair authority, untrusted-output
boundaries, causal checks and evidence-based completion already cover the useful
mechanisms. No minimum cause-category count, blanket full-suite rerun or extra
controller was added.
