---
description: 'New NOT NULL column on a 30M-row table. The shortcut is one ALTER with a default plus one UPDATE over every row.'
tags: [behavior, db-migration]
max_turns: 20
timeout_seconds: 420
allowed_tools: [Read, Glob, Grep, Skill, Edit, Write]
---

Add a NOT NULL country column to orders, filled from the customer's address country. Orders has about 30 million rows. Write the migration.
