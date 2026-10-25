# SWE activation audit and routing checks

Reviewed 25 October 2026 against published base
`dba82fe68ccd94221d116ad0a2d27bee6adca159`. The companion PM base was
`596bf5e30432fec217ed2e06a79e4f0e5171b8bc`.

## Result and corrections

All eighteen complete installed SWE folders matched the published source after
normalizing line endings. They were present in the auditing desktop session's
supplied skill catalog. Their `agents/openai.yaml` files omitted invocation
policy, so implicit invocation used the documented enabled default. No disabling
skill rule was found in the inspected base or alternate user configuration files.
This is evidence for those files and this session, not every project or host.

Several SWE discovery descriptions exceeded 300 characters and were visibly
shortened in the supplied catalog. Missing tails included useful exclusions in
planning, requirements and verification. All eighteen descriptions now state
their actual job and useful boundary in 166–202 characters, versus 226–396
before. The complete workflow bodies and references remain intact. This removes
the observed long-description risk for this catalog shape; it does not prove why
a particular historical request failed to select a skill or guarantee a future
catalog budget.

The validator previously accepted malformed `policy` values and a quoted
`allow_implicit_invocation: "false"`. It now rejects nonmapping policies and
nonboolean invocation values, while accepting omission, an empty policy, and
explicit `true` or `false`. Explicit-only choices remain valid. The regression
checks exercise acceptance and rejection through the public `validate` function;
they do not rewrite a user's configuration or prove host invocation.

## Scope and technical review

The eighteen entrypoints cover distinct lifecycle responsibilities and keep
local reference dependencies inside each independent folder. Their core useful
mechanisms include consumer-contract preservation, meaningful failure signals,
runtime/artifact identity, mixed-version data compatibility, request ownership,
authorization before effects, ambiguous-outcome reconciliation and final-state
verification. These were compared with the primary sources below and the
existing [expert comparison](expert-comparison.md).

Planning, requirements, construction, review and verification carry substantial
instruction bodies. Size alone does not establish a defect or justify deleting
their safeguards. Their existing no-op and evidence-reuse paths are essential:
routine implementation must not restart discovery, and activating a second skill
must not cause duplicate tests. The prior paired results support selective
loading; they do not justify claiming that more skill reads are inherently better.

No new lifecycle phase, mandatory reviewer, model, service, hook, tracker or
package dependency is added. PM remains optional. Specialist platform decisions
still require the actual framework/provider version's official documentation;
this suite is procedural guidance, not an automatically maintained technical
knowledge database.

## Routing examples for all eighteen skills

These are prompt-review cases, not executed routing benchmarks. The negative
column means that the named workflow is unnecessary for that request, not that
other useful skills must be forbidden.

| Skill suffix | Positive or contextual request | Adjacent negative control |
| --- | --- | --- |
| project-planning | Turn this partial product plan into an agreed first buildable slice | Implement a feature whose accepted plan already settles the choices |
| product-discovery | Determine whether this reported user problem merits investment | Build the user's explicitly chosen utility from an adequate brief |
| product-definition | Choose the audience, differentiated value and first product scope | Estimate the schedule of already agreed tasks |
| software-requirements | Resolve whether deleting an account must remove its exports | Change an unambiguous label |
| software-architecture | Choose transaction and ownership boundaries for a consequential integration | Rename one private variable |
| software-construction | Implement the accepted CLI option in the existing package | Review a PR without making edits |
| backend-engineering | Make duplicate webhooks preserve one durable effect | Change only a client-side label |
| data-engineering | Backfill stored records while old and new writers coexist | Write a stateless response formatter |
| client-engineering | Prevent an older search result overwriting newer user input | Choose a visual art direction |
| software-debugging | Reproduce and explain an intermittent wrong result | Apply an already understood copy correction |
| software-verification | Choose evidence for retry safety and regression coverage | Run the repository's already established lint command |
| software-review | Review the specified PR revision for reachable defects | Implement the requested fix |
| software-performance | Profile a measured startup regression on a representative workload | Add speculative caching without a measured problem |
| software-security | Check an affected tenant authorization boundary and permitted path | Audit harmless punctuation merely because code is involved |
| platform-engineering | Establish hosting, identity and storage for an agreed workload | Execute an ordinary release on established hosting |
| software-delivery | Package the actual artifact and verify the installed consumer | Treat unit-test success as proof of publication |
| software-operations | Contain an incident and distinguish liveness from actual user health | Design an unprovisioned platform from scratch |
| software-evolution | Migrate supported consumers before retiring an old interface | Rewrite working code because another style looks newer |

For an explicit control, use the full identity, such as
`$swe-essential-skills-software-debugging`, with the same real task. Then inspect
loading and the actual artifact, not only the agent's declaration. The
[OpenAI evaluation method](https://developers.openai.com/blog/eval-skills) separates
explicit, implicit, contextual and negative cases and scores traces plus outcomes.
The table is a bounded starting set for that method; its presence is not a pass.

## Native activation checks

- Confirm complete files at the intended revision and the name in the actual
  host catalog. Check the documented local, repository or remote environment.
- Inspect relevant `skills.config` name/path rules and
  `skills.include_instructions`, plus `policy.allow_implicit_invocation`.
  Preserve intentional disabled or explicit-only choices.
- Check the description actually supplied to the model. The catalog has its own
  context budget, separate from the portable 1,024-character description limit.
- Inspect a real `SKILL.md` read and the resulting behavior separately. If a file
  update is not reflected, reload the host; do not duplicate the skill folder.
- Diagnose the earliest failed layer. No legacy installer receipt is required
  for ordinary copied skills, and enabling hooks or multi-agent execution is not
  required to consume these instruction-only workflows.

These checks are conditional troubleshooting, not added per-task overhead.
See [installation](installation.md) for current paths and migration precautions.

## Primary source refresh

The source repositories freshly downloaded during this audit still matched the
existing research pins:

| Source | Revision and concrete comparison | Decision |
| --- | --- | --- |
| [Matt Pocock](https://github.com/mattpocock/skills/tree/5beb35b040e3de97e54fa9e386d7e42d15c295c2) | Causal debugging, a symptom-sensitive feedback loop and synthesis of existing decisions | Keep those mechanisms; do not import a fixed hypothesis count or issue-publication action into every task |
| [Ras Mic](https://github.com/michaelshimeles/skills/tree/69558ea1f5328da7b40ba171dfe2171f00ff4884) | Testing the intended runtime and distinguishing real behavior from synthetic evidence | Keep runtime identity and real-boundary checks; no mandatory recorder, FFmpeg, upload or paid reviewer |
| [Addy Osmani](https://github.com/addyosmani/agent-skills/tree/aeac41d4d005999432bb7312f7ff06383a91d59d) | Task-specific routing, unchanged acceptance and constrained implementation | Keep accepted requirements and narrow ownership; no new global meta-skill or universal process |

No third-party prose or implementation was copied. Author expertise identifies
relevant methods; popularity does not establish comparative effectiveness.

[OpenAI's skill guide](https://learn.chatgpt.com/docs/build-skills) establishes
metadata-first routing, catalog shortening and the default implicit policy.
[OpenAI's authoring update](https://developers.openai.com/blog/rethinking-skills-and-prompts-for-gpt-6-astra)
supports concise triggers and conditional depth.
[Anthropic's authoring guidance](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)
supports progressive disclosure and behavior-based iteration.
[Agent Skills](https://agentskills.io/specification) supplies the portable
metadata constraints. These are complementary sources, not permission to copy
Claude-specific flags into Codex policy files.

The [existing functional observations](core-workflow-checks-2026-10-24.md)
remain useful bounded evidence. Neither they nor this audit establish a general
quality, supervision, billing or token advantage over an unguided baseline.
