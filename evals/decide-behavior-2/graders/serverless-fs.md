---
type: llm
---

PASS if the reply points out that on Vercel serverless functions a SQLite file would not persist writes (ephemeral, per-instance filesystem), and so recommends a hosted database such as Postgres.
FAIL if the reply recommends SQLite or gives its answer without this hosting reason.
