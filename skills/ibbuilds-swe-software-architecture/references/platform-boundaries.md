# Apply the actual platform constraints

Read only the applicable sections. Derive exact platform capabilities from the project's supported versions and authoritative documentation.

## Services and distributed systems

Align transaction boundaries with invariants. Decide what may be stale and for how long, how stale data is marked, and what happens when dependencies are slow. Bound request fan-out, queues and resource consumption. Authentication at a gateway does not establish object-level authorization inside a service. Identify where tenant scope is enforced. Make correlation and failure signals possible without recording secrets or sensitive payloads.

## Libraries and SDKs

The host application owns process lifecycle and often logging, threading and dependency versions. Avoid global initialization, hidden network calls and process termination unless the contract explicitly calls for them. Define API/ABI compatibility as applicable, allocation/resource ownership, thread safety and cancellation. A new dependency can impose a transitive runtime or licensing obligation on all consumers. Validate against a small external consumer, not only internal tests that can access private internals.

## CLI and desktop tools

Separate machine-readable output from diagnostics. Exit status, standard streams, config precedence, filesystem effects and noninteractive operation are contracts. Treat files as user-owned; design interruption-safe writes and explain overwrite behavior. Desktop work must account for event-loop responsiveness, lifecycle, local permissions and persistent state upgrades. Do not assume a permanently connected backend or privileged installer.

## Native/mobile and embedded systems

For native clients account for process suspension, intermittent networks, device permissions, secure local storage and supported OS versions. For embedded work identify real-time deadlines, memory ceilings, scheduling, interrupts, watchdog behavior, power-loss consistency and hardware interfaces before selecting abstractions. Dynamic allocation or blocking calls may be unacceptable on a critical path even if convenient elsewhere. Simulators can establish some logic behavior but not electrical behavior, timing or resource margins on target hardware. Identify target-only evidence and required expertise rather than claiming simulator success proves deployment safety.

## Data pipelines and batch systems

Define input completeness, late data, replay windows, checkpoint ownership and output publication. A successful process exit is not proof of complete output. Decide when consumers can see a partition and how they distinguish partial, corrected and superseded output. Keep provenance sufficient to reproduce transformations without retaining unnecessary sensitive data.

## Scientific and model-backed software

Distinguish deterministic program correctness from statistical or numerical validity. Identify numerical error tolerances, units, conditioning and reproducibility requirements; bitwise equality may be either required or misleading depending on the computation and hardware. A passing implementation test does not establish that a scientific model represents the domain correctly. Ask for domain expertise when the choice of equation, acceptance threshold or safety consequence cannot be established from the accepted requirements.

For ML-backed features, track the compatible data/transformation, model and code versions, and define who validates each. Identify nondeterministic behavior, drift, evaluation data provenance and acceptable fallback behavior. Keep model output outside privileged decisions unless a validated policy boundary enforces permitted actions. Test integration contracts separately from task-quality evaluation, and do not substitute a few attractive examples for representative held-out evidence. Model training techniques and domain-specific validation require their own expertise; this architecture guidance does not certify model quality.
