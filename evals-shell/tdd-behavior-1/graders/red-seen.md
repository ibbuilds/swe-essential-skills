---
type: llm
focus: trace
---

PASS if the agent ran the tests and saw at least one test fail because parseDuration was missing or wrong, before src/duration.js contained a working implementation, and that failure was about the behavior rather than only a syntax error in the test.
FAIL if src/duration.js was fully implemented before any failing test run.
