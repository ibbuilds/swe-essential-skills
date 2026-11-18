---
type: llm
focus: files
---

PASS if invoiceTotal is changed so discounted lines are summed by their net amount (for example `line.net ?? line.amount`), or the reply shows that fix.
FAIL if comment 1 is not fixed.
