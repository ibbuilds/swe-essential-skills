---
type: regex
target: { source: file, path: CHANGELOG.md }
pattern: '## Unreleased(?:(?!## 1\.4)[\s\S])*--output'
---

The rename, a breaking change for users of a published CLI, is recorded under Unreleased in CHANGELOG.md.
