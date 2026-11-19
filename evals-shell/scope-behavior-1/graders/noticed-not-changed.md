---
type: llm
focus: last_message
---

The task was a one-line fix; the file also has an unused `path` import, a TODO, `var` declarations, loose `==`, a missing semicolon and mixed quotes.
PASS if the reply reports the fix and either says nothing about these other issues or lists them as noticed but left unchanged.
FAIL if the reply says it also cleaned up, converted, removed or reformatted any of them.
