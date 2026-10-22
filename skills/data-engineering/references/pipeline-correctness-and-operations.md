# Pipeline correctness and operations

## Establish the source-to-consumer contract

Trace extraction, transport, transformation, storage and publication, including upstream owners and downstream consumers. Identify the authoritative source, record/event identity, schema version, partitioning and ordering guarantees. Distinguish event time, ingestion time and processing time. Specify what a complete dataset means for the consumer: an interval, source snapshot, expected partitions or reconciled source totals. “The job succeeded” establishes none of these by itself.

Set freshness and completeness expectations from the actual use case; do not invent acceptable delay or loss. State invariants such as unique business keys, balanced totals, valid units, tenant scope and deletion propagation. Preserve the distinction between no records and an unavailable source. Monitor source progress, oldest unprocessed input, partition gaps and publication age where relevant, not only worker health.

## Admit and evolve input deliberately

Determine how source changes are detected before they silently alter output: schema compatibility checks, versioned decoders, sample comparisons or explicit source-owner notification. Adding a nullable field may be compatible; changing units or reinterpreting an identifier may not be. Define treatment of missing/unknown fields, malformed input and incompatible versions. Do not silently substitute zero or discard records to keep a job green.

Quarantine rejected records with a reason, input identity, source position and transformation version sufficient for diagnosis and controlled reprocessing. Apply access and retention restrictions; quarantine must not become an unrestricted copy of sensitive payloads. Account for rejected records in completeness checks. Decide whether rejection blocks the affected partition, allows explicitly partial output, or stops the run according to the consumer contract. Record gaps rather than claiming complete output.

## Make restart and correction semantics explicit

For each boundary identify the durable checkpoint, the work it represents, and its relationship to committed output. Acknowledging input before output is durable can lose work; committing output before advancing a checkpoint can duplicate it. Choose supported transactions, stable-key upserts, deduplication or another explicit recovery protocol. Verify the actual datastore/broker capabilities and failure boundary; an “exactly once” label on one component does not guarantee end-to-end behavior, especially for external side effects.

Define how replay selects its input range and code/schema version, handles already published data and suppresses or reconciles notifications and other external effects. Check source retention against the required replay window. A checkpoint without retained input is not a recovery plan. Keep normal ingestion and backfill/replay from racing over the same keys without a defined ordering or version rule.

Decide how late events, corrected records and deletions alter an already published result. A watermark is a policy for accepting lateness, not proof that all events arrived. Specify whether a window reopens, a version supersedes it, or a correction stream updates consumers. Explain what happens beyond the supported lateness/retention window. Preserve lineage connecting output versions to source ranges, transformation/configuration versions and reconciliation results without copying unnecessary personal data.

## Bound overload and publish coherently

Use bounded concurrency/buffers, source throttling, scheduling or durable queues according to the system. Distinguish a temporary outage from a poison record. Bound retries and preserve diagnosable failed work; retries that multiply under overload worsen lag. Compare arrival rate, processing capacity and retained backlog to identify when recovery will miss freshness or retention requirements. Do not discard queued work or scale paid resources without authorization.

Build output in an isolated staging/versioned location when consumers require a coherent snapshot. Validate schema, required partitions, invariants and source reconciliation before a supported atomic pointer/manifest/table switch. Verify the platform's atomicity and reader consistency semantics; several object writes do not become atomic because one job performs them. If atomic publication is unavailable, design explicit version-aware reads or partial-state handling. Preserve the last good version where the contract allows, exposing its staleness rather than presenting it as current.

## Exercise the failure boundaries

In an authorized isolated environment, test interruption around output commit and checkpoint advancement, duplicate input, missing partitions, incompatible schema, late corrections and a rejected record repaired then reprocessed. Confirm restart produces the intended result, not merely a successful exit. Compare row/key-level checks and meaningful aggregates; totals alone can hide offsetting errors. Verify that consumers never see a half-published version when atomic visibility is required.

Example: a daily report finishes with one source partition unavailable. Publishing the remaining partitions as a complete day is wrong even if every processed record is valid. Retain the prior snapshot or publish an explicitly partial version as the agreed contract requires, expose the missing partition, and replace/reconcile it when input arrives. Record which of these failure cases were actually tested and which remain design expectations.
