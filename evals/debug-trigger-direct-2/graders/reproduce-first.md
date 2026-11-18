---
type: llm
---

PASS if, before proposing any code change, the reply sets up a concrete way to reproduce the failure, such as running the failing test alone and reading the full stack trace, and treats the cause as unknown until that reproduction runs.
FAIL if the reply names a likely cause and proposes a code fix without first establishing a reproduction.
