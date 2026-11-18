---
description: Direct trigger phrase for the diagnose skill. Fails until the skill exists, which is the baseline.
tags: [trigger, diagnose, direct]
max_turns: 4
allowed_tools: [Read, Glob, Grep, Skill]
---

Debug this: since yesterday's deploy our Express API returns 500 on POST /orders, but only when the order has a discount code. Nothing else changed in the orders route as far as I know.
