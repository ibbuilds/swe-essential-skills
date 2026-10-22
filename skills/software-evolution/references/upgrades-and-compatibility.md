# Upgrades and compatibility

Determine exact installed/target versions from manifests, lockfiles and shipped artifacts. Inspect official version-specific migration/release notes, intermediate breaking changes, support policies, runtime requirements and security advisories. Semver signals intent; it does not guarantee every minor/patch upgrade preserves real consumer behavior.

Map exposed API, ABI, wire format, persisted state, configuration defaults, errors, timing, plugin hooks and build tooling. Transitive dependencies can change runtime behavior without direct imports. Separate security-required upgrades from elective modernization; choose the smallest sufficient version change unless broader work is justified.

Select evidence by affected surface:

- **Library:** compile/run representative consumer fixtures against public exports, supported runtimes, package contents and peer requirements.
- **Runtime/compiler:** use target flags, inspect warnings/generated outputs, platform-sensitive behavior and native extensions.
- **Database/driver:** check serialization, transaction/retry behavior, query semantics, server compatibility and old-reader compatibility of new stored data.
- **Protocol/SDK:** check supported server/client combinations, defaults, pagination, retries and error mappings.
- **Native/device:** check ABI/architecture, resource limits, signing/entitlements and target hardware with available authorized capability.

Use documented compatibility tables to prioritize real combinations, especially rollout coexistence and supported boundaries, rather than an unbounded test matrix. Regenerate dependency resolution with supported tooling and inspect unexpected upgrades, sources, lifecycle hooks, licensing and artifacts. Do not execute unfamiliar install hooks merely to see what happens.

If incompatible, choose an adapter, prerequisite upgrade, supported alternative or explicit breaking release. Do not weaken checks until green. Verify installed/built results, not only manifests. Report checked combinations and recovery restrictions from new formats or effects. Give temporary pins/mitigations a review condition so they do not become invisible permanent exceptions.
