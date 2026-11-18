---
type: regex
target: { source: file, path: SPEC.md }
pattern: '^(?=[\s\S]*#+ *Out of scope)(?=[\s\S]*#+ *Acceptance)(?=[\s\S]*#+ *Open questions)(?=[\s\S]*#+ *User stories)'
flags: i
---

SPEC.md has user stories, out of scope, acceptance criteria and open questions sections.
