---
type: regex
target: { source: file, path: docs/usage.md }
pattern: "--out(?!put)"
match: not_contains
---

docs/usage.md no longer mentions the old --out flag.
