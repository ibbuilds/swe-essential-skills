---
name: swe-essential-skills-backend-engineering
description: Implement or change service APIs, message handlers and backend workflows with explicit validation, authorization, error, concurrency and transaction semantics. Use for backend behavior and integration failures; database schema and backfill work may also need data-specific investigation.
---

# SWE Essential Skills / Backend Engineering

Build the operation around its invariant and failure semantics, not only its successful response. Preserve existing protocols and project architecture unless the requested change requires otherwise.

## Trace the contract

Reuse an applicable request/message trace from this task; fill missing, stale or affected authentication, parsing, authorization, domain, persistence, external-effect and response/acknowledgment details. Scope discovery to the changed contract and plausible failure mechanisms: response-text edits need not retrace all callers; authorization, effects, concurrency or shared-boundary changes require the affected cross-boundary trace. Refresh relevant consumers, deployed versions and background callers where unknown or changed. Record the intended behavior delta: valid inputs, rejected inputs, output shape, errors, persistent effects and compatibility obligations.

Validate untrusted inputs at runtime with bounds on size, depth, formats and resource cost. Decide whether unknown fields are rejected or tolerated according to the existing protocol. Avoid passing user-controlled fields directly into persistence updates, queries, commands or remote destinations. Treat identifiers as references to authorize, not proof of access.

Authenticate the actor, then authorize the action on the specific resource and tenant using trusted server-side context. Scope reads, writes, lists and nested lookups consistently. When authorization, resource lookup, tenant scoping or an affected caller changes, verify access using a valid identifier belonging to another principal; reuse applicable coverage and results under the verification rules below. Random nonexistent identifiers do not exercise cross-tenant authorization. Do not expose internal errors or sensitive existence information contrary to the API contract.

For API evolution, errors, pagination and external integrations read [contracts and boundaries](references/contracts-and-boundaries.md).

## Own the invariant under concurrency

Name what must remain true, such as “inventory never becomes negative” or “one accepted operation produces at most one charge.” Identify the storage or coordinator that can enforce it. A process-local mutex is not a cross-instance guarantee. Prefer database constraints and atomic conditional writes for invariants they can represent; transactions require the correct isolation and conflict handling, not just a transaction wrapper.

Draw the commit boundary. Keep remote effects out of long-held database transactions where possible. An external API call and a database commit do not become atomic because they are adjacent in code. Specify durable intent, outbox/reconciliation or compensation when effects cross boundaries. Explain what a client should do after an ambiguous timeout.

For competing writes, retries, duplicate messages and partial failure, read [concurrency and delivery](references/concurrency-and-delivery.md) before implementing.

For changed collection-returning workflows, inspect whether datastore requests
scale per item or a proposed join multiplies returned rows. Choose appropriate
projection/loading or bounded batching without losing tenant scope, ordering or
consistency; neither one query nor maximum parallelism is always better.

## Bound resource use and make failure diagnosable

Use timeouts and cancellation supported by the actual runtime and client. Allocate an end-to-end deadline across dependencies rather than allowing each hop to spend the full request budget. Bound fan-out, queue depth, payload size and expensive work; reject or shed load according to the service contract rather than amplifying an overload with retries.

On event-loop or shared-thread runtimes, identify where parsing, serialization,
compression, IO and CPU loops actually execute; asynchronous syntax does not make
synchronous work nonblocking. For material input-dependent work, use appropriate
runtime APIs, bounded partitioning or an existing bounded worker facility as
justified. Account for worker startup, copying, queues, cancellation and ownership;
do not create one worker per item or apply event-loop advice to unrelated runtimes.

Capture enough structured context to distinguish validation, authorization, dependency, contention and internal failures. Use operation/correlation identifiers without logging credentials or full private payloads. Avoid high-cardinality identifiers as metric labels. Expose durable job status when acknowledgment precedes completion; do not label queued work as completed.

## Verify the state, not only the status code

Cover final changed behavior and plausible failure mechanisms, including rejection, duplication, concurrency and interruption where affected. Reuse task-local checks only when coverage and relevant code, configuration, data and environment remain applicable and required gates allow their freshness; a skill handoff is not a rerun trigger. Assert persistent state and external-effect count where those are the invariant. Use deterministic coordination where possible for concurrency tests; a sleep-based test that passes once is weak race evidence. Verify affected established consumers still parse responses and handle errors. Separate simulated dependency behavior from integration evidence against the real service.

Report the changed contract, actual checks, and any unsupported failure window or unverified integration. Installing this guidance does not authorize production calls, real payments or sending real notifications; use safe fixtures and existing approved test environments.
