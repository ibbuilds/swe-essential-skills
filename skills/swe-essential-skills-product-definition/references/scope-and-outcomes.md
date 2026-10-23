# Scope, outcomes and staged choices

## Define a complete slice

Trace one priority journey from its real trigger to a useful outcome. Include the minimum supporting behavior needed to make that outcome trustworthy: prerequisites, access, invalid or missing inputs, failure communication and recovery where applicable. A command-line conversion tool needs meaningful output and failure/exit behavior; it does not automatically need accounts, billing or a dashboard.

Distinguish a learning prototype from a releasable increment. A prototype may deliberately omit reliability or persistence if its use is bounded and clearly communicated. It cannot be presented as production-ready. A releasable increment still needs applicable privacy, accessibility, compatibility, operational and safety obligations even when they are not visible features. Let engineering establish the concrete contracts and verification rather than prescribing implementation details in the product brief.

When reducing scope, prefer removing whole optional use cases over damaging the main journey. State which audience, environment or failure mode is not supported, and verify that this is compatible with existing commitments. Do not make a critical capability an indefinite “later” item simply to label the first release minimal.

## Make an outcome interpretable

An outcome should name the change that matters and who experiences it. Where measurement is useful, define the population, unit, relevant time window and data source; distinguish baseline, proposed target and measured result. If the baseline is absent, propose how to establish it rather than inventing one. If measurement is not available or justified, use a qualitative acceptance method with its limitations rather than decorative metrics.

Separate:

- Delivery evidence: the capability exists and passes applicable checks.
- Usage evidence: people can reach or use it in the relevant context.
- Outcome evidence: their intended task improves without unacceptable regressions.

A count of new features or total registrations is not automatically proof of value. A shorter task may still be worse if it increases errors or shifts work to another actor. Pair the intended improvement with the material countervailing effect: correctness, exclusion, burden, safety, privacy or support demand. Do not optimize a proxy against the actual user outcome.

## Prioritize under uncertainty

Avoid scoring every idea by a universal formula. Use a lightweight comparison when it changes a choice: expected user benefit, affected population, confidence, delivery and ongoing costs, downside, dependencies and reversibility. If a numeric model is useful, expose assumptions, units and sensitivity; uncertain inputs do not become precise because a spreadsheet multiplies them.

For a deadline, distinguish fixed date from desired date and mandatory scope from negotiable scope. Ask engineering to assess capacity and dependencies before claiming feasibility. Present credible alternatives—smaller audience, fewer optional paths, staged availability or a changed date—without silently trading away required quality.

For a staged plan, identify each stage's value or learning goal, prerequisite evidence, unresolved commitment and continuation/reconsideration signal. Use dates only where grounded; avoid converting uncertain distant work into artificial certainty. Pilot recruitment, telemetry changes and live rollout require their own applicable authority. A proposed continuation signal is not permission to execute the next stage automatically.
