# Build and prove the hosting foundation

## Turn the resource graph into bootstrap order

Write down prerequisites and owners before commands. A typical dependency chain is account/region and quota eligibility → network/resolution and identity → storage/secrets/artifact access → runtime → routing/certificates → intended client path. Adapt it: a managed service may supply networking and TLS, while a VM needs explicit process supervision and host administration. Certificates and DNS can have their own verification dependencies.

For each node record the desired configuration, prerequisite, output consumed by the next node, observation proving readiness and retention rule. Distinguish resources created here from shared resources merely referenced. Keep environment-specific identifiers explicit; check effective target identity before applying. Reconcile import/adoption of existing resources through the project's process, not opportunistic recreation.

Bootstrap administrative access through an approved management path. Do not open SSH or a database to the internet to make setup easy. Establish a recoverable management channel before restricting the existing one, without inventing a new permission grant. Keep temporary access scoped, owned and expiring; removal needs verification. Where IaC state storage or its identity must be initialized separately, document that small bootstrap boundary and how later changes are managed.

## Define the packet and identity paths

For each required flow, record source workload/client, destination name, resolved address scope, port/protocol, route, filtering layers, TLS termination and authorization. Include outbound dependencies: registry/image pull, identity tokens, secret retrieval, DNS, telemetry and external APIs. Application ingress working does not prove a worker can resolve or reach its database.

Choose public, private or authenticated edge exposure from the actual caller requirement. Design the approved public edge without unnecessarily exposing origins or state stores. Verify provider default URLs and alternate paths cannot bypass required edge controls. A private address does not itself establish authorization. NAT is neither a substitute for service identity nor a universal requirement for private workloads; use the platform's documented egress/private-endpoint model.

Check overlapping address ranges and both request and return routes for peering, VPNs and hybrid networks. Routing, firewall policy and endpoint authentication are separate gates. Provider semantics matter: [AWS route tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html) choose traffic paths, while [security groups and network ACLs](https://docs.aws.amazon.com/en_en/vpc/latest/userguide/infrastructure-security.html) differ in scope and statefulness. On that platform, stateless ACL return-traffic rules can explain a failure despite a permissive stateful security group. Do not generalize those exact semantics to another provider.

Own DNS delegation and record lifecycle, including split-horizon answers, IPv4/IPv6, TTLs and stale caches. Before a cutover, test the new destination with the intended hostname and TLS server name, without changing global DNS. Define certificate issuer, names, validation path, renewal actor and where the renewed certificate is loaded. [ACME challenge selection](https://letsencrypt.org/docs/challenge-types/) affects that design: HTTP-01 requires its reachable challenge path on port 80 and does not issue wildcards; DNS-01 supports wildcard validation and can avoid exposing the application for validation, but requires safely scoped DNS automation. Do not open a private application merely to obtain TLS. Monitor renewal failure and expiry, not only initial issuance.

## Make the runtime and state survive ordinary lifecycle events

Use an immutable identified artifact where practical. Specify supported architecture/runtime, entrypoint, listening address/port, working directory, runtime user, writable paths, resource bounds and shutdown behavior. Separate build-time variables from runtime configuration. Verify how the selected host injects configuration and secrets, how rotation takes effect and which actor retrieves them. Prefer supported workload identity to embedded long-lived keys; check issuer/audience/trust and resource permission separately. Do not print credentials while proving access.

For a VM, establish the approved OS image, patch owner, supervised service definition, boot ordering, restart/backoff, log collection and disk lifecycle. For managed compute, check its documented startup deadlines, concurrency, termination, request/job lifetime and background execution. A process listening only on loopback may be unreachable by the platform ingress; use the service's documented binding contract, not a blanket rule to expose all interfaces. Startup probes should accommodate actual initialization; readiness should control acceptance of work, and liveness should not restart healthy processes solely because a dependency is unavailable.

Place authoritative data on storage with the required durability and access semantics, not an assumed persistent container filesystem. Specify database/object/volume ownership, encryption/key availability, schema bootstrap, connectivity, connection budgets, backup retention and deletion protections. A mounted volume still requires verification of attachment mode, permissions, failover and lifecycle. Do not run competing schema migrations in every replica's startup unless the migration system explicitly handles that coordination. Record restore prerequisites and an isolated restore-verification plan; ongoing recovery exercises belong with operations.

## Verify from the failing boundary inward

Use a permitted diagnostic point in the same network and identity context as the real caller. A successful laptop request is not proof of runtime connectivity. Prefer narrow, nonmutating probes, redact output and bound timeouts. Do not scan unrelated addresses or disable controls to find out whether they matter.

| Evidence or symptom | Next discriminating check |
| --- | --- |
| Provisioning failed or resource missing | Inspect provider operation events, actual partial resources, region/quota and target identity before retrying. A nonzero apply can still leave resources. |
| Artifact not starting | Separate image retrieval/authentication from process failure; inspect artifact digest/architecture, startup logs, entrypoint, runtime config and termination reason. |
| Name not resolving or wrong address | Compare resolver and authoritative answers from the intended caller; inspect private-zone association, record/delegation and address family. Do not alter firewall rules for a DNS error. |
| Connection timeout | Confirm selected destination and listener, then route/return route, filter decisions and platform ingress policy. A timeout alone does not identify which gate dropped traffic. |
| Connection refused | Check listener/port and process readiness plus active rejection at intermediaries; it is not proof of a DNS failure or bad credentials. |
| TLS negotiation/validation fails | Check intended hostname/SNI, certificate chain/names/expiry, client trust and termination-to-origin protocol. Do not use disabled verification as the production fix. |
| HTTP 401/403 | Identify which proxy/application produced it; check caller identity, token audience and operation permission. Do not grant administrator rights as a diagnostic. |
| HTTP 404/502/503 | Identify responding hop, host/path routing, backend target/protocol and readiness; these statuses do not uniquely establish an application bug. |
| Health succeeds but real work fails | Exercise the dependency path with the actual workload identity; check database auth/schema, secret version, egress, connection limits and durable effects. |
| Works once, fails after replacement or scale-out | Check local-only state, config/secret availability, startup races, connection multiplication and shutdown/draining. |

Prove successive claims: resource exists → artifact starts → correct listener is ready → intended caller completes authenticated transport → representative operation uses dependencies → expected state persists across an authorized replacement/restart test. Include a denied unintended caller/path where required. Run live end-to-end writes or replacement tests only within explicit authority and bounded test data; otherwise state those claims remain unverified. Never equate provider status “healthy” with application correctness.

## Close the bootstrap loop

Leave resource identifiers, ownership, configuration source, approved access route, observed checks and residual risks. Assign quota/spend monitoring, drift review, patch/rotation work and backup/restore ownership. Inventory temporary endpoints, credentials, test data and billable resources; remove only when authorized, respecting shared ownership and retention. For decommissioning, trace consumers first, preserve required data, then retire traffic/identity/resources in dependency order and verify DNS references and billing residue. A failed cleanup is an open action with a named target, not a successful teardown.

## When the hosting environment itself is lost

Use this path when the required recovery scenario includes loss of the account, region, cluster or host foundation—not merely an application process. Identify what remains accessible independently of that environment: protected infrastructure configuration/state, artifact digests and retrievable artifacts, dependency inventory, DNS ownership, backups and key/access recovery procedures. A backup inside the same inaccessible boundary may not support this scenario. Establish these recovery prerequisites before claiming the scenario is covered; do not introduce multi-region infrastructure unless the actual requirement warrants it.

Regain approved administrative/workload identity and decryption-key access through the documented recovery process, without broadening privileges or bypassing a denial. Confirm an authorized replacement target with suitable residency, service availability, quota and capacity; a nominally supported region does not prove resources can be allocated there now. Reconcile surviving resources and infrastructure state before rebuilding so reconstruction does not replace recoverable data or duplicate shared services.

Rebuild the foundation from protected inputs in dependency order, then restore dependencies and mutually consistent application data using their documented recovery procedures. Rebind environment-specific endpoints and identity references deliberately. Keep traffic and producers isolated while checking authentication, dependency access, restored data invariants and a representative critical operation; verify required durable effects, not just health endpoints. Before authorized cutover, establish the recovery point, account for writes/external effects since that point, prevent competing old writers, and define a safe response if validation fails. Record actual restoration time and any unproven prerequisite; retain surviving sources until the recovery and retention decision permits removal.
