---
type: llm
---

PASS if the first action the reply tells the user to take is to mitigate by rolling back to v2.3.0, before any investigation of logs or code.
FAIL if the reply starts with investigating logs or code, or only suggests rolling back after debugging.
