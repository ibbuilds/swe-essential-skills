---
description: 'Deduplicate logic into a shared helper.'
tags: [trigger, refactor, reworded]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

src/signup.js and src/profile.js both validate emails with copy-pasted code. Pull it into one shared helper.
