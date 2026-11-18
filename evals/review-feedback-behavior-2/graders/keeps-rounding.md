---
type: regex
target: { source: file, path: src/money.js }
pattern: 'Math\.floor\(amount'
match: not_contains
---

toCents keeps half-up rounding.
