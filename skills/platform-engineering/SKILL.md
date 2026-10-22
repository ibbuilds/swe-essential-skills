---
name: platform-engineering
description: Select and build hosting foundations for applications and jobs, including environment isolation, compute, network paths, identity, durable storage and bootstrap verification. Use for hosting/platform setup or infrastructure design, not routine release execution or ongoing incident response.
---

# Platform engineering

Turn the workload's requirements into a reproducible hosting foundation that can actually run it. Own the concrete resource relationships and bootstrap path; do not mistake an architecture diagram or successful infrastructure plan for a working environment.

## Establish the target

Inspect the workload entrypoints, build/runtime contracts, dependencies, existing infrastructure and ownership before choosing a host. Separate request-serving processes, workers, scheduled jobs, static assets and authoritative state. Identify expected traffic/bursts, latency and availability needs, data residency, recovery expectations, budget, team operating capacity and existing platform commitments. Local-only software may need artifact distribution rather than an always-on server.

Resolve unknowns that change isolation, exposure, irreversible data placement or material spend. For analysis or routine details within agreed choices, state bounded assumptions. For unresolved consequential hosting, region, exposure or cost choices, explain the options and obtain the user's or designated owner's choice before dependent implementation; reversibility is not acceptance. Do not invent acceptable data loss, public access, paid subscriptions or permission grants.

- For choosing or changing a hosting model, read [platform selection](references/platform-selection.md).
- For building the environment or diagnosing first-deployment connectivity/startup failures, read [bootstrap and network verification](references/bootstrap-and-network.md).

## Make the foundation implementable

Produce the smallest useful resource graph, configuration and verification procedure appropriate to the request. Name the account/project/environment, region, owner and lifecycle of each resource. Edges specify both connectivity and authority: who calls whom, over which endpoint/protocol, using which workload identity and permitted operation. Include DNS/TLS, runtime, configuration/secrets, persistence, dependency connections and the management path when applicable.

Use existing provisioning tools and conventions. Before writing executable provider configuration or commands, consult current primary documentation for the actual provider, service tier, region and tool/provider versions; record consequential constraints near the implementation. Do not freeze a remembered service limit into a universal rule. Pin reproducible inputs where supported and keep secret values out of source, output and state artifacts shared with others.

Build and validate in dependency order. Avoid circular bootstrap dependencies such as requiring a runtime secret store to provision its own access identity. Prefer a thin end-to-end slice over building unused platform abstractions. Distinguish configuration authored, statically checked, provisioned and behavior verified.

## Execution and boundaries

This skill does not grant cloud access or authority to create billable resources, expose services, alter DNS, grant credentials or destroy infrastructure. Before live changes establish the exact target, permitted actions, cost bounds and retention/cleanup decisions. Use the project's delivery process for plan review and apply execution; inspect partial state after failure rather than blindly repeating creation. A denied action remains blocked unless materially new relevant evidence changes the authorization decision. Report the blocked action, target, reason and current status, then continue independent work.

Keep responsibilities clear without requiring other skills to be installed: architecture owns system-level boundaries and tradeoffs; delivery owns release and infrastructure-change execution; operations owns ongoing health, incident response and restoration exercises; security owns specialized threat analysis and hardening. This skill supplies and verifies the hosting foundation those workflows consume. Seek relevant specialist review for regulated residency, complex enterprise routing/identity, unusual cryptographic custody or high-consequence availability claims; do not claim certification from a configuration review.

## Handoff

Leave configuration and resource ownership, actual versions/targets, verified network and application paths, evidence of denied unintended access, unresolved checks and the next responsible owner. Include runtime patch ownership, certificate/secret rotation, backup/restore ownership, quota and spend signals, drift detection, and replacement/decommission dependencies. State whether recovery was exercised or only configured. Never describe an unprovisioned design as deployed, or a reachable health endpoint as proof of durable application behavior.
