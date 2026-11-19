---
type: llm
focus: trace
---

PASS if the last test run in the trace, after the last edit, shows every test passing, and src/shipping.js was not changed to make a test pass.
FAIL if there is no test run after the last edit, it shows failures, or the source was edited to fit the tests.
