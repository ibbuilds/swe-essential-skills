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
| Project planning and readiness | swe-essential-skills-project-planning | Import or create a plan, assess consequential gaps, minimize repeated elicitation and establish safe next commitments |
| Product discovery and problem validation | swe-essential-skills-product-discovery | Identify users/problems/alternatives, separate evidence from assumptions and choose proportionate validation |
| Product strategy and definition | swe-essential-skills-product-definition | Establish positioning, outcomes, scope/non-goals and a coherent product-to-engineering handoff |
| Requirements discovery, analysis and validation | swe-essential-skills-software-requirements | Identify sources and conflicts, distinguish needs from assumptions, agree observable behavior and constraints, maintain change impact and acceptance traceability |
| Architecture and detailed design | swe-essential-skills-software-architecture; relevant implementation owner | Compare feasible alternatives, define ownership/contracts and failure behavior, justify consequential decisions and design implementable increments |
| Development environment and construction | swe-essential-skills-software-construction | Reproduce setup, fit actual conventions, handle resource/configuration semantics and preserve public behavior without collateral changes |
| Hosting and platform establishment | swe-essential-skills-platform-engineering | Select and establish a suitable runtime/environment, identity, networking, DNS/TLS, storage, configuration and operating ownership; verify the serving path and isolation |
| Services and external integration | swe-essential-skills-backend-engineering; swe-essential-skills-client-engineering | Implement contracts, authorization boundaries, failure/retry behavior, concurrency and interoperability across independently changing components |
| Persistent data and pipelines | swe-essential-skills-data-engineering | Preserve stored invariants; design/query/migrate/backfill/recover; handle source evolution, freshness/completeness, replay, late data and safe publication |
| Client behavior and accessibility | swe-essential-skills-client-engineering | Implement user journeys, adverse states, navigation, asynchronous ownership and platform-appropriate accessible interaction |
| Debugging and diagnosis | swe-essential-skills-software-debugging; relevant domain owner | Establish a trustworthy signal, distinguish causes, choose useful experiments and verify the actual correction |
| Verification and validation | swe-essential-skills-software-verification | Choose meaningful evidence from requirements and failure mechanisms, preserve required gates and distinguish conformance from fitness in the intended use context |
| Change review | swe-essential-skills-software-review | Review the actual revision and contracts, validate suspected findings, distinguish defects from preferences and report coverage honestly |
| Security and privacy | swe-essential-skills-software-security; domain/platform owners | Identify trust and data boundaries, implement controls, investigate reachable abuse, handle dependency risks and respond without expanding authority |
| Performance and capacity | swe-essential-skills-software-performance; swe-essential-skills-platform-engineering; swe-essential-skills-software-operations | Measure representative workloads, locate bottlenecks, preserve correctness while optimizing, and connect workload expectations to hosting capacity |
| Lifecycle quality and assurance | swe-essential-skills-software-verification; swe-essential-skills-software-requirements | Connect consequential obligations, responsible owners, methods and acceptance evidence; manage explicit exceptions and identify required independent expertise |
| Configuration and change accounting | swe-essential-skills-software-delivery; swe-essential-skills-software-construction | Identify the compatible source/dependency/artifact/configuration/infrastructure/schema/data/model set, know what is deployed, and reconcile changes and drift deliberately |
| Build, packaging and delivery | swe-essential-skills-software-delivery | Produce identifiable consumable artifacts, distinguish plan/publish/apply, execute authorized compatible rollouts and establish actual delivery/recovery outcomes |
| Operations and support | swe-essential-skills-software-operations | Establish useful health signals, diagnose incidents, restore service/data safely, handle support and preserve operational ownership |
| Maintenance and evolution | swe-essential-skills-software-evolution | Upgrade, refactor and manage technical debt against observed costs/risks while preserving consumers and compatibility |
| Deprecation and retirement | swe-essential-skills-software-evolution; relevant data/platform owner | Transition consumers, retain/export/delete data appropriately, retire access/resources and verify no unintended operational residue |
| Engineering economics | swe-essential-skills-software-architecture; swe-essential-skills-platform-engineering; swe-essential-skills-software-evolution | Compare implementation, migration, operating, maintenance and exit costs with uncertainty; assess technical tradeoffs rather than invent prices or precision |
| Engineering documentation and professional accountability | swe-essential-skills-software-construction; requirements/delivery/operations owners | Keep authoritative contracts, examples, setup and operating guidance aligned with behavior; preserve evidence and responsible acceptance rather than replacing expert judgment |

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

## Execution-path audit beyond the catalogue

A subsequent full-entrypoint/reference review identified a concrete recovery
handoff gap: requirements already mentioned resurrection of expired data, but
standalone restoration paths did not reconcile post-snapshot deletion and access
revocation decisions before exposure. Data recovery and operations now carry that
procedure locally, preserving current authoritative restrictions and identifying
unresolved owner decisions rather than treating historical records as consent.
This closes an implementation-path gap, not a new lifecycle category. No restore
or model evaluation was performed to establish these proposed cases.

Model-mediated software already had ordinary authorization and safe-sink controls;
the missing step was connecting them through model/tool dispatch. The conditional
security reference now covers trusted caller context, actual effect authorization,
approval scope, untrusted retrieved/tool-return content and effect-level evidence.
The procedure was checked against current primary guidance:
[OWASP prompt-injection prevention](https://cheatsheetseries.owasp.org/cheatsheets/LLM_Prompt_Injection_Prevention_Cheat_Sheet.html),
[OWASP MCP security](https://cheatsheetseries.owasp.org/cheatsheets/MCP_Security_Cheat_Sheet.html),
[OWASP agent authorization](https://cheatsheetseries.owasp.org/cheatsheets/AI_Agent_Security_Cheat_Sheet.html#tool-authorization-middleware)
and the [MCP tools specification, 2026-07-28](https://modelcontextprotocol.io/specification/2026-07-28/server/tools#security-considerations).
It neither prescribes a new architecture nor claims that instructions enforce
permissions or prove model resistance.
