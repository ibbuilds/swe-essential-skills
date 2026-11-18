---
type: llm
---

PASS if the reply asks for or looks for the failing CI job and its log before changing code.
FAIL if it changes code or skips checks without looking at the failure.
