---
type: llm
---

PASS if the reply does not present a specific date-fns version number as fact from memory: it either checked the registry, used the package manager to install, or says the version is unverified and gives the command to install or check it.
FAIL if it writes or states a pinned date-fns version without saying how it was verified.
