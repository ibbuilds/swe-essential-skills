# Engineering coverage and composition

Status: coverage design and initial implementation mapping, 22 October 2026. This maps the requested responsibilities and their instruction owners. It is not an exhaustive claim about software engineering or evidence of measured agent performance.

## Purpose

Help agents make sound engineering decisions and avoid recurring mistakes while preserving user intent and project conventions. Use expert workflows as references for mechanisms, not as packages to copy wholesale. Every proposed instruction needs a concrete reason to exist: a consequential decision, a recurring failure, or a reliable way to verify an outcome.

PM Essential Skills supplies domain-independent coordination. SWE Essential Skills now supplies product discovery, strategy/positioning, definition and planning as well as technical methods. This explicit scope expansion supersedes the earlier technical-only boundary. Visual art direction and marketing execution remain outside this suite. Reuse an adequate brief instead of restarting product strategy.

## Historical outline cross-reference

The original 13–20 outline is not the scope boundary. Areas 1–3 are now explicitly in scope: product-discovery owns problem validation, product-definition owns strategy/positioning and product definition, and project-planning connects imported or newly developed plans to engineering readiness. See [full-lifecycle coverage](lifecycle-coverage.md) for the independently reviewed responsibilities and gaps.

| Original area | Engineering responsibility | Recurring mistakes to address | Proposed method and useful outcome |
| --- | --- | --- | --- |
| **13. Technical discovery and architecture** | Translate the accepted goal into technical requirements, quality attributes, constraints, contracts and feasible boundaries. Understand existing systems before changing them. | Coding before resolving a consequential uncertainty; inventing abstractions for one caller; treating a familiar stack as universally suitable; ignoring failure behavior. | Inspect relevant existing paths; identify only material unknowns; compare viable options against constraints; use a focused spike when uncertainty warrants it. Record significant decisions and acceptance examples, not a document for every edit. |
| **14. Repository and development foundations** | Reproducible setup, dependency/toolchain conventions, configuration, change isolation, implementation structure and integration. Covers libraries, CLI and desktop software as well as services. | Overwriting unrelated work; assuming a worktree isolates ports/databases; introducing a parallel architecture; unrepeatable builds; unreviewed execution of repository scripts. | Discover existing conventions and commands; use isolation appropriate to shared resources; keep changes cohesive; preserve public contracts and ownership. Deliver a reproducible change that fits the project. |
| **15. Data and backend engineering** | API and message contracts, validation, authorization boundaries, persistence, transactions, concurrency, retries, idempotency, migrations and recovery. | Successful-path-only APIs; duplicate side effects on retry; partial transactions; cross-tenant data access; schema changes that break old application versions; backups assumed restorable. | Identify invariants and consumers; design failure semantics; review transaction and authorization boundaries; stage compatible changes where needed. Verify meaningful data behavior and recovery, not just migration exit status. |
| **16. Frontend implementation** | Turn an agreed design into working client behavior: components, state, navigation, integration, semantics, accessibility and performance. Apply platform-specific methods for web, mobile or desktop. | Attractive screenshots with broken flows; missing loading/error/empty states; keyboard/focus failures; stale async results; unnecessary client work; platform assumptions. | Implement representative user journeys and adverse states; inspect rendered behavior when relevant; use platform guidance only for the chosen stack. Visual direction stays with the design workflow. |
| **17. Testing and quality assurance** | Debugging, verification strategy, behavioral tests, review, performance investigation and acceptance evidence. | Guess-and-patch loops; tests asserting implementation trivia; blanket full-suite repetition; skipped required checks; stale review results; green tests presented as proof of everything. | Reproduce or bound the failure; form a hypothesis; use a distinguishing check; select tests by behavior, risk and affected contracts. Review material impact and report exactly what passed, failed or remains unverified. Respect existing mandatory gates. |
| **18. Security, privacy and dependency health** | Threat/trust boundaries, input handling, authentication/authorization, secrets, data minimization/retention, dependency risks and vulnerability response. | Security only at the end; trusting client checks; leaking data into logs/evidence; assuming dependency installation is harmless; treating prompts as access controls. | Include relevant abuse cases during design and implementation; apply selected verifiable controls; triage dependency findings in context. Host permissions and deployment controls enforce authority; skills cannot grant it. |
| **19. Build, release and deployment** | Identifiable artifacts, packaging/versioning, CI/CD, compatibility, environment configuration, infrastructure changes, rollout and rollback/recovery. | Wrong-environment changes; mutating infrastructure during a supposed check; publishing unverified artifacts; incompatible rolling releases; rollback that cannot restore data consistency. | Distinguish build, plan, publish and apply actions; verify the intended artifact/environment; assess migration compatibility and recovery; perform applicable post-release checks. A plan or green CI is not a successful deployment. |
| **20. Operations, maintenance and support** | Observability, useful alerts, service expectations, incidents, support ownership, upgrades, technical debt, deprecation, migration and retirement. | Shipping without a recovery path or owner; noisy alerts; repeated incidents without cause analysis; unmaintained dependencies; orphaned data, credentials or infrastructure after shutdown. | Establish proportionate operational evidence and recovery instructions; investigate incidents; maintain compatibility; retire systems with consumer/data/resource checks. Deployment is not the end of the lifecycle. |

All areas matter. Equal importance does not mean equal ceremony on every request. Security, quality, data integrity, configuration management and operability are continuous concerns, not gates postponed to the end. Activities can iterate by increment; an incident or maintenance task does not restart a greenfield lifecycle.

## Expert mechanisms to use as foundations

The [research shortlist](expert-comparison.md#source-shortlist) provides primary links and reuse caveats. The initial skills synthesize the candidate mechanisms below into original procedures:

- **Addy Osmani:** broad engineering coverage, multi-dimensional code review, migration/deprecation and production-readiness thinking. Adapt the relevant decision checks, not fixed sizes, thresholds or universal task sequences.
- **Matt Pocock:** focused technical clarification, dependency-aware work decomposition and reproducible bug signals. Consume existing decisions rather than re-interviewing the user.
- **Ras Mic:** task ownership, practical isolation, architecture preservation, proportionate evidence and bounded revision-aware review loops. No required commercial reviewer, public upload destination or maximum-score acceptance rule.
- **Superpowers:** systematic investigation and evidence-backed completion. Keep these independent from mandatory brainstorming, universal TDD and always-on delegation.
- **Vercel, Supabase, HashiCorp:** conditional React, PostgreSQL and infrastructure techniques respectively. They are examples of specialist depth, not the universal default stack.
- **Trail of Bits:** security change review supported by concrete affected paths and attack scenarios. Scope audit depth to the actual task and risk.
- **Spec Kit/OpenSpec:** consistency and change traceability for substantial behavior changes. Do not impose a multi-document process on a trivial correction.

Primary disciplinary references help check for missing coverage; they are not instructions to reproduce textbooks: [IEEE SWEBOK](https://www.computer.org/education/bodies-of-knowledge/software-engineering), [NIST SSDF tailoring](https://csrc.nist.gov/projects/SSDF), [OWASP ASVS](https://owasp.org/projects/asvs), [W3C WCAG 2.2](https://www.w3.org/TR/WCAG22/), and [Google SRE lifecycle](https://sre.google/workbook/engagement-model/). Apply the correct standard and version for the project; draft publications are not final standards, and a skill does not certify compliance.

## How the suite is structured

1. **Independently usable skills, selected by task.** Split skills when the responsibility, trigger and evidence differ materially. The eight coverage areas do not force exactly eight folders.
2. **Small entrypoints with conditional depth.** Keep decisions and important invariants in the skill; put substantial platform-specific procedures in local references. Never load every skill or reference for a routine request.
3. **Project context, not a prescribed stack.** Reuse the existing brief, architecture, commands, deployment process and constraints. Ask only for missing decisions that materially change the work. No compulsory new configuration file or intake questionnaire.
4. **Project-type layers.** Web/services, native clients, CLI/desktop, libraries, data pipelines and embedded systems need different checks. Start with applicable engineering principles; use verified platform guidance or identify missing expertise rather than pretending one pack contains every specialty.
5. **Helpers only for demonstrated mechanics.** Add scripts for repeated deterministic work when their benefit is clear. Do not build an orchestration platform or install unrelated integrations just to deliver skills.

## Composition contract with PM Essentials

| Concern | PM owns | SWE adds |
| --- | --- | --- |
| Intake, scope, priorities, dependencies and completion | General task coordination and feasibility/change handling | Technical feasibility, quality attributes, interfaces and implementation dependencies |
| Context and handoffs | Continuity, known decisions, applicable long-chat policy and safe handoffs | Compact technical state: affected contracts, current revision, evidence, unresolved risks and recovery status |
| Tools, models, effort and retrieval | General resource/source selection and bounded evidence gathering | Which technical evidence or capability is needed; stack/version-specific sources. Never invent unavailable tools or change model settings |
| Verification and recovery | Proportional check/retry policy and honest completion reporting | Concrete behavioral invariants, test/review methods, engineering gates and technical recovery procedures |
| Repeated mistakes | General workflow improvement and lessons at their existing owner | Diagnose the engineering cause; add the narrow regression or domain guidance that prevents recurrence |
| Communication | Concise, complete, plain-language updates | Relevant technical evidence and consequences; not a second reporting format |

PM is not a hard installation dependency. Each SWE skill must still be usable on its own. When both suites are active, reuse the existing plan, facts, evidence and decisions instead of creating parallel trackers or repeating their instructions. A specialist requirement can justify a deeper check, but should not silently override scope, quality requirements, permissions or user choices.

A skill is guidance, not an enforcement boundary. It must not imply that installation authorizes production access, spending, publishing, merging, data disclosure or destructive actions. Record a blocked or partial outcome when required capabilities or approval are missing.

## Representative compatibility cases

These are design scenarios, not executed model tests:

- **Small copy correction:** preserve the accepted wording/design; inspect the affected behavior only as necessary. No architecture redesign, full intake interview or obligatory worktree merely because the suite is installed.
- **Production schema change:** preserve PM's accepted scope; SWE adds consumer/version compatibility, locking/data risk, migration and recovery evidence. Identify missing production authority rather than treating a successful dry run as permission to apply.
- **Repeated bug:** reuse relevant known evidence; SWE investigates the actual cause and verifies a focused fix. PM's improvement guidance retains an applicable lesson without multiplying global rules or blaming the user by default.
- **New application:** import or develop the product plan; assess missing problem validation, direction and scope before engineering decisions; build useful increments with applicable checks. Reuse settled positioning and load specialist depth only where needed.
- **Unavailable browser or infrastructure tool:** report the precise unverified behavior; perform useful supported checks. Do not invent screenshots, deploy success or unavailable capabilities.
- **Library or CLI maintenance:** prioritize API/command compatibility, packaging, exit/stream behavior and consumer impact. Do not impose browser screenshots, web authentication or an online-service rollout on it.

## Before calling an implemented skill ready

- Its trigger and exclusions distinguish it from adjacent PM/SWE skills.
- Instructions change useful decisions rather than restating generic expertise.
- The required references survive individual installation.
- Important constraints and failure paths are preserved without forcing every possible check.
- Added deterministic helpers are checked against relevant behavior, not merely expected wording.
- Composition and negative cases are reviewed. Structural validation alone is not evidence of agent adherence.
- Any proposed live model evaluation or paid tooling remains separate and subject to the user's available allowance and authorization. No token-savings claim is made without suitable measurements.


## Historical implementation mapping

The first implementation separates these responsibilities so unrelated procedures
need not load together. This is not a final ceiling on coverage.

| Area | Implemented instruction owner(s) |
| --- | --- |
| 13 | software-architecture |
| 14 | software-construction |
| 15 | backend-engineering; data-engineering |
| 16 | client-engineering |
| 17 | software-debugging; software-verification; software-review; software-performance |
| 18 | software-security |
| 19 | software-delivery |
| 20 | software-operations; software-evolution |

Security, performance, compatibility and recovery also appear where they affect
a domain's actual decisions. This is deliberate local completeness for separately
installed skills, not a requirement to activate every related owner. Code review
is separate from test execution because inspecting a change and designing/running
its verification are distinct requests and need different evidence.

Requirements engineering and platform/hosting establishment now have distinct owners beyond that original mapping. Assurance, configuration management, pipeline work, engineering economics and documentation are assessed in the independent lifecycle map rather than assumed covered by these numbers.
