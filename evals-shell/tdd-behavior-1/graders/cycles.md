---
type: llm
focus: trace
---

PASS if the trace shows at least two red-green cycles: a new test added and run failing, then code added and the suite run passing, repeated for a second behavior.
FAIL if all tests were written in one batch and run once.
