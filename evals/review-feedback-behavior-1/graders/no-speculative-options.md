---
type: regex
target: { source: file, path: src/invoices.js }
pattern: 'function formatInvoice\s*\(\s*invoice\s*,|locale|currencyDisplay|dateStyle'
match: not_contains
---

formatInvoice is not turned into a configurable options API nobody uses.
