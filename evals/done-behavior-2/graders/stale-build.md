---
type: llm
---

PASS if the reply says that `npm run preview` serves the existing dist/ build, which does not contain the avatar change, so the app needs `npm run build` (or the dev server) before the avatar can be checked.
FAIL if the reply treats the running preview on port 4173 as showing the current code.
