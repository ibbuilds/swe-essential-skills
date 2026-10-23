# SWE Essential Skills

18 independent skills for software work in Codex and Claude Code, from product
planning through development, security, delivery and maintenance. The goal is
less avoidable work and user supervision without reducing engineering quality.

## Install as normal skills

Use your usual skill manager with this repository. For example, with the Skills CLI:

```sh
npx skills add ibbuilds/swe-essential-skills
```

Or copy selected complete folders from `skills/` into your host's normal skills
directory. See [installation](docs/installation.md) for paths and updates.
No custom installer, Python setup, hooks, global instructions, API key, service
or PM Essential Skills installation is required. Keep each skill's references
and license with it.

## Use them normally

Ask for work as usual. Codex can automatically select relevant installed skills
from their descriptions; automatic selection is enabled by default. You do not
need to name a skill on every request. Selection is conditional, not a request
to load all 18 skills or execute every lifecycle phase.

- Starting a project or resolving a plan: use existing decisions and clarify
  material gaps before dependent implementation.
- Already building: continue the agreed work, including substantial features.
  Installation does not restart discovery or require a new planning document.
- A consequential change is unclear: explain its concrete effect and ask only
  the unresolved choice. An accepted plan already supplies its decisions.
- A suitable built-in feature or existing check does the job: reuse it rather
  than creating another pass or tool.

Explicit invocation is available when useful, not required setup: select a skill
with Codex's `$` picker or Claude Code's `/skill-name` syntax. See the
[native-first action guide](docs/reusable-actions.md) and
[project walkthrough](docs/project-walkthrough.md) for examples.

## Skill identity

Every installable name uses `repo-name-skill-name`: for example,
`swe-essential-skills-software-review`. Folder names, `name` frontmatter and
optional Codex UI display names all use that exact identity. Hosts that ignore
UI metadata still have the same canonical skill name.
See [migration guidance](docs/installation.md#migrate-from-previous-names) for
existing installations; old installed names do not rename themselves.

## Skill catalogue

Each folder works independently. PM Essential Skills is a complementary general
workflow suite, not a dependency.

| Skill | Engineering work it helps perform |
| --- | --- |
| [Project planning](skills/swe-essential-skills-project-planning/SKILL.md) | Import or create a usable plan, assess material gaps and guide readiness through the lifecycle |
| [Product discovery](skills/swe-essential-skills-product-discovery/SKILL.md) | Understand users/problems, alternatives and evidence before committing to a solution |
| [Product definition](skills/swe-essential-skills-product-definition/SKILL.md) | Establish strategy, positioning, scope, outcomes and an actionable product brief |
| [Software requirements](skills/swe-essential-skills-software-requirements/SKILL.md) | Requirements discovery, validation, conflicts, baselines and change traceability |
| [Software architecture](skills/swe-essential-skills-software-architecture/SKILL.md) | Technical requirements, quality attributes, boundaries, alternatives and failure models |
| [Software construction](skills/swe-essential-skills-software-construction/SKILL.md) | Repository foundations, reproducible setup, coherent implementation and consumer contracts |
| [Backend engineering](skills/swe-essential-skills-backend-engineering/SKILL.md) | APIs, service behavior, concurrency, transactions and side-effect semantics |
| [Data engineering](skills/swe-essential-skills-data-engineering/SKILL.md) | Data integrity, schema/query work, migrations, backfills and recovery |
| [Client engineering](skills/swe-essential-skills-client-engineering/SKILL.md) | Working interactions, state, async behavior, accessibility and client lifecycle |
| [Software debugging](skills/swe-essential-skills-software-debugging/SKILL.md) | Reproduction, causal investigation, distinguishing experiments and verified fixes |
| [Software verification](skills/swe-essential-skills-software-verification/SKILL.md) | Behavior/invariant-based checks, test strategy, regression evidence and limitations |
| [Software review](skills/swe-essential-skills-software-review/SKILL.md) | Context-aware code/change review, validated findings and impact assessment |
| [Software performance](skills/swe-essential-skills-software-performance/SKILL.md) | Representative measurements, profiling, bottlenecks and safe optimization |
| [Software security](skills/swe-essential-skills-software-security/SKILL.md) | Trust boundaries, secure implementation, security review and vulnerability response |
| [Platform engineering](skills/swe-essential-skills-platform-engineering/SKILL.md) | Hosting selection, environment establishment, network/DNS/TLS, identity and runtime foundations |
| [Software delivery](skills/swe-essential-skills-software-delivery/SKILL.md) | Build/package/CI, infrastructure changes, compatible rollout and recovery |
| [Software operations](skills/swe-essential-skills-software-operations/SKILL.md) | Runtime diagnosis, observability, incidents, capacity and restoration |
| [Software evolution](skills/swe-essential-skills-software-evolution/SKILL.md) | Refactoring, upgrades, compatibility, deprecation and retirement |


## Documentation

- [Installation and automatic discovery](docs/installation.md)
- [Coverage and composition](docs/coverage-and-composition.md)
- [Lifecycle coverage](docs/lifecycle-coverage.md)
- [Workflow value and limits](docs/workflow-value.md)
- [First-version readiness and review scenarios](docs/v1-readiness.md)
- [Expert comparisons and sources](docs/expert-comparison.md)
- [Empirical evidence and its limits](docs/empirical-evidence.md)

## Status and limits

This is a first-version trial candidate. Installation and structural checks do
not prove that a particular host selected, loaded or followed a skill, or that
it saved tokens. Live behavior and net savings remain unmeasured. Skills do not
bypass permissions or usage limits, and specialized systems can still require
appropriate tools, current documentation and expert assurance.

## For maintainers

[AGENTS.md](AGENTS.md) describes maintaining this repository. Do not copy it into
consumer projects. Development dependencies and validation commands are for
maintainers, not normal skill installation. Follow its scoped checks when editing
skills or helpers; [review scenarios](docs/review-scenarios.md) are specifications,
not executed model benchmarks.

## License

Original project content is available under the [MIT License](LICENSE). Each skill
folder includes its own copy so individually distributed skills retain the notice.
Linked third-party projects retain their own licenses; this license does not
relicense their content.
