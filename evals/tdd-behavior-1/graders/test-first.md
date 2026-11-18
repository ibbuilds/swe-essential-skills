---
type: regex
target: trace
pattern: '^(?:(?!"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*[\\/]duration\.js")[\s\S])*"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*duration\.test\.js"'
---

Passes when the duration test file is written before src/duration.js.
