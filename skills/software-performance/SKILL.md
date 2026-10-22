---
name: software-performance
description: Investigate and improve latency, throughput, memory, startup, responsiveness, and resource efficiency using representative workloads and measured bottlenecks. Use for performance regressions, capacity constraints, or evidence-backed optimization across clients, services, data jobs, and native software.
---

# Software performance

Optimize a measured constraint while preserving correctness. A slow feeling, familiar anti-pattern, or benchmark score from another project is a hypothesis, not evidence that the same optimization belongs here.

## Establish the workload and baseline

Identify the user/system outcome: interaction delay, startup, tail latency, throughput at a stated concurrency, memory growth, batch completion, battery/energy, or a real-time deadline. Reuse existing service objectives or device/resource budgets. If none exist, establish a relevant baseline and clarify the consequential tradeoff rather than inventing universal thresholds.

Record the environment and workload enough to compare: exact revision/build mode, runtime/tool versions, hardware/resource limits, input/data scale and distribution, concurrency/arrival pattern, warm versus cold caches, and relevant dependencies. Use project commands and actual version documentation for profilers, runtime flags, and build configuration. Debug builds, mocked dependencies, and unrealistic tiny datasets can change the bottleneck.

Reuse a supplied baseline when its revision, workload, environment, measurement method, and variability are known and applicable to the current path. Collect a new baseline only where these are missing, materially changed, or insufficient for the proposed comparison. Include the distribution or variability that matters, not just one best sample or an average hiding tail stalls. Check errors, timeouts, resource use, and completed work alongside speed; rejecting work faster is not a throughput improvement. Avoid load testing shared/production systems or creating costly resources without authorization.

## Find where the budget is spent

Use applicable existing traces or profiles to locate the critical path and distinguish service time from queueing, network waits, synchronization, scheduling, rendering, or resource exhaustion. Profile or instrument at an appropriate layer when the bottleneck remains uncertain or the existing evidence no longer applies; avoid both guessing from code appearance and obligatory re-profiling of an established bottleneck. Check whether instrumentation materially changes timing or memory.

Prefer reducing unnecessary work, duplicated IO, algorithmic growth, or serialized independent waits before adding complexity. Independence must be real: parallelizing operations with ordering or transactional dependencies changes semantics. Use [measurement-and-optimization.md](references/measurement-and-optimization.md) for profiling, caching, concurrency, and platform-specific cases.

Choose one justified intervention with a predicted effect and a correctness risk. Examples include reducing transferred data, indexing a demonstrated query bottleneck, batching bounded work, eliminating repeated parsing, or moving computation off a UI thread. Preserve public behavior and the agreed visual design. Do not apply React, PostgreSQL, GPU, or operating-system-specific advice to unrelated software.

## Control optimization hazards

- **Caching:** define complete identity/key, freshness, invalidation, eviction, memory limits, and authorization/tenant separation. Address concurrent misses and failed fills where material. Caching can serve stale or private data faster.
- **Concurrency:** bound in-flight work and queue depth against downstream capacity; preserve ordering, cancellation, backpressure, fairness, and failure aggregation. Unbounded parallelism may improve one local timing while overwhelming a service.
- **Memory:** distinguish live retained data, allocation churn, native buffers, and process/runtime accounting. Repeated lifecycle/workload measurements reveal growth that one snapshot misses.
- **Precomputation or denormalization:** define update/rebuild cost, consistency, recovery, and storage growth. Moving cost out of the measured window does not eliminate it.

## Compare and stop on evidence

Measure the candidate against the same representative workload and conditions as the applicable baseline, with appropriate repetitions/controls. Rerun the baseline when drift or missing controls would make the comparison unreliable, not merely because it was supplied by another step. Compare correctness checks, latency distributions, throughput, and resource costs under comparable conditions. Include cold paths or adverse workloads if the change shifts costs there. If the result is within noise, say inconclusive; do not manufacture a percentage claim or keep an unjustified complexity increase.

Retain a regression check or resource budget when stable and worthwhile. Do not make noisy microbenchmarks brittle CI gates; use a controlled benchmark environment or a coarse regression threshold justified by observed variance and product tolerance. Preserve required functional gates.

Report the measured effect, environment/workload, tradeoffs, and limits of generalization. Stop when the relevant budget is met or the next material gain needs scope/authority beyond the task; do not continue speculative optimization simply because other code looks inefficient. If measurement is unavailable, offer a clearly labeled analysis or instrumentation plan, not a claimed improvement.
