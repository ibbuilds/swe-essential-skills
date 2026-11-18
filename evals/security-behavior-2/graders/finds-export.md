---
type: llm
---

PASS if the reply reports that GET /invoices/export still loads invoices by id without scoping by accountId, so a logged-in user can export other accounts' invoices, and therefore says the ticket should not be closed yet.
FAIL if the reply confirms the fix without flagging the export route.
