# Contracts and external boundaries

## Design the wire behavior

Use the project's transport conventions rather than assuming every API is HTTP/JSON. For each operation define required/optional fields, units, identifiers, null/absent semantics, ordering, limits and error categories. A field addition can still break strict decoders; enum expansion can break exhaustive clients. Inspect actual consumers and compatibility policy before describing a change as additive and safe.

Separate malformed input, failed preconditions, authorization failure, resource absence, conflict, rate limiting, transient dependency failure and internal failure. Map them to the protocol's existing statuses/codes. Provide stable machine-readable categories and safe human context; do not make clients parse changing exception text. Retry advice must match operation safety. Distinguish a request that was rejected before execution from one whose outcome is unknown.

For list operations, define stable ordering with a unique tie-breaker and maximum page size. Offset pagination can skip or duplicate records during mutation; cursor pagination requires a defined ordering and consistency expectation too. Ensure the cursor cannot widen tenant scope or bypass filters. Do not promise snapshot consistency unless the implementation actually supplies it.

## Failure after a response starts

For streaming responses or work continuing after acknowledgment, identify when status/headers become committed and whether success means acceptance or completed work. A later exception may reach a server error handler without replacing the response already received by the client. Define the appropriate late-failure signal, incomplete-stream behavior or operation-status/reconciliation path where the product contract requires one. Check relevant faults before and after commitment; handler invocation alone does not prove the client received an error. Reuse supported protocol behavior; do not introduce queues or status APIs for incidental best-effort work.

## External integrations

Inspect the supported client/provider version and official contract for timeout, retry, pagination, rate limits and idempotency behavior. Do not invent headers, error codes or guarantees from familiarity with another provider. Validate remote responses and constrain permitted destinations for user-influenced fetches. Keep credentials server-side and grant only the needed capability.

Separate transport failure from domain rejection. A timeout may occur after the provider committed the action. If the provider exposes a stable operation lookup or idempotency key, persist the identity before initiating the effect and use it for reconciliation. Without such a mechanism, report the ambiguity and design a safe manual or automated resolution instead of blindly retrying.

Verify inbound webhook authenticity with the provider's documented canonicalization and replay rules before processing. Signature validity authenticates the sender, not the event's uniqueness or its relevance to the current account. Store event identity or a durable equivalent, authorize account association, and acknowledge only at the point the delivery contract permits. Keep raw signed bytes when required for verification, without unnecessarily retaining sensitive bodies.

## Illustrative compatibility branch

An API changes money from a floating number to minor-unit integers. Renaming the field alone is not sufficient: consumers need currency, scale and rounding rules, and persisted values may require explicit conversion. If old clients coexist, introduce a separately defined representation or version and verify round trips with boundary values. Do not infer conversion precision from a generic “currency has two decimals” assumption.

## Failure diagnosis

- A valid request fails only for one tenant: inspect scope propagation and row-level permissions before weakening authorization.
- Latency spikes while CPU is low: compare connection-pool wait, lock wait, downstream latency and queue delay; adding instances can worsen database pressure.
- Clients repeatedly submit after a timeout: inspect whether the service commits before the response and whether operation identity survives reconnects. Increasing the timeout may hide but not solve duplicate effects.
