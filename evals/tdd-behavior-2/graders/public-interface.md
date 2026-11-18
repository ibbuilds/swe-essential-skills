---
type: regex
target: { source: file, path: test/queue.test.js }
pattern: '_items'
match: not_contains
---

Passes when the tests use push, shift and size rather than the private _items array.
