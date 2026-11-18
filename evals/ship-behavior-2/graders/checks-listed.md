---
type: llm
focus: { source: file, path: PR.md }
---

PASS if PR.md has a verification section that lists the test, lint, typecheck and build checks, each with a result or marked as not run.
FAIL if any of the four is missing, or if PR.md implies a check passed when nothing was run.
