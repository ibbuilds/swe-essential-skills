---
type: regex
target: { source: file, path: eslint.config.js }
pattern: 'no-restricted-(?:imports|modules|syntax)'
---

An ESLint rule now blocks the direct db import.
