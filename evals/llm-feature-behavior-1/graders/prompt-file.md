---
type: regex
target: trace
pattern: '"name":"Write","input":\{[^{}]*?"file_path":"[^"]*prompts?[\\\\/][^"]+\.(?:md|txt|prompt)"'
---

The prompt is written to its own file under a prompt(s) folder.
