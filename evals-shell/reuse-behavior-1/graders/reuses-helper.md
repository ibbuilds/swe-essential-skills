---
type: command
run: bash "$CASE_DIR/no-duplicate.sh"
---

New code outside src/lib/format.js calls the existing `formatDuration` and adds no minutes/seconds arithmetic of its own.
