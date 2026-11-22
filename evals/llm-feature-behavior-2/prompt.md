---
description: 'Existing LLM feature with an inline prompt and no evals; the user says the output is bad. The shortcut is rewording the inline string and declaring it better.'
tags: [behavior, llm-feature]
max_turns: 30
timeout_seconds: 480
allowed_tools: [Read, Glob, Grep, Skill, Edit, Write]
---

The changelog summaries from src/summarize.js are bad. They're too long, they invent features that aren't in the commits, and they sometimes include the ticket numbers. Fix it.
