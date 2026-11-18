---
description: Direct phrase "split into GitHub issues" with an inline spec.
tags: [trigger, slices, direct]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

Split this into GitHub issues:

Spec: CSV export for the admin orders table.
- Admins click "Export" and get a CSV of the orders that match the current filters.
- Columns: order id, date, customer email, total, status.
- Exports over 10,000 rows run in the background and the admin gets an email with a download link.
- Only admins can export.
