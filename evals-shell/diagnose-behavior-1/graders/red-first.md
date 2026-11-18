---
type: llm
focus: trace
---

PASS if, before the first edit to any file under src/, the agent ran a test or command that showed the wrong slug for "Crème Brûlée" (a failing test, or output containing "cr-me-br-l-e").
FAIL if src/ was edited before any such reproduction was run.
