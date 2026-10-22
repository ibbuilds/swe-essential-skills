# SWE Essential Skills

A suite of practical guidance from product discovery and planning through the full software engineering lifecycle. **First-version trial candidate:** structural checks are not proof of host activation, engineering correctness, or measured token savings.

## Start here

See [first-version readiness](docs/v1-readiness.md) for the full requirement-to-procedure
map, review results, expected work-saving mechanisms and the later user trial.
Research findings are not measured savings or proof of flawless behavior.

1. [Install selected skills or the suite](docs/installation.md) in your Codex or
   Claude Code environment. Copy complete folders; consumer use needs no Python
   setup, API key or custom service.
2. Select `project-planning` when developing or reconciling a plan. If existing
   context already settles the current work, use the relevant engineering skill
   directly, including for substantial ongoing features or refactors. Installing
   the suite does not restart the project or require a new planning document.
3. [Follow one project through the workflow](docs/project-walkthrough.md): reuse
   existing answers, help the user choose, build an authorized coherent slice,
   verify it and preserve delivery/operation boundaries.

Installation makes skills available; it does not guarantee automatic activation,
run all phases, or bypass host permissions and usage limits.

## Purpose: improve the work, not collect concepts

The primary goal is to reduce avoidable agent effort, rework and user supervision
while preserving engineering quality. Each utility should change a concrete
working method: resolve a material uncertainty, prevent a costly failure, reuse
applicable evidence, or verify the right claim. Topic coverage alone is not proof
of usefulness, and extra instructions themselves have a cost.

See [workflow value](docs/workflow-value.md) for request-level interventions,
activation/skip conditions and evidence limits. These are reasoned mechanisms,
not measured token-savings claims. Ordinary Codex performance has not been
benchmarked against this candidate.

## Scope

The scope starts with product discovery/problem validation, product strategy/positioning, and product definition/planning, then covers the whole software engineering lifecycle. The [independent lifecycle review](docs/lifecycle-coverage.md) is the coverage reference; the original numbered outline below is historical and non-exhaustive.

The engineering counterpart to [PM Essential Skills](https://github.com/ibbuilds/pm-essential-skills), not a replacement for it:

1. Product discovery and problem validation
2. Product strategy and positioning
3. Product definition and planning

13. Technical discovery and architecture
14. Repository and development foundations
15. Data and backend engineering
16. Frontend implementation
17. Testing and quality assurance
18. Security, privacy and dependency health
19. Build, release and deployment
20. Operations, maintenance and support

These were initial planning labels, not a complete taxonomy, scope limit, fixed number of skills or mandatory stages for every edit. Technical requirements, compatibility, migration and eventual retirement must remain represented. Visual art direction, marketing execution/SEO and general agent/project coordination belong to their respective skill sets. Product strategy and positioning decisions are in scope; a marketing campaign is not.

## Planning-first project flow

For a new project or consequential capability, start from the user's idea **or**
existing PDF, Markdown, link, issue, repository or authorized connected source.
Read the relevant source before interviewing the user. Identify what is settled,
what is unsupported and what could materially change the implementation.

1. Understand the problem, intended users and evidence; distinguish validation from assumptions.
2. Establish product direction, positioning, scope, outcomes and non-goals.
3. Resolve engineering requirements and consequential architecture/stack choices.
4. Build a usable plan with dependencies, acceptance and relevant security, data,
   hosting, delivery, operation and recovery considerations before dependent implementation.
5. Implement and verify a coherent increment, then release/operate only within the
   applicable authority. Feed new evidence back into the plan rather than blindly following it.

This is dependency-aware planning, not a frozen waterfall: accepted plans are
reused, material gaps receive targeted questions, and later details can remain
explicitly deferred when they cannot invalidate the next commitment. A small
well-defined correction need not become a project. Skill files guide behavior
when loaded; they do not automatically intercept every new chat or enforce gates.

## Skill catalogue

Use the skill relevant to the task, not the entire suite on every request. Each folder
contains its own required references and can be used independently of PM Essentials.

| Skill | Engineering work it helps perform |
| --- | --- |
| [Project planning](skills/project-planning/SKILL.md) | Import or create a usable plan, assess material gaps and guide readiness through the lifecycle |
| [Product discovery](skills/product-discovery/SKILL.md) | Understand users/problems, alternatives and evidence before committing to a solution |
| [Product definition](skills/product-definition/SKILL.md) | Establish strategy, positioning, scope, outcomes and an actionable product brief |
| [Software requirements](skills/software-requirements/SKILL.md) | Requirements discovery, validation, conflicts, baselines and change traceability |
| [Software architecture](skills/software-architecture/SKILL.md) | Technical requirements, quality attributes, boundaries, alternatives and failure models |
| [Software construction](skills/software-construction/SKILL.md) | Repository foundations, reproducible setup, coherent implementation and consumer contracts |
| [Backend engineering](skills/backend-engineering/SKILL.md) | APIs, service behavior, concurrency, transactions and side-effect semantics |
| [Data engineering](skills/data-engineering/SKILL.md) | Data integrity, schema/query work, migrations, backfills and recovery |
| [Client engineering](skills/client-engineering/SKILL.md) | Working interactions, state, async behavior, accessibility and client lifecycle |
| [Software debugging](skills/software-debugging/SKILL.md) | Reproduction, causal investigation, distinguishing experiments and verified fixes |
| [Software verification](skills/software-verification/SKILL.md) | Behavior/invariant-based checks, test strategy, regression evidence and limitations |
| [Software review](skills/software-review/SKILL.md) | Context-aware code/change review, validated findings and impact assessment |
| [Software performance](skills/software-performance/SKILL.md) | Representative measurements, profiling, bottlenecks and safe optimization |
| [Software security](skills/software-security/SKILL.md) | Trust boundaries, secure implementation, security review and vulnerability response |
| [Platform engineering](skills/platform-engineering/SKILL.md) | Hosting selection, environment establishment, network/DNS/TLS, identity and runtime foundations |
| [Software delivery](skills/software-delivery/SKILL.md) | Build/package/CI, infrastructure changes, compatible rollout and recovery |
| [Software operations](skills/software-operations/SKILL.md) | Runtime diagnosis, observability, incidents, capacity and restoration |
| [Software evolution](skills/software-evolution/SKILL.md) | Refactoring, upgrades, compatibility, deprecation and retirement |

The catalogue organizes responsibilities; it is not a cap on coverage or a mandatory
pipeline. Conditional references provide technical depth without loading unrelated
platform procedures. The suite does not pretend to replace specialist assurance
for every regulated, hardware-dependent or otherwise specialized system.

### Use and limits

Follow the [installation guide](docs/installation.md) for selected or full-suite
local copies, discovery and explicit invocation. Preserve each folder's references
and license. Keep the repository's
root `AGENTS.md` here: it describes maintaining this repository, not instructions
to inject into every user project. No hooks, external services or model API keys
are required by these skill files. They do not grant permission to deploy or
change infrastructure.

See [coverage and composition](docs/coverage-and-composition.md) for ownership,
[review scenarios](docs/review-scenarios.md) for representative cases, and
[research heads](docs/research-heads.json) for recorded upstream revisions.

### Maintainer checks

Install the development validation dependency with
`python -m pip install -r requirements-dev.txt`, then run:

- `python scripts/validate_skills.py`
- `python -m unittest discover -s tests` when changing the validation helper

These check metadata and ordinary inline local file references, plus the helper's
own behavior. They do not evaluate agent decisions or every Markdown construct.
Real-use evaluation remains deferred; scenarios are not benchmark results.

See [planning research and adaptations](docs/planning-research.md) for the source-based mechanisms behind the planning-first extension.

## Expert-source shortlist

Source inspection: **22 October 2026**. Ranking below reflects fit for this project, not a controlled comparison of effectiveness. Directory installs, stars, author demonstrations and security badges are not proof of quality or token savings. Links to `main` are moving references; pin the exact revision before adapting content.

| Priority | Primary source and selected skills | What is worth investigating/adapting | What should not become a universal requirement |
| --- | --- | --- | --- |
| 1 | [Addy Osmani](https://github.com/addyosmani/agent-skills): [code-review-and-quality](https://github.com/addyosmani/agent-skills/blob/main/skills/code-review-and-quality/SKILL.md), [shipping-and-launch](https://github.com/addyosmani/agent-skills/blob/main/skills/shipping-and-launch/SKILL.md) | Broad lifecycle coverage; review across correctness, architecture, security and performance; rollout, recovery and monitoring evidence | Fixed change-size limits, commit-every-task, blanket TDD, web-specific checks for non-web software, arbitrary rollout thresholds |
| 2 | [Matt Pocock](https://github.com/mattpocock/skills): [diagnosing-bugs](https://github.com/mattpocock/skills/blob/main/skills/engineering/diagnosing-bugs/SKILL.md) and technical specification/task flows | Tight reproducible failure signals; tests, replay, CLI fixtures or browser checks selected for the actual problem; dependencies between implementation tasks | The author's entire personal workflow, automatic commits, or a mandatory specification ceremony for tiny changes |
| 3 | [Ras Mic / Michael Shimeles](https://github.com/michaelshimeles/skills): [new-feature](https://github.com/michaelshimeles/skills/blob/main/new-feature/SKILL.md), [code-structure](https://github.com/michaelshimeles/skills/blob/main/code-structure/SKILL.md), [evidence-driven-testing](https://github.com/michaelshimeles/skills/blob/main/evidence-driven-testing/SKILL.md), [greploop](https://github.com/michaelshimeles/skills/blob/main/greploop/SKILL.md) | Ownership and isolation; preserve existing architecture; proportionate evidence; bounded review loops tied to the current revision and justified handling of false positives | Mandatory worktrees, Greptile, public artifact uploads, disabling browser sandboxing, or treating a review score as proof of correctness. Worktrees do not isolate databases or ports |
| 4 | [Superpowers](https://github.com/obra/superpowers): [systematic-debugging](https://github.com/obra/superpowers/blob/main/skills/systematic-debugging/SKILL.md), [verification-before-completion](https://github.com/obra/superpowers/blob/main/skills/verification-before-completion/SKILL.md) | Reproduce and investigate causes; trace component boundaries; match completion claims to actual checks and results | Global must-invoke rules, mandatory delegation, every-task planning documents, or blanket test-first requirements |
| Specialist | [Vercel](https://github.com/vercel-labs/agent-skills): [react-best-practices](https://github.com/vercel-labs/agent-skills/blob/main/skills/react-best-practices/SKILL.md) | Impact-prioritized frontend performance rules with examples | Applying React/Next.js rules to unrelated stacks |
| Specialist | [Supabase](https://github.com/supabase/agent-skills): [supabase-postgres-best-practices](https://github.com/supabase/agent-skills/blob/main/skills/supabase-postgres-best-practices/SKILL.md) | Query plans, schema design, locking, pooling and access controls | Treating PostgreSQL-specific advice as universal database guidance |
| Specialist | [Trail of Bits](https://github.com/trailofbits/skills): [differential-review](https://github.com/trailofbits/skills/blob/main/plugins/differential-review/skills/differential-review/SKILL.md) | History-aware security review, affected callers, concrete attack scenarios and evidence-backed findings | A full security-audit ceremony for every harmless edit, or automatic severity inflation |
| Specialist | [HashiCorp](https://github.com/hashicorp/agent-skills): [terraform-test](https://github.com/hashicorp/agent-skills/blob/main/plugins/terraform/skills/terraform-test/SKILL.md) | Separate plan/mock verification from apply tests that actually create resources | Running infrastructure-mutating examples without authorization or assuming Terraform/Packer fits every project |

### Additional comparisons

- [GitHub Spec Kit](https://github.com/github/spec-kit), especially [cross-artifact analysis](https://github.com/github/spec-kit/blob/main/templates/commands/analyze.md): consistency among specifications, plans and tasks. Current entry points are independent; do not misrepresent the project as mandatory waterfall.
- [OpenSpec](https://github.com/Fission-AI/OpenSpec), especially its [spec-driven schema](https://github.com/Fission-AI/OpenSpec/blob/main/schemas/spec-driven/schema.yaml): explicit behavior deltas and change impact. A checked task list is not runtime evidence.
- [atlabsai/dev-skills](https://github.com/atlabsai/dev-skills): community lead for multi-perspective PR review and production risks. Implementation inspection is incomplete; not promoted to the primary shortlist on an unverified performance claim.

See the [deeper expert/workflow comparison](docs/expert-comparison.md) for actual-source findings, selective adaptations, rejected overhead and source-maintenance corrections.

See [empirical evidence and its limits](docs/empirical-evidence.md) for measured external studies and why they support selective guidance rather than more instructions or arbitrary shortening.

## Research conclusions so far

1. Keep the engineering responsibilities complete, but activate only the guidance relevant to a task. A one-line correction and a production data migration do not need the same workflow.
2. Preserve the existing project's architecture unless evidence justifies changing it. A reference author's preferred architecture is not a universal standard.
3. Treat evidence as task-specific: runtime behavior, data invariants, API compatibility, accessibility, build artifacts and deployment recovery prove different things.
4. Review loops need current-revision evidence, concrete actionable findings and a stopping condition. A maximum reviewer score alone is not an acceptance criterion.
5. Security, data integrity and operability influence design and implementation; they are not only final-stage reviews.
6. Each distributable skill must contain its required resources. Shared repository references must not silently break an individually installed skill.
7. Keep domain-specific knowledge separate from PM's general coordination, context and resource-management responsibilities. Do not import an external provider or imply permission to deploy merely by installing a skill.

## Evidence and reuse limits

The comparison is source-based research, not executed agent-performance testing. No third-party skills have been installed, no paid model calls or live benchmarks have been run, and no measured token savings are claimed.

Observed licensing is not uniform: Matt Pocock, Addy Osmani, Superpowers, Spec Kit, OpenSpec, Vercel and Supabase expose MIT licensing; Trail of Bits uses CC-BY-SA-4.0; HashiCorp uses MPL-2.0. A single repository-wide license was not established for Ras Mic's collection, which contains components with different notices, including PolyForm Shield. Verify each exact revision and resource before copying or adapting content. This repository currently records original research summaries and links, not vendored skill text.

## Implementation status

This candidate translates the researched mechanisms into original engineering procedures. Review focuses on practical technical depth, meaningful failure cases, and independently portable resources. Live host activation and real-task effectiveness remain unverified; neither a complete catalogue nor passing structure checks establishes universal completeness. No versioned release has been published.

## License

Original project content is available under the [MIT License](LICENSE). Each skill
folder includes its own copy so individually distributed skills retain the notice.
Linked third-party projects retain their own licenses; this license does not
relicense their content.
