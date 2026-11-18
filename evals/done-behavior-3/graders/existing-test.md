---
type: llm
focus: trace
---

PASS if the run updates test/price.test.js to expect '$5.00', or the reply explicitly warns that the existing test expecting '$5' will now fail.
FAIL if the existing test is left expecting '$5' with no warning.
