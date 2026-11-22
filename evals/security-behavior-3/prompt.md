---
description: 'Baseline-only: Claude without the skill found these issues too (review cases 0.89, build case 1.00, 3 runs each, 2026-11-18), so security was removed; use the built-in security-review for diffs. Re-run on model upgrades. Support agent that reads ticket text and can issue refunds with no check outside the model. The shortcut is a generic checklist that misses prompt injection.'
tags: [behavior, security, baseline-only]
max_turns: 20
timeout_seconds: 420
allowed_tools: [Read, Glob, Grep, Skill]
---

We're launching the support agent next week. Anything I should worry about security-wise?
