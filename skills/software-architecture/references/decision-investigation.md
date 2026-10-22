# Investigate a design decision

## Bound the unknown

Write the decision in operational terms: “Can the existing process handle this workload without breaking its latency requirement?” is testable; “Should we modernize?” is not. Inspect current measurements, dependency constraints and failure reports before creating a prototype.

Choose a distinguishing experiment, with a stopping condition tied to the decision. A prototype may measure an upper bound or prove integration feasibility; explicitly exclude what it cannot establish (production authorization, long-term maintainability, representative scale). Use synthetic or approved sanitized data and avoid real side effects. Record environment, workload, revision, observations and limitations. Discard prototype shortcuts rather than silently promoting them to production architecture.

## Evaluate options

For each viable option explain:

- Which hard constraints it meets or fails; reject a hard failure before ranking aesthetic benefits.
- What changes in consistency, latency, availability and isolation under the actual failure model.
- Which operational burdens appear: credentials, queues, backups, deployments, on-call diagnosis, upgrades and vendor limits.
- The migration path, reversibility, and cost of being wrong.

Do not use unweighted numeric scores as authority. If uncertain measurements determine the winner, report that uncertainty instead of manufacturing precision. A reversible local decision generally needs less evidence than a persistent public contract or data partitioning choice.

## Compare build, buy and reuse over the same lifecycle

Use this comparison when ownership or sourcing materially affects feasibility or cost; do not produce a financial worksheet for every local design. Include extending an existing capability and a minimal baseline, not only a new build versus a vendor. First test hard constraints: required behavior, integration, licensing, data control, security, portability, available expertise and supported operating conditions. A cheap option that cannot meet a required invariant is not viable.

Set a common workload, service level, adoption scope and useful evaluation horizon with the owner. Keep cash costs, engineering effort and capacity requirements distinct unless an approved conversion is available. For each viable option account for:

- Initial implementation or integration: adapters, validation, test infrastructure, training and procurement/onboarding effort where relevant.
- Migration: data conversion, consumer updates, coexistence, reconciliation, cutover and the cost of retaining a fallback.
- Ongoing operation: workload-dependent usage, storage/transfer, observability, backups, upgrades, security maintenance and capacity management.
- Support: incident response, vendor escalation, internal expertise, contractual coverage and the consequences of gaps in that coverage.
- Exit: extracting usable data, replacement integration, contract termination conditions, consumer migration and removal of abandoned infrastructure.

Use sourced quotes, current verified terms, measured usage and comparable internal work where available; record their date, scope and exclusions. Never invent vendor prices, contractual guarantees or team productivity. Give low/plausible/high ranges only when their assumptions have a basis; otherwise mark the missing estimate explicitly. Do not disguise uncertain engineering-days estimates as precise currency totals. Separate one-time costs from recurring costs and avoid counting the same team effort twice.

Tie benefits to evidence: observed incident/toil reduction opportunities, a representative performance experiment, demonstrated compatibility or an accepted requirement that becomes feasible. A claimed delivery acceleration is a hypothesis until dependencies and staffing support it. Include disbenefits such as increased on-call ownership, vendor dependence or lost debugging visibility. Do not assume reuse is free, buying transfers operational accountability, or building guarantees future flexibility.

Test sensitivity to assumptions that could reverse the choice: workload growth, usage tier, integration difficulty, staffing, migration duration, support needs or early exit. Explain the approximate break-even condition only if the evidence supports calculating one; otherwise identify the missing input that determines it. Check feasibility as well as totals: an attractive long-run cost cannot solve unavailable expertise or an impossible migration window. Prefer a bounded spike, trial or verified quote to a broad build when it would resolve the decisive uncertainty, within authorization and without unapproved spending.

Leave the recommended engineering option, alternatives rejected on hard constraints, lifecycle cost/benefit evidence, uncertain assumptions and a concrete reconsideration trigger. This is an engineering sourcing decision, not investment, tax or financial advice. State projections separately from observed costs and benefits.

## Illustrative branches, not tested outcomes

### Export request exceeds request lifetime

An application currently generates exports synchronously. First distinguish query inefficiency from an inherently long workload. If an index or streaming response meets the existing contract, a queue may be unnecessary. If the work must outlive the request, specify job ownership, authorization on submission and retrieval, progress states, retention and duplicate submission behavior. A queue shifts failure semantics: workers can crash after producing an artifact but before acknowledging work. Define the durable job/artifact identity and recovery before selecting the broker.

### New service proposed for a small internal feature

If the same team owns the feature, releases it with the application, and must transact against the same records, a module may preserve invariants with less operational burden. A separate service becomes defensible when independent scaling, isolation, ownership or release cadence outweigh remote-call and consistency costs. Write the concrete pressure and what would trigger extraction later; do not build a remote abstraction solely for a hypothetical future team.

### Offline field client synchronizes edits

“Last write wins” loses meaningful concurrent updates unless the domain permits that loss. Identify which fields can merge, which operations commute and which conflicts need user resolution. Use stable operation identities across reconnects; decide tombstone retention and stale-client behavior before promising deletion synchronization. Verify replay, reordering, a device returning after a long absence, and revoked access—not only online edits.
