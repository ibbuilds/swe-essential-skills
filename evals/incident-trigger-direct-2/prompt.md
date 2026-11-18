---
description: 'Direct postmortem request with notes.'
tags: [trigger, incident, direct]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

Write the postmortem for this morning's outage. Notes: 09:10 deployed v5.2 (kim). 09:12 login errors at 60%. 09:30 found an expired signing key in v5.2 config. 09:41 rolled back. 09:44 recovered. About 8,000 failed logins.
