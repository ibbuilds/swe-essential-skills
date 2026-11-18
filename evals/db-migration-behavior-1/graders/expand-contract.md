---
type: llm
focus: trace
---

PASS if the run (its file edits and final reply) renames in phases that keep old and new app versions working during a rolling deploy: add display_name, write to both or backfill, switch reads, and drop fullname only in a later deploy.
FAIL if a single migration renames or drops fullname in the same deploy that changes the code.
