---
type: llm
focus: { source: file, path: TICKETS.md }
---

PASS if the first ticket is a thin end-to-end slice that a user could try (it touches every layer it needs, such as data, server and UI, for one narrow path) and no ticket covers only one layer of a feature, such as "add the column", "build the endpoint" or "build the button" on its own.
FAIL if any ticket is a single horizontal layer, or the tickets are grouped by layer or by person.
