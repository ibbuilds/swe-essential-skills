---
description: Asks for chunks of work in order, no ticket words.
tags: [trigger, tickets, reworded]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

Here's the spec we agreed on. What are the pieces of work, in order, so two of us can start picking them up tomorrow?

Spec: CSV export for the admin orders table.
- Admins click "Export" and get a CSV of the orders that match the current filters.
- Columns: order id, date, customer email, total, status.
- Exports over 10,000 rows run in the background and the admin gets an email with a download link.
- Only admins can export.
