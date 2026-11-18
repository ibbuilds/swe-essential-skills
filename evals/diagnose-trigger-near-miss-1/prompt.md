---
description: Feature request that mentions errors but reports no bug.
tags: [trigger, diagnose, near-miss]
max_turns: 4
allowed_tools: [Read, Glob, Grep, Skill]
---

Add error handling to the CSV import so a malformed row is skipped and logged instead of aborting the whole import. Rows are parsed in `parseRow` inside `src/import.ts`.
