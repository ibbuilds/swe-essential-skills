---
type: regex
target: trace
pattern: '"name":"Write","input":\{[^{}]*?"file_path":"[^"]*prompts?[\\\\/][^"]+\.(?:md|txt|prompt)"'
---

The prompt moves out of the handler into its own file under a prompt(s) folder.
