# Positive control for a supported retry

This is a separate synthetic service contract, not an extension of the
non-idempotent saver. The trusted caller supplies operationId and payload. The
service guarantees that repeated ID/identical payload returns the original
result without another effect. Reusing that ID with changed payload raises
INTENT_MISMATCH. New intent has a new caller ID. A first response can be lost
after commit with TIMEOUT.

Implement send(service, operationId, payload), one attempt per invocation,
preserving the supported user-triggered retry after an unknown response.
Do not silently generate another identity, block this verified retry or add a
new cache/framework. Use only a scratch folder and local standard-library tests;
no network, credentials, actual reservations or model API calls.

Replay the positive acceptance control with:

```sh
node evaluations/unknown-write/check-idempotent.mjs /absolute/path/to/submitted/client.mjs
```

Like the other checker this imports submitted JavaScript, is not a sandbox, and
must be used only after source inspection in an appropriately isolated context.
