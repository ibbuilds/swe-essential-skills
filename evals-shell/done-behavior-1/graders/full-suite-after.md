---
type: llm
focus: trace
---

PASS if, after the last edit, the agent ran the whole suite (npm test, or both test/ and test/receipts/) and the final reply reports that result, which shows no failures.
FAIL if no full-suite run follows the last edit, the receipt test failure was missed, or the reply claims a success the last run does not show.
