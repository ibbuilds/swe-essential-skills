# Concurrency, retries and delivery

## Select a concurrency control mechanism

Start with the invariant and competing operation, then choose a mechanism supported by the datastore:

- **Constraint or atomic conditional write:** suitable when one write can express the invariant. Inspect affected-row counts or conditional failure; success of the statement alone is not proof the condition matched.
- **Optimistic concurrency:** compare a version or prior value and reject/retry conflicts. Decide whether the user must resolve a conflict rather than automatically replaying stale intent.
- **Locking:** protect the relevant records or predicate with the datastore's actual semantics. Lock order, timeout and transaction duration affect deadlocks and throughput. A lock on an existing row may not protect the absence of another row.
- **Serializable execution or equivalent:** may detect anomalies but can abort valid-looking transactions. Retry the whole transaction with fresh reads when safe, not only its last statement.

Confirm isolation and constraint capabilities against the project's datastore/version. Test the interleaving that violates the invariant; two independently successful happy-path tests do not establish concurrency safety.

## If ownership expires, fence stale workers

Lease expiry or missed heartbeats permit reassignment; they do not stop the former worker from resuming after a pause. Renewal is not proof of exclusive access at the instant a later write occurs. Where correctness depends on current ownership, make the authoritative resource atomically reject stale writes using a supported ownership/version predicate or fencing mechanism. A fencing token carried in a request is ineffective if the destination does not validate it. Prefer an existing conditional-write contract when it suffices rather than introducing distributed locks by default. The stale-holder failure and resource-side enforcement are illustrated in [Hazelcast's fencing documentation](https://docs.hazelcast.com/hazelcast/5.6/data-structures/fencedlock).

During mixed-version rollout, inspect coordination keys, tenant/resource scoping and ownership protocol compatibility across old and new workers. Changing a lock key or bypassing the version predicate in one version can split coordination into independent groups. This is a rollout consequence of the ownership invariant, not a guarantee supplied by a particular lock library. Include the paused-old-worker/resumed-after-reassignment interleaving when evaluating the design.

## Define idempotency as a durable protocol

For retryable operations identify a key scoped to the actor/tenant and operation. Store the request fingerprint and durable status/result with an atomic claim or uniqueness guarantee. Reusing the same key for materially different intent should produce the defined conflict, not replay an unrelated result. Decide retention based on the real retry/replay window; expired deduplication records reopen duplicate risk.

Specify in-progress, completed and failed/unknown behavior, including concurrent duplicate requests. Coordinate deduplication state with the domain commit. A cache entry written after an external side effect leaves a crash window. If the side effect is remote, use its idempotency mechanism or durable reconciliation; local deduplication alone cannot manufacture exactly-once effects.

## Retry only recoverable operations

Identify one retry owner per path where possible. Nested retries multiply work and delay. Retry only errors judged transient, within a bounded deadline/attempt budget, with backoff and jitter as appropriate; honor supported server retry instructions. Ensure every attempt is safe, including requests whose previous result is unknown. Do not retry authorization failures, invalid data or permanent business rejections as if they were outages.

For queues, understand at-least-once delivery, visibility/lease duration, acknowledgment and redelivery. Acknowledge after the durable work or durable handoff required by the contract. Poison messages need bounded handling, diagnostic context and a deliberate replay path—not infinite rapid redelivery. Replaying a dead-letter message must preserve operation identity.

## Distinct events can arrive out of order

Deduplicating event IDs prevents repeated processing of the same event; it does not prevent an older, distinct snapshot from overwriting newer state. Establish ordering semantics from the source contract. For example, [Amazon S3 documents per-object sequencing and unordered delivery](https://docs.aws.amazon.com/AmazonS3/latest/userguide/notification-content-structure.html); its sequence is not a global order across objects.

For replacement snapshots, atomically compare a trustworthy source version/sequence with the stored version before applying the update. Do not treat a local arrival timestamp or arbitrary event ID as a source-order guarantee. If events are deltas that depend on predecessors, ignoring an older event may lose required work: use the supported ordering/gap-recovery protocol, genuinely commutative updates with duplicate protection, or reconciliation against authoritative state. If reconciliation fetches race, protect the local publication from stale fetched results too.

Illustrative case: version 12 marks an item unavailable, then a different event carrying version 11 says it is available. Both IDs are unseen, so deduplication alone accepts both and incorrectly restores availability. A supported atomic version check preserves version 12 for snapshot replacement. If no trustworthy version exists, design authoritative reconciliation rather than inventing an ordering from opaque IDs. These are proposed failure cases, not executed test results.

## Transaction and message coordination

If a committed state change must emit an event, consider writing an outbox record in the same local transaction, then dispatching asynchronously. Dispatch can repeat after a crash; consumers still need idempotency. Ensure outbox monitoring, retention and replay do not silently lose required events. The pattern does not guarantee consumers observe every event immediately or in a global order.

For multi-step external workflows, define durable states and compensations. A compensation is a new action, not a rewind: refunds may fail or differ from canceling a charge. Specify reconciliation and ownership for unresolved states. Keep database transactions short; holding locks while waiting on a network can turn one slow provider into widespread contention.

## Illustrative engineering cases

### Last unit of inventory

Two requests both read stock `1`, then write `0`; both sales succeed incorrectly. An atomic decrement conditioned on sufficient stock, checked for success, can protect a single-stock-row invariant. If reservations span multiple rows, define transaction/isolation and ordering, plus expiry handling. Test concurrent purchase and reservation expiry, not just sequential decrements.

### Payment request times out

Persist an operation identity and reuse the provider's supported idempotency key. After timeout, distinguish unknown from declined and reconcile by that identity. Do not create a new key on each retry. Tests should cover a provider commit followed by a dropped response, and a worker crash before local completion is recorded. A fake provider must model that sequence to test it meaningfully.

### Updated record emits an event

Writing the record and then publishing can lose the event on a crash; publishing first can announce state that never commits. A transactional outbox addresses this local split, but dispatch replay can duplicate delivery. Test commit-before-dispatch crash and publish-before-ack crash, checking durable state and consumer effects. Record any ordering guarantee narrowly, such as per aggregate, rather than implying global order.
