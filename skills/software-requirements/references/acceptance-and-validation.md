# Acceptance and validation

Use this when a requirement sounds agreeable but two engineers could implement materially different behavior and both claim success. Examples are illustrative; quantities must come from the actual agreement, not this file.

## Make the observation decisive

For a consequential requirement, specify enough to answer:

1. Under which inputs, preconditions, environment and workload does it apply?
2. What output, persistent effect or invariant must be observed, including failures?
3. What evidence can distinguish a violation from success, and at which boundary?
4. Who accepts the intended outcome, and which unknowns prevent agreement?

Inspect cross-requirement consistency. “Never lose an accepted write” is not established by a response-time test; an encryption requirement does not define which identities may read the data. Check necessity and unintended constraints as well as testability: an unnecessary but testable rule is still the wrong requirement.

## Retry and inventory example

Need: users must not buy more stock than is available. Clarify whether reservations, accepted orders or captured payments consume inventory, and how expiry/cancellation returns it. Define the authoritative stock unit and treatment of replenishment before expressing the invariant.

An agreed invariant might prohibit total active reservations from exceeding available inventory. Candidate checks include concurrent attempts for the final unit, repeated delivery of the same operation, cancellation racing confirmation, and interruption after commitment but before response. Define expected outcomes and legitimate transitions, not merely “both calls returned something.” A disabled UI button is not acceptance evidence for independent concurrent callers.

Validate these rules with the domain owner using concrete transitions. Later implementation verification should exercise the real atomicity boundary. Neither activity substitutes for the other.

## Latency and recovery examples

“Search is fast” leaves the workload, measurement point and allowed degradation undefined. Establish representative query/data classes, concurrent activity, cold/warm state, client or server boundary, error handling, percentile and observation window. Get the target agreed or mark it unresolved. Measuring the current system can inform feasibility; it must not silently become the promised target. A cached local microbenchmark cannot prove client-observed latency under load.

“Recover after a failure” needs a failure class, restoration boundary, tolerable data loss, recovery time and required integrity checks. Identify whether the clock starts at failure, detection or declared recovery action. Confirm who can operate recovery and what credentials/dependencies remain available. A backup file's existence is not proof of restoration, and an unexecuted recovery drill is not evidence.

## Human and assurance acceptance

For usability or accessibility, choose representative tasks, affected users/assistive technology and applicable criteria rather than “looks good.” Identify what human evaluation must establish and what automated checks cannot. Preserve privacy and obtain authority before involving participants or collecting their data.

For safety or regulated software, map the obligation to its authoritative source and qualified owner. Determine required analysis, independent review, hardware/environment evidence or other assurance activities; do not presume a green test suite satisfies them. A requirement can be blocked pending expert applicability review while unrelated reversible work proceeds.

## Expert reference

[NASA Software Engineering Handbook: Requirements Validation](https://swehb.nasa.gov/spaces/SWEHBVD/pages/102695440/SWE-055%2B-%2BRequirements%2BValidation) grounds review of whether requirements are suitable for their intended use. NASA obligations are context-specific, not universally applicable acceptance gates. The examples here do not reproduce a standard or establish compliance.
