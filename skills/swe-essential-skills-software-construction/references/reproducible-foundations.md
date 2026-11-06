# Reproducible foundations

## Own generated files and recovery copies

Apply while creating outputs and at a useful work boundary; a user need not ask
for cleanup first. Reuse an established workspace-hygiene workflow when available.
This section remains usable on its own. A small edit that creates no artifacts
needs no inventory or disk scan.

Before a bulk copy, capture, export, dependency installation or repeated build,
identify its output location, expected growth and useful recovery boundary. Keep
scratch work in the project's existing temporary area; keep deliverables in their
intended destination. Capture concise diagnostics by default, retaining a bounded
raw artifact only when it supports a current finding or recovery need.

Prefer version-control checkpoints for tracked source. When a filesystem backup
is necessary, copy only the affected material and define when it can be retired.
Keep the destination outside its source and exclude existing backups, dependency
trees and generated output unless recovery specifically needs them. Never let a
new snapshot recursively include prior snapshots. A successful copy is not tested
recovery; retain the required known-good boundary until replacement is verified.

If generated files grow unexpectedly, stop the producing loop before making
another copy. Use existing size/count evidence or a bounded inventory of the
affected area, including ignored output. Follow neither symlinks nor Windows
junctions into another workspace. Distinguish needed recovery material, final
deliverables, regenerable intermediates and files whose ownership is unknown.
Ignored, untracked, old or named `backup` does not by itself mean disposable.

At a milestone or completion, remove task-owned temporary outputs whose consumers
have finished and whose contents can be regenerated, within existing editing
authority and project policy. Preserve user files, active work from another task,
secrets/configuration, required diagnostic evidence and recovery copies still in
use. Recheck resolved paths and current ownership before any deletion; use the
native cleanup mechanism for the exact scoped targets. A retain/delete decision
outside an established policy needs that specific decision, not a blanket cleanup
prompt. Report material retained growth or unresolved candidates briefly.

## Resolve setup from evidence

Compare local toolchain versions with repository pins and CI; multiple manifests may represent a workspace rather than competing package managers. Determine the intended working directory and prerequisite services. Prefer the repository's documented reproducible install mode and preserve its lockfile. Do not guess universal flags across package managers or versions.

When setup fails, classify the first causal failure before changing files:

- **Toolchain mismatch:** reproduce with the supported version rather than loosening language or compiler constraints.
- **Dependency resolution:** compare manifest and lockfile intent, registry access and platform constraints. Do not delete the lockfile as a generic repair.
- **Native build:** inspect the missing system library, compiler or architecture mismatch; a package reinstall may not supply system prerequisites.
- **Environment/configuration:** distinguish missing secrets or services from invalid code. Use documented local substitutes when their semantics suffice.
- **Permissions/network:** preserve the exact failed operation and missing authority. An unrelated privilege escalation or alternate data path is not a setup fix.

Avoid executing unreviewed remote installer snippets. Installation can run package hooks and access credentials; use project-approved sources and scope. Capture the minimal reproducible setup in the existing project documentation when the task calls for setup work, not in a parallel agent-only handbook.

## Own development and test subprocesses

When starting a build, test command or development service, retain its handle and
identify which process or process group the runtime actually owns. A shell PID
need not identify all descendants. Drain captured stdout/stderr while the process
runs; bound retained or displayed output without blocking the producer, and avoid
buffering an unlimited log in memory. Preserve useful failure diagnostics and the
real exit status. A command expected to finish needs a terminal result, not merely
a successful launch; a long-running service needs appropriate readiness evidence
and an owned handle, not a claim that it completed.

Confirm readiness belongs to the intended build/configuration and serving path,
not just any listener on a familiar port. On failure or when temporary processes
are no longer needed, use the platform's supported cleanup for the owned process
tree; respect intentionally persistent services. Do not kill unrelated listeners
by name/port or introduce a new runner when existing project tooling manages this
correctly. Ordinary commands that do not start such processes need no extra setup.

## Dependencies and generated code

Before adding a dependency, identify the capability missing from the standard library or current dependencies. Check supported runtimes, maintenance, transitive weight, license constraints, security implications and how failure is surfaced. Do not replace mature project libraries solely for personal familiarity. Keep a new integration behind the actual owned boundary where that limits vendor coupling, rather than adding a generic framework for every import.

Before adding or executing an unfamiliar dependency, verify the exact ecosystem,
package name and intended version against official project documentation and its
intended distribution source (registry, upstream repository or approved internal
source). A matching name, search result or successful installation does
not establish that it is the intended package. Inspect relevant installation
hooks and project integrity/provenance requirements before executing package code;
identity or provenance does not certify benign behavior. Reuse established
project dependency evidence while applicable; do not reaudit every unchanged
lockfile entry or install a guessed package merely to discover whether it exists.

For generated clients or bindings, identify source schemas, generator version, deterministic inputs and expected checked-in output. Regeneration can expose upstream changes unrelated to the request; separate or revert unrelated output without overwriting user work. A generated declaration must agree with runtime serialization and the deployed protocol.

## Illustrative setup decisions

1. **Fresh checkout fails while CI is green:** compare runtime and working directory first. If CI injects a database URL, identify the documented local database or test substitute; do not copy production credentials or silently skip integration tests and report success.
2. **Dependency update changes hundreds of lockfile entries:** determine whether the package-manager version rewrote the format or a broad resolution occurred. Restore the intended toolchain and scope the update before interpreting every change as necessary.
3. **Two development tasks collide:** distinct directories protect source edits, but both tasks may still use one database and queue. Give tests isolated namespaces or disposable fixtures using existing supported mechanisms, and confirm cleanup cannot delete another task's state.

## Changed configuration

When changing configuration, define defaults, required values, precedence and validation. Reject invalid combinations at a useful boundary; distinguish an absent value from an empty or zero value when behavior differs. Keep secrets out of committed defaults and fixtures. Check which settings are baked into an artifact versus read at runtime before claiming they can change without rebuilding.

## Human-only setup steps

When a requested setup depends on actions only the human can perform, first do
the authorized agent-capable work and reuse existing configuration. Give the
smallest ordered handoff: verified location/action, required input, its purpose
and destination, and how completion will be checked. Do not invent dashboard
paths or ask the human to perform available agent operations. Keep secrets in
the intended secret store or hidden local input, out of chat, logs and tracked
files. Separate public identifiers from credentials and grant only the needed
scope. A user-completed step is evidence only for what it actually establishes.

For a recurring requested setup, a local guide or wizard may reduce repeated
explanation. Reuse project conventions; make repeat runs preserve existing
values unless replacement is authorized. Validate syntax and value destinations
without exercising real purchases, secrets changes or destructive migration
merely to test the wizard. Mark remaining human steps and verify the resulting
configuration through a harmless appropriate check before claiming setup works.
This adapts the useful handoff mechanism from
[Matt Pocock's wizard](https://github.com/mattpocock/skills/blob/5beb35b040e3de97e54fa9e386d7e42d15c295c2/skills/engineering/wizard/SKILL.md)
without requiring its Bash template or an additional confirmation at every step.
