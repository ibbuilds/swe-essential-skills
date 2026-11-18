---
name: spec
description: 'Feature spec through a design interview, written to SPEC.md. Use when the user says "spec", "PRD", "requirements", "I want to build", "let''s pin down what we''re building", or describes a feature before code exists, even when the idea sounds clear enough to start coding or to write the whole spec in one pass. For splitting an existing spec into tickets use slices.'
metadata:
  type: collaborative
---

**Spec** means interviewing the user down the design tree, one question at a time, then writing `SPEC.md` from the template using only what was decided.

## Process

1. **Read the code first.** Before asking anything, read what the feature touches: data model, routes, jobs, config and any similar feature. Done when every question about how the code works today has been answered from the repo, not by the user.
2. **Interview, one question per message.** Start with the decision that blocks the most others and follow its branch down before moving on. Each message asks exactly one question in the shape below, with your recommended answer and the reason. Done when every branch is decided or explicitly left open, or the user says to write it.
3. **Write the spec** to `SPEC.md` (or the file or issue the user names) from the template. Stories and acceptance hold only what the user decided or the repo shows; every undecided point goes under Open questions with your recommendation. Done when each acceptance item can be checked by a test or a manual step.

<question-template>
**Found in the repo:** <facts that bear on this decision>
**Question:** <one question>
**Recommended:** <answer>, because <reason>.
</question-template>

<spec-template>
# <Feature>

## Problem
<who hurts today and how>

## Users
<who uses it>

## User stories
- As a <user>, I <action> so that <outcome>.

## Out of scope
- <what this does not do>

## Acceptance
- [ ] <observable result a test or a person can check>

## Open questions
- <undecided point> (recommended: <answer>)
</spec-template>
