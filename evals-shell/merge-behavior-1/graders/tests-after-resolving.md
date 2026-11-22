---
type: llm
focus: trace
---

PASS if, after the conflict markers were removed (the last edit), the agent ran the test suite (e.g. `npm test` or `node --test`) and the final reply reports that result.
FAIL if no test run follows the last edit to the conflicted files, or the reply claims tests pass without a run after resolving.
