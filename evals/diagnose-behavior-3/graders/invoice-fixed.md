---
type: regex
target: { source: file, path: src/emails/invoice.js }
pattern: "new Date\\(invoice\\.dueDate\\)\\.toLocaleDateString\\('en-US', \\{ month: 'long', day: 'numeric', year: 'numeric' \\}\\)"
match: not_contains
---

The reported line in src/emails/invoice.js no longer parses the date-only string as UTC midnight and formats it in local time.
