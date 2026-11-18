---
description: 'Direct phrase "is this secure".'
tags: [trigger, security-review, direct]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

Is this endpoint secure?

```js
// src/routes/invoices.js
router.get("/invoices/:id", requireLogin, async (req, res) => {
  const invoice = await db.invoice.findUnique({ where: { id: Number(req.params.id) } });
  if (!invoice) return res.sendStatus(404);
  res.json(invoice);
});
```
