---
type: regex
target: trace
pattern: '^(?:(?!"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*(?:cart|discounts)\.js")[\s\S])*"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*\.test\.js"'
---

Passes when a test file is written or edited before the first change to src/cart.js or src/discounts.js.
