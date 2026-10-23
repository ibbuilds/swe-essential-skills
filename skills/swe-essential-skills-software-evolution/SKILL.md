---
name: swe-essential-skills-software-evolution
description: Safely refactor or modernize software, upgrade dependencies, evolve APIs and data formats, deprecate capabilities, migrate consumers or retire systems. Use when behavior and compatibility across versions and time are the central engineering problem.
---

# SWE Essential Skills / Software Evolution

Preserve behavior and invariants unless an intentional change is accepted. Compatibility relates real producers, consumers and stored state over time; it is not just a version-number convention. Reuse architectural decisions and debt priorities instead of rewriting toward a fashionable structure.

## Choose the change

- **Refactor:** internal structure changes while observable behavior remains stable; use the method below.
- **Explicitly requested project/scoped cleanup:** apply [cleanup safeguards](references/project-cleanup.md) alongside that method; installing this skill or ordinary refactoring does not request a project-wide cleanup.
- **Dependency/platform upgrade:** read [upgrades-and-compatibility.md](references/upgrades-and-compatibility.md).
- **API/data/protocol migration or deprecation:** read [migration-and-retirement.md](references/migration-and-retirement.md).
- **Retirement:** use that reference's shutdown path; source deletion does not retire a running capability.

Identify the change's purpose and invariant: public behavior, data meaning, performance envelope, resource ownership, security boundary or operability. Inspect actual consumers/failure cases. Small local refactors need no migration document; external or irreversible changes need sequencing and evidence.

## Justify maintenance work

When choosing among debt reductions rather than executing an already accepted change, read [evidence-based debt reduction](references/evidence-based-debt-reduction.md). Use observed incident, maintenance or change burden to select a bounded intervention; an unfamiliar style or low line count is not itself evidence of debt. Reuse existing priorities and records instead of creating a second planning backlog.

## Refactor without accidental redesign

1. **Locate the seam.** Trace execution, callers, tests, shared state and ownership. Find the coupling/duplication responsible for the maintenance problem. Prefer the existing owner over a parallel framework.
2. **Capture observable behavior.** Reuse meaningful tests or add focused characterization where behavior is poorly specified. Include adverse inputs, ordering, error semantics and external effects relied on by consumers. Characterization records behavior; it does not make a known defect desirable. Separate intentional correction from preservation.
3. **Make a reversible increment.** Extract/replace one coherent responsibility behind a stable interface, then compare old/new behavior. A temporary adapter can reduce risk; a speculative abstraction with no demonstrated use or boundary can increase it.
4. **Check equivalence at the right level.** Run affected behavior tests, type/static checks and required project gates. Compare serialized output, exit/stream behavior, numerical tolerance, side-effect/query counts or performance when contractual. For nondeterminism, compare explicit properties rather than byte equality.
5. **Remove obsolete paths only when justified.** Check runtime/configuration entrypoints, reflection/plugins, generated code, scripts and supported consumers before trusting static reference search. Remove temporary adapters after their dependents move.

If behavior changes unintentionally, distinguish the refactor's defect from a pre-existing one. Shrink the change or restore the last valid seam instead of layering compensating patches onto an unclear rewrite. Keep intentional behavior changes visible and justified even if delivered in the same authorized task.

## Establish improvement

Reduced line/file counts do not prove better architecture. Show clearer ownership, reduced coupling, eliminated duplicated policy, simpler extension or measured performance improvement tied to the maintenance problem. Avoid changing public names, persistence and control flow simultaneously when a narrower change suffices.

Do not regenerate unrelated lockfiles, reformat the whole repository or upgrade toolchains incidentally. If architecture prevents a required invariant, explain the constraint and smallest viable boundary change rather than silently expanding scope.

State preserved/changed behavior, affected consumer/version range, checks on the resulting revision, temporary paths and unresolved migration risk. An adapter shipped is not consumers migrated; no recent endpoint traffic is not proof offline clients upgraded. Tie completion to the requested transition and expose remaining temporal dependencies instead of claiming future work already happened.
