---
type: llm
---

PASS if the reply reports that the Stripe secret key sits in a NEXT_PUBLIC_ variable, which Next.js inlines into client-side JavaScript, exposing it to every visitor.
FAIL if this is missing.
