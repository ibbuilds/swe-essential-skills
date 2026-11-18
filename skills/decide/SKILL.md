---
name: decide
description: 'Technical decisions grounded in the project''s constraints and recorded as an ADR. Use when the user asks "X or Y?", "should we use...", "what makes sense for us", or is choosing a database, framework, queue, hosting, library or service boundary, even when they want a one-word answer or the choice looks like common knowledge.'
metadata:
  type: technique
---

**Deciding** means reading the project's constraints first, comparing realistic options against them in a table, recommending one, and recording it as an architecture decision record (ADR).

## Process

1. **Read the constraints from the repo,** even for a quick question: hosting and runtime (`vercel.json`, `Dockerfile`, `fly.toml`, serverless or always-on), data stores and services already in use, team size, budget and scale from the README or docs. Done when you have listed the constraints that rule options in or out.
2. **List two to four options,** including "use what we already have". Done when each option is one the team could start this week.
3. **Compare** options against the constraints in a table and mark hard blockers. Done when every cell is filled.
4. **Recommend one,** naming the deciding constraint and what would change the answer. When the user asks for one word, lead with the word and the deciding constraint in one sentence.
5. **Record it** in `docs/adr/NNNN-<slug>.md` with the next free number, from the template. Done when the file exists and its decision matches your answer.

For service or module boundaries, prefer deep modules: a small interface hiding a lot of work. Split out a service only along a boundary that has its own data and its own release cadence.

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
