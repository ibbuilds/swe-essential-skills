# Review lenses and acceptance controls

Read for the affected boundary or changed acceptance control, after establishing
the concrete revision and input path. Apply the relevant lenses to that path.

Use several lenses on this traced path, proportionate to its risk:

- **Behavior:** boundary values, missing/invalid input, state transitions, error propagation, ordering, cancellation, and resource cleanup. For timeouts, determine whether the operation actually stops or merely stops waiting; a caller retry after a committed side effect can duplicate work.
- **Contracts and architecture:** compatibility with supported clients, ownership boundaries, transaction scope and recovery. Trace old persisted records through new readers and new records through older readers where rollback or rolling deployment requires it. Consider mixed application revisions, queued old events, caches, migration ordering, and defaults, not only a fresh installation.
- **Security:** follow changed trust boundaries and sensitive flows; check whether real callers can bypass the assumed guard or broaden access. State a reachable abuse condition rather than reporting suspicious syntax alone. A deeper audit may be needed; this review is not one by implication.
- **Performance:** relate added work to input size, concurrency, hot-path frequency and resource limits. Show why a query-per-item, retained buffer, blocking operation, or unbounded retry is consequential in this context. Do not label unfamiliar code slow without a plausible mechanism; measurements may remain required.
- **Maintainability:** look for conflicting sources of truth, hidden coupling, unclear ownership or misleading control flow that materially increases error risk. Explain the concrete maintenance consequence and a focused improvement; personal naming or architectural preferences are not defects.

Inspect tests as evidence of these contracts, not simply as present or absent. Determine whether their setup reaches the changed path and whether their assertions would detect the proposed failure. Recommend a specific missing scenario when it matters; do not demand an arbitrary coverage percentage or reproduce the entire verification workflow.

When tests, acceptance budgets, CI gates, exclusions or waiver records change,
compare their meaning with the accepted baseline. Look for lost assertions,
skipped/deleted checks, broader suppressions, relaxed thresholds or new exceptions.
Distinguish an equivalent or stronger replacement and an authorized requirement
change from unapproved weakening. Explain the concrete guarantee lost; a removed
assertion or a matching keyword alone is not a defect. Green checks do not prove
the original acceptance bar survived. Unchanged controls need no new audit.

