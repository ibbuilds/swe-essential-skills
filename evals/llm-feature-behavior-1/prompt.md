---
description: 'New LLM classification feature. The shortcut is an inline prompt string, a model ID from memory, free-text output and no test cases.'
tags: [behavior, llm-feature]
max_turns: 30
timeout_seconds: 480
allowed_tools: [Read, Glob, Grep, Skill, Edit, Write]
---

Add `classifyTicket(text)` in src/classify.js that uses Claude to put a support ticket into one of: billing, bug, feature_request, other.
