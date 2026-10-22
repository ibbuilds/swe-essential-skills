---
name: software-delivery
description: Build, package, release, or deploy identifiable software artifacts; change CI/CD or infrastructure workflows; verify environment compatibility, rollout and recovery. Applies to services, libraries, CLI/native software and firmware without implying permission to publish or deploy.
---

# Software delivery

Keep build, verification, publication, deployment and successful operation distinct. Start from the repository's actual release process, supported toolchain versions and target platform; consult the corresponding version-specific official documentation before introducing unfamiliar commands or provider semantics.

## Establish what moves where

Identify the source revision (including relevant uncommitted changes), dependency resolution, build configuration, artifact/version, target environment or distribution channel, and intended consumers. Reuse existing build scripts and CI conventions after inspecting what they execute. A tag alone is not proof of the bytes shipped.

Choose the applicable path:

- **Build/package only:** produce an inspectable artifact, verify its contents and consumer behavior; stop before publication.
- **CI/CD change:** check triggers, permissions, secret exposure, trust of contributions, concurrency and artifact handoffs; exercise the changed branch safely.
- **Infrastructure:** read [infrastructure.md](references/infrastructure.md) before planning, testing or applying changes.
- **Release/deploy:** read [rollout-and-recovery.md](references/rollout-and-recovery.md) before the externally visible action.
- **Coupled versions or drift:** read [configuration-baselines.md](references/configuration-baselines.md) when release correctness depends on a coordinated configuration set, deployed-version accounting, or reconciliation of declared and live state.

Installation of this skill grants no registry, signing, production, spending or destructive authority. If the requested destination or authority is ambiguous, prepare and validate what can be done locally; pause the consequential action with the exact target and missing decision.

## Make the artifact trustworthy enough for its use

Build with the project's locked dependencies/toolchain where supported. Identify undeclared inputs such as ambient environment variables, downloaded “latest” resources, generated code, local files and platform SDKs. Fix a demonstrated reproducibility failure rather than claiming bit-for-bit reproducibility from one successful build.

Inspect the **packaged output**, not only the working tree: required runtime files and metadata, absence of secrets/development data, licensing notices, entrypoints, architecture/ABI/runtime support, and version embedded in the artifact. Retain the digest or equivalent immutable identity and applicable provenance/signature evidence. Keep signing credentials out of logs and build output.

Select verification by consumer:

| Deliverable | Verification that catches release-only failures |
| --- | --- |
| Library | Install the built package into a clean consumer; check public exports/types/headers, runtime and peer dependency ranges, supported ABI/API compatibility and required bundled resources. |
| CLI | Install the package, invoke the installed executable, check exit codes/stdout/stderr, config discovery, noninteractive use and the supported shell/OS assumptions. |
| Native/desktop/mobile | Check target architecture, signing/entitlement requirements, install/launch/update paths, user-data compatibility and distribution-channel constraints on rollback. |
| Service/container | Inspect image/runtime identity, startup/readiness, configuration, least-needed privileges and shutdown behavior; verify dependency and migration compatibility. |
| Firmware/embedded | Check hardware revision, image size/layout, bootloader/protocol compatibility and integrity verification; use the available simulator/test device for update and interrupted-update behavior. Do not flash unknown or safety-critical hardware to fill an evidence gap. |
| Data job | Validate input/output contracts, scheduling identity, checkpoint/version compatibility, restart/idempotency and representative output invariants. |

Use the applicable rows, not the whole table. If a clean consumer, device or platform is unavailable, state precisely which packaging behavior remains unverified.

## CI is an executable release boundary

Follow artifacts from producer to consumer jobs. Ensure a deployment cannot accidentally rebuild different bytes or select a stale artifact from another revision. Cache keys must account for relevant dependencies/toolchains; distinguish disposable caches from authoritative build outputs. A cache miss should not change required behavior.

For configuration edits, inspect event filters and conditions, matrix coverage, required checks, cancellation/concurrency behavior, timeout/failure propagation and secret/permission scope. Untrusted pull requests must not gain trusted release credentials through a privileged follow-up job or injected build script. Use the provider's current documented trust model, not guessed YAML semantics.

Run available syntax/configuration validation and meaningful build/test paths in a safe context. Do not trigger publication or infrastructure mutation merely to prove the workflow parses. If CI cannot be executed, label the distinction between reviewed configuration and an observed successful run.

## Completion evidence

Report the useful outcome: artifact identity, checks performed against it, publication/deployment status, environment identity when applicable, and unresolved compatibility or recovery risk. A green pipeline is not proof users received the intended version; a published package is not proof it installs; a successful apply is not proof the workload functions.
