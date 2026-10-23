# V1 readiness: finish the usable version, then try it

**Status: reviewed first-version candidate, 22 October 2026; final integration gates recorded below.** The target is a complete, locally
reviewed first version for the user's own later trial—not a published release,
a certification, or a promise of perfect engineering. This document joins the
requirements to implemented procedures and defines a finite acceptance boundary.
It does not start a new project tracker or replace the user's existing plan.

**Status clarification — 23 October 2026:** The checked gates, review results and
package-copy evidence below belong to the stated 22 October snapshots. Subsequent
changes are summarized in the [23 October research audit](research-audit-2026-10-23.md).
Use the selected candidate's exact source revision and applicable checks for
current integration status; earlier package copies do not validate later content.
Live application and net savings remain unverified, and the disclosed PM
location-policy choice remains pending.

## What this version must do

Help an agent take software work from product intent through retirement without
avoidable guessing, repeated context discovery, speculative repair, unsupported
completion claims or unnecessary ceremony. Preserve quality, user-owned decisions
and action authority while reducing *total effort to an accepted outcome*.

The package has 18 independently usable instruction owners. Product discovery,
strategy/positioning, definition and planning are in scope, alongside engineering.
Visual art direction and marketing execution are not. Platform-specific and
regulated work still needs appropriate current documentation, tools and expertise.
The skill count is an implementation fact, not a completeness score.

V1 must work as selective guidance: already-defined ongoing development,
including substantial features or refactors, does not restart product strategy; a known check recipe does not restart assurance planning. Each skill's
required references stay in its own folder. Installation does not enforce
activation, establish a sandbox, grant production access or authorize spending,
publication, merging or destructive action.

### Evidence vocabulary

- **Implemented:** the linked skill contains the procedure. This is inspectable
  instruction coverage, not observed agent compliance.
- **Static support:** the repository's coverage, workflow or expert review explains
  the mechanism and relevant failure cases. It is not a controlled comparison.
- **Mechanically checked:** a named local command actually ran against a stated
  snapshot with an observed result. Final integration results are recorded below.
- **Live unverified:** discovery/loading, correct application, user experience,
  finished-task quality and net usage effects have not been established in a user
  trial or matched model evaluation.
- **Pending:** integration or review remains to be closed; a planned change is not
  counted as implemented merely because its subject appears here.

The lifecycle map below reports **implemented instructions with static support;
all live behavior and savings remain unverified**. Unperformed live use and the retained PM policy choice are explicit limits, not implied completions. Existing research in
[empirical evidence](empirical-evidence.md) concerns other interventions and
settings; its results cannot be transferred into this suite's success rate or
weekly-quota savings.

## PM is the foundation, not a second engineering workflow

| Existing responsibility | PM contribution | SWE contribution; no duplicate artifact |
| --- | --- | --- |
| Coordination and scope | Priorities, dependencies, feasible commitments and change handling | Technical dependencies and acceptance implications, attached to the same plan |
| Context and continuity | Recover decisions, maintain continuity and hand off useful state | Relevant contracts, target/revision, evidence applicability and recovery status |
| Resources and sources | Choose available tools/effort and bounded retrieval | Identify the technical capability and authoritative version-specific evidence needed |
| Execution and recovery | General check/retry discipline and honest progress | Concrete invariants, failure windows, required engineering gates and recovery checks |
| Learning | Retain a useful lesson at its existing owner | Diagnose the engineering cause and add a narrow regression or domain correction |
| Communication | Concise, complete updates and decision transparency | Explain technical consequences and actual evidence, not a second reporting format |

SWE remains usable without PM installed. With both present, reuse the existing
plan, sources and results; another skill becoming relevant is not a reason to
repeat discovery or run the same test. Evidence becomes stale when its relevant
inputs, target, scope or required-gate freshness change—not just at a handoff.

**Known composition constraint:** current PM policy blocks urgent incident domain
work while its chat-location prompt is unanswered. An exception requires the
user's decision, which is pending; current policy remains unchanged. This draft
neither authorizes an exception nor redesigns that policy.

## Lifecycle traceability

Read a row when that responsibility is actually involved. “Avoided work” is a
conditional mechanism, not a measured result or permission to skip a gate. Each
row identifies an observable failure and the procedure that should change it.
The evidence column identifies the authored anchor and what still needs live
confirmation, rather than treating a topic heading as proof.

### Product and engineering decisions

| Responsibility / actual owner | Concrete failure → workflow change | Expected avoided work; quality guard | Evidence and unverified behavior |
| --- | --- | --- | --- |
| **Problem discovery** — [swe-essential-skills-product-discovery](../skills/swe-essential-skills-product-discovery/SKILL.md), “Investigate the uncertainty that matters next” | Treat a feature request as validated demand → separate observed/reported evidence, assumptions and decisions; investigate only an uncertainty that changes the next choice | Avoid irrelevant research or building the wrong response; never fabricate users, interviews or approval, and respect an explicit decision to build | Authored decision/evidence procedure; whether an agent stops research at the useful boundary is live unverified |
| **Strategy and definition** — [swe-essential-skills-product-definition](../skills/swe-essential-skills-product-definition/SKILL.md), “Bound a useful increment” | Let a favorite stack or feature list define the product → settle audience/value, alternatives, scope/non-goals, critical journeys and outcomes before dependent design | Avoid discarded features and repeated direction changes; proposed targets and positioning remain proposals until accepted | Concrete scope and decision handoff exists; improved prioritization or user satisfaction is unmeasured |
| **Planning and readiness** — [swe-essential-skills-project-planning](../skills/swe-essential-skills-project-planning/SKILL.md), plan intake and gap/readiness references | Re-interview about an existing plan, or build from a polished plan with unresolved material choices → recover source answers, classify gaps, reconcile dependent contracts and identify a buildable slice | Avoid answered questions, duplicate plans and incompatible task outputs; unanswered consequential owner choices block dependent commitments, not independent authorized analysis | Implemented intake, gap and transition procedures; actual question reduction and correct activation are unverified |
| **Requirements** — [swe-essential-skills-software-requirements](../skills/swe-essential-skills-software-requirements/SKILL.md), acceptance/change-impact references | Implement a guessed interpretation and discover disagreement after coding → distinguish authoritative needs, observations and assumptions; define observable examples and trace changed obligations | Avoid clarification-driven reimplementation; no invented thresholds, loss tolerance or silent conflict resolution | Implemented source/conflict/acceptance chain; fitness for intended use still requires relevant owner/user evidence |
| **Architecture and detailed design** — [swe-essential-skills-software-architecture](../skills/swe-essential-skills-software-architecture/SKILL.md), “Choose boundaries from pressure” and decision investigation | Introduce fashionable layers or choose a stack that cannot meet constraints → reuse adequate design; compare feasible choices only at consequential uncertainty, then run a discriminating authorized spike if needed | Avoid speculative architecture and late integration redesign; preserve invariant ownership, failure paths, mixed-version compatibility and user decisions | Implemented alternatives, contracts and evidence procedure; actual feasibility/performance cannot be inferred from prose |

### Implementation and stored behavior

| Responsibility / actual owner | Concrete failure → workflow change | Expected avoided work; quality guard | Evidence and unverified behavior |
| --- | --- | --- | --- |
| **Repository foundations and construction** — [swe-essential-skills-software-construction](../skills/swe-essential-skills-software-construction/SKILL.md), reproducible foundations and contract-aware implementation | Re-scan the repo at each handoff, run an uninspected helper, add a parallel pattern or overwrite unrelated work → reuse applicable facts, inspect changed scripts and extend the existing behavior owner | Avoid repeated reads, setup churn and collateral repairs; preserve unrelated edits, runtime validation, resource cleanup and required checks | Implemented script/context/contract/checkpoint procedures; repeatability and adherence need actual task evidence |
| **Efficient code construction** — construction, work/resource-shape reference; [swe-essential-skills-backend-engineering](../skills/swe-essential-skills-backend-engineering/SKILL.md) | Add repeated scans, per-item IO or blocking CPU work hidden behind async syntax → reason about input growth and execution location; select a simple appropriate representation or bounded batching | Avoid structurally redundant work and later complexity repairs; preserve identity, ordering, authorization and cancellation; no speculative cache/worker layer | Structural reasoning is implemented; no benchmark or generated-code optimality claim follows |
| **Services and integrations** — swe-essential-skills-backend-engineering, contracts/boundaries and concurrency/delivery references | A timeout produces duplicate effects, or valid foreign IDs bypass tenant checks → trace actor/resource authority, commit boundaries, idempotency and reconciliation; check state/effect counts, not just status codes | Avoid duplicate operations and repeated guess-patches; authenticate/authorize before effects, test affected real boundaries with safe fixtures | Implemented invariant and adverse-path procedures; actual external service behavior remains unverified without integration evidence |
| **Data models, queries and migrations** — [swe-essential-skills-data-engineering](../skills/swe-essential-skills-data-engineering/SKILL.md), model/query and migration/backfill references | A successful migration breaks old readers, corrupts meaning or leaks pooled-session identity → inventory readers/writers and session-state ownership, separate logical change from locks/rewrites, reconcile values through compatible stages | Avoid failed cutovers and misdirected query tuning; retain tenant scope, accepted deletion semantics and mutation authority | Procedures and pooling adaptation have static support in expert comparison; production-scale effects and live isolation are not demonstrated |
| **Pipelines** — swe-essential-skills-data-engineering, pipeline correctness/operations reference | Replay or late input silently duplicates or omits published records → establish source/output contracts, checkpoints, replay and partial-publication behavior | Avoid manual repair/reprocessing caused by incorrect completeness; preserve data meaning and verify publication invariants, not job exit alone | Conditional pipeline procedure exists; workload-specific freshness/completeness remains live unverified |
| **Clients and accessibility** — [swe-essential-skills-client-engineering](../skills/swe-essential-skills-client-engineering/SKILL.md), platform/state patterns | An attractive screen has broken recovery, stale responses overwrite new state, or forced clicks hide unusable controls → build an actual journey with request/account/lifecycle ownership and semantic input behavior | Avoid patching symptoms with debounce or duplicate state; preserve accepted design, server authority and ordinary user interaction | Implemented journey/race/accessibility procedures; rendered, device and assistive-technology behavior requires its own evidence |

### Quality, security and efficiency

| Responsibility / actual owner | Concrete failure → workflow change | Expected avoided work; quality guard | Evidence and unverified behavior |
| --- | --- | --- | --- |
| **Debugging** — [swe-essential-skills-software-debugging](../skills/swe-essential-skills-software-debugging/SKILL.md), investigation patterns | Stack patches and rerun broad tests without distinguishing causes → establish a trustworthy signal and choose the cheapest safe discriminating observation; use a directly demonstrated cause without a hypothesis ritual | Avoid speculative repair cycles; reconcile uncertain side effects before replay and distinguish diagnosis authority from repair authority | Implemented causal procedure; actual diagnosis quality and avoided iterations are unmeasured |
| **Verification and validation** — [swe-essential-skills-software-verification](../skills/swe-essential-skills-software-verification/SKILL.md), test-design cases | Green mocks prove only fixture behavior, or tests hit a stale server → select a falsifying observation at the real failure layer, verify target identity and retain durable failing inputs/sequences | Avoid irrelevant tests, repeated logs and lost regression cases; preserve mandatory gates, final applicability and normal entry-path prerequisites | Implemented oracle/identity/replay procedures; validator success cannot establish their live application |
| **Change review** — [swe-essential-skills-software-review](../skills/swe-essential-skills-software-review/SKILL.md), “Turn suspicions into defensible findings” | Invent findings from suspicious syntax, review mixed revisions or accept green checks after weakened assertions → trace real callers at one snapshot, try to disprove concerns and compare changed acceptance controls with the baseline | Avoid false-positive repairs and stale review rounds; no finding quota, unauthorized edits or unapproved weakening | Implemented source-grounded review; true/false-positive performance is unmeasured |
| **Security and privacy** — [swe-essential-skills-software-security](../skills/swe-essential-skills-software-security/SKILL.md), change-review and response/dependencies references | Treat a clean scanner or client check as security, or expose private evidence to prove a finding → trace asset/actor/authority/effect, select concrete bypass checks and minimize evidence | Avoid irrelevant scans, unsafe proof and late boundary redesign; use actual enforced controls and authorized synthetic tests, not prompt promises | Core controls are implemented; the conditional [model-to-tool procedure](../skills/swe-essential-skills-software-security/references/model-tool-boundaries.md) is implemented and statically reviewed; exploit resistance is not established by static review |
| **Performance and capacity** — [swe-essential-skills-software-performance](../skills/swe-essential-skills-software-performance/SKILL.md), measurement/optimization; platform and operations | Add caching/concurrency without attribution or compare unlike workloads → reuse an applicable baseline, locate the bottleneck, make one justified change and compare equivalent completed work | Avoid speculative tuning and redundant profiling; preserve correctness, tail behavior, resource bounds and authority for load tests | Measurement procedure exists; no actual speed, resource or token gain is claimed here |
| **Lifecycle assurance** — verification, lifecycle-assurance reference; requirements | Claim acceptance from a green suite while a contractual, safety or recovery obligation has no owner/evidence → connect material claims, evidence methods, acceptance owner and explicit exceptions at existing records | Avoid late discovery of missing assurance and duplicate audit artifacts; no self-certification, invented waivers or universal assurance ceremony | Conditional assurance procedure exists; applicable specialist judgments and live acceptance are still project-specific |

### Hosting, delivery and the rest of the lifecycle

| Responsibility / actual owner | Concrete failure → workflow change | Expected avoided work; quality guard | Evidence and unverified behavior |
| --- | --- | --- | --- |
| **Hosting establishment** — [swe-essential-skills-platform-engineering](../skills/swe-essential-skills-platform-engineering/SKILL.md), platform selection and bootstrap/network references | Start with a deploy command, then discover runtime/state/network incompatibility → match the workload to a resource graph, build in dependency order and verify DNS/TLS/identity/application paths | Avoid failed setup/reprovisioning; consequential provider, exposure, region and spend choices stay with their owner | Implemented selection/bootstrap procedure; authored configuration is not provisioned or working hosting |
| **Configuration/change accounting** — [swe-essential-skills-software-delivery](../skills/swe-essential-skills-software-delivery/SKILL.md), configuration baselines; construction | Verify one source tree but ship different bytes/configuration, or overwrite intentional live state as “drift” → identify compatible source/dependency/artifact/schema/configuration sets and reconcile declared versus observed state deliberately | Avoid wrong-target debugging and repeated rebuilds; keep identity and authorization through reconciliation | Implemented baseline procedure; actual deployed identity requires observation, not a tag or plan |
| **Build, packaging and delivery** — delivery, rollout/recovery and infrastructure references | Source tests pass but the installed package fails; a timed-out apply is repeated while still running → inspect actual artifact/consumer behavior, separate build/publish/apply and inspect authoritative outcome before retry | Avoid broken-package repair and duplicated deployment effects; retain compatibility, target checks, applicable gate freshness and separate publication authority | Implemented artifact/consumer/retry procedures; no application deployment or versioned release is part of this v1 preparation |
| **Operations, support and recovery** — [swe-essential-skills-software-operations](../skills/swe-essential-skills-software-operations/SKILL.md), incident/recovery and capacity/restore; data recovery/reconciliation | Treat a restart or backup file as restored service/data; add noisy telemetry → target user-visible health, discriminate causes, separate mitigation from correction and verify restored invariants | Avoid blind restart loops, repeated support discovery and unsafe recovery; protect evidence, authority and actual current restrictions | Existing incident/restore procedures implemented; post-snapshot deletion/revocation reconciliation is implemented in both independently usable restore paths and statically reviewed |
| **Maintenance and evolution** — [swe-essential-skills-software-evolution](../skills/swe-essential-skills-software-evolution/SKILL.md), upgrades/compatibility and evidence-based debt reduction | Upgrade/rewrite everything because it looks old, or equate shorter code with improvement → select observed maintenance cost, preserve behavior at a seam, stage compatible upgrades and prove affected consumer behavior | Avoid incidental churn and compensating fixes; distinguish intentional changes, temporary adapters and remaining transition work | Implemented incremental/evidence-based procedure; reduction in future maintenance cost is not measured |
| **Deprecation and retirement** — evolution, migration/retirement reference; data/platform owners | Delete source while offline consumers, stored data, credentials or billable resources remain → identify dependents and transition conditions, handle retain/export/delete decisions and verify shutdown residue | Avoid broken consumers, orphaned costs and repeated cleanup; lack of recent traffic is not proof all consumers moved; irreversible actions require authority | Implemented shutdown/transition procedure; no actual retirement or deletion has been executed for this draft |
| **Engineering economics** — architecture decision investigation; platform selection; evolution debt reduction | Pick lowest apparent build cost while ignoring operations, migration or exit → compare plausible whole-lifecycle costs and uncertainty at the real decision | Avoid premature optimization and expensive lock-in; no invented prices, precise scores or workload forecasts | Implemented conditional tradeoff methods; actual cost differences need project evidence |
| **Documentation and accountability** — construction engineering-documentation reference; requirements/delivery/operations | Update code but leave stale examples/runbooks, or blur proposal and accepted result → update the authoritative usage source with changed behavior and leave evidence/owner/status at existing records | Avoid repeated questions and failed setup/recovery from stale instructions; no documentation quota or parallel tracker | Implemented change-linked documentation procedure; usability of actual instructions needs consumer observation |

## How to assess avoided work without inventing savings

The expected benefits above are mechanisms. Every added read, question, check and
review also has a cost. Apply these examples only when their stated assumptions
hold; none is an observation of this suite's behavior.

- **Repeated context:** if `k` relevant handoffs would each rediscover the same
  unchanged facts, reusing one established trace can avoid at most `k - 1`
  rediscovery passes. This assumes the baseline really repeats them, the trace is
  sufficient and no relevant input/gate has invalidated it. Reading and checking
  the trace still costs work.
- **Existing plan:** if a supplied plan already answers `a` questions an agent
  would otherwise ask, source-based intake can avoid those `a` question exchanges,
  minus any questions needed to resolve conflict or authority. It does not avoid
  unanswered owner decisions, and reading the relevant plan is additional work.
- **Evidence reuse:** if construction, a domain skill and delivery would otherwise
  run the same applicable check, one permitted run rather than three avoids two
  executions. This holds only for unchanged relevant inputs, the same claim and
  compatible gate freshness; it says nothing about token usage per execution.
- **Earlier clarification:** an avoided wrong implementation saves a repair cycle
  only if that ambiguity would actually have caused the wrong implementation.
  A useful estimate is `expected avoided repair effort - clarification effort`,
  with the ambiguity probability and repair cost explicit rather than invented.
- **Net task effort:** compare like units: `baseline accepted-task effort -
  guided accepted-task effort`, including instruction loading, investigation,
  questions, checks, repairs and review. A reduction in reads can coexist with
  increased tokens; shell elapsed time is not model time, and model tokens are
  not automatically provider-specific weekly quota.

**Actual model, token, time and weekly-quota savings are unmeasured.** Do not
replace required checks with speculative prose to make the counts look smaller.
External experiments and source popularity support neither a promised benefit
nor universal failure of these particular procedures.

## Finite completion gates for this first version

Use the existing task/review record for results. A checked box requires evidence;
only observed results are checked below.

- [x] **Scope/traceability:** each responsibility above has an actual usable owner,
  a concrete failure mechanism, conditional depth and a simple valid bypass path.
- [x] **Instruction integration:** resolve supported material contradictions,
  especially user-owned decisions, evidence reuse, independent installation and
  PM composition; leave no known critical instruction defect disguised as a trial
  limitation.
- [x] **Targeted changes:** restore/current-restriction reconciliation and the
  conditional model-to-tool security procedure are implemented and reviewed.
  Review corrected atomic single-use approval validation to include consumption.
- [x] **Mechanical/package checks:** run the repository validator on the final
  local snapshot; run helper unit tests if the helper changed. Record command,
  result and snapshot. Inspect installation paths and standalone local references;
  do not mistake these checks for host activation tests.
- [x] **Ten distinct review lenses:** record the actual scoped results below;
  correct material findings and recheck their affected paths. An evidence-backed
  no-finding result is valid. No perfect-score or endless reread requirement.
- [x] **Trial handoff prepared:** installation/invocation instructions, remaining limitations
  and the short trial path below are usable; clearly distinguish local version,
  review state and any unperformed publication/remote action.

Final local mechanics on 22 October 2026:

- `python scripts/validate_skills.py` passed for all 18 skills after the final
  runtime changes; the validator itself did not change.
- Skills CLI 1.7.4 copied the complete current suite into isolated Codex and
  Claude Code project roots. All 74 source files per host matched; no skill
  symlinks were introduced. Runtime skills tree:
  `d2f011f856cd6439c26d645f7bc866a71128f28c`.
- README/document inline local-file links and whitespace checks passed. This
  does not check every Markdown construct, remote link or coding-host behavior.
- No coding model, production recovery, application deployment or live benchmark
  was invoked. The copy test does not establish host activation or adherence.

The historical handoff covered the reviewed source candidate. For a later
candidate, identify its exact merged revision and applicable local/remote check
results in the final handoff.
No versioned release/tag is requested or created by these gates.

When these gates are established, call the result **“v1 ready for the user's
trial.”** Do not wait for a paid benchmark, public release, every possible stack,
a future user trial or a proof of perfection to finish this preparation. New
research is warranted only to resolve a concrete material issue, not to keep
expanding the catalog. A blocker requiring a new user decision must be named
precisely instead of being silently waived.

### Ten distinct review lenses and recorded results

All ten lenses were completed as scoped static reviews on 22 October 2026 against
base `387bf8649b310d57a44282326d9685f74f66a37f` plus the integrated recovery,
model-tool and readiness changes. The reviewed runtime skills tree is
`d2f011f856cd6439c26d645f7bc866a71128f28c`. PM composition used main
`cb441a74cb90d58650fc7991c37f6d6fa39d9b17`. These are ten distinct review
angles, not ten model executions or ten independent whole-project certifications.
No additional material instruction defect was supported after the scoped fixes.

| # | Distinct lens | Concrete review action and acceptable evidence |
| --- | --- | --- |
| 1 | Lifecycle completeness | Walk an idea, an existing-system change and retirement through the responsibility map; find missing decisions/actions rather than count headings |
| 2 | Product intent and decision ownership | Trace an imported plan with one resolved and one unresolved choice; confirm no repeat interview or silent acceptance of a proposal |
| 3 | Selective routing and proportionality | Contrast a label correction, known-check execution and consequential capability; inspect descriptions/load conditions for unnecessary full-workflow activation |
| 4 | PM composition and standalone use | Trace facts, plan, sources and evidence across PM/SWE boundaries and one separately installed skill; identify duplicate trackers or missing local prerequisites |
| 5 | Technical invariants and cross-boundary failures | Trace tenant substitution, retry-after-commit, pooled context, stale client response and mixed-version migration against the relevant actual instructions |
| 6 | Security, authority and recovery restrictions | Inspect untrusted-content/tool boundaries, target permissions, denied/uncertain actions and restored-state reconciliation; establish which controls are instructions versus host enforcement |
| 7 | Verification truth and acceptance preservation | Trace stale runtime identity, fixture-only setup, changed assertions, failed checks and replay evidence; confirm none becomes unsupported success |
| 8 | Workflow cost and maintainability | Identify each added unconditional action, duplicate read/check and speculative abstraction; retain safeguards and require a concrete utility for extra process |
| 9 | Package and installation integrity | Inspect frontmatter, names, local links, copied folder contents and installation instructions; run applicable deterministic checks and state what they cannot test |
| 10 | Evidence honesty and trial usability | Inspect claimed results, source attribution, pending work and the final handoff; confirm a user can try one task without mistaking research or static checks for measured effectiveness |

Recorded decisive observations:

- **1–2:** traced new idea, defined change, incident and retirement paths; supplied
  answers stay accepted while unresolved material choices block only dependent
  commitments. Retirement includes consumers, effects, data, credentials and costs.
- **3–4:** label edits and known check recipes bypass broad planning/assurance;
  standalone planning contains its three required references. PM and SWE reuse
  one plan/evidence set. The disclosed PM location policy remains unchanged.
- **5–6:** traced valid foreign-tenant IDs, commit-then-timeout, pooled identity,
  stale client generations and mixed-version readers/writers. Reviewed current
  restrictions after restoration and actual model/tool execution authority,
  including atomic grant consumption and separate retry reconciliation.
- **7–8:** runtime identity, fixture prerequisites, weakened assertions, skipped
  checks and generated-case replay remain distinct evidence obligations. No
  unconditional new model campaign, agent count or duplicate check was introduced.
- **9–10:** inspected frontmatter, portable references, full-folder installation,
  attribution and trial instructions. Historical CLI results were not reused as
  proof of new files; the current 74-file copies were separately checked. A host
  listing, model adherence and measured savings remain separate from packaging.

These are review methods, not ten model evaluations or a requirement for ten
agents. A material edit invalidates only the affected conclusions, subject to
required gates; record the recheck rather than claiming the old result covers it.

## Short later user trial

No trial has been run for this draft. The user can try the completed version when
ready without starting a benchmark project:

1. Follow [installation](installation.md) in the chosen supported host; confirm
   the selected skill is visible and explicitly invoke it if needed. Keep
   visibility, loading and correct application as separate observations.
2. Choose one real bounded task with known acceptance—such as a bug with a useful
   reproduction or a small feature in an existing repository. Supply the existing
   issue/plan; do not prepare a new template. Use normal permissions and required
   checks, with no production mutation solely for the trial.
3. Watch whether the agent reuses decisions, asks only material questions,
   respects authority, implements the requested contract and reports actual
   evidence. Note a concrete unnecessary action or missed obligation if one
   occurs; retain the relevant task excerpt rather than a whole private log.
4. At the task's accepted outcome or precise blocker, record a brief verdict:
   useful mechanism, friction/failure, quality/gate result and available usage
   observations. Fix a demonstrated instruction problem at its owner. One task
   can reveal a defect; it cannot prove general improvement or quota savings.

A later matched comparison is optional, separately authorized work, not a hidden
v1 completion condition. The user's trial supplies the missing real-use evidence;
this preparation must leave a coherent version worth trying first.

## Supporting records

[Coverage/composition](coverage-and-composition.md) and
[lifecycle coverage](lifecycle-coverage.md) explain scope and historical gaps.
[Workflow value](workflow-value.md) explains the expected mechanisms and bypasses.
[Expert comparison](expert-comparison.md) records source-grounded adaptations and
rejected ceremony; [empirical evidence](empirical-evidence.md) explains why those
mechanisms are not measured gains. [Review scenarios](review-scenarios.md) provide
additional adverse cases. Reuse these records; do not load them all for ordinary
consumer tasks.
