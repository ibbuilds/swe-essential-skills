# What measured research does and does not establish

Reviewed 23 October 2026 against the latest available primary versions. These are external experiments, not evaluations of SWE
Essential Skills. Repository context files, selectively discovered skill packages,
and large-marketplace retrieval are different interventions. Neither popularity
nor these results establishes this suite's task success or subscription savings.
Use the linked versions: some conclusions and headline numbers changed across
paper revisions.

## Relevant primary studies

### Repository-level instructions can induce costly extra work

[Evaluating AGENTS.md, v3, September 2026](https://arxiv.org/html/2602.11988v3)
compares absent, generated and developer-provided context in Python repository
tasks. Generated context did not significantly improve success and increased
inference cost by roughly 20–23%; developer context's average success gain was
also not statistically significant against absence. The analysis associates cost
with additional exploration, testing and reasoning, not a clear relationship with
file length. Security and other nonfunctional outcomes were outside its evaluation. A separate
documentation-removal ablation favored generated context: redundant guidance and
otherwise unavailable repository knowledge are different interventions.

**Consequence:** inspect what an instruction makes the agent do. Do not infer that
shorter text always wins, or delete needed safety and verification gates to match
an issue-resolution metric. Our root AGENTS.md is maintenance guidance and must
not be injected into consumer projects.

### Curated, task-relevant skills can help substantially

[SkillsBench, v4, June 2026](https://arxiv.org/html/2602.12670v4)
reports a mean task-macro verifier score (called “pass rate,” including partial
credit) increase from 33.9% to 50.5% across 87 tasks and 18 model–harness
configurations, with three trials per arm. Skill bundles are mounted
for native discovery/progressive disclosure, not all bodies force-injected. Tasks
are curated for skill sensitivity; the methods reject low-signal submissions
without measurable separation. This is not an unbiased estimate for arbitrary
software work. Length and skill-count comparisons use different task buckets,
not randomized same-task trimming.

Self-generated packs perform worse in a separate diagnostic condition, but some
were never discovered and authoring could displace task work; this does not isolate
the quality of all AI-authored instructions. Our source review is not equivalent
to this benchmark's tested curation. Token use and priced inference cost vary by
configuration; neither consistently decreases.

**Consequence:** preserve specific applicability and simpler valid paths. Do not
invent a maximum of three installed skills, a universal word limit or a promised
uplift. Installed inventory is not the same as simultaneously loaded guidance.

### Discovery, selection and useful application are separate

[How Well Do Agentic Skills Work in the Wild, v1, April 2026](https://arxiv.org/html/2604.04323v1)
compares curated loading, autonomous selection, distractors and retrieval from a
34,198-skill collection. Benefits degrade as selection and retrieval become harder;
results vary by model, and generic retrieved material can be unhelpful. Query-specific
refinement helps several settings but is not uniformly beneficial. It requires an
additional task-exploration pass, so reported quality gains do not establish net
efficiency.

**Consequence:** keep discriminative descriptions, exclusions and explicit invocation
instructions. Do not force-load everything or add a retrieval engine based on an
experiment with a much larger catalog. A skill appearing in a host list is evidence
of discovery, not proof it was selected or applied correctly.

### SWE-specific results caution against assuming savings

[SWE-Skills-Bench, preliminary v1, March 2026](https://arxiv.org/html/2603.15401v1)
reports a small mean pass-rate change with increased average token consumption
across 49 public skills. It uses one model, generated requirement-driven tasks,
a very high baseline and small per-skill samples. Its methods inconsistently
describe placement under `~/.claude` and at the project root, without per-trial
activation rates. This reporting gap is not proof activation failed.

**Consequence:** treat this as counterevidence to automatic benefit, not proof that
this suite's particular procedures should be removed. Its extreme individual
cost changes are not typical penalties or Codex quota estimates.

### Positive results also have important boundaries

[On the Impact of AGENTS.md Files, v2, March 2026](https://arxiv.org/html/2601.20404v2)
reports lower median runtime and output tokens for small PR-derived changes using
GPT-5.2-Codex. Median input tokens did not decrease; mean input declined without
the same reported statistical significance. Comprehensive functional correctness
was not evaluated. Its published “total” adds cached input separately to input
and output, although cached input is already included under
[Codex usage semantics](https://github.com/openai/codex/blob/83086188ae0614bd882818ff1aa23f3194962012/codex-rs/protocol/src/protocol.rs#L2552-L2554).
The [replication archive](https://zenodo.org/records/18348507) confirms that
accounting; independent input-plus-output arithmetic retains the higher-median
direction. Do not treat the published total as nonduplicated usage or an
allowance measurement.

[Ablating Repository Context, v1, July 2026](https://arxiv.org/html/2607.27250v1)
finds no measurable correctness difference in a small three-repository comparison
of absent, full and selective context, with broad uncertainty and content/delivery
confounds. It does not establish equivalence for all workflows.

[Repository guidance refinement, v2, June 2026](https://arxiv.org/html/2606.20512v2)
reports improvements from probe-refined guidance on one constrained model/scaffold;
the refined guidance was longer, and benefit did not transfer cleanly to another
model. Content and length were not isolated.

**Consequence:** useful information can earn its space, and shorter answers need
not reduce total work. These studies do not authorize model-based tuning here or
support a universal context strategy.

## Static action taken in this suite

Audit three distinct surfaces rather than trimming the catalog indiscriminately:

1. **Discovery metadata:** clear triggers and boundaries. Descriptions aid selection;
   their word count is not the cost of loading every skill body.
2. **Loaded guidance:** preserve required gates and user-owned decisions; identify
   unconditional testing, research or duplicate work that should depend on the
   affected contract, actual uncertainty and applicable evidence.
3. **Conditional references:** retain precise load conditions and standalone local
   resources. Deeper material should answer a live decision, not add ceremony.

The audit identified concrete tensions rather than a general size problem:
backend authorization checks read as unconditional despite scope exemptions;
construction requested a new regression even when existing coverage sufficed;
client verification read like a cumulative all-layer checklist; and a single-pass
security review had a remediation-oriented stopping condition. Narrow edits align
those procedures with affected behavior, applicable evidence and requested mode.
A diagnosis-only clarification also preserves the distinction between finding a
cause and authorization to repair it. Mandatory gates remain intact.

Static review can establish clearer instructions and remove a contradictory
obligation. It cannot establish that a model obeys them or that usage improves.
No blanket trimming quota, agent-count quota, mandatory measurement layer or
new benchmark harness follows from this research.

## Deferred real-use evidence

When separately authorized and resources are available, compare representative
accepted tasks with and without the relevant skill under matched conditions.
Record actual discovery/loading, final quality, missed requirements, rework,
questions, unnecessary reads/runs and available usage/time evidence. Keep required
security, compatibility and verification criteria intact. Separate input/output,
reasoning, execution time and provider-specific billing measures where observable;
do not convert them into subscription-quota savings without evidence.

A representative matched evaluation establishing those benefits remains outstanding.
The bounded observations below are distinct from the external research above;
neither is an installed runtime instruction or a promise of measured improvements.

## Suite functional observations: 23 October 2026

Explicitly activated SWE Software Verification at `77efd89` supported independent
review of an actual PM decoder-boundary repair. The participant rejected a synthetic
wrong-path/no-tests proposal, selected the repository-required checks and requested
no user rescue. The recorded full suite ran 310 tests (OK, three Windows-only
skips); 18 independently reviewed probes supported error handling and state safety.
The repair shipped in [PM PR #36](https://github.com/ibbuilds/pm-essential-skills/pull/36).
Repository instructions also supplied the correct commands: this demonstrates
bounded application, not SWE's causal contribution or superiority.

A separate PM Context Management demonstration completed two SWE migration
documents through a source-authored brief and fresh successor, with a safely
corrected schema error. Its recovery follow-on retrieved historical content and
produced a correct note, but did not establish a strict full pass: an immutable
historical citation and separate transport capture were missing, and an overbroad
read preceded the narrow retrieval. Transport was controller-assisted and host
identity assurances simulated. See the [PM evidence update](https://github.com/ibbuilds/pm-essential-skills/blob/main/docs/cloud-workflow-evaluation-2026-10-23.md#later-functional-observations-23-october-2026).

These are selected functional observations from local receipts and artifact
checks, not complete native-session telemetry, automatic discovery, representative
user-effort savings, provider billing measurements or suite-wide effectiveness.

## Core workflow observations: 24 October 2026

The [core workflow report](core-workflow-checks-2026-10-24.md) adds own-suite
observations without replacing the studies or earlier results above. Ordinary and
explicitly instructed participants both produced actionable multi-turn plans
(16/16) and implemented a scoped SQLite migration/security change (20/20; each
passed 12 contract checks and three additional reviewer probes). This demonstrates
bounded functional capabilities, not an incremental suite benefit. The optional
maintainer case packages the 12 contract checks, not those historical extra probes.

A separate planning candidate remains held: observable behavior passed, but fewer
read bytes coincided with more written-work bytes and unchanged operation counts.
The report also distinguishes shipped PM capture corrections from instruction
changes. Partial blinding, frozen source revisions, cloud-only infrastructure and
observer limits remain material; representative effectiveness, native activation,
human-effort reduction and billing savings remain unestablished.
