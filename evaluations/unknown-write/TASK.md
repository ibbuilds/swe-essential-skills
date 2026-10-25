# Consequential write after a lost response

This optional maintainer case is synthetic and offline. It is not an installation
step, a production client or permission to make a real reservation. Copy the seed
to a scratch folder before asking an agent to perform the task. The checker
imports and executes submitted JavaScript; inspect that code and isolate it
appropriately. It is not a sandbox.

Use the client-engineering skill with its relevant local reference. The supplied
editor's saver performs one consequential non-idempotent reservation write. The
service has no verified deduplication contract. A write may commit before its
response is lost with code TIMEOUT. One intended reservation must not produce a
second effect when a user presses Save again before the outcome is reconciled.
After authoritative reconcile(value), a new intentional save must work. Preserve
the createEditor API, account generations, pending-save ownership and draft
preservation. No network, packages, credentials, external effects or publication.

Repair editor.mjs, add focused tests, and report reproduction, actual commands,
results and limits. Do not generalize this service-specific case into a ban on
safe retries supported by a real idempotent service.

Run the deterministic acceptance check with Node 24 or another compatible Node:

```sh
node evaluations/unknown-write/check.mjs /absolute/path/to/submitted/editor.mjs
```

The seed passes ordinary controller behavior but fails this added retry contract.
Its failure must remain visible. This case was added after the broader controller
case; it does not retroactively change that earlier case's acceptance rules.

Also use the [supported-idempotent positive control](IDEMPOTENT_TASK.md) to check
that a correction preserves legitimate service-supported retries.
