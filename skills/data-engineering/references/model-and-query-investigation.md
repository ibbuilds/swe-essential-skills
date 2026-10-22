# Model and query investigation

## Choose representations from invariants and access patterns

For relational data, separate entities whose identity/lifecycle differs; model relationships and deletion behavior explicitly. Avoid a generic document/JSON field for data that needs strong relationships and frequent indexed filtering unless the tradeoff is intentional. Conversely, a rigid table per incidental attribute may make an evolving opaque payload needlessly difficult. For document/key-value stores inspect item size, partition key distribution, conditional-write semantics and cross-item transaction limits. Do not assume relational guarantees exist implicitly.

Choose normalization for authoritative facts and denormalization for a demonstrated access need. If values are copied, name the authoritative source, update/rebuild mechanism, acceptable staleness and discrepancy detection. A cache without invalidation ownership becomes a second accidental database.

Represent currency, measurements and time with explicit precision, unit and semantics. Distinguish event time from ingestion time and an instant from a local calendar date. Avoid implicit floating-point or timezone conversions where equality or ordering matters. Evaluate uniqueness with the real collation/case rules and tenant scope.

## Shape collection access before it becomes a bottleneck

For changed collection reads, inspect the actual generated SQL or equivalent
request shape. Identify lazy/per-item loading that makes round trips grow with
the result count; push appropriate filtering, field selection and limits before
materialization. Do not replace it blindly with one large join: multiple related
collections can multiply rows and transferred bytes. Compare projection, eager
loading, bounded batches or explicit split queries against relationship shape,
parameter limits, ordering and consistency requirements. Preserve tenant scope
and intended tracking/update semantics.

Fewer queries is not an unconditional win. Split reads can observe different
snapshots; a streamed result may hold a connection and an ORM/driver may buffer
internally. Trace the full consumption path before claiming bounded memory.
Use a stable query-count/shape observation when it can expose repeated work;
representative profiling is needed for disputed runtime cost, not automatically
for every ordinary data edit. Small scalar reads or unchanged access paths need
no separate query-optimization exercise.

## Own connection-scoped state across reuse

When a pool, driver, pool mode or connection-scoped authorization/setting changes,
establish the actual lifetime: request, transaction, logical client connection or
physical database session. Inventory relevant tenant/role settings, search paths,
temporary objects, prepared statements and session locks. Neither the next query
using the same session nor a returned connection having clean state is automatic.

Bind trusted request context and protected queries to the same supported scope.
Identify which layer owns transaction completion, reset and invalidation. Reuse
its supported cleanup rather than adding duplicate rollback/reset or discarding
a connection after every ordinary error. Establish that request-scoped context
cannot reach the next borrower; rollback alone need not clear all session
resources. If cleanup fails or reuse safety remains unknown, use the driver's or
pool's supported invalidation path. Do not reset an unowned active connection.
When these semantics change, check sequential reuse across two principals,
failure/cancellation cleanup and connection reassignment that could lose context.
Reusing one physical database session can test leakage, but does not establish
correctness when the pooler reassigns sessions. Unchanged stateless queries need
no new pool exercise.

For PostgreSQL, transaction-local settings require an actual transaction and end
with that scope; session settings can survive commit; transaction-local values revert to prior
session values. Savepoint rollback can also change effective settings. Verify the selected pooler/version and actual query
scope. Protocol-level prepared statements and SQL PREPARE have different support;
do not disable preparation globally or assume every pool preserves session state.
Transaction binding and cleanup have capacity costs; do not introduce pooling or
row-level security merely to apply this guidance.

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
