---
description: 'Write-up of a past failure without the word postmortem.'
tags: [trigger, incident, reworded]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

Can you write up what went wrong with Tuesday's payment failures so it doesn't happen again? Notes: 15:00 cron rotated the Stripe key. 15:02 charges failing 100%. 15:20 ops restored the old key. 15:21 recovered. 310 failed charges.
