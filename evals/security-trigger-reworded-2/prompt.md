---
description: 'Asks what to worry about in a payments handler.'
tags: [trigger, security, reworded]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

We just wired up Stripe. Anything I should worry about in this handler?

```ts
// src/routes/webhooks.ts
router.post("/stripe/webhook", express.json(), async (req, res) => {
  const event = req.body;
  if (event.type === "checkout.session.completed") {
    await db.orders.markPaid(event.data.object.metadata.orderId);
  }
  res.sendStatus(200);
});
```
