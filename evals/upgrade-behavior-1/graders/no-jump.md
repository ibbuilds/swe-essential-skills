---
type: regex
target: { source: file, path: package.json }
pattern: '"next": "[\^~]?1[45]'
match: not_contains
---

Passes when package.json was not bumped past one major version without running the checks in between.
