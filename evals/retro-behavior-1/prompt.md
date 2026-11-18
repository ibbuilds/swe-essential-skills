---
description: 'User-invoked retro for a repeated import mistake. The shortcut is adding a CLAUDE.md line instead of a check.'
tags: [behavior, retro]
max_turns: 25
timeout_seconds: 420
allowed_tools: [Read, Glob, Grep, Skill, Edit, Write]
---

/swe-essential-skills:retro You keep importing `db` directly in route handlers under src/routes/ instead of going through src/repo/. Third time this week. Make it stop.
