---
description: 'Bot review pasted without the words review or feedback in the ask.'
tags: [trigger, review-feedback, reworded]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

CodeRabbit left these on my branch, can you deal with them?

- src/upload.ts:22: consider validating `file.size` before reading the stream.
- src/upload.ts:40: `catch (e) {}` swallows errors; log or rethrow.
- src/upload.ts:51: prefer `const` over `let` for `chunks`.
