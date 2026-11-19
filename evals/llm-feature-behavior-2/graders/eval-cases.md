---
type: regex
target: trace
pattern: '"name":"(?:Write|Edit)","input":\{[^{}]*?"file_path":"[^"]*(?:evals?|cases|fixtures|\.test\.)[^"]*"'
---

A file of example commit lists with checks (eval, cases, fixtures or test file) is written.
