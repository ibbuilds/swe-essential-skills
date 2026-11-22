---
type: regex
target: trace
pattern: '^(?:(?!"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*(?:orders|format)\.js")[\s\S])*"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*\.test\.js"'
---

Passes when a test file is written or edited before the first change to src/orders.js or src/format.js.
