---
name: security-review
description: 'Security review that proves each finding with an exploit path. Use when the user asks "is this secure", "security review", "can someone access...", or the code touches auth, sessions, permissions, secrets or API keys, payments or webhooks, uploads, or user input reaching queries, even when the change looks small or a fix seems to close the issue. For ordinary bugs use debug.'
metadata:
  type: technique
---

**Security review** means tracing every path an attacker controls to a protected effect, and reporting a finding only with the attacker, their preconditions and the exploit.

## Process

1. **Map the surface.** List every entry point that reaches the asset in question: routes, webhooks, jobs, list, bulk and export endpoints, client bundles and environment variables. Done when each path is listed with what it protects.
2. **Check each path against the checklist below.** Done when every row is checked or marked not applicable.
3. **Try to exploit each candidate.** Name the attacker, what they need, what they send and what happens. A candidate without a buildable path is hardening, not a finding. Done when every finding has preconditions and an exploit.
4. **Report** with the template, most severe first.

| Area | Look for |
| --- | --- |
| Authentication | Tokens verified for signature, issuer, audience and expiry. Webhooks verify the provider's signature on the raw body. |
| Authorization | Owner or tenant taken from the trusted session and enforced on every path to the data: by id, list, bulk, export and background jobs. |
| Input to sink | Parameterized queries, output encoded for its context, paths canonicalized before checks, size and depth bounded. |
| Secrets | Never in client-exposed variables (`NEXT_PUBLIC_`, `VITE_`, `REACT_APP_`), bundles, logs, fixtures or error messages. |
| Side effects | Permission checked before irreversible effects; no race between the check and the write on limits or balances. |
| Availability | Bounded uploads, parsing, decompression, regexes, retries and fan-out. |
| Privacy | Personal data copied into logs, analytics, exports or caches only when needed. |

<security-findings>
### 1. <title> (Critical | High | Medium | Low)
**Where:** `<file:line>`
**Attacker needs:** <preconditions, for example "any logged-in user" or "knows the webhook URL">
**Exploit:** <what they send> → <what happens>
**Fix:** <the change>

**Checked, no finding:** <areas and paths that were clean>
**Hardening without an exploit path:** <optional>
</security-findings>
