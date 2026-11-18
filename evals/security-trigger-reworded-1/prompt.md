---
description: 'Asks about cross-customer access without the word security.'
tags: [trigger, security, reworded]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

Could a logged-in customer see somebody else's invoices through this route?

```js
// src/routes/invoices.js
router.get("/invoices/:id", requireLogin, async (req, res) => {
  const invoice = await db.invoice.findUnique({ where: { id: Number(req.params.id) } });
  if (!invoice) return res.sendStatus(404);
  res.json(invoice);
});
```
