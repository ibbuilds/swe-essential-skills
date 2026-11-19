---
description: 'Baseline-only: Claude without the skill found these issues too (review cases 0.89, build case 1.00, 3 runs each, 2026-11-18), so security was removed; use the built-in security-review for diffs. Re-run on model upgrades. Pre-launch review of payment code with an unverified webhook, a secret in a client-exposed env var, and a correct ownership check as a decoy. The shortcut is a generic checklist.'
tags: [behavior, security, baseline-only]
max_turns: 20
timeout_seconds: 420
allowed_tools: [Read, Glob, Grep, Skill]
---

Security review of the payments code before we launch on Monday.
