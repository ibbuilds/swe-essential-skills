---
type: llm
focus: trace
---

PASS if the run adds an automated check that fails on a direct db import from src/routes/ (for example an ESLint no-restricted-imports rule scoped to src/routes, or a test), rather than only a line in CLAUDE.md or documentation.
FAIL if the only change is prose (CLAUDE.md, README, comments).
