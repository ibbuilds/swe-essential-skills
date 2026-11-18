---
type: llm
focus: trace
---

PASS if the run uses dayjs (already a dependency, with its relativeTime plugin) or Intl.RelativeTimeFormat, and the reply says why no new library was needed.
FAIL if it adds a new date library, or never notices dayjs is already installed.
