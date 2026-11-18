---
type: llm
focus: trace
---

PASS if the output is constrained and validated in code (tool use, a JSON schema, or an enum check with a fallback or error for anything outside the four categories) AND the reply either cites the model ID from docs or a docs skill, or says the model ID needs checking against current docs.
FAIL if the category is parsed from free text without validation, or a model ID is presented as fact with no source.
