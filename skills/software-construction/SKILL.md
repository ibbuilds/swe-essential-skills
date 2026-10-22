---
name: software-construction
description: Implement cohesive code changes that fit an existing repository, or establish a reproducible foundation for a new one. Use for setup, configuration, dependency integration, module structure and public-contract preservation across applications, libraries, CLIs and embedded software.
---

# Software construction

Produce a change that fits the actual codebase and can be built and exercised again. Use existing technical decisions; do not replace the architecture or scaffold a preferred stack merely because a task is underspecified.

## Discover the implementation path

Inspect repository instructions, working-tree changes, manifests, toolchain pins, lockfiles, CI definitions and the affected code and tests. Read task-relevant scripts before executing them, especially installation hooks, code generators and commands that contact shared services. Determine the canonical package manager and project commands from repository evidence; use supported-version documentation for unfamiliar commands.

Trace a nearby working feature through its callers and dependencies. Identify the module that owns the behavior, the public contracts involved and generated files whose source must be edited instead. For new repositories, choose only the foundations required by the target artifact, accepted constraints and first useful behavior; avoid creating unused infrastructure.

For setup, dependencies and environment problems, read [reproducible foundations](references/reproducible-foundations.md). For library, CLI, native and embedded changes, read the applicable sections of [contract-aware implementation](references/contract-aware-implementation.md).

## Change the owner, preserve the contract

Write down the behavior delta in terms of inputs, outputs, errors and side effects. Include affected callers and old behavior that must remain. Implement at the narrowest coherent ownership boundary rather than duplicating logic in each caller. Extract shared code when semantics genuinely match; similar-looking code with different ownership or lifecycles may need to stay separate.

Use types and interfaces to expose valid states and obligations where the language supports them. Validate untrusted data at the boundary; static types do not validate files, network payloads or persisted legacy data. Avoid broad exception swallowing, unchecked casts, disabled checks and global mutable state used to bypass a contract problem. If a temporary compatibility adapter is necessary, identify the old contract, translation and removal condition.

Keep resources and cancellation visible: who opens and closes a handle, owns a buffer, joins a task or removes a temporary file? Ensure error paths release resources and leave valid state. Do not log secrets or whole user payloads to make debugging convenient.

## Integrate without collateral changes

Preserve unrelated edits and local conventions. Use isolation appropriate to the collision: a separate working tree does not isolate databases, queues, ports, credentials or generated outputs. Avoid reformatting unrelated files, unrequested dependency upgrades and bulk lockfile churn. Inspect generated output and manifests together when code generation is part of the build.

When changing configuration, define defaults, required values, precedence and validation. Reject invalid combinations at a useful boundary; distinguish an absent value from an empty or zero value when behavior differs. Keep secrets out of committed defaults and fixtures. Check which settings are baked into an artifact versus read at runtime before claiming they can change without rebuilding.

## Keep changed usage usable

When a change alters setup, configuration, a public API or a supported workflow, update the documentation and examples consumers actually use alongside the implementation. Read [engineering documentation](references/engineering-documentation.md) for choosing the authoritative source and verifying documented behavior. Internal edits with no changed usage need no new document.

## Establish the result

Run the project's required checks and the smallest meaningful behavioral checks for the changed contract. Typechecking does not prove runtime parsing; a build does not prove packaging; a unit test does not prove an external consumer can use the public API. Add a regression at the layer that would have detected the failure, without coupling it to incidental implementation details.

Inspect the resulting diff for unintended public surface, dependencies, generated changes and suppressed diagnostics. Report implemented behavior, checks actually run and specific remaining gaps. If environment setup is blocked, preserve the actionable failure and distinguish code inspection from executable verification.
