---
type: regex
target: { source: file, path: README.md }
pattern: "--out(?!put)"
match: not_contains
---

README.md no longer mentions the old --out flag.
