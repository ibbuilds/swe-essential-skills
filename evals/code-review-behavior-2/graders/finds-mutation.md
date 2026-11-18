---
type: llm
---

PASS if the reply says that `hosts.sort(...)` now sorts the caller's array in place, unlike the old copy, so shared host lists get reordered.
FAIL if the reply misses this.
