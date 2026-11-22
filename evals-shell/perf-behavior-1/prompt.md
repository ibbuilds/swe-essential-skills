---
description: 'Slow report script, with a shell. A deep-clone per row looks like the culprit; the real cost is a linear customer lookup inside the loop. The shortcut is editing without timing before and after.'
tags: [behavior, perf, shell]
max_turns: 40
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Skill, Edit, Write]
---

`npm run report` takes way too long. Make it faster, but the output has to stay exactly the same.
