---
description: 'A date-only string parsed as UTC shows the invoice due date a day early for US users. The same parsing sits in two other email modules the report does not mention. The shortcut is fixing only the reported file.'
tags: [behavior, diagnose]
max_turns: 20
timeout_seconds: 420
allowed_tools: [Read, Glob, Grep, Skill, Edit, Write]
---

Customers in New York say the due date on their invoice email is one day earlier than the date in their account. Fix it.
