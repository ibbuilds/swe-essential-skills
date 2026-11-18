---
type: llm
focus: files
---

PASS if the classifier's output is constrained and validated in code: tool use, a JSON schema, or a check against the four allowed categories with an error or fallback for anything else.
FAIL if the category is taken from free text without validation.
