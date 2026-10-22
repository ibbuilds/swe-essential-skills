# Model and query investigation

## Choose representations from invariants and access patterns

For relational data, separate entities whose identity/lifecycle differs; model relationships and deletion behavior explicitly. Avoid a generic document/JSON field for data that needs strong relationships and frequent indexed filtering unless the tradeoff is intentional. Conversely, a rigid table per incidental attribute may make an evolving opaque payload needlessly difficult. For document/key-value stores inspect item size, partition key distribution, conditional-write semantics and cross-item transaction limits. Do not assume relational guarantees exist implicitly.

Choose normalization for authoritative facts and denormalization for a demonstrated access need. If values are copied, name the authoritative source, update/rebuild mechanism, acceptable staleness and discrepancy detection. A cache without invalidation ownership becomes a second accidental database.

Represent currency, measurements and time with explicit precision, unit and semantics. Distinguish event time from ingestion time and an instant from a local calendar date. Avoid implicit floating-point or timezone conversions where equality or ordering matters. Evaluate uniqueness with the real collation/case rules and tenant scope.

## Investigate a slow query systematically

1. Capture the actual query shape and sanitized parameter distribution, frequency, returned rows and observed latency boundary. Separate pool wait, network time, lock wait and execution time.
2. Inspect the supported plan facility. Determine whether the selected mode executes writes or volatile functions, and choose a safe environment. Obtain the plan and relevant runtime counters when authorized.
3. Compare estimated and actual cardinality if available. Large errors suggest skew, stale statistics or correlated predicates; an index alone may not fix a bad estimate.
4. Locate expensive work: full scans, repeated inner-loop work, sorts/spills, broad joins, excessive rows transferred, nonselective filters or per-row application queries. A scan can be correct for a small table or a query returning much of it.
5. Change one supported cause: query shape, projection, batching, index, statistics or data model. For a composite index consider the real equality/range/order predicates and datastore-specific index rules. Do not index every filtered column independently by reflex.
6. Re-measure representative cases, including skewed tenants and worst plausible parameters. Check write overhead, storage, locking and plan regression for other common queries.

A performance claim should name the workload and environment. Treat a local speedup as local evidence unless production representativeness is established.

## Illustrative investigations

### Tenant-scoped list gets slower with growth

The query filters tenant and status, orders by timestamp and fetches a page. Inspect its stable tie-breaker and actual selectivity. An index aligned with the filter/order may avoid sorting or scanning unrelated tenants, but the exact column ordering depends on workload and engine. Test a large tenant and a small tenant; a global average can hide severe skew. Verify the query still includes tenant scope and pagination remains deterministic.

### Report produces duplicate totals

Inspect join cardinality before adding `DISTINCT`. Joining an invoice to both line items and payments can multiply rows and inflate sums. Aggregate each one-to-many relation at its proper grain or restructure the query. Check invariants with a fixture containing multiple lines and multiple payments; a fixture with one of each hides the defect.

### Timestamp conversion shifts daily totals

Determine whether the stored field means an instant or a local business date. Grouping UTC instants by an implicit server timezone can assign events to the wrong day. Specify the intended zone and daylight-saving behavior, then compare boundary events and historical rows before backfilling. A mechanical type conversion is not a decision about business meaning.

## Pipeline and model-data integrity

Track source snapshot or event position, transformation version and output version where reproducibility matters. Define event-time versus ingestion-time windows, late-arrival handling and deduplication identity. Publish outputs only when the declared partition or batch is complete, or expose explicit partial-state semantics. Retry/replay must preserve identity and avoid doubling aggregates.

For model-facing datasets, identify feature/label definitions, join-time semantics and access/retention restrictions. Check for future information leaking into historical features and for mismatched training versus serving transformations. Preserve dataset lineage and the model/code compatibility relationship without treating lineage alone as proof of statistical validity. Domain owners must establish whether sampling, labels and evaluation criteria represent the intended use.
