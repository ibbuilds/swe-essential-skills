---
type: regex
target: trace
pattern: '"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*duration\.test\.js"[\s\S]*?"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*[\\/]duration\.js"[\s\S]*?"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*duration\.test\.js"[\s\S]*?"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*[\\/]duration\.js"'
---

Passes when tests and code alternate at least twice: test, code, test, code.
