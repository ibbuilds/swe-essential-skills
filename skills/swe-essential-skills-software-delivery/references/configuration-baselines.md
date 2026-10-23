# Configuration baselines, status accounting and drift

Use when correctness depends on several independently changing components, when multiple versions remain deployed, or when declared configuration and observed state disagree. Reuse manifests, lockfiles, release inventories and deployment records rather than building a second authority. For a single local artifact, its existing version/digest record may suffice.

## Define the compatible set

Identify the smallest set whose compatibility matters: source revision; dependency resolution and build toolchain; generated artifacts and generator inputs; runtime configuration and feature flags; infrastructure declarations/provider versions; schemas and migration state; and, when applicable, model, preprocessing, dataset/index and evaluation versions. Include external service/protocol and device constraints without pretending to control their versions. Record secret references and rotation/version requirements, not secret values.

Give the candidate baseline an identity and record immutable member identities where available, the authoritative owner/reference for each, and compatibility constraints between members. For generated files, distinguish authoritative inputs from disposable output and record how to regenerate them. A source tag plus an unpinned generated download is not a defined baseline. Preserve existing artifact digest, provenance and embedded-version checks; this record supplements rather than replaces them.

Before changing one member, traverse its compatibility edges. For a schema change, check old and new readers/writers, migration ordering, queued messages, backups and rollback consumers. For a model change, check preprocessing, vocabulary/features, serving runtime and output consumers, not only the weights file. Classify the proposed set as supported, transitional with explicit bounds, or unresolved. Test the combinations that will actually coexist; do not assume each component passing separately proves the set works.

## Account for what is actually active

Track baseline/candidate status separately from observed deployment. Record environment/account/region or device/channel/cohort, artifact digest, relevant effective configuration identity, schema/migration level, activation time and observation source. Distinguish desired, published, partially rolled out, active, superseded and recovered states. Include workers, scheduled jobs and long-lived clients where they can retain older versions.

Compare observed identities against the intended set using authorized read-only evidence. A successful pipeline or a tag in a manifest is not evidence of activation. If some targets are unreachable, report them as unknown rather than inferring fleet convergence. Assign ownership for the deployment inventory and its authoritative references so a future release can distinguish a supported older cohort from accidental drift.

## Reconcile three different things deliberately

For infrastructure-managed systems, compare **declared configuration**, **management state** (the tool's resource/identity mapping) and **live resources/effective settings**. Also compare application configuration and schema state where they are managed separately. Establish target identity and timestamps first; concurrent rollout or incident response can make observations inconsistent. Read-only plans may contact providers and execute helpers, so inspect execution and authorization boundaries before running them.

Classify a discrepancy before fixing it:

- **Approved emergency containment:** preserve the protective control. Confirm the incident owner's intent and whether to codify the new state, maintain a bounded temporary exception, or later restore the baseline. Do not let a routine apply reopen exposure or re-enable a disabled capability.
- **Unrecorded but intended change:** establish ownership and approval, then propose updating declarations/baseline and necessary evidence. Observation alone does not authorize adopting it.
- **Accidental or unauthorized live drift:** assess integrity, exposure and dependencies; propose restoration or a safer forward correction. Follow incident handling when compromise is plausible rather than destroying useful evidence.
- **Stale or broken management state:** reconcile actual resource identities and ownership through the tool's documented recovery/import procedure. Do not force-unlock, delete state or recreate a resource merely to make a plan clean.

Review the change across the whole compatible set, including replacements, data retention, effective permissions and recoverability. Obtain authority for the exact mutation, preserve evidence and use locking/concurrency controls. Refresh the proposed change if observations or inputs changed. After execution, re-observe live identities and behavior, confirm management-state consistency and update the baseline/status record. A clean plan alone does not prove the workload works.

## Preserve recovery and hand off the record

Identify the owner and protected location of state backups, baseline manifests, artifact retention and recovery instructions. Management state can contain credentials or sensitive resource details; restrict access and never embed it in public handoff notes. Establish which snapshots match which resource/configuration generations, restoration prerequisites and recovery evidence appropriate to the risk. Restoring an old state file does not restore live resources or application data; it may misassociate identities and cause destructive subsequent operations.

For state repair or recovery, preserve the current state first where authorized, freeze competing writers through the existing process, inspect partial effects, and use the documented procedure with a compatible tool/provider version. If the required backup, owner or recovery permission is missing, report the exact blocked operation and safe evidence already collected instead of improvising a repair.

At release handoff, leave maintainers the actual active set, supported transitional combinations, known drift/temporary controls with owner and revisit trigger, authoritative references and recovery limits. Update installation, upgrade, migration and operator documentation when behavior changed; stale instructions can reintroduce an incompatible set after a correct rollout.

## Check the release gate's coverage

Suppose a release gate receives successful unit-test results but its dependency
list omits the required package-consumer check. Approving every supplied result
still leaves the release requirement unverified. Compare the gate's represented
checks with the established requirements for the actual event/configuration,
including matrix expansion and dependency conditions. Exercise or inspect the
missing-check and upstream failure/cancellation paths without triggering release.
An intentionally excluded platform on this event or a documented non-voting
experiment is not a missing required check. Reuse the workflow's authoritative
mapping and supported gate mechanism rather than maintaining a parallel job list.
