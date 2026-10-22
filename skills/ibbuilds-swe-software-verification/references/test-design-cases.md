# Test design cases

Illustrative cases, not executed test evidence. Use the project's existing tools and conventions rather than adopting a new framework to reproduce these examples.

## Specify invariants before choosing fixtures

For a balance transfer, useful invariants include conservation of total value, no forbidden negative balance, and at-most-once effect per operation identity. Test a successful transfer, insufficient funds, failure between writes, repeated delivery, and concurrent competing withdrawals at the transaction boundary. A mocked repository unit test can check orchestration, but cannot establish isolation or rollback behavior in the real database.

For a parser/formatter pair, round-trip behavior may be useful, but two functions with the same defect can agree. Include independently specified examples, invalid inputs, and normalization rules. A metamorphic test might establish that reordering independent records preserves an aggregate; verify that independence is actually part of the contract.

When a generated case fails, preserve its concrete input or event sequence,
relevant tool/generator versions and required replay metadata. Prefer a minimized
case when useful, without removing ordering or environment conditions needed for
the failure. A seed, cached example database or version-specific replay blob may
stop reproducing after changes. Preserve an important fixed case as a durable
regression in the existing test tool rather than rerunning a large campaign to
rediscover it. Keep secrets and unauthorized production data out of committed
fixtures. This does not require adopting property-based testing for every change.

## Separate contract from implementation

For a library change, exercise public entry points with supported consumer/compiler/runtime versions where required. Test error types, cancellation and resource ownership as well as success values. Compile/link/package consumption can catch missing exports or assets that source-level tests miss. Do not make private helper names or incidental call counts the compatibility contract.

For a CLI, verify exit status, stdout/stderr separation, supported flags, no-interaction behavior, and affected quoting/path/encoding cases. A snapshot of a human-readable message is insufficient if the changed contract is JSON output. A headless CLI does not require browser screenshots.

For a rolling API/schema change, old-reader/new-writer and new-reader/old-writer cases may differ. Test the combinations actually supported during rollout, plus meaningful enum/unknown-field/default semantics. A mock generated from the same mistaken schema as the implementation is not independent compatibility evidence.

## Check who supplies a prerequisite

Inspect whether fixture setup performs work the real entry path is responsible
for. A test that pre-creates an output directory, authorization context or default
record can hide missing first-run initialization or binding. Identify the real
owner and exercise the relevant entry path when the claim depends on it. A
prerequisite explicitly guaranteed by the caller or deployment is legitimate;
fixtures and mocks are not defects merely because they supply inputs. Conversely,
a passing unit path does not prove an undeclared production prerequisite exists.

## Keep repair comparisons about behavior

When comparing a defect before and after repair, use the same triggering input or
event sequence and the same required behavioral property. The oracle must inspect
the observed result, not the checkout label, commit identity or presence of the
patch. Inspect changes to setup, fixtures and assertions independently: changing
both the harness and code can make an apparent red-to-green result incomparable.
Test changes are legitimate; establish what the comparison still demonstrates.

For example, a tenant-isolation repair should reject the same cross-tenant request
without disclosing data or causing a protected effect. A harness that expects
denial only when a patched-version flag is set does not prove that repair. An
adapter for a renamed public entrypoint can be valid if it supplies equivalent
input and preserves that property; it must not add the missing authorization itself.

An accepted behavior or API change may require different expectations. Verify the
new contract and relevant compatibility obligations rather than forcing identical
outputs across versions. If the baseline cannot run with available dependencies or
authority, report the comparison gap and use other applicable evidence; a setup
failure is not reproduction. Reuse trustworthy existing evidence. This comparison
does not require another runner, extra builds or repeated checks when the claim is
already supported, and does not make baseline execution mandatory for every test.

## Test ordering deliberately

Suppose two workers may claim the same job. Use two real transactions or a controlled integration harness: both observe availability, then both attempt acquisition. Assert the owning invariant (one successful claim), not the exact thread that wins. Verify retry behavior and visible final state. A thousand passing serial executions do not exercise this race.

For eventually consistent projections, await the specific expected condition with a bounded timeout and useful failure diagnostics. Do not replace a required consistency guarantee with eventual assertions just because the latter pass more easily.

## Choose platform evidence honestly

A desktop save feature may need unit checks for serialization, filesystem integration for atomic replacement and permission errors, and an interactive check for dirty-state prompts and window closure. A browser mock of the dialog cannot prove OS behavior.

A mobile notification flow may require cold-start and signed-out navigation checks. Simulator tests establish only what the simulator supports; physical push delivery, background power constraints, and hardware permissions may need device evidence. Record missing device coverage rather than blocking all unrelated verification.

For embedded control logic, simulate state transitions and fault inputs, then identify what requires hardware-in-the-loop: timing, electrical behavior, physical fail-safe state. Keep safety interlocks active and use an authorized fixture; successful simulation does not establish real-time physical safety.

## Handle a tiny edit without blanket rules

A label correction may be adequately supported by inspection, existing lint/build checks required by the project, and a targeted rendering check if truncation or localization is affected. No new unit test is needed merely to assert a literal string already inspected. Conversely, a one-line comparison change can break authorization or money calculations and warrants focused adverse tests. Changed-line count is not risk.

## Interpret coverage and failures

A test executes an error branch but never asserts the error: line coverage can be high while the oracle is weak. A safe deliberate fault (for example, allowing an unauthorized result in a temporary isolated copy) should make the relevant assertion fail. Do not modify the working tree unsafely to manufacture this demonstration.

If the full suite cannot run because its database is unavailable, report that exact missing dependency. Run supported unit or static checks, but do not call them equivalent to database integration. If a required gate fails, completion remains qualified or blocked according to the project's acceptance policy; do not quietly redefine the gate.
