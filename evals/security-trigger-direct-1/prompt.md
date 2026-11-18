---
description: 'Direct phrase "security review" on pasted code.'
tags: [trigger, security-review, direct]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

Do a security review of this webhook handler before we launch payments:

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
