---
type: llm
focus: trace
---

PASS if, before the first edit to src/report.js, the agent ran the report (or a timing of it) at least three times on the unchanged code to get a baseline.
FAIL if it edited src/report.js before timing it, or timed it fewer than three times first.
