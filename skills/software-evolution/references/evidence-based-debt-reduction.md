# Evidence-based debt reduction

## Connect debt to an observed consequence

Use the existing issue, incident, review history or maintenance record. State the technical mechanism and its consequence: duplicated validation caused inconsistent fixes; an unsupported dependency blocks a required security update; shared mutable state repeatedly breaks parallel tests; an ownership boundary makes small changes cross several modules. Distinguish observed incidents, estimated future exposure and preferences. Age, unfamiliarity and stylistic inconsistency alone do not establish harm.

Inspect the relevant code and affected workflows before proposing a rewrite. Separate the underlying constraint from its symptoms: repeated fixes in several callers may indicate misplaced policy, but superficially similar callers may have intentionally different contracts. Identify what evidence would disprove the proposed cause. Do not manufacture toil measurements or extrapolate one incident into a measured recurring rate.

## Compare bounded interventions

Include leaving the structure alone with a focused mitigation, repairing the actual seam and broader replacement only when justified. For each plausible intervention assess:

- Observed frequency and consequence of incidents, manual maintenance or delayed changes; affected users and supported consumers.
- Exposure to data loss, security failure or unsupported operation, distinguishing credible impact from likelihood uncertainty.
- Expected benefit and mechanism: which repeated operation disappears, which invariant becomes enforceable or which required change becomes feasible.
- Implementation and migration effort, compatibility risk, new operating burden and reversibility. A rewrite may exchange known debt for less understood debt.

Use available ranges or qualitative evidence rather than a universal debt score. Avoid double-counting one incident as downtime, engineering toil and delayed delivery without explaining overlap. Favor a small experiment or reversible seam when uncertainty dominates. Existing urgent obligations can outweigh a high recurring burden; make the tradeoff visible rather than silently reprioritizing the user's work.

## Define completion and reevaluation

Attach a technical success condition to the authorized change: one policy owner with preserved consumer behavior, removal of an obsolete dependency after supported consumers migrate, or elimination of a demonstrated failure mode. Pair it with regression evidence and relevant costs, not reduced line count or a cleaner diagram. Record unresolved risk and deliberately deferred scope in the existing record; do not duplicate the product/planning backlog.

After implementation, compare the relevant burden when evidence becomes available. State that future incident or maintenance reduction is predicted until observed. Reopen the decision if the expected change workload does not materialize, migration cost rises, a new constraint appears or the intervention fails to remove the causal mechanism. Do not schedule monitoring or keep broadening a cleanup task without authority. A debt item can be retired as no longer relevant rather than implemented merely because it was once recorded.
