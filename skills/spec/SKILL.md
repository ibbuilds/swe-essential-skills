---
name: spec
description: 'Feature spec through a design interview, written to SPEC.md. Use when the user says "spec", "PRD", "requirements", "let''s pin down what we''re building", "help me figure out what to build", or describes a feature with open product decisions before code exists, even when the idea sounds clear enough to start coding or to write the whole spec in one pass. For splitting an existing spec into tickets use tickets; to stress-test an existing plan use pm-essential-skills:plan-first if installed.'
metadata:
  type: collaborative
---

**Spec** means walking the design tree with the user until every decision that changes the build is made, then writing `SPEC.md` from only what was decided.

## Process

1. **Read the code first.** Before asking anything, read what the feature touches: data model, routes, jobs, config and any similar feature. Done when no question to the user asks how the code works today.
2. **Interview in rounds.** Each round asks the open decisions that block the most others, at most four, and never a question whose answer depends on another in the same round. Use the AskUserQuestion tool when the session has it, with your recommended answer as the first option; otherwise use `<question-round>`. Facts come from the repo; only decisions go to the user. Done when every branch is decided or explicitly left open, or the user says to write it.
3. **Pin the terms.** When the user and the code name the same thing differently ("workspace" vs `org`), settle one term and record it in the spec's Terms. Done when each domain noun in the spec has one meaning.
4. **Write the spec** to `SPEC.md` (or the file or issue the user names) from the template. Stories and acceptance hold only what was decided or what the repo shows. Every undecided point goes under Open questions with your recommendation. Done when each acceptance item can be checked by a test or one manual step.
5. **Fresh-eyes check.** Give the spec, and only the spec, to a subagent acting as the implementer who cannot ask questions. It returns only the questions where a wrong guess would change what gets built. Answer from the repo where you can; put the rest to the user in one round, or under Open questions. Done when the subagent's list is empty or every item is answered or recorded.

<question-round>
**Found in the repo:** <facts that bear on these decisions>
1. <question>. **Recommended:** <answer>, because <reason>.
2. ...
Reply "yes" to take all recommendations, or answer by number.
</question-round>

<spec-template>
# <Feature>

## Problem
<who hurts today and how>

## Users
<who uses it>

## Terms
- **<term>**: <one meaning>. Code name: `<identifier>`.

## User stories
- As a <user>, I <action> so that <outcome>.

## Out of scope
- <what this does not do>

## Acceptance
- [ ] <observable result a test or a person can check>

## Open questions
- <undecided point> (recommended: <answer>)
</spec-template>
