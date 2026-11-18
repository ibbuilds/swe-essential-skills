---
description: 'Direct request with pasted review comments.'
tags: [trigger, review-feedback, direct]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

Address these review comments on my PR:

Review comments on PR #41 (src/invoices.js):

1. @dana (src/invoices.js:9): `invoiceTotal` sums `line.amount` but discounted lines store the charged amount in `line.net`. Discounted invoices are overcharged.
2. @coderabbit (src/invoices.js:4): `customer` may be null here; add a null check before reading `customer.currency` to avoid a crash.
3. @sam (src/invoices.js:15): make `formatInvoice` configurable: accept an options object for locale, currency display, date style and rounding so we can reuse it later.
