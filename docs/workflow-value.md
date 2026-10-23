# Workflow value, not a topic collection

The product starts from ordinary agent-assisted engineering: a person asks for
work and the agent tries to complete it. The suite should improve that process
where a specific intervention prevents avoidable investigation, bad decisions,
rework or user supervision. Engineering coverage is a check against omissions,
not a reason to turn every concept into instructions.

Optimize the total effort to an accepted, adequately verified outcome. A shorter
prompt that causes an extra debugging cycle is not necessarily cheaper. A long
skill that repeats what the agent already does well is not necessarily useful.
Quality, authority and required checks are not bargaining chips for token savings.

## Evidence status

The potential baseline failures below are hypotheses, not observations from a
controlled vanilla-Codex comparison. The draft did contain overlapping commands
to rediscover repository context and verification obligations; static inspection
can establish that overlap. It cannot establish how often an agent would repeat
the actions or how many tokens an intervention saves in use.

## Utility map

| User's actual work | Potential avoidable failure or waste | Useful intervention | When to skip the extra process |
| --- | --- | --- | --- |
| Start from an idea or supplied plan | Interview the user about facts already in documents, or code from a polished but incomplete plan | swe-essential-skills-project-planning imports relevant evidence, sorts material gaps and unblocks dependent decisions; discovery/definition resolve missing product intent | Reuse adequate plans; bounded changes with clear intent do not restart product planning |
| Clarify a feature whose expected behavior is disputed | Guess a requirement, implement it, then redo the work after clarification | swe-essential-skills-software-requirements separates authoritative needs, observations and assumptions; resolves only material uncertainty and traces acceptance impact | Behavior and acceptance are already clear; consume them without a new specification |
| Choose a consequential technical approach | Adopt a familiar architecture that cannot meet the actual constraints | swe-essential-skills-software-architecture compares feasible options and a discriminating spike against the real decision | An established local design already supports the change; no new option exercise |
| Implement a bounded feature or correction | Repeatedly scan manifests and conventions, create parallel patterns, repeat the same check in several stages | swe-essential-skills-software-construction and the relevant domain owner reuse applicable task facts and evidence, inspect the changed boundary and implement coherently | Do not reload unrelated domains or rediscover facts just because another skill activates |
| Fix an unexplained failure | Stack speculative patches and repeated broad tests without reducing uncertainty | swe-essential-skills-software-debugging selects the cheapest safe observation separating plausible causes | Cause is directly demonstrated; validate the causal chain and proceed to fix/regression instead of inventing competing explanations |
| Fix a client race | Add debounce while an older response still overwrites newer state | swe-essential-skills-client-engineering identifies request/account/lifecycle ownership and checks the reversed-response case | No asynchronous ownership change or uncertainty is involved; do not investigate the whole client lifecycle |
| Change persistent data | A migration succeeds locally but breaks mixed versions or corrupts meaning | swe-essential-skills-data-engineering identifies invariants, physical effects, compatibility and meaningful reconciliation before consequential execution | A disposable local operation does not automatically need a production migration ceremony |
| Decide how to prove a change | Run many tests whose mocks/oracles cannot establish the claim, or redesign a valid existing check recipe | swe-essential-skills-software-verification selects evidence from the failure mechanism and reuses still-applicable results; assurance depth is conditional on the actual acceptance/obligation task | Ordinary execution of an adequate known recipe need not restart test-strategy or lifecycle-assurance design |
| Review a change | Report suspicious syntax without caller context, repeat prior discovery, chase a perfect score | swe-essential-skills-software-review reuses trustworthy revision-bound context but independently checks decisive assertions and filters unsupported findings | Do not turn every implementation step into another full independent review; honor required review gates |
| Improve performance | Add caches/concurrency speculatively, then debug new consistency problems | swe-essential-skills-software-performance checks representative baseline evidence, attributes the bottleneck and compares one justified intervention | Existing applicable measurements may suffice; no fresh profiling merely to repeat established evidence |
| Establish hosting | Start with a deploy command, discover incompatible runtime/state/network assumptions late | swe-essential-skills-platform-engineering matches workload to platform and verifies dependency-ordered establishment, DNS/TLS/identity/runtime and durable behavior | Existing suitable hosting is unchanged; do not restart provider selection for a routine release |
| Preserve completed engineering work | Either push every tiny edit or leave a long sequence of completed work only locally | swe-essential-skills-software-construction selects coherent authorized checkpoints, verifies staged scope and distinguishes commit/push/merge/deployment effects | No fixed commit quota; combine trivial adjacent edits, respect repo rules and keep unapproved remote actions blocked |
| Ship or recover a release | Confuse source tests with packaged behavior, or repeat a timed-out deployment that is still running | swe-essential-skills-software-delivery verifies the actual artifact/configuration and reconciles authoritative state before retry/recovery | Reuse valid earlier evidence where the relevant inputs and required gate policy permit it |
| Handle an incident, upgrade or retirement | Treat startup as recovery, upgrade everything at once, or leave dependent consumers/resources behind | swe-essential-skills-software-operations and swe-essential-skills-software-evolution target the actual failure/change and verify recovery or transition consequences | No new global process for an unrelated small correction; retain applicable operating obligations |

These are examples of utility boundaries, not a prescribed chain or proof that
every default agent exhibits these failures. Security and other domain safeguards
stay at the technical decision where they matter rather than being deferred to a
final quality checklist.

## Composition without repeated work

Already-established task context can carry the relevant command/setup source,
input/configuration/environment identity, observed result, what it proves, and
what would invalidate it. Use existing conversation/project records; do not
create a mandatory cache, evidence database or new management file.

Another skill becoming relevant is not itself a reason to repeat discovery or
checks. Relevant code, configuration, data, environment, scope or contradictory
evidence can invalidate previous facts. Required gates retain their own freshness
rules. Reuse does not mean trusting an unsupported summary, silently reclassifying
a failed check, or claiming stale evidence applies to a changed outcome.

## How additions earn their place

For a new instruction, reference, helper or skill, identify:

1. The concrete request and decision or recurring failure it addresses.
2. The mechanism that changes the agent's work, not merely the subject it names.
3. The trigger, bypass path and added instruction/tool/process cost.
4. The technical quality and authority invariants that must remain intact.
5. What evidence could show usefulness, redundancy or harm.

Keep distinct utilities independently usable. Split a skill when materially
different requests repeatedly pull in unrelated procedures; do not split or
combine solely to meet a folder count. Deterministic helpers should replace
demonstrated repetitive mechanics, not add an orchestration layer without need.

Real-use evaluation, when authorized and available, should compare complete
accepted tasks: corrections, retries, unnecessary reads/runs, user interventions,
time and available usage data alongside output quality. Until then, changes are
reasoned workflow improvements with explicit limits, not measured savings claims.

## Budget-conscious execution

Do not confuse test count with model usage. Shell work has execution costs;
returned logs, repeated context reconstruction and agent analysis have context
costs. A focused deterministic check can be cheaper and stronger than a long
speculative review. Prefer existing adequate checks, compact successful output,
relevant failure diagnostics and reusable evidence; never suppress failures or
skip required gates merely to appear economical.

The engineering suite does not require multi-agent orchestration. General
resource selection, delegation and retry discipline stay with PM Essentials when
present; SWE provides the concrete engineering evidence needed. Without PM,
ordinary single-agent execution remains valid. No new planner, reviewer or agent
is required just because the task entered another phase.

Scalability means meeting credible workload and growth constraints with explicit
tradeoffs, not prebuilding every possible future. Maintainability means coherent
ownership and clear contracts, not maximum layers. Reliability means meaningful
failure handling and evidence, not maximum test volume. Optimize the complete
accepted outcome, including planning, tool calls, retries and downstream rework;
none of these mechanisms establishes measured savings by itself.

Source basis for checkpointing: [Git contribution guidance](https://git-scm.com/book/en/v2/Distributed-Git-Contributing-to-a-Project)
on logically separate changesets, [GitHub review guidance](https://docs.github.com/en/pull-requests/concepts/helping-others-review-your-changes)
on focused reviewable work, and [push workflow events](https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows#push)
on remote-triggered effects. These support the mechanism, not a numerical claim
about agent efficiency or an automatic permission to push.

## Additional failure-pattern research

A targeted source review on 22 October 2026 checked failures beyond the initial
user examples, comparing them against existing SWE and PM mechanisms before
adding instructions:

- **Unfamiliar dependency identity:** [USENIX's June 2025 research summary](https://www.usenix.org/publications/loginonline/we-have-package-you-comprehensive-analysis-package-hallucinations-code)
  provides empirical evidence of package hallucination and registration risk.
  It does not establish a failure rate for current agents. Construction now
  checks identity against the official project and intended distribution source
  before an unfamiliar addition,
  not just during a later security advisory investigation.
- **Source content mistaken for authority:** Anthropic's [March 2026 auto-mode report](https://www.anthropic.com/research/claude-code-auto-mode)
  and [May 2026 containment discussion](https://www.anthropic.com/research/how-we-contain-claude)
  motivate an explicit repository/tool-content boundary in standalone construction.
  This is behavioral guidance, not a sandbox or security guarantee.
- **More orchestration is not automatically better:** the [March 2026 long-running-apps account](https://www.anthropic.com/engineering/harness-design-long-running-apps)
  describes removing process as capabilities changed and evaluator overhead on
  simpler work. Its examples differ in outcomes and are not a controlled savings
  benchmark for this suite. Do not import mandatory agents, sprints or evaluators.
- **Existing coverage retained:** setup/API guessing, premature completion,
  context drift, oversized logs, retry loops, uncertain mutations, speculative
  review findings and weakened checks already have relevant owners. No duplicate
  environment, memory, retry or review skill was added for those topics.

These source-supported mechanisms justify narrow conditional changes; they do
not demonstrate that future agents will follow them or prove net usage savings.

## Efficient construction, not only later optimization

The next targeted review found a gap between ordinary construction and the
already-substantive performance investigation skill: the suite should help avoid
structurally wasteful new code before a reported slowdown. Construction now checks
input-dependent work and representation; data/backend guidance examines collection
request shape and actual blocking execution. No mandatory benchmark was added.

Primary references inspected 22 October 2026:

- Python's [deque operation documentation](https://docs.python.org/3/library/collections.html#collections.deque)
  and [sort-key guidance](https://docs.python.org/3/howto/sorting.html#key-functions)
  illustrate operation-aware standard structures and avoiding repeated key work.
  Their concrete APIs are Python-specific, not universal implementation recipes.
- Microsoft's [efficient querying guidance](https://learn.microsoft.com/en-us/ef/core/performance/efficient-querying)
  supports inspecting projection, result size, per-item requests, join expansion
  and buffering. The suite adapts these tradeoffs to the actual datastore/ORM.
- Node's [event-loop guide](https://nodejs.org/en/learn/asynchronous-work/dont-block-the-event-loop)
  and [worker documentation](https://nodejs.org/api/worker_threads.html) distinguish
  input-dependent blocking work from asynchronous syntax and worker overhead.
  Those execution-model details apply conditionally, not to every runtime.
- [C++ Core Guidelines performance principles](https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#S-performance)
  reinforce simple maintainable code and evidence rather than assumed speed.

None of these sources proves universally optimal generated code or this suite's
runtime or token gains. Preserve required behavior, quantify gains only when
measured, and do not add caches, layers or parallelism merely to appear optimized.
