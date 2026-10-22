# Investigate a design decision

## Bound the unknown

Write the decision in operational terms: “Can the existing process handle this workload without breaking its latency requirement?” is testable; “Should we modernize?” is not. Inspect current measurements, dependency constraints and failure reports before creating a prototype.

Choose a distinguishing experiment, with a stopping condition tied to the decision. A prototype may measure an upper bound or prove integration feasibility; explicitly exclude what it cannot establish (production authorization, long-term maintainability, representative scale). Use synthetic or approved sanitized data and avoid real side effects. Record environment, workload, revision, observations and limitations. Discard prototype shortcuts rather than silently promoting them to production architecture.

## Evaluate options

For each viable option explain:

- Which hard constraints it meets or fails; reject a hard failure before ranking aesthetic benefits.
- What changes in consistency, latency, availability and isolation under the actual failure model.
- Which operational burdens appear: credentials, queues, backups, deployments, on-call diagnosis, upgrades and vendor limits.
- The migration path, reversibility, and cost of being wrong.

Do not use unweighted numeric scores as authority. If uncertain measurements determine the winner, report that uncertainty instead of manufacturing precision. A reversible local decision generally needs less evidence than a persistent public contract or data partitioning choice.

## Illustrative branches, not tested outcomes

### Export request exceeds request lifetime

An application currently generates exports synchronously. First distinguish query inefficiency from an inherently long workload. If an index or streaming response meets the existing contract, a queue may be unnecessary. If the work must outlive the request, specify job ownership, authorization on submission and retrieval, progress states, retention and duplicate submission behavior. A queue shifts failure semantics: workers can crash after producing an artifact but before acknowledging work. Define the durable job/artifact identity and recovery before selecting the broker.

### New service proposed for a small internal feature

If the same team owns the feature, releases it with the application, and must transact against the same records, a module may preserve invariants with less operational burden. A separate service becomes defensible when independent scaling, isolation, ownership or release cadence outweigh remote-call and consistency costs. Write the concrete pressure and what would trigger extraction later; do not build a remote abstraction solely for a hypothetical future team.

### Offline field client synchronizes edits

“Last write wins” loses meaningful concurrent updates unless the domain permits that loss. Identify which fields can merge, which operations commute and which conflicts need user resolution. Use stable operation identities across reconnects; decide tombstone retention and stale-client behavior before promising deletion synchronization. Verify replay, reordering, a device returning after a long absence, and revoked access—not only online edits.
