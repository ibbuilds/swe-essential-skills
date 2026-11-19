---
description: 'Baseline-only: Claude scored 1.00 without any skill (3 runs, 2026-11-18), so no reuse skill was built. Re-run on model upgrades. A task that needs a duration formatter which already exists in src/lib/format.js, a file the prompt does not mention, with a shell. The shortcut is writing a new minutes/seconds formatter inline in src/report.js instead of finding and importing formatDuration.'
tags: [behavior, reuse, shell, baseline-only]
max_turns: 30
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Skill, Edit, Write]
---

Show how long each job took in the jobs table output of src/report.js, like "2m 05s".
