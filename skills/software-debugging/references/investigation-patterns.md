# Investigation patterns

These cases illustrate experiments and conclusions; they are not records of executed model tests.

## Search for variants of a confirmed defect

When the task calls for finding related defects, describe the causal mistake before
searching for similar text. Check that the initial query detects the known instance;
if it is already patched, use an available original revision or saved example
without reverting live work. This calibrates the query, not the correctness of the
diagnosis. If no usable positive example is available, state that limitation rather
than treating an empty result as proof of absence.

Broaden identifiers or structure only where the same mistake could recur, inspecting
the resulting candidates against their callers and guards. Similar syntax may be
safe; different syntax may violate the same invariant. Account for the selected
paths, file types, ignore rules and generated-code exclusions before interpreting
the result. Static search may miss dynamic dispatch or external consumers. Report
the relevant search boundary, not a claim of complete coverage. Do not turn a
local repair into a whole-repository sweep or treat discovered variants as authority
to repair additional code.

For example, after confirming a tenant-unscoped invoice lookup, first check the
query against that lookup's original form. Generalizing the identifier can locate
sibling exports, but each needs its own tenant-binding analysis. A zero-result
search restricted to HTTP handlers says nothing about an excluded worker path.

## Duplicate charge after timeout

Observation: the client reports failure; a customer later sees two charges. Separate request transport, server operation creation, provider submission, and acknowledgment. Correlate operation/idempotency keys and provider records without dumping payment data.

Competing hypotheses: one request was processed twice internally, or the client submitted a second operation after a lost response. A controlled fixture that commits the first operation and then drops the response distinguishes retry semantics from pre-commit failure. The fix may need stable operation identity and reconciliation, not a longer timeout. A successful normal request does not verify the lost-acknowledgment path. Do not replay real charges to reproduce it.

## Order-dependent or flaky tests

First separate product nondeterminism from a defective harness: shared ports/files/database rows, leaked timers, process environment, test ordering, clock assumptions, and eventual-consistency waits. Run the relevant test in isolation and with a suspected predecessor using the existing test runner's documented options. Preserve a seed/order when supported.

Replace arbitrary sleeps with a meaningful completion signal only if that reflects the real contract. Use a controllable scheduler or barrier to force a suspected interleaving: both workers read version N, worker A writes N+1, worker B attempts its stale update. This verifies conflict behavior more directly than a stress run that happened to pass. Do not weaken assertions or quarantine tests merely to make CI green; if quarantine is authorized, preserve failure ownership and the lost gate's implications.

## Cross-service or pipeline corruption

Trace a single sanitized record through serialization, queue envelope, transformation, storage, and consumer projection. Compare representations at boundaries, including units, timezone, nullability, encoding, schema version, and duplicate delivery. Instrument the earliest boundary not yet supported by evidence. A downstream validation error can be correct detection of upstream corruption.

For example, a millisecond timestamp interpreted as seconds may surface as a database overflow. Widening the database column treats the symptom; checking units at producer/consumer boundaries tests the causal contract. Add a regression at the owning conversion plus a boundary test where compatibility matters.

## Crashes, leaks, and native/resource faults

Preserve crash signatures, symbol/build identity, relevant thread stacks and resource trends. Check ownership and lifetime: use-after-free, retained subscriptions, unclosed files, thread affinity, shutdown ordering, and resource exhaustion. Use the project's available sanitizer, profiler, or debugger under an appropriate build configuration. Instrumentation can alter timing and memory layout; a disappearance under a debugger does not disprove a race.

Reduce the triggering workload without deleting the concurrency or resource pattern that produces it. Compare allocation/handle counts before and after repeated lifecycle cycles, not just one successful launch. On embedded or physical systems, reproduce in simulation or safe hardware modes where possible; never bypass interlocks to obtain a clearer trace.

## Production-only failure without a local reproduction

Bound what the evidence establishes: affected versions, environments, tenants or input classes; last known healthy state; frequency and impact; available traces. Compare configuration, feature flags, data shape, dependency versions, permissions, locale, and load with a working environment. Avoid collecting raw private payloads when derived fields or redacted samples suffice.

A reversible, authorized mitigation can precede diagnosis when impact warrants it, but label it as containment and retain the unresolved cause. Design further instrumentation around a hypothesis and its required fields, with data minimization and removal/retention expectations. Report an unconfirmed hypothesis as such; absence of a recent alert is not proof of resolution.
