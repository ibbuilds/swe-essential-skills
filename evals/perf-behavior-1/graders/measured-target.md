---
type: llm
focus: trace
---

PASS if the run (its file edits and final reply) identifies the per-order customer query (about 3,000 round trips) as the main cost, fixes it with a join or a single batched query, and states how the before and after time is or should be measured.
FAIL if it optimizes formatRow or string building as the main fix, or gives no way to measure the result.
