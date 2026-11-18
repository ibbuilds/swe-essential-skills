---
name: security
description: 'Security review of a named surface that proves each finding with an attacker path. Use when the user asks "is this secure", "can someone access...", "could a user see another user''s...", "anything I should worry about", or before launch of code touching auth, sessions, permissions, secrets, payments or webhooks, uploads, user input reaching queries, or an LLM that reads untrusted text or calls tools, even when the change looks small or a fix seems to close the issue.'
metadata:
  type: technique
---

**Security review** traces every path an attacker controls to a protected effect, and reports a finding only with the attacker, their preconditions and a working exploit.

## Process

1. **Map the surface.** List every entry point that reaches the asset in question, not just the file shown: routes, webhooks, background jobs, list, bulk and export endpoints, admin tools, client bundles, environment variables, and for LLM features every place untrusted text enters a prompt and every tool the model can call. Done when each path is listed with what it protects.
2. **Check each path against the table.** Done when every row is checked or marked not applicable.
3. **Prove each candidate.** Name the attacker, what they need, what they send and what happens. Where you can run it, prove it: a failing test, a `curl`, a script. A candidate without a buildable path is hardening, not a finding. Done when every finding has preconditions and an exploit, run or written out.
4. **Report** with the template, most severe first, including what was checked and clean.

| Area | Look for |
| --- | --- |
| Authentication | Tokens verified for signature, issuer, audience and expiry. Webhooks verify the provider's signature on the raw body. |
| Authorization | Owner or tenant taken from the trusted session, never the request, and enforced on every path to the data: by id, list, bulk, export, jobs. |
| Input to sink | Parameterized queries, output encoded for its context, paths canonicalized before checks, server-side fetches limited to allowed hosts (SSRF), size and depth bounded. |
| Secrets | Never in client-exposed variables (`NEXT_PUBLIC_`, `VITE_`, `REACT_APP_`), bundles, logs, fixtures, error messages or prompts. |
| Side effects | Permission checked before irreversible effects; no race between check and write on limits or balances; idempotency keys on retried payments and webhooks. |
| LLM and agents | Untrusted text (user input, web pages, emails, files, tool results) cannot trigger tools with side effects without a check outside the model. Tool permissions are the least the feature needs. Model output is validated before it reaches SQL, shell, HTML or another tool. Cost and recursion are bounded per user. |
| Availability | Bounded uploads, parsing, decompression, regexes, retries and fan-out. |
| Privacy | Personal data copied into logs, analytics, prompts sent to third parties, exports or caches only when needed. |

<security-findings>
### 1. <title> (Critical | High | Medium | Low)
**Where:** `<file:line>`
**Attacker needs:** <preconditions, for example "any logged-in user" or "can put text in a support ticket the agent reads">
**Exploit:** <what they send> → <what happens>. Proven by: <test or command and its output> | written out, not run
**Fix:** <the change>

**Checked, no finding:** <areas and paths that were clean>
**Hardening without an exploit path:** <optional>
</security-findings>
