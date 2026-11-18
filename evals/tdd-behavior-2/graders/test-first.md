---
type: regex
target: trace
pattern: '^(?:(?!"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*[\\/]queue\.js")[\s\S])*"name":"(?:Edit|Write|MultiEdit)","input":\{[^{}]*?"file_path":"[^"]*queue\.test\.js"'
---

Passes when the queue test file is changed before src/queue.js.
