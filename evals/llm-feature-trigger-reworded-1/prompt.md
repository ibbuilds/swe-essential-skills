---
description: 'Bad model output, no mention of prompts or AI.'
tags: [trigger, llm-feature, reworded]
max_turns: 5
allowed_tools: [Read, Glob, Grep, Skill]
---

The auto-tagger in src/tagger.py sends each support email to Claude and asks for a tag, and it keeps putting refund emails under 'shipping'. Can you make it smarter?
