---
type: llm
focus: last_message
---

PASS if the rewrite keeps every fact: Tidepool is a job queue on Postgres, it uses SKIP LOCKED, 4,000 jobs per second, on a single db.t4g.medium, version 0.9 adds cron schedules and retries with exponential backoff, up to 25 attempts by default, and the install command `npm install tidepool-queue`.
FAIL if any of these is missing or changed.
