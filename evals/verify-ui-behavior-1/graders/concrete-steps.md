---
type: llm
---

PASS if the reply gives the user a concrete check that names the exact local URL of the page (http://localhost:3000/settings/profile, from the Vite port and the router), the action to take, and what to watch in the console or the network panel (the PUT /api/profile request).
FAIL if any of the URL with its route, the action, or the console or network check is missing.
