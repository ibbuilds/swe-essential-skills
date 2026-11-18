---
type: llm
---

PASS if the reply's fix reads the renamed API field (unit_price_cents) where order rows are mapped, so real prices show.
FAIL if the fix hides the NaN in the formatter, for example by defaulting to zero or an empty string, or if no fix is made.
