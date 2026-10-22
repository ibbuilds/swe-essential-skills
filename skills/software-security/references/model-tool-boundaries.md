# Model-mediated actions and untrusted context

Use for affected model/tool boundaries, not as a required agent architecture or
proof of model quality. Reuse the application's authorization and safe-sink controls.

## Trace the consequential path

Follow authenticated caller → retrieved/context inputs → proposed tool/arguments →
execution handler → effect and output. Identify attacker-controlled documents,
tool definitions/results and persisted context where used. Formatting, delimiters,
filters or instructions to ignore attacks are not an authorization boundary.

## Enforce authority outside generated content

Carry actor, tenant and granted task scope in trusted application context. Do not
accept their authority, approval flags or policy exceptions from model-generated
arguments. At execution, authorize the particular operation and referenced objects;
preserve the system's accepted authorization-timing rules for delayed work.
Schema-valid arguments can still request an unauthorized effect.

Resolve tools through the permitted application registry and validate the actual
normalized operation: identifiers, destinations, paths, payload and resource cost.
Use safe query, filesystem and network APIs rather than executing generated
commands as a shortcut. A nominally read-only fetch/search can disclose data in
its arguments; include outbound disclosure in the permission decision.

## Preserve the actual approval scope

Where the accepted risk policy requires confirmation, present the real target
and material parameters, not just a model-written description. Bind the decision
to the authenticated actor and authorized operation/parameters, identity and
validity conditions. A generated confirmation flag is not approval. Reject a
changed request outside the grant; preserve valid standing or bounded authority
without adding repeated confirmations. Where single-use approval is required,
atomically validate and consume it before execution; reject missing, expired or
replayed grants. Retries and unknown
outcomes still need the existing idempotency/reconciliation mechanism; approval
does not prove an effect already happened or authorize duplicate execution.

## Keep data from becoming authority

Apply caller/tenant access rules before assembling retrieved or persisted context.
Validate tool-return structures and preserve source/trust distinctions. An
authenticated source or successful tool result may supply facts, but embedded
prose cannot change permissions, tool registration or approval policy. At output
sinks, apply appropriate encoding, sanitization and destination restrictions,
including generated links/images when they can disclose data or execute content.
Keep credentials and unnecessary sensitive prompt/response content out of logs.

## Establish what the checks prove

Within authorized verification scope, use synthetic principals and instrumented
tool substitutes. Supply adversarial proposals directly to the dispatcher to
check cross-tenant references, forbidden destinations, substituted parameters,
missing/replayed approval and valid allowed operations independently of the model.
Observe attempted/dispatched calls, dummy outbound data and state changes, not
only final refusal text. Select cases relevant to the changed boundary and reuse
applicable evidence; this is not a required live-model campaign.

Those checks establish only the exercised application controls. If model-level
integration evaluation is separately authorized, introduce untrusted instructions
through the real retrieved/tool-return channel and inspect actual effects.
Missing telemetry is an evidence limit. Neither schema validation, a clean
scanner nor a few successful refusals establishes injection resistance or overall
model effectiveness. No new model judge, firewall service or multiagent system is
required merely to apply this procedure.
