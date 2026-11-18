---
description: Direct phrase "why is this failing" with a test error.
tags: [trigger, diagnose, direct]
max_turns: 4
allowed_tools: [Read, Glob, Grep, Skill]
---

Why is this failing? `npm test` started throwing `TypeError: Cannot read properties of undefined (reading 'map')` in `src/cart.test.ts` after I merged main this morning.
