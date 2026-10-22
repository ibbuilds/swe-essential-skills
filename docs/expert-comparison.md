# Expert and popular-workflow comparison

Source inspection: 22 October 2026. This pass compares actual instructions and
selected helper implementations against this suite, rather than ranking authors
or copying their workflows. Repository revisions are recorded in
[research heads](research-heads.json). Findings below are static observations and
reasoned adaptations, not executed upstream tests or measured efficiency gains.

## Changes justified by an actual gap

| Mechanism | Primary source inspected | Original adaptation and scope |
| --- | --- | --- |
| Detect a lowered acceptance bar despite green checks | [Addy Osmani constraint-driven development](https://github.com/addyosmani/agent-skills/blob/aeac41d4d005999432bb7312f7ff06383a91d59d/skills/constraint-driven-development/SKILL.md) and [floor guard](https://github.com/addyosmani/agent-skills/blob/aeac41d4d005999432bb7312f7ff06383a91d59d/skills/constraint-driven-development/references/floor-guard.md); [BMAD verification-gap review](https://github.com/bmad-code-org/BMAD-METHOD/blob/61e01f82644c4bb533750cfa0d6d61ab61d2cc9b/skills/bmad-code-review/review-prompts/verification-gap.md) | Review changed assertions, thresholds, gates and exceptions against the accepted baseline. Distinguish authorized changes and equivalent replacements from weakened guarantees. No regex-only checker, quota or new test suite. |
| Reconcile dependent task contracts before implementation | [Superpowers executing-plans preflight](https://github.com/obra/superpowers/blob/2ce8aa15d05bd57213e6f746f953aafb7ded7a8b/skills/executing-plans/SKILL.md) and [writing-plans](https://github.com/obra/superpowers/blob/2ce8aa15d05bd57213e6f746f953aafb7ded7a8b/skills/writing-plans/SKILL.md) | Compare prerequisite outputs with consumer expectations at actual dependency edges. Link a shared contract once; no matrix for a local edit. User-owned semantic decisions still require the owner's choice. |
| Attribute runtime evidence to the target actually exercised | [Ras Mic evidence-driven testing](https://github.com/michaelshimeles/skills/blob/69558ea1f5328da7b40ba171dfe2171f00ff4884/evidence-driven-testing/SKILL.md) | Match running build/configuration to the change instead of trusting a familiar URL, port or checkout. Reuse applicable identity evidence; no mandatory browser install, restart, video or upload. |
| Detect fixture-only prerequisites | [GSD Core verifier](https://github.com/open-gsd/gsd-core/blob/ba307f3d7c7ef02a9aa7f3986de9545eedff69b6/agents/gsd-verifier.md) | A fixture must not silently perform initialization the real entry path must supply. Legitimate caller/deployment prerequisites remain valid. One conditional example, not a new verdict taxonomy or orchestration system. |
| Preserve request identity across pooled database sessions | [Supabase pooling and RLS references](https://github.com/supabase/agent-skills/tree/c9be0e931b7930f7d02126d04774d904c381e7d7/skills/supabase-postgres-best-practices/references) | Inventory connection-scoped state, establish context/query lifetime and cleanup ownership, and verify leakage versus lost context when relevant semantics change. No universal pool/RLS adoption or blanket prepared-statement disabling. |
| Own long-running development/test processes | [Anthropic server helper](https://github.com/anthropics/skills/blob/dbd4588f9e1033efb41dad4bef2f7947c8993d44/skills/webapp-testing/scripts/with_server.py) | Retain owned process identity, drain output without unbounded retention, distinguish launch/readiness/completion, and clean up only owned processes. Inspecting the helper revealed why successful spawning and a listening port are insufficient. No copied runner. |
| Distinguish normal user-input proof from diagnostic bypasses | [OpenAI interactive Playwright skill](https://github.com/openai/skills/blob/49f948faa9258a0c61caceaf225e179651397431/skills/.curated/playwright-interactive/SKILL.md) | Direct handler calls or forced actions can support diagnosis, but do not prove ordinary input reaches a control. Conditional client example, not obligatory full-app browser QA. |

The pooling adaptation was checked against [PostgreSQL 18 settings](https://www.postgresql.org/docs/18/sql-set.html),
[PgBouncer features](https://www.pgbouncer.org/features.html) and [reset configuration](https://www.pgbouncer.org/config.html#server_reset_query),
[node-postgres transaction ownership](https://node-postgres.com/features/transactions),
and [SQLAlchemy reset ownership](https://docs.sqlalchemy.org/en/20/core/pooling.html#reset-on-return).
These distinguish logical clients from physical sessions, rollback from complete
state cleanup, and transaction-local settings from session-affinity guarantees.

Process and input-path reasoning was checked against [Python subprocess behavior](https://docs.python.org/3.13/library/subprocess.html#subprocess.Popen.wait),
[Node child processes](https://nodejs.org/api/child_process.html), and [Playwright actionability](https://playwright.dev/docs/actionability).
Concrete APIs remain runtime-specific. These references do not authorize running
upstream helpers, probing production or changing host permissions.

## Useful mechanisms already present

- **Matt Pocock:** focused clarification, existing-context synthesis, dependency-aware
  planning and causal debugging already have owners. Comparing
  [grill-with-docs](https://github.com/mattpocock/skills/blob/5beb35b040e3de97e54fa9e386d7e42d15c295c2/skills/engineering/grill-with-docs/SKILL.md)
  with [to-spec](https://github.com/mattpocock/skills/blob/5beb35b040e3de97e54fa9e386d7e42d15c295c2/skills/engineering/to-spec/SKILL.md)
  reinforces loading extra methods for a real unresolved decision, not mechanically
  chaining skills through phase names. Static word counts alone do not prove waste.
- **Vercel, Trail of Bits and HashiCorp:** authentication before effects, cache
  identity, configuration precedence, infrastructure authority and recovery already
  have concrete procedures. Their specialist material does not justify adding
  mandatory full-system audits or provider defaults to every task.
- **OpenAI coding/security skills:** targeted CI logs, runtime evidence, threat
  preconditions and installed-consumer checks substantially overlap existing
  debugging, verification, security and delivery. A provider-specific helper
  returning success does not establish that all required checks finished.
- **HumanLayer and wshobson:** context continuity, research-to-plan transitions and
  review/debugging structure are already represented. Additional trackers,
  mandatory handoff ceremonies or numerical self-confidence scores add no proven
  benefit here.

## Important differences deliberately retained

Do not import a source merely because it is popular or maintained by an expert:

- No minimum finding count derived from diff size. A supported empty review is
  preferable to manufactured defects; unreadable input is an explicit limitation.
- No universal per-task subagents or fresh reviewer, mandatory cross-model review,
  test-first sequence, fixed change size, or coverage target. Current Superpowers
  offers inline as well as per-task-agent execution; it should not be described
  as requiring the latter universally.
- No autonomous resolution of consequential user-owned choices. Recommendations
  and reversible exploration do not establish acceptance.
- No claim every data migration has a safe down path or that all additive schema
  changes are harmless. Preserve roll-forward, mixed-version and irreversible
  boundary reasoning.
- No forced browser permission escalation, sandbox disabling or automatic public
  uploads. A read-only evaluation question is not an enforced read-only tool set.
- No assumption a copied helper enforces all the prose surrounding it. Inspect
  actual effects, error handling and outputs; none was executed during this review.

## Local integration correction

A standalone-entry review also found that hosting assumptions and data retention/
deletion semantics could bypass the user-owned decision boundary made explicit in
planning. Those entrypoints now distinguish analysis/routine execution from a
consequential unresolved policy or hosting choice. This is a consistency correction
against the user's requested behavior, not a claim learned from an external skill.

## Source identity, maintenance and reuse

The original `gsd-build/get-shit-done` repository is archived at the inspected
snapshot and points to active `open-gsd/gsd-core`; the comparison uses that successor.
`humanlayer/humanlayer` describes its code as deprecated, while its separate
advanced-context-engineering material is active. Do not confuse a recent search
crawl with current maintenance.

GSD Core, BMAD and wshobson inspected licenses are MIT. HumanLayer's old repository
has an Apache-2.0 root license; a license was not established for the separate
advanced-context material, so no text is reused. Inspected OpenAI coding/security
and Anthropic webapp-testing/MCP skills have individual Apache-2.0 license files;
that is not a claim about every file in either repository. Vercel's MIT notice is
explicit in the inspected README and React skill frontmatter despite no root
LICENSE-named file. Existing mixed-license cautions for Ras Mic, Trail of Bits
and HashiCorp remain applicable.

No third-party skill prose or helper implementation is vendored. Popularity and
installation counts were discovery signals only, not proof of correctness or
comparative effectiveness. Changes still need scoped review and ordinary
mechanical checks; real-agent activation and net savings remain unmeasured.

## Recent community leads checked

Indexed searches across Codex, Claude Code/Claude, Anthropic and skill-community
discussions, plus skills.sh, supplied additional leads. This was not an exhaustive
subreddit crawl. Primary source inspection, not votes or testimonials, determined
whether a mechanism was useful and missing here. Snapshots are recorded in
[research heads](research-heads.json).

| Primary source | Decision after inspecting the implementation |
| --- | --- |
| [Cloudflare security-audit-skill](https://github.com/cloudflare/security-audit-skill/blob/c1c8a8c1471069fb0e188eeaff69b8e8db6564a8/skills/security-audit/SKILL.md) | Source-grounded findings, unresolved facts and explicit coverage reinforce existing security/review guidance. Do not import the full multi-agent audit machinery into routine changes. Record validators check structure/consistency, not whether an exploit claim is true. |
| [Ponytail](https://github.com/DietrichGebert/ponytail/tree/09c434ab73ca43761c5d8b0c5d341926c2fba710) | Reuse and coherent, restrained implementation already have an owner. Shortest-diff or one-line preferences are not better correctness or maintainability criteria. |
| [Reaproof](https://github.com/Junhan2/reaproof/tree/127196561989a3b9bc0759a05e2cfd10de315103) | Shipped-output inspection reinforces existing delivery/security guidance. Embedded source in a source map is not by itself contextual proof of a critical vulnerability; preserve impact and exposure reasoning. |
| [skillc exposure implementation](https://github.com/cooneycw/skillc/blob/a1ca249d62115d91e41e5adbd068ed7a2e812d1a/skillc/exposure.py) | Authored files, client-rendered exposure, activation and effectiveness are different claims. Unavailable rendering remains unmeasured. No compiler or exposure service is required by this suite. |
| [jpcaparas adversarial-test-sweep](https://github.com/jpcaparas/skills/blob/78a9c7da609549a3e63af20087aec559fad04d45/skills/testing/adversarial-test-sweep/SKILL.md) | One narrow improvement: retain concrete failing inputs/sequences and relevant replay metadata rather than a seed alone. Added to existing verification guidance, not a new skill or mandatory testing framework. A repository license was not established; no prose was copied. |

The replay correction is independently supported by
[Hypothesis's distinction between durable explicit examples and version-specific replay blobs/databases](https://hypothesis.readthedocs.io/en/latest/tutorial/replaying-failures.html)
and [fast-check's additional replay metadata for stateful commands](https://fast-check.dev/docs/advanced/model-based-testing/).
It prevents losing a known regression case without requiring another fuzzing
campaign or a new tool. Its effect on agent effort is not measured here.

[Impeccable](https://github.com/pbakaus/impeccable/tree/8644175285360c166e57b1e35ecadfbc85ff5209)
and [Graphify](https://github.com/Graphify-Labs/graphify/tree/847a93f3cab5e2c82ea9170014b21cd2c52a4417)
were also inspected as leads; this review did not establish an uncovered essential
SWE mechanism warranting their installation or another skill. Their popularity
does not itself justify adding art-direction or repository-indexing workflows.

## Source shortlist

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

See [empirical evidence and its limits](empirical-evidence.md) for measured external studies and why they support selective guidance rather than more instructions or arbitrary shortening.

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
