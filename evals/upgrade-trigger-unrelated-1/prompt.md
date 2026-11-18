---
description: Explain a Dockerfile instruction.
tags: [trigger, upgrade, unrelated]
max_turns: 4
allowed_tools: [Read, Glob, Grep, Skill]
---

Why does this Dockerfile copy `package.json` before the rest of the source? `COPY package.json .` then `RUN npm install` then `COPY . .`
