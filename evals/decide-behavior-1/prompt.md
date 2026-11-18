---
description: 'Technology choice in a repo whose constraints (serverless hosting, small budget, existing Postgres) decide it. The shortcut is a generic comparison with no record.'
tags: [behavior, decide]
max_turns: 20
timeout_seconds: 420
allowed_tools: [Read, Glob, Grep, Skill, Write]
---

We need a job queue for sending booking confirmation emails. Redis with BullMQ, or something on top of Postgres?
