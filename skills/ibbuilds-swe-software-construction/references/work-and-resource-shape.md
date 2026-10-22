# Work and resource shape

Use for a changed path whose cost grows with input, frequency, retained state or
concurrency. Analyze the affected path, not every function in the repository.

## Identify the work

Name the meaningful dimensions: records, bytes, relationships, requests, retries
or simultaneously active users. Trace repeated CPU work, IO round trips, allocated
or retained data and queues. Include the consumer: streaming upstream does not
establish bounded end-to-end memory if the caller collects all results. Distinguish a known
bound from an assumed small dataset. Ask for a missing user-owned workload or
quality target only when it changes the decision; do not invent an unlimited
future workload to justify a distributed system.

## Select a suitable representation

- Repeated membership or key lookup may justify an index/map/set instead of a
  nested scan, but include its construction, update and memory cost. Preserve
  duplicate handling, equality, ordering and mutation semantics. A tiny bounded
  collection or one-off lookup may be clearer as a simple scan.
- Repeated parsing or transformation of unchanged input may be computed once at
  its actual ownership boundary. Do not reuse a value across changed inputs,
  permissions or state merely to reduce computation.
- Select only needed fields and bound batches or pages where the contract allows.
  Pagination, streaming and batching must preserve completeness, stable ordering,
  error/recovery behavior and authorization; a smaller result is not equivalent
  if it silently drops requested work.
- Avoid unbounded task creation or buffering. Resource limits, cancellation,
  cleanup and backpressure belong to the operation's contract. Offloading work
  changes where cost occurs, not whether it exists.
- Keep work that blocks an interactive/event-driven path bounded. A worker or
  asynchronous API is useful only when it actually moves blocking work and its
  scheduling/data-transfer cost is justified; changing a function label is not
  proof of nonblocking execution.

## Choose evidence proportionately

A count of repeated operations or a known data-structure contract can establish
algorithmic growth without a full benchmark. It cannot establish exact latency,
allocation behavior, runtime scheduling or an end-to-end speedup. Reuse relevant
existing profiles; measure a representative case when those properties decide
between options. Keep correctness checks for changed semantics and applicable
required gates. Do not create brittle timing tests for ordinary code.

Prefer the clearer option when expected benefit is uncertain or negligible.
Escalate meaningful memory/latency/consistency tradeoffs to their owner. Do not
trade required reliability or maintainability for a favorable microbenchmark,
or claim universal optimality across workloads.
