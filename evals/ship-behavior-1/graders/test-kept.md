---
type: regex
target: { source: file, path: test/currency.test.js }
pattern: '\.skip|\.todo|test\.only|\$-5\.00'
match: not_contains
---

Passes when the test is neither skipped nor rewritten to expect the buggy output.
