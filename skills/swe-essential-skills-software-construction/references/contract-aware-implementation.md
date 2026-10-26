# Contract-aware implementation

## Libraries and bindings

Identify exported symbols, type declarations, serialization formats and compatibility guarantees. Avoid changing a default, exception type, ownership rule or timing behavior without considering consumers. Compile or run a representative external consumer against the built package, because internal imports can bypass missing exports and packaging errors. Inspect included files and runtime dependencies; a source-tree test cannot detect an omitted resource in the artifact. For native bindings verify ABI, architecture, calling convention and lifetime expectations on supported targets as applicable.

## Acquisition, cleanup and cancellation

For changed resource-lifecycle paths, establish when ownership begins or transfers. Release successfully acquired resources if later initialization fails, without disposing borrowed resources. Prefer the project's native resource-management mechanism. When work and cleanup both fail, retain actionable evidence of both through supported chaining, suppression or aggregation; do not impose a universal top-level exception order.

Respect the runtime's cancellation contract: cleanup must not accidentally turn cancellation into ordinary retry or success. Deliberate supported consumption remains valid. Select checks for reachable failure combinations when acquisition, fallible cleanup or cancellation semantics change; reuse established coverage. Cancellation arriving during suspended cleanup is a separate interleaving only when that path exists and is affected. Trivial edits preserving these mechanisms need no failure-injection matrix or custom shielding framework.

## Command-line interfaces

Preserve argument parsing, exit codes and stream behavior. Put diagnostics on the established diagnostic stream rather than corrupting JSON or piped output. Define behavior for invalid input, missing files, unreadable paths, broken pipes, cancellation and interactive prompts in automation. Use safe filesystem operations: validate destination intent, handle symlinks according to the threat model, avoid partial replacement of valuable files, and clean temporary artifacts after failure. Test through the installed executable when packaging or entrypoints change.

Example: adding a progress indicator to a JSON-export command should not insert progress text into the JSON stream. Exercise redirected output and noninteractive use, not just a terminal demo. If output atomicity is required, write and validate a temporary artifact before replacement using the supported filesystem semantics; cross-filesystem moves may not be atomic.

## Native applications and embedded code

Keep slow work off a UI or real-time path as the platform requires. Explicitly transfer ownership across threads, interrupts or callbacks. Make lifecycle shutdown and cancellation safe when completion races with resource disposal. Test boundary sizes and integer conversions in binary protocols; host word size and endianness are not portable defaults.

Example: replacing a fixed buffer with dynamic allocation may solve one input-size failure but violate an embedded memory or timing constraint. Determine bounded maximum input, rejection behavior and target resource budget before choosing the repair. A desktop sanitizer run is valuable evidence for memory errors but cannot certify worst-case timing on the device.

## Configuration and compatibility example

Changing `timeout = 0` from “no timeout” to “use default” is a behavior change even when the type remains integer. Trace existing call sites and persisted configuration, document accepted units and sentinel meanings, and test absent, zero, negative, malformed and oversized values according to the intended contract. If old configuration must remain valid, translate it explicitly rather than silently reinterpreting it.

## Numerical and model-backed implementations

Preserve units, precision and explicit conversion at boundaries. For numerical changes test meaningful tolerances, extreme magnitudes and unstable inputs against an appropriate reference; choose absolute/relative error according to the domain rather than a universal epsilon. Compiler optimizations, parallel reductions and target hardware can change floating-point results. Document whether reproducibility means bitwise identity or an accepted error bound.

For inference integrations, bind the preprocessing/postprocessing contract to the model artifact and compatible code version. Validate shapes, units and label mappings at load or execution boundaries. Separate deterministic integration tests using controlled outputs from statistical evaluations of model quality; a mocked model proves neither accuracy nor robustness. Preserve approved evaluation-data handling and report when realistic model or target-hardware evidence is unavailable.

## Implementation readiness and changed intent

For a new product or consequential capability, first recover the usable project
plan: intended problem/users, chosen scope, behavior and acceptance, constraints,
consequential technical decisions and unresolved risks. An existing document,
issue or prior conversation can supply this; do not require a new template or
repeat settled questions. If missing intent or a decision could materially change what is
built, resolve that gap before dependent implementation; absence of a formal
plan alone is not a blocker. Resolve the affected gap directly; use swe-essential-skills-project-planning only when available
and its method is needed. Ongoing work with clear behavior, acceptance and adequate existing decisions
is already sufficiently planned, even for a substantial feature or refactor.
Installing this skill does not restart discovery or require a whole-project audit. Authorized feasibility experiments and urgent containment can proceed
within their limited scope; neither is permission to build an unagreed product.

For consequential existing-project changes, distinguish the requested outcome
from your proposed implementation. If plausible interpretations change behavior,
data, consumers or compatibility differently, or reveal an unaccepted conflict
with an established goal, state the concrete consequence and ask the unresolved
choice before dependent edits. Carry settled answers forward; a partial answer
does not settle the remaining choices. Apply this again if new evidence exposes
ambiguity during implementation. Pause only affected work; code already written
or passing tests does not establish the user's intent. Clear accepted changes,
explicit bounded delegation and routine details need no new approval ceremony.
