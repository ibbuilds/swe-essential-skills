# Deliberately challenge a software plan

Use for an explicit “grill me,” design interview or stress-test request, even
when an initial plan is accepted and no ambiguity has yet been reported. For a
clear implementation request, do not add an interview merely because it exists.

Recover accepted users, outcomes, constraints, contracts and choices. Challenge
the consequential assumptions using actual code/contracts and representative
failure, concurrency, authorization, compatibility or recovery scenarios. Choose
the scenarios that can change this design, not every category. A counterexample
must separate plausible interpretations or expose a meaningful failure; avoid
manufactured controversy. Existing behavior establishes what happens, not what
the product ought to do. Distinguish a discoverable fact from an owner decision.

Track dependencies among the unresolved decisions in current context. Ask only
questions whose prerequisites are settled; prefer the highest-consequence one
or a small independent group. Honor the user's pacing, including one at a time.
Retrieve accessible facts without making the user do the investigation. Use
permitted native selection for concrete alternatives, with practical consequences
and a justified recommendation; use free text for open facts. Do not bias every
question toward agreement or fabricate confidence percentages.

Wait for actual answers before dependent design or edits. Recompute the useful
questions after each reply, retaining settled choices and unresolved parts of
partial answers. Explicit delegation authorizes choices within its bounds; it
does not authorize unrelated scope, spending or deployment. Challenge an accepted
choice only when requested or new evidence bears on it, explaining the consequence.

Close when material in-scope decisions are resolved, investigated, delegated or
explicitly deferred until a safe point. Preserve consequential uncertainty if
the user stops. Leave accepted behavior, acceptance examples, open dependencies
and the next authorized action in the existing plan. Do not require an exhaustive
tree, a formal specification, a mandatory agent panel or another approval after
an adequate answer. An interview alone is not permission to implement.

## A different person owns the missing knowledge

When asked for a stakeholder questionnaire, draft for that recipient rather than
interrogating the requester about unavailable facts. Reuse known purpose,
recipient knowledge and constraints. Include enough context for an asynchronous
answer; prioritize questions by the software decision they affect, separate facts
from proposed policy, and make dependent questions conditional. Give space for
answers, unknowns and supporting examples. Cover the requested decisions without
inventing deadlines or answers. Drafting does not authorize sending the document
or contacting anyone. Reconcile returned answers and unresolved conflicts into
the existing requirements record.

## Keep domain language usable

When overloaded terms change behavior, distinguish the concepts with a concrete
example and compare them with the existing glossary, code and contracts. Record
accepted definitions and unresolved meanings in the current authoritative
requirements or glossary. Keep business meanings separate from implementation
choices; do not force one term across contexts where it legitimately differs.
A consequential architectural tradeoff may need a decision record; a clarified
word alone does not need an ADR or repository-wide rename.

Original adaptation of [Matt Pocock's grilling](https://github.com/mattpocock/skills/blob/5beb35b040e3de97e54fa9e386d7e42d15c295c2/skills/productivity/grilling/SKILL.md),
[domain modeling](https://github.com/mattpocock/skills/blob/5beb35b040e3de97e54fa9e386d7e42d15c295c2/skills/engineering/domain-modeling/SKILL.md)
and [Addy Osmani's interview](https://github.com/addyosmani/agent-skills/blob/aeac41d4d005999432bb7312f7ff06383a91d59d/skills/interview-me/SKILL.md).
Their mandatory formats, exhaustive stopping rules and synthetic confidence
thresholds are not imported.
