# Rollout and recovery

## Before the release action

Match the exact artifact to the verified revision and intended environment/channel. Check the target through available account/project/cluster/device/registry evidence, not just an environment nickname. Confirm configuration and required secret presence without printing values. Identify who can halt or recover the release.

Map compatibility across versions that can coexist: clients/servers, producers/consumers, schemas/readers, plugins/hosts, device/bootloader and installed user data. For an expanding schema, add compatible fields first, release tolerant readers/writers, migrate with reconciliation, then remove the old representation only after old consumers are gone. A database downgrade is not a universal rollback procedure. Include shared lock, lease and deduplication identities in this compatibility check: overlapping versions must coordinate on the same ownership boundary, or use a transition that prevents duplicate ownership and effects.

Decide what recovery actually means:

- Revert code when old code still understands current data/protocols.
- Disable the capability when that safely preserves data and reduces impact.
- Roll forward when data conversion or external effects make rollback unsafe.
- Restore/reconcile only with an understood data-loss window and an authorized procedure.

A backup's existence is not restore evidence. For destructive changes, require adequate recovery evidence or stop before the irreversible boundary and report it.

## Select a rollout that exposes meaningful failures

Use staging, limited cohorts, canaries, phased distribution or an atomic replacement where supported and justified by risk. A tiny local utility need not acquire a service-style canary process. Package registries and app stores may cache versions, prohibit overwriting or delay updates; clients may remain old indefinitely. Firmware may require a tested fallback slot rather than a remote rollback command.

Choose success/abort signals before changing state: representative transaction/job/command behavior, errors, latency, integrity, resource consumption and update/install results applicable to the product. Compare with a baseline and account for traffic volume and telemetry delay. Do not invent a universal acceptable error percentage or declare a quiet canary healthy without meaningful use.

Execute only the authorized scope. Observe the intended artifact's actual activation and the critical path, not just the deploy tool's exit status. If a signal crosses the agreed stop condition, pause expansion, capture useful evidence and take the authorized recovery path. If recovery needs additional permission, state the action and impact while continuing safe diagnosis.

If a deployment or publication times out or its response is lost, treat the outcome as unknown—not failed. Inspect authoritative release/job state and the active or published artifact identity before retrying or rolling back. Reuse the operation identity or documented idempotency mechanism where supported; otherwise reconcile any partial effects and choose the next action from observed state. A blind retry can publish twice or race an operation still in progress.

## Close the release loop

Verify the resulting version and behavior after rollout **and after any recovery**. Check data invariants, backlog/retries, long-lived processes, background workers and dependent consumers where relevant. Confirm temporary release controls do not silently remain as permanent security or availability exceptions.

Record what actually shipped, where, verification results, compatibility limits, recovery outcome and any remaining observation window. “Published,” “deployed,” “healthy under observed traffic,” and “fully verified on supported targets” are different claims.
