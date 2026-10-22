# Capacity and restore

## Capacity

Identify the constrained resource and workload unit: CPU per operation, memory per job, connections, storage growth, queue age, throughput or device endurance. Inspect peaks, bursts, skew and growth; averages hide hot partitions and long tails.

Estimate demand from observed rates/service times, then validate with representative authorized load. Bound traffic, cost, target, duration and abort signals; a visible production graph does not authorize a production load test. Include relevant cold starts, cache misses, expensive valid inputs and downstream limits. Separate load-generator limits from system limits.

Tie the intervention to the bottleneck: optimize work, bound concurrency, shed/defer nonessential work, rebalance, add capacity or impose a meaningful quota. Autoscaling does not solve serialized locks or runaway retries. Verify throughput, latency/errors, resource use, recovery after bursts and cost implications. State the tested operating envelope, not unlimited scalability.

## Backup and restore

Identify what must be restored together: database, objects, encryption keys, configuration, schema/application versions, identity references and external effects. Obtain recovery-point/time requirements from the actual system; do not invent acceptable data loss.

Inspect backup coverage, freshness, access controls and retention. Test restoration into an isolated authorized target using the documented platform procedure. Backup-job success or a downloadable file proves neither decryptability nor application usability.

Verify the recovery point; approved availability of keys and compatible readers; critical invariants and sampled data/count reconciliation; representative application reads/writes; and restoration duration including dependencies and validation. Determine whether reconnecting producers/consumers would replay unsafe effects or overwrite repairs.

Never overwrite the live system as a convenience test. For actual recovery cutover, establish traffic/write isolation, final recovery point, external-effect reconciliation, target identity and recovery options. Retain the old source until the recovery decision and retention policy permit removal.

If restore cannot be attempted, name the unproven link: key access, backup format, cross-store consistency or isolated capacity. Keep backup existence, tested restoration and production recovery readiness as separate claims.
