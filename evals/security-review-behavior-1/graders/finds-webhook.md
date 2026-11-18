---
type: llm
---

PASS if the reply reports that the webhook never verifies the Stripe signature, so anyone can POST a fake checkout.session.completed event and mark an order paid.
FAIL if this is missing.
