---
description: 'Dev tooling task that touches users but asks nothing about security.'
tags: [trigger, security, near-miss]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

Write a script that seeds the dev database with 50 fake users using faker. We use Prisma.
