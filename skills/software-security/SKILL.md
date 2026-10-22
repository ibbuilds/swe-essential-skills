---
name: software-security
description: Design, implement, or review security and privacy controls; investigate vulnerabilities and dependency risks using concrete trust boundaries and attack paths. Use for security-sensitive changes, not as a mandatory audit for harmless edits.
---

# Software security

Make the relevant abuse case harder to execute and show why the control works. Preserve the accepted system architecture unless it prevents the required security property. A skill, scanner result, or review does not certify compliance or grant access to systems or data.

## Locate the security decision

Use the affected implementation, its callers, configuration, tests, and relevant change history. Identify:

- **Asset and actor:** what must remain confidential, correct, or available; who can act, including anonymous users, another tenant, compromised clients, plugins, and operators when relevant.
- **Data flow and trust boundary:** entry point → parsing → identity/authorization → effect/storage → output/logging. Include background workers, exports, caches, local files, IPC, or device interfaces when they bypass the main request path.
- **Authority source:** where identity, ownership, roles, device trust, or signed metadata actually comes from. User-controlled fields and model output are not authority.
- **Failure property:** what must remain true when a dependency times out, credentials expire, input is malformed, or a check fails.

Keep this as a small working model for the change, not a full-system threat-model document unless the assignment warrants one. For a review, read [change-review.md](references/change-review.md). For exposed secrets, suspected exploitation, or dependency advisories, read [response-and-dependencies.md](references/response-and-dependencies.md).

When models consume retrieved/untrusted content or influence tool calls and consequential operations, read [model-tool-boundaries.md](references/model-tool-boundaries.md). Ordinary software changes do not require this path.

## Turn a threat into implementation

Choose controls from the actual path. When implementation or executable verification is within the requested scope and authority, check the attempted bypass as well as the permitted operation. A design or review request can instead produce proposed controls and evidence needs; do not silently turn it into remediation or live testing.

| Decision | Implementation reasoning | Useful verification |
| --- | --- | --- |
| Authentication | Reuse supported identity/session libraries and the platform's token-validation rules. Verify issuer, audience, expiry and algorithm/key handling where applicable; determine session revocation and credential-reset behavior. Authentication proves an identity, not permission. | Missing, expired and wrong-audience credentials fail without a protected effect; sensitive identity changes invalidate appropriate sessions. |
| Authorization | Derive tenant/owner from trusted identity and enforce operation-level permission at the authoritative boundary, including list, bulk, export and worker paths. Avoid fetching by unrestricted ID and trusting a client-supplied owner. | Two principals with distinct ownership: permitted access works; substituted IDs, nested objects and asynchronous paths cannot cross the boundary. |
| Input and output | Validate meaning, length and resource cost at ingress; use parameterized queries and context-appropriate output encoding at the sink. Canonicalize paths/identifiers before boundary checks using platform-supported APIs. Validation is not a replacement for safe APIs. | Inputs designed for the specific sink: query metacharacters, traversal/encoded variants, oversized or recursive documents, unintended URL destinations. |
| Side effects | Place security checks before irreversible effects; account for races between checking permission/state and modifying it. Use the transaction, locking or atomic interface appropriate to the invariant. | Concurrent requests cannot exceed a privilege or resource limit; denied requests cause no queued job, write, notification or information leak. |
| Secrets | Use existing secret injection/storage facilities; restrict access and lifetime. Do not bake secrets into artifacts, client bundles, fixtures, logs or command output. | Inspect the relevant built output/configuration and redacted logs, not only source. Rotation must update consumers and revoke the old credential. |
| Availability | Bound parsing, decompression, regex work, uploads, retries and fan-out. Rate/resource limits need a meaningful subject and failure behavior; arbitrary small limits can break valid users. | A bounded hostile input or load test in an authorized environment shows rejection or bounded resource use without harming unrelated work. |
| Privacy | Collect only needed fields; trace derived copies into analytics, logs, exports, caches and backups. Define access, retention and deletion behavior for the actual purpose. | Representative deletion/expiry/access checks cover secondary copies; evidence contains synthetic or minimized data. Explain any backup retention limits rather than promising instant erasure. |

For web paths, determine whether browser cookie authentication requires CSRF protection, whether output enters an HTML/URL/script context, and whether a server-side fetch can reach private services. For native/CLI/device paths, inspect file permissions, process arguments, command construction, update verification and privileged IPC instead of mechanically applying browser controls. Prefer established cryptographic implementations and protocols; get specialist review when protocol design, key lifecycle or platform isolation is the consequential uncertainty.

## Verify and communicate the boundary

Use synthetic principals, fixtures and isolated environments wherever possible. Do not upload code, tokens, production records or findings to a public service for convenience. Do not exploit a live target or expand investigation access merely to strengthen a finding.

For each material control or finding, retain the affected revision/path, attack preconditions, expected invariant, check/result, and remaining uncertainty. Distinguish an exploitable demonstrated path, a plausible untested path, and hardening advice. A clean scan does not prove missing authorization is absent; passing denial tests does not prove every caller is covered.

If verification is blocked, name the specific unverified boundary and the capability needed. Finish useful implementation/static review without representing the system as secure. Prioritize fixes by reachable impact and exposure, not scanner severity alone; do not suppress a finding without the evidence and conditions that justify suppression.
