---
type: regex
target: trace
pattern: '"name":"(?:Edit|Write|MultiEdit)","input"'
match: not_contains
---

Passes when no file is edited or written before a target is measured.
