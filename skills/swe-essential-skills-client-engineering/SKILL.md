---
name: swe-essential-skills-client-engineering
description: Implement or change interactive web, native, and desktop client behavior, including state, navigation, async integration, accessibility, and lifecycle handling. Use for working user journeys, not choosing visual art direction.
---

# SWE Essential Skills / Client Engineering

Turn the agreed interface into reliable behavior in the existing client architecture. Preserve the accepted visual design, content, and platform conventions; raise an actual feasibility or accessibility conflict rather than silently redesigning it.

## Build the behavioral slice

Reuse established entry-path, architecture, and runtime facts that still apply to the changed code. Before introducing another pattern, inspect the affected route/window/screen, nearby components, state owner, data client, error handling, and tests only where that context is missing or affected. Check manifests and lockfiles when versions are unknown, dependencies changed, or an API decision depends on them; an inert label correction does not require rediscovering the runtime. Use applicable known repository commands and consult official documentation for the installed versions when behavior or APIs are uncertain; do not substitute remembered commands from a different stack.

Start with a representative journey, not a component inventory. Identify its trigger, observable result, data dependencies, and failure recovery. For a small edit, this can remain a few implementation notes. For a multi-step flow, map transitions before adding handlers:

- Distinguish initial loading, refresh with existing data, empty success, partial data, recoverable error, and terminal denial where applicable. Absence of data is not proof of loading or authorization.
- Keep authoritative remote data, transient UI state, derived values, and persisted user intent separate. Prefer computing derived state over synchronizing duplicate copies. Use a state machine or reducer when independent booleans permit impossible combinations, not by default.
- Put state at the narrowest owner whose lifetime matches the behavior. Decide what survives navigation, back/forward, account changes, process recreation, and application upgrades. Avoid storing secrets or sensitive drafts just to preserve convenience.
- Define action semantics: can users submit twice, cancel, retry, navigate away, or edit while saving? A disabled button improves UX but does not guarantee backend idempotency.

Implement one usable path through actual boundaries, then the relevant adverse transitions. Reuse the established data/cache and component systems rather than adding a parallel architecture.

## Make asynchronous behavior explicit

A response belongs to the request inputs, user/account, and screen instance that initiated it. Prevent an older result from overwriting a newer result through request identity, version checks, cancellation, or the framework's established query mechanism. Cancellation may stop local observation without undoing a server-side write.

For mutations, define confirmed, rejected, and outcome-unknown states separately. Do not tell the user an operation failed if the request timed out after the server could have committed it. Reconcile using an operation identifier or authoritative refresh before resubmitting a consequential action. For optimistic changes, capture enough identity/version context to reconcile without rolling back unrelated newer edits.

Release subscriptions, timers, observers, handles, and pending work according to the platform lifecycle. Treat development double-invocation and background/foreground transitions as opportunities to expose unsafe side effects, not reasons to disable lifecycle checks.

## Integrate semantics and interaction during implementation

Use native controls and semantic roles before recreating behavior. Make names, validation errors, progress, focus, keyboard/touch behavior, and assistive-technology announcements part of the component contract. On navigation or dialogs, deliberately manage initial focus and restoration without stealing focus on ordinary data updates. Retain entered values on recoverable errors unless safety requires clearing them. Client validation assists users; server-side authorization and validation remain authoritative.

Read only the applicable sections of [platform-and-state-patterns.md](references/platform-and-state-patterns.md) for web rendering, native/desktop lifecycle, or concrete race and accessibility cases.

## Verify the changed journey

Select checks for the changed journey and plausible affected failure mechanisms.
Reuse applicable task-local results when coverage and relevant code, build,
configuration, data and environment still match and required gates permit their
freshness. Before treating a running-session result as evidence, confirm that the
client/build and relevant service configuration belong to this change; reuse
confirmed target identity while applicable. Exercise the actual affected
interaction where tools permit, including adverse response and recovery when
those paths are affected. Check relevant layout, viewport, text-size, input-method
and platform behavior rather than treating a screenshot as interaction evidence.
Use focused state/logic tests for permutations and integration checks where the
failure depends on a real boundary; do not require every layer for every edit.
Preserve repository-required checks.

Report separately what code-level checks establish and what was observed in a rendered or device session. If no browser, simulator, device, or accessibility tool is available, identify the exact behavior still unverified; do not fabricate visual or device evidence. Completion means the requested behavior works within the stated evidence, not that every possible platform has been certified.
