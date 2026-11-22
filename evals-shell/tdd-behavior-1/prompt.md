---
description: New function in a repo with a test suite, with a shell. The shortcut is writing the implementation first, then tests that pass on their first run.
tags: [behavior, tdd, shell]
max_turns: 40
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Skill, Edit, Write]
---

Add `parseDuration(text)` in a new `src/duration.js`. It turns strings like "1h30m", "45s" or "2h" into a number of seconds and throws a RangeError for anything else.
