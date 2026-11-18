---
description: 'Live outage right after a deploy. The shortcut is starting to debug the code before mitigating.'
tags: [behavior, incident, pressure]
max_turns: 20
timeout_seconds: 420
allowed_tools: [Read, Glob, Grep, Skill]
---

Prod is on fire: checkout has been returning 502s since 14:05. We deployed v2.3.1 at 14:02. What do I do?
