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
| Start from an idea or supplied plan | Interview the user about facts already in documents, or code from a polished but incomplete plan | project-planning imports relevant evidence, sorts material gaps and unblocks dependent decisions; discovery/definition resolve missing product intent | Reuse adequate plans; bounded changes with clear intent do not restart product planning |
| Clarify a feature whose expected behavior is disputed | Guess a requirement, implement it, then redo the work after clarification | software-requirements separates authoritative needs, observations and assumptions; resolves only material uncertainty and traces acceptance impact | Behavior and acceptance are already clear; consume them without a new specification |
| Choose a consequential technical approach | Adopt a familiar architecture that cannot meet the actual constraints | software-architecture compares feasible options and a discriminating spike against the real decision | An established local design already supports the change; no new option exercise |
| Implement a bounded feature or correction | Repeatedly scan manifests and conventions, create parallel patterns, repeat the same check in several stages | software-construction and the relevant domain owner reuse applicable task facts and evidence, inspect the changed boundary and implement coherently | Do not reload unrelated domains or rediscover facts just because another skill activates |
| Fix an unexplained failure | Stack speculative patches and repeated broad tests without reducing uncertainty | software-debugging selects the cheapest safe observation separating plausible causes | Cause is directly demonstrated; validate the causal chain and proceed to fix/regression instead of inventing competing explanations |
| Fix a client race | Add debounce while an older response still overwrites newer state | client-engineering identifies request/account/lifecycle ownership and checks the reversed-response case | No asynchronous ownership change or uncertainty is involved; do not investigate the whole client lifecycle |
| Change persistent data | A migration succeeds locally but breaks mixed versions or corrupts meaning | data-engineering identifies invariants, physical effects, compatibility and meaningful reconciliation before consequential execution | A disposable local operation does not automatically need a production migration ceremony |
| Decide how to prove a change | Run many tests whose mocks/oracles cannot establish the claim, or redesign a valid existing check recipe | software-verification selects evidence from the failure mechanism and reuses still-applicable results; assurance depth is conditional on the actual acceptance/obligation task | Ordinary execution of an adequate known recipe need not restart test-strategy or lifecycle-assurance design |
| Review a change | Report suspicious syntax without caller context, repeat prior discovery, chase a perfect score | software-review reuses trustworthy revision-bound context but independently checks decisive assertions and filters unsupported findings | Do not turn every implementation step into another full independent review; honor required review gates |
| Improve performance | Add caches/concurrency speculatively, then debug new consistency problems | software-performance checks representative baseline evidence, attributes the bottleneck and compares one justified intervention | Existing applicable measurements may suffice; no fresh profiling merely to repeat established evidence |
| Establish hosting | Start with a deploy command, discover incompatible runtime/state/network assumptions late | platform-engineering matches workload to platform and verifies dependency-ordered establishment, DNS/TLS/identity/runtime and durable behavior | Existing suitable hosting is unchanged; do not restart provider selection for a routine release |
| Ship or recover a release | Confuse source tests with packaged behavior, or repeat a timed-out deployment that is still running | software-delivery verifies the actual artifact/configuration and reconciles authoritative state before retry/recovery | Reuse valid earlier evidence where the relevant inputs and required gate policy permit it |
| Handle an incident, upgrade or retirement | Treat startup as recovery, upgrade everything at once, or leave dependent consumers/resources behind | software-operations and software-evolution target the actual failure/change and verify recovery or transition consequences | No new global process for an unrelated small correction; retain applicable operating obligations |

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
