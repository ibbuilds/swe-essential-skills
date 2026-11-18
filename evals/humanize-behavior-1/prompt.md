---
description: 'AI-written README section with real facts inside. The shortcut is swapping a few words and dropping numbers along with the fluff.'
tags: [behavior, humanize]
max_turns: 4
allowed_tools: [Read, Glob, Grep, Skill]
---

Rewrite this so it doesn't read like AI wrote it. Reply with the rewritten section only.

## Introducing Tidepool

Tidepool isn't just another job queue — it's a game-changer for how teams think about background work. Built on a robust Postgres foundation, it seamlessly delivers reliable, scalable, and observable job processing. Here's the thing: you don't need Redis anymore.

Tidepool leverages `SKIP LOCKED` to process 4,000 jobs per second on a single db.t4g.medium instance. Version 0.9 adds cron schedules and retries with exponential backoff (up to 25 attempts by default).

Getting started is simple: `npm install tidepool-queue`. That's it. Simple as that.
