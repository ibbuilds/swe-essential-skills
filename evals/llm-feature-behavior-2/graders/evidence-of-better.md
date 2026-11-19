---
type: llm
focus: last_message
---

PASS if the reply gives an eval result for the new prompt (a score or pass count), or says the eval was not run and gives the command that runs it.
FAIL if it says the summaries are now better, fixed or shorter with neither a result nor a command to check it.
