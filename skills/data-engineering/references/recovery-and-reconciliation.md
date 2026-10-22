# Recovery and reconciliation

## Define what recovery means

Identify acceptable data loss and time-to-restore requirements from the project or owner; do not invent them. Distinguish undoing code, reversing schema, restoring a database and repairing domain state. Each changes different things. External messages, charges and exported files may survive a database restore and need reconciliation.

Before a destructive operation identify the recovery point, backup coverage, encryption-key availability, retention and restore permissions. Verify that recovery includes required objects such as schemas, extensions, roles, large objects and external storage according to the actual platform. A backup job's success status proves neither completeness nor restorability.

## Rehearse without overwriting live state

When authorized, restore into an isolated target using the project's version-specific recovery procedure. Confirm target identity before execution and prevent restored jobs, webhooks or email workers from acting against production dependencies. Check data integrity, representative application access and the point-in-time boundary. Measure elapsed recovery time when that is part of the requirement. Do not report a rehearsed restore unless it was actually performed.

If a restore cannot be tested, explicitly state what evidence exists—backup metadata, configuration inspection, checksum verification—and the remaining uncertainty. Do not downgrade a required recovery test to a green check.

## Repair versus restore

A full restore can discard valid writes since the recovery point. For a localized data error, a targeted repair from an audit log or isolated restored copy may preserve more valid work. Define affected records, source of truth, transformation, conflict behavior and verification queries before mutating. Keep a reversible record of repairs where policy permits, without spreading sensitive data into uncontrolled files.

For derived state, rebuilding may be safer than restoring if source data is complete and transformation/version is known. Validate completeness and consumer cutover; publishing a partially rebuilt index or partition can corrupt downstream decisions. For event streams, preserve event identity and understand whether replay can trigger external side effects.

## Illustrative recovery case

A migration incorrectly converts values for one subset of accounts while normal writes continue. Do not immediately roll the entire database back. Bound the affected subset and time interval, preserve evidence, and compare a restored isolated snapshot with subsequent valid events. Design a repair that retains valid later writes, apply it only with authorization, then reconcile both row-level and aggregate invariants. If the event/audit history is insufficient to distinguish valid changes, report that uncertainty rather than fabricating an exact reconstruction.
