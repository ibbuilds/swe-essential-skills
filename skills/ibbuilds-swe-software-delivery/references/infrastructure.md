# Infrastructure verification and change execution

Treat infrastructure code as both a proposed resource graph and a program with side effects. Read provider/tool versions, state/backend configuration, workspace/account/project/region and variables before selecting commands. Never infer the target solely from a directory or familiar workspace name.

## Choose the verification level

- **Static validation/lint:** checks syntax/schema or local policy; does not prove provider behavior, permissions or real resource availability.
- **Plan/mock test:** examines proposed changes or simulated behavior. A plan may still read remote state/data and run providers or external helpers; inspect these before execution. Mock success does not prove actual provisioning works.
- **Apply/integration test:** creates or mutates real resources unless explicitly isolated by the tool. It needs authority, an identified test account/project, cost/resource bounds and a cleanup procedure. A filename containing “test” is not evidence that it is non-mutating.

For Terraform, consult documentation for the installed version's test execution modes and provider mocking support. Do not assume `test` means plan-only or that every test supports the same mocks. Use the same discipline for other IaC systems; do not introduce Terraform into an unrelated project.

## Review the proposed change

Inspect replacements/deletions, network exposure, identity policies, secret handling, persistent storage, region/zone placement and lifecycle settings. Compare intended configuration with drift and current ownership. A seemingly small rename can replace stateful resources. Plan files/state may contain sensitive data: restrict handling and never upload them publicly.

Before authorized apply, confirm target identity through available read-only platform evidence, verify the planned revision/variables and account for intervening changes. Use the project's locking and approval mechanisms; do not force-unlock or import state simply to bypass an unfamiliar error.

If apply fails, inspect actual state and provider resources before retrying. Partial creation can leave billable or reachable resources even when the process exits nonzero. Determine whether to resume, repair state through the documented procedure, or clean up only resources whose ownership and authorization are established. Never blindly rerun a destructive plan or delete a shared resource because a test failed.

Verify effective access/networking and workload behavior after resource creation. For test cleanup, confirm deletion and persistent data retention decisions; report residue and cost/security exposure when cleanup is blocked. Destructive cleanup is not implicitly authorized by permission to inspect a plan.
