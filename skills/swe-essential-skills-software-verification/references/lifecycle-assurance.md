# Lifecycle assurance: from obligation to acceptance evidence

Use this procedure when failures have material consequences, acceptance spans several engineering activities, or a contract, applicable rule or organizational policy requires assurance. Reuse the project's existing records; a focused change may need only a claim, a check and an explicit limitation. This is technical evidence management, not a replacement for product priorities, project coordination, legal interpretation or an authorized acceptance decision.

## Establish the obligation before choosing the test

Start with intended use, users, operating environment and reasonably foreseeable misuse or failure. Trace affected behavior and dependencies through implementation, integration, release, operation and eventual retirement. Identify material obligations: functional correctness and integrity; reliability, performance and recovery; physical safety; security and abuse resistance; privacy and data retention; accessibility and supported interaction modes. Do not assume all categories require a new program, or that an unmentioned category is irrelevant.

For each consequential claim, record enough to answer:

- **Source and scope:** the requirement, hazard/threat analysis, user need, contract, applicable policy or authoritative rule, its version, and where it applies. Distinguish an externally required obligation from an engineering recommendation or an unconfirmed interpretation.
- **Accountability:** the engineering owner who supplies evidence and the person or role authorized to accept the result and residual risk. A test author, release operator or assistant is not automatically that authority.
- **Acceptance condition:** the observable outcome, operating bounds, prohibited failure and threshold justified by the source. Resolve conflicting requirements with their owners rather than quietly choosing the easiest test.
- **Evidence and decision:** the method, configuration and use context covered, result location, limitations, outstanding issues and acceptance status.

Unknown applicability or acceptance authority is a concrete gap. Continue independent checks, but do not label a release compliant or accepted by guessing. Obtain qualified interpretation for material legal, safety or domain-specific obligations.

## Map each claim to a method that could refute it

Choose complementary methods by failure mechanism. Inspection can establish that a required control is represented; static analysis can reveal defined classes of implementation error; analysis or simulation can explore modeled bounds; execution checks demonstrate observed behavior; user or domain evaluation addresses fitness for actual use. None substitutes universally for the others.

For example, an emergency-stop requirement may need hazard analysis, review of independence from normal control, timing/fault tests and authorized physical validation. A tenant-isolation claim needs authorization-boundary analysis and adverse cross-tenant checks, not merely successful login. An accessible workflow can require semantic/keyboard checks and representative assistive-technology use; an automated scanner alone misses task completion. A deletion obligation may span replicas, exports and backup retention rather than just a missing UI row.

Separate **verification** (does the implementation meet the specified contract?) from **validation** (does the resulting system serve its intended users and purpose in its actual use context?). Passing specified tests does not establish that the specification was sufficient. For validation, identify representative users or domain experts, tasks, devices, operational load and environment; compare those with the intended deployment. Record where a simulator, synthetic data or staging environment differs materially. Do not perform dangerous trials or expose sensitive data to fill a gap without an authorized safe method.

## Keep evidence attached to the delivered configuration

Identify the revision, built artifact identity, dependency/toolchain versions and relevant runtime configuration, schema, model/data versions, platform and test fixtures for each result. Protect sensitive evidence and retain reproducibility information under the project's access and retention rules. Evidence from source tests is not automatically evidence for a differently packaged binary or a new operating configuration.

On change, follow the affected claim's dependency chain: changed input or control → assumptions invalidated → evidence needing renewal → decision needing reconsideration. Reuse unaffected evidence with a stated basis; rerun or re-review the affected portion. Include documentation, installation, migration, recovery and operator procedures where successful use depends on them. Check the actual delivered version and hand off known limits to its maintainer rather than leaving acceptance attached only to an earlier candidate.

## Resolve gaps without manufacturing acceptance

Keep unresolved defects, failed or unavailable checks, model assumptions and requested waivers visible beside the affected claims. For each material exception state consequence, affected versions/users/environments, compensating controls, accountable owner and required acceptance authority. Record the actual authorized decision, rationale, scope, expiry or revisit trigger and closure evidence. A proposed waiver is not an approved waiver; silence and schedule pressure are not acceptance. Some obligations cannot be waived by the project—escalate to the applicable authority instead of inventing an exemption.

Useful revisit triggers include changed use context, a new hazard or exploit, removed compensating control, expired evidence, dependency/platform changes and observed field failures. Specify how the responsible maintainer will receive those signals. Where a required condition is not met, stop the dependent acceptance or release claim while stating what work and evidence are complete.

Bring in qualified specialists, independent reviewers or an accredited assessment process when the applicable obligation or risk requires them; identify their remit, independence and unresolved findings. Engineering review and successful tests do not by themselves confer certification, regulatory approval, security assurance for every threat or physical safety. Report the exact claims supported and who accepted the remaining risk.
