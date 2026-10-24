# Optional SQLite notes acceptance case

A small, locally authored, synthetic engineering exercise for maintainers: migrate
SQLite v1 to v2, preserve legacy consumers, scope access by a trusted principal,
and handle rollback and caller-owned transactions. This is **not** part of skill
installation or runtime instructions. No model launcher, paid calls, network,
third-party dependencies, or orchestration framework is included.

## Use

1. Copy `seed/` to a disposable working directory; never implement in the seed.
2. Give an already-authorized agent the complete [TASK.md](TASK.md), the copied
   seed, and access to [check.py](check.py). Send the planning request first, then
   the implementation request after the planning turn. The planning turn allows
   file inspection but no Python or database mutation. The full contract and all
   packaged checks are public; there are no hidden business rules.
3. Inspect the final diff, `PLAN.md`, `DELIVERY.md`, and the agent's own tests.
   In an appropriate isolated environment, run the following (substitute paths):

   ```sh
   cd /absolute/path/to/disposable-working-directory
   python -B -m unittest -v test_smoke test_notes
   python -B /absolute/path/to/evaluations/sqlite-notes/check.py ./notes.py
   ```

The checker uses Python's standard library and SQLite, exercising synthetic
in-memory databases and a temporary on-disk database. It returns 0 only when all
12 required checks execute and pass; nonzero means failure, a load error, or a
checker error. Missing/invalid candidates, import-time `SystemExit(0)`, and zero
or partial check execution must not be treated as acceptance. The seed is
intentionally incomplete and must fail before implementation. The checker disables
bytecode-cache writes during candidate loading/checking, even without `-B`, and
restores the prior setting when called as a function.

**This is not a sandbox.** Importing and checking a candidate executes its Python
code with the reviewer's permissions. Review it first and use an appropriately
isolated environment without credentials or valuable data. The checker does not
isolate malicious code, prevent side effects, enforce filesystem/network limits,
or provide security certification. The task's restrictions are instructions,
not a security boundary implemented by this checker.

## What the checks establish

The 12 tests cover migration preservation/defaults/constraints, idempotence,
callback success and failure rollback/retry, unsupported migration versions,
tenant-scoped reads and writes, principal and note-ID validation, v1 API refusal,
caller-transaction ownership, and persisted archive changes. They sample the
public contract rather than prove it for every input. Planning-only compliance,
quality of tests/delivery notes, and all remaining contract details require human
review. No authentication, production restore, concurrent rollout, schema
downgrade, hostile database, or malicious-code guarantee is claimed.

## Provenance and observed result

The synthetic task, seed, and 12 contract checks were authored locally for the
2026-10-24 engineering-lifecycle comparison. Both frozen implementations passed
these 12 checks and three additional independent public-contract probes. That
was a **scoped tie**, not evidence of superiority, token savings, or general
production correctness. The three historical probes are not included in this
small package and must not be counted as executed by `check.py`.

Package validation used Python 3.12.14 and SQLite 3.53.1; this is an observed
environment, not certification of every Python/SQLite version.

This reusable package contains no participant solution, private history, raw
controller traces, hidden prompts, or model identity. It adds no new participant
run. See [empirical evidence](../../docs/empirical-evidence.md) for the comparison's
scope and limitations. Acceptance of a new implementation is a new local result,
not a replication of the original model comparison.
