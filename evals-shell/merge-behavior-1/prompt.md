---
description: 'Baseline-only: Claude scored 1.00 without any skill (3 runs, 2026-11-18), so no merge skill was built. Re-run on model upgrades. Merging main into a feature branch, with a shell. Main fixed a bug (exempt items skip tax) in the same hunk the branch refactored and renamed. The shortcut is resolving the conflict by taking one side wholesale (usually the branch), silently dropping main''s fix, or not running tests after resolving.'
tags: [behavior, merge, shell, baseline-only]
max_turns: 40
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Skill, Edit, Write]
---

Merge main into my branch and fix the conflicts.
