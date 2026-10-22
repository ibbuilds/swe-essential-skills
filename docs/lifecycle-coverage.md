# Full-lifecycle coverage review

Reviewed 22 October 2026. The product scope is **the software engineering
lifecycle plus product discovery, strategy and definition/planning**, not the original numbered checklist and not the number of skill
folders. A named topic is not substantive coverage: the instructions must help
an engineer make decisions, perform work, handle failure and establish evidence.

## Independent frame

The review used the actual skill procedures and references, with [IEEE
SWEBOK](https://ieeecs-media.computer.org/media/education/swebok/swebok-v4.pdf)
and the current [ISO/IEC/IEEE 12207 lifecycle standard overview](https://www.iso.org/standard/90219.html)
as independent coverage checks. This is an original practical mapping, not a
reproduction of either standard or a compliance assessment. The publicly served
IEEE PDF identifies v4.0a on its cover; publication labels and original revision
history should not be conflated. The ISO overview identifies edition 2, published
April 2026. No claim depends on a search engine's crawl date.

## Responsibilities and evidence

| Responsibility | Instruction owner(s) | What useful coverage must enable |
| --- | --- | --- |
| Project planning and readiness | project-planning | Import or create a plan, assess consequential gaps, minimize repeated elicitation and establish safe next commitments |
| Product discovery and problem validation | product-discovery | Identify users/problems/alternatives, separate evidence from assumptions and choose proportionate validation |
| Product strategy and definition | product-definition | Establish positioning, outcomes, scope/non-goals and a coherent product-to-engineering handoff |
| Requirements discovery, analysis and validation | software-requirements | Identify sources and conflicts, distinguish needs from assumptions, agree observable behavior and constraints, maintain change impact and acceptance traceability |
| Architecture and detailed design | software-architecture; relevant implementation owner | Compare feasible alternatives, define ownership/contracts and failure behavior, justify consequential decisions and design implementable increments |
| Development environment and construction | software-construction | Reproduce setup, fit actual conventions, handle resource/configuration semantics and preserve public behavior without collateral changes |
| Hosting and platform establishment | platform-engineering | Select and establish a suitable runtime/environment, identity, networking, DNS/TLS, storage, configuration and operating ownership; verify the serving path and isolation |
| Services and external integration | backend-engineering; client-engineering | Implement contracts, authorization boundaries, failure/retry behavior, concurrency and interoperability across independently changing components |
| Persistent data and pipelines | data-engineering | Preserve stored invariants; design/query/migrate/backfill/recover; handle source evolution, freshness/completeness, replay, late data and safe publication |
| Client behavior and accessibility | client-engineering | Implement user journeys, adverse states, navigation, asynchronous ownership and platform-appropriate accessible interaction |
| Debugging and diagnosis | software-debugging; relevant domain owner | Establish a trustworthy signal, distinguish causes, choose useful experiments and verify the actual correction |
| Verification and validation | software-verification | Choose meaningful evidence from requirements and failure mechanisms, preserve required gates and distinguish conformance from fitness in the intended use context |
| Change review | software-review | Review the actual revision and contracts, validate suspected findings, distinguish defects from preferences and report coverage honestly |
| Security and privacy | software-security; domain/platform owners | Identify trust and data boundaries, implement controls, investigate reachable abuse, handle dependency risks and respond without expanding authority |
| Performance and capacity | software-performance; platform-engineering; software-operations | Measure representative workloads, locate bottlenecks, preserve correctness while optimizing, and connect workload expectations to hosting capacity |
| Lifecycle quality and assurance | software-verification; software-requirements | Connect consequential obligations, responsible owners, methods and acceptance evidence; manage explicit exceptions and identify required independent expertise |
| Configuration and change accounting | software-delivery; software-construction | Identify the compatible source/dependency/artifact/configuration/infrastructure/schema/data/model set, know what is deployed, and reconcile changes and drift deliberately |
| Build, packaging and delivery | software-delivery | Produce identifiable consumable artifacts, distinguish plan/publish/apply, execute authorized compatible rollouts and establish actual delivery/recovery outcomes |
| Operations and support | software-operations | Establish useful health signals, diagnose incidents, restore service/data safely, handle support and preserve operational ownership |
| Maintenance and evolution | software-evolution | Upgrade, refactor and manage technical debt against observed costs/risks while preserving consumers and compatibility |
| Deprecation and retirement | software-evolution; relevant data/platform owner | Transition consumers, retain/export/delete data appropriately, retire access/resources and verify no unintended operational residue |
| Engineering economics | software-architecture; platform-engineering; software-evolution | Compare implementation, migration, operating, maintenance and exit costs with uncertainty; assess technical tradeoffs rather than invent prices or precision |
| Engineering documentation and professional accountability | software-construction; requirements/delivery/operations owners | Keep authoritative contracts, examples, setup and operating guidance aligned with behavior; preserve evidence and responsible acceptance rather than replacing expert judgment |

These are cooperating responsibilities, not a compulsory sequence for every task.
Security, quality, configuration, documentation and operational constraints
influence the work throughout. Requirements may change; maintenance can begin
with an existing system; an incident need not restart greenfield discovery.

## What the initial candidate missed

The initial thirteen-skill candidate had substantive implementation, integration,
testing, release, incident, migration and retirement guidance. It was not yet
sufficient to call full-lifecycle coverage established:

- Architecture clarified requirements but did not supply a complete practical
  requirements-engineering procedure.
- Delivery's infrastructure reference safely reviewed/applied an existing
  infrastructure change; it did not establish a hosting environment from
  workload needs, DNS/TLS, identity and runtime constraints.
- Verification contained strong individual evidence methods but insufficient
  cross-lifecycle obligation/acceptance accounting.
- Artifact identity and configuration checks were useful but did not fully join
  configuration baselines, deployed status and drift reconciliation.
- Data-pipeline procedures, engineering cost comparisons and documentation
  maintenance needed more depth than references to those topics.

The revision adds distinct requirements and platform owners, and strengthens
the existing owners for the remaining gaps. New folders are justified by distinct
work and evidence, not by matching a taxonomy or inflating the catalogue.

## Boundaries that preserve completeness honestly

- PM Essentials handles cross-domain coordination. It does not substitute for
  technical requirements, engineering assurance or infrastructure work.
- Product discovery, strategy/positioning and definition/planning are now in scope.
  Visual art direction and marketing execution remain separate; engineering
  still owns technical feasibility, working interactions and accessibility.
- Web, native/mobile, desktop/CLI, libraries, pipelines, embedded and scientific
  or model-backed software have different platform and domain evidence needs.
  The lifecycle remains in scope; universal knowledge of every framework,
  hardware target or regulated specialty is not claimed.
- Domain-specific safety, legal, scientific or certification judgments require
  appropriate qualified evidence and authority. A skill must identify that need,
  not hide it under a generic pass.
- This review evaluates document substance. It is not an executed agent
  benchmark, a hosting deployment, a compliance certification or proof that
  future projects cannot reveal additional gaps.

## Planning-flow scope correction

The earlier fifteen-skill engineering candidate did not implement the newly
requested product-to-engineering planning flow. The new planning, discovery and
definition owners address that omission; existing requirements, architecture
and construction entrypoints now preserve planning readiness before dependent
implementation. This is a document-level correction, not measured evidence that
an agent will always activate the correct skills.
