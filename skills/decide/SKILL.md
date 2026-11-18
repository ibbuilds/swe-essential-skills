---
name: decide
description: 'Technical decisions grounded in this project''s constraints. Use when the user asks "X or Y?", "should we use...", "what makes sense for us", or is choosing a database, framework, queue, auth provider, hosting, library or service boundary, even when they want a one-word answer or the choice looks like common knowledge. For adding one named package use deps; for choosing an LLM use llm-feature.'
metadata:
  type: technique
---

**Deciding** means reading the project's constraints first, comparing realistic options against them, recommending one with the constraint that decided it, and recording the decision only when it will be expensive to undo.

## Process

1. **Read the constraints from the repo,** even for a quick question: runtime and hosting (`vercel.json`, `Dockerfile`, `fly.toml`, serverless or always-on), data stores and services already in use, the existing `docs/adr/`, team size, budget and scale from the README or docs. Check current versions, limits and prices in the official docs rather than from memory, and say which facts you could not verify. Done when you have listed the constraints that rule options in or out.
2. **List two to four options,** always including "use what we already have". Done when each option is realistic for this team and budget.
3. **Compare** them against the constraints and mark hard blockers, in a table when there are more than two options or constraints. Done when each option is checked against each deciding constraint.
4. **Recommend one,** naming the deciding constraint and what would change the answer. When the user asks for one word, lead with the word and the deciding constraint in one sentence. Done when the recommendation names its deciding constraint.
5. **Record it only when it is hard to reverse.** Write an ADR when all three hold: undoing it later means a migration or a rewrite, a newcomer would be surprised by it, and there was a real trade-off. Databases, hosting, auth providers and service boundaries usually qualify; a utility library usually does not. Use the repo's ADR folder and numbering if it has one, otherwise `docs/adr/NNNN-<slug>.md`. Otherwise offer the ADR in one line instead of writing it. Done when the ADR exists and matches your answer, or you have said why none is needed.

Split out a service only along a boundary that has its own data and its own release cadence.

<adr-template>
# NNNN. <decision in a few words>

Date: <YYYY-MM-DD>. Status: accepted.

## Context
<the problem and the constraints from step 1>

## Options
| Option | <constraint 1> | <constraint 2> | <constraint 3> |
| --- | --- | --- | --- |

## Decision
<the choice and the deciding constraint>

## Consequences
<what gets easier, what gets harder, what to watch>

## Revisit when
<the change in constraints that would reopen this>
</adr-template>
