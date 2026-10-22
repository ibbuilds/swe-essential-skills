# Gap coverage and readiness

Use this lens to audit a consequential plan or identify what blocks the next commitment. Do not ask every row as a question or require all details before the first experiment. For each material gap record its consequence, priority, owner/decision source, evidence needed and latest safe decision point. Record “not applicable” only where it prevents confusion, with a short reason.

| Concern | Look for | Resolve before |
| --- | --- | --- |
| Product discovery and strategy | Intended users, problem, current alternatives, rationale, hypotheses and success evidence | Committing substantial build effort to an untested interpretation of value |
| Product definition and UX | Core journeys, scope/non-goals, relevant failure states, accessibility and acceptance | Implementing behavior whose meaning or usability depends on the answer |
| Feasibility and constraints | Resource/time constraints, dependencies, build/buy/reuse choices, material technical unknowns | Selecting an expensive or hard-to-reverse solution |
| Architecture and integration | Boundaries, owners, contracts, compatibility, quality attributes under realistic conditions | Locking in dependent interfaces or structural decisions |
| Security and privacy | Trust boundaries, identities, authorization, sensitive data, abuse exposure, applicable obligations and review ownership | Choosing exposed interfaces, collecting data or making dependent design commitments |
| Data lifecycle | Meaning, ownership, retention/deletion, migration, concurrency and integrity, recovery needs | Choosing persistence semantics or irreversible transformations |
| Build and verification | Useful slices, dependencies, testable acceptance, environment and representative evidence | Calling a slice implementation-ready or declaring it complete |
| Deployment and transition | Target environment, authority, coexistence, migration/cutover, rollback limits and release checks | A design that constrains rollout, then actual release |
| Operations and evolution | Support ownership, observability, failure detection, recovery, operating cost and eventual retirement | Decisions that determine supportability, then service exposure |

Do not postpone a lifecycle concern solely because its execution happens later: retention can change storage design, recovery targets can change architecture, and deployment restrictions can rule out a dependency. Conversely, an exact dashboard layout or later backlog ordering need not block a prototype when no binding decision depends on it.

## An implementation-ready slice

Separate product readiness (a coherent problem, scope and intended outcome) from engineering readiness (enough contracts, constraints and evidence to implement the chosen slice). Report the relevant commitment as **ready**, **ready with explicitly accepted bounded risks**, or **blocked**, with the reason. Readiness for a disposable prototype does not imply readiness for production data or public release.

A slice is ready when the following are adequate for its risk, not when all future work is specified:

- Its purpose, user-visible behavior, bounds and observable acceptance are understood; material intent conflicts are settled.
- The design identifies relevant contracts, invariant owners and dependencies. No unresolved decision would make this implementation unsafe, unauthorized or substantially wrong.
- Applicable security/privacy, data-integrity and release/operating constraints are considered before they become expensive to reverse.
- Verification can distinguish success from failure using available evidence, or an explicit evidence-gathering step precedes the dependent work.
- Remaining unknowns are labeled with consequences and revisit triggers; user-owned decisions and risk acceptance come from the user or explicitly designated owner, not the assistant's assumption. Reversibility does not transfer decision ownership.
- The next action is authorized. Planning, coding, shared-document changes and deployment have distinct permission boundaries.

If readiness fails, name the specific blocker and continue independent work or propose a narrower slice/experiment. Do not hide a blocking unknown in a backlog, or demand certainty about all later slices. After completion, reconcile observed results with the plan before choosing the next commitment.
