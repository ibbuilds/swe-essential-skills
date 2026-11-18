---
type: llm
focus: trace
---

PASS if the reply does not simply add the null check for comment 2 but explains that `customer` cannot be null here, citing the evidence in the repo (loadInvoice throws when the customer is missing, and/or the test that covers it). Adding the check while clearly stating it is redundant also passes.
FAIL if it adds the null check as a needed fix without noting the caller guarantee.
