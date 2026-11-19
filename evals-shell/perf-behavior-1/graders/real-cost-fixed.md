---
type: regex
target: { source: file, path: src/report.js }
pattern: 'customers\.find\('
match: not_contains
---

The linear customer lookup inside the loop is gone.
