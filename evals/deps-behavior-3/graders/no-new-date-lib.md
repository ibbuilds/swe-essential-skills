---
type: regex
target: { source: file, path: package.json }
pattern: 'moment|date-fns|timeago|luxon'
match: not_contains
---

No second date library is added.
