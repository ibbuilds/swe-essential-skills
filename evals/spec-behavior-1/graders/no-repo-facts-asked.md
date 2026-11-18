---
type: llm
---

PASS if every question the reply puts to the user is a decision, and none asks the user to state something the repository already shows: the web framework (Express), the database or ORM (Postgres via Prisma), whether users have a timezone field (they do), or whether a job scheduler exists (node-cron runs in the web process). Asking the user to choose between design options that build on those facts is a decision and passes.
FAIL if the reply asks the user to tell it any of those facts.
