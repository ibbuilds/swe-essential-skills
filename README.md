# SWE Essential Skills

A software-engineering skill set being researched and designed for the full software lifecycle. This repository is **not yet an installable skill pack**.

## Scope

The engineering counterpart to [PM Essential Skills](https://github.com/ibbuilds/pm-essential-skills), not a replacement for it:

13. Technical discovery and architecture
14. Repository and development foundations
15. Data and backend engineering
16. Frontend implementation
17. Testing and quality assurance
18. Security, privacy and dependency health
19. Build, release and deployment
20. Operations, maintenance and support

These are coverage areas, not a fixed number of skills or mandatory stages for every edit. Technical requirements, compatibility, migration and eventual retirement must remain represented. Visual art direction, marketing and general agent/project coordination belong to their respective skill sets.

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

## Next milestone

Deepen the selected skill comparisons, map useful mechanisms to engineering coverage, and implement original, independently usable skills. Select folders by distinct responsibilities and triggers, not by a target skill count. Preserve proportional verification and document unsupported or untested behavior honestly.
