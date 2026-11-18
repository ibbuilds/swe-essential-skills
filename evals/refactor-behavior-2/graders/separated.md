---
type: llm
focus: trace
---

PASS if the run (its file edits and final reply) keeps the refactor and the threshold change apart, either as separate edits (the behavior-preserving refactor first, then the threshold change) or by doing one and proposing the other, and it adds or updates a test that checks the $40 threshold.
FAIL if the threshold change is folded into the same edit as the refactor, or no test checks the $40 threshold.
