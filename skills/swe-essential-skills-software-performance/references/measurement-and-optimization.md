# Measurement and optimization patterns

These cases are illustrative methods, not measured results. Consult official documentation for the installed project's actual tool/framework version before using concrete profiler commands or API recipes.

## Distinguish waiting from execution

An endpoint takes 900 ms, but its CPU profile contains only 20 ms of work. A CPU-only optimization cannot explain most elapsed time. Use a request trace or narrow timing around queue admission, pool acquisition, remote calls, database work, serialization, and response transfer. Check whether concurrent requests wait for a scarce connection or lock. Correlate traces without logging secrets or complete private payloads.

For a query bottleneck, inspect the actual plan and representative parameter/data distributions before adding an index. Some analysis modes execute the statement; do not run mutating statements or costly production plans under the assumption that all explain tools are read-only. Consider lock time, write overhead, selectivity, and the project's deployment path for an index.

## Workload controls and misleading benchmarks

A closed-loop client that sends its next request only after a response reduces offered load when the service stalls, potentially hiding queueing behavior. Use an arrival model appropriate to the real workload and report achieved versus offered load, failures, and latency measurement boundaries. Do not extend a shared-system load test beyond authorized limits.

Warm-up, runtime compilation, page caches, thermal throttling, GC, background work, and network variance can dominate short measurements. Compare repeated baseline/candidate runs under controlled conditions; alternate their order when drift matters. Preserve raw observations sufficient to inspect variance. A single favorable run is not a reliable speedup.

Microbenchmarks are useful for a demonstrated hot function, not proof of end-to-end impact. Prevent compilers from eliminating work, include representative inputs, and account for setup outside the measurement window. A faster parser is irrelevant if most batch time is remote storage latency.

## Cache correctness before hit rate

A permissions-dependent response keyed only by document ID can leak content across identities. Include or enforce the relevant authorization context and invalidation behavior; do not blindly cache authorization decisions forever. A large hit-rate improvement does not justify a confidentiality defect.

For concurrent misses, bounded request coalescing may avoid a stampede. Specify what happens when the fill fails, the waiter cancels, or the cache entry expires while a refresh runs. Consider stale-while-refresh only where stale output is acceptable. Test cold start, expiration, eviction, and account/context changes as well as warm hits.

When invalidation promises to exclude prior data, removing a stored value is not
enough: a fill started before invalidation must not later publish that old value
as trusted current data. Trace fill start, invalidation, eviction and publication,
including eviction of the metadata used to reject an obsolete fill. Reuse the
cache's supported generation/version, owned-placeholder or coherent publication
protocol; do not prescribe global locks, global flushes or unbounded tombstones.
If coherence depends on an invalidation channel, establish what channel loss and
reconnection mean for cached values and pending fills before trusting them again.
Use controlled event-order cases, including invalidation followed by eviction
before the old fill completes, not just sequential hit/miss checks.

Immutable/version-addressed data or an accepted TTL/stale-while-refresh contract
may already satisfy the requirement without added invalidation machinery. A
mutable pointer selecting the current version still needs its own freshness and
publication guarantee; immutable payloads do not make that pointer coherent.

## Bounded concurrency and resource budgets

A batch of 50,000 remote calls should not automatically become 50,000 simultaneous promises/tasks. Measure the service's and client's limits, choose bounded workers and bounded buffering, and propagate backpressure. Track total completion time, tail latency, retries/errors, open sockets, and memory. A concurrency increase that improves isolated throughput but destabilizes downstream capacity is not an unconditional win.

For processing streams, incremental decoding and bounded queues can reduce peak memory. Confirm ordering, partial-output/error behavior, cancellation cleanup, and file/socket closure. Buffering the entire stream downstream defeats upstream streaming gains.

## Client/web performance

Separate navigation/network waterfall, server rendering, download/parse/compile, hydration, and interactive rendering. Prioritize the measured critical path: request independent data concurrently only where contracts permit; avoid shipping server-only computation to clients; reduce unnecessary code/data transfer. These are mechanisms, not a mandate for any specific framework.

In React-like clients, profile commits and interaction latency before memoizing. Expensive recomputation, unstable subscriptions, broad context updates, or large unvirtualized collections have different fixes. Memoization introduces identity/dependency and memory costs; verify that the result stays current. Virtualization must preserve keyboard navigation, focus, accessibility, and scroll behavior. Do not sacrifice the agreed design or meaningful loading feedback to improve a synthetic score.

## Native, desktop, embedded, and batch workloads

For a frozen desktop/native UI, inspect work on the UI thread and contention with workers. Offloading work needs bounded queues, thread-safe ownership, cancellation, and progress delivery; it is not solved by adding threads indiscriminately. Measure repeated open/close or screen navigation for resource retention.

For mobile energy, account for network/radio wakeups, polling, background work, and thermal effects on a representative device when available. Simulator timings do not establish battery improvement.

For embedded deadlines, averages are insufficient: relevant worst-case execution, interrupt priority, allocation behavior, and scheduling interference require platform-specific evidence. Preserve safety mechanisms and identify when hardware expertise or an authorized hardware-in-the-loop setup is needed.

For data pipelines, measure end-to-end completion and stage skew/spills/shuffle/IO, not only one transform. A faster stage that increases downstream memory or changes ordering/precision can worsen the actual job. Verify the data invariants with the same representative scale where feasible.
