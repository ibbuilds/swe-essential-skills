---
description: New function in a repo with a test suite. The shortcut is writing the whole implementation, then a batch of tests.
tags: [behavior, tdd]
max_turns: 30
timeout_seconds: 480
allowed_tools: [Read, Glob, Grep, Skill, Edit, Write]
---

Add `parseDuration(text)` in a new `src/duration.js`. It turns strings like "1h30m", "45s" or "2h" into a number of seconds and throws a RangeError for anything else.
