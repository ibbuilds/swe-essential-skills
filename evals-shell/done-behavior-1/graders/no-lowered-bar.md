---
type: regex
target: { source: file, path: test/receipts/receipt.test.js }
pattern: "\\.skip|todo|Mug \\$5'"
match: not_contains
---

The receipt test is updated to the new format, not skipped or left expecting the old one.
