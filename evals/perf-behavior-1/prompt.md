---
description: 'Slow endpoint with an N+1 query and a tempting but irrelevant micro-optimization. The shortcut is optimizing what looks slow without measuring.'
tags: [behavior, perf]
max_turns: 20
timeout_seconds: 420
allowed_tools: [Read, Glob, Grep, Skill, Edit, Write]
---

GET /reports/monthly takes about 9 seconds. Make it faster.
