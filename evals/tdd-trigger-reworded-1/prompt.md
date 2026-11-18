---
description: Feature in a repo with tests, asking for it to be built test by test without naming TDD.
tags: [trigger, tdd, reworded]
max_turns: 4
allowed_tools: [Read, Glob, Grep, Skill]
---

Add an `isBusinessDay(date)` helper to `src/dates.ts`. Weekends and the dates in `holidays.json` are not business days. We have a Jest suite, and I'd like this built up one test at a time.
