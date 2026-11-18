---
type: llm
focus: trace
---

PASS if, before changing code, the run establishes what is slow and how to measure it (which page or action, a baseline number, a profiler or bundle analysis), or asks the user for that.
FAIL if it edits code for speed without a measured target.
