# Vulnerability response and dependency decisions

## Dependency finding

Resolve the exact package, version, ecosystem, lockfile and shipped artifact. Distinguish direct/transitive, build/runtime, optional/enabled and development-only use; a build dependency can still compromise artifacts. Check current primary maintainer advisories and version-specific remediation rather than assuming the scanner's suggested major upgrade is safe.

Trace whether the affected feature is reachable under the advisory's prerequisites. Record evidence for reachability or its absence; lack of a reproduced exploit alone is not proof of safety. Choose among a compatible patched version, disabling the affected feature, a documented temporary mitigation, or replacement. Check dependency origin, installation hooks and integrity/provenance expectations before executing unfamiliar package code.

Test the affected behavior and consumer compatibility after the change. Regenerate lockfiles using the project's supported tooling, inspect unexpected dependency changes, and verify the built artifact actually contains the corrected version. A suppression needs an owner, rationale, conditions and a review trigger; do not hide the warning merely to make CI green.

## Suspected exploitation or secret exposure

Separate observation, containment and remediation. Preserve minimal useful timestamps, affected versions and redacted evidence through approved channels. Do not copy the leaked value into a report, expand access, probe third-party systems, or destroy evidence to “clean up.”

- Establish likely exposure: where the value/data appeared, who could access it, when, and which powers it grants. History removal alone cannot revoke a copied credential.
- Propose the narrow authorized containment: revoke/rotate a credential, disable a vulnerable capability, restrict access, or pause an affected release. State expected user impact and recovery implications before a disruptive action. If authority is missing, report the exact target/action requiring it while continuing safe analysis.
- For rotation, verify new consumers work before retiring the old value when exposure and policy permit an overlap; urgent revocation may instead require accepting downtime. Confirm old access fails and no stale workers or deployments retain it.
- Patch the enabling cause and verify affected artifacts/environments. Check for persistence or additional access only within authorized scope; involve incident/security owners for scope and notification decisions.
- Report confirmed impact separately from unknown exposure. Preserve a timeline and the remaining checks needed to close the incident.

Do not promise legal compliance, breach classification or notification deadlines from this workflow; those require the applicable jurisdiction, contracts and authorized specialists.
