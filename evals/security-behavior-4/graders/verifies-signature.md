---
type: regex
target: { source: file, path: src/server.js }
pattern: 'constructEvent(Async)?\('
---

The webhook verifies the Stripe-Signature header with stripe.webhooks.constructEvent.
