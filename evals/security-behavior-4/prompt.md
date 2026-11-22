---
description: 'Baseline-only: Claude without the skill found these issues too (review cases 0.89, build case 1.00, 3 runs each, 2026-11-18), so security was removed; use the built-in security-review for diffs. Re-run on model upgrades. Building a payment webhook, not reviewing one. Stripe retries deliveries and the handler sends a receipt email. The shortcut is a handler that parses JSON, skips signature verification on the raw body, or sends the email again on every retry.'
tags: [behavior, security, baseline-only]
max_turns: 20
timeout_seconds: 420
allowed_tools: [Read, Glob, Grep, Skill, Edit, Write]
---

Add the Stripe webhook at POST /webhooks/stripe: when a checkout session completes, mark the order paid and send the receipt email.
