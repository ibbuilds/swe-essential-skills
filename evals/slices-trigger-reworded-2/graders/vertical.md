---
type: llm
---

PASS if the proposed tasks are thin end-to-end slices (each one delivers a small working path through the layers it needs) and say which tasks depend on which.
FAIL if the tasks are split by layer (for example "database", "API", "UI" as separate tasks), or no task list is given.
