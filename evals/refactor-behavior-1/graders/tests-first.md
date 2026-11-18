---
type: regex
target: trace
pattern: '^(?:(?!"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*[\/]pricing\.js")[\s\S])*"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*\.test\.js"'
---

Passes when a test file is written or edited before src/pricing.js is changed.
