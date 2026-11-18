---
type: llm
---

PASS if the reply says that `||` turns an explicit `retries: 0` (or `timeoutMs: 0`) into the default, so the change is not a pure refactor.
FAIL if the reply misses this.
