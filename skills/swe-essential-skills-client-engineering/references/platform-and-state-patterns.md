# Conditional client patterns

Read the relevant section for the changed platform or failure mode. These are illustrative design cases, not executed evaluations or framework-specific API recipes.

## Search results arrive out of order

A user types `ca`, then `cat`. Request B (`cat`) finishes before A (`ca`). A simple `setResults(response)` displays stale data under the current query.

Associate the result with the complete query key (including filters and account context). Either let the project's query client manage keyed results or check a monotonic request generation before committing local state. Invalidate the generation when the owner is disposed or its context changes. Abort obsolete requests when supported, but retain the ownership check because cancellation can race with completion. Test controlled resolution in both orders, including a failed old request arriving after a successful new one. Do not add arbitrary debounce delays as a correctness fix; debounce changes request volume, not ownership.

## Optimistic edits and ambiguous writes

An optimistic rename A is followed by rename B. If A fails, restoring the snapshot before A could erase B. Track mutation identity/version and invalidate or rebase only the affected optimistic layer. For consequential writes (purchases, destructive changes, device commands), prefer explicit pending/reconciliation states unless safe optimistic semantics exist. A retry should reuse the intended operation identity where the server supports deduplication, not invent a new operation on every transport attempt.

An `unknown` label alone does not enforce that decision. For a non-idempotent
write or an unverified retry contract, guard the actual mutation entry point
against automatic **and user-triggered** repeats of that operation until
authoritative reconciliation. A disabled button can be bypassed by another
caller or shortcut. Where the service already guarantees an idempotent retry,
reuse its supported operation identity and unchanged intent instead of blocking
that valid path. Check a committed write with a lost response followed by a user
retry, then the legitimate path after reconciliation. This is a conditional
failure case, not a new retry framework. The
[AWS Builders' Library treatment](https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/)
explains the underlying reconciliation and operation-identity contract.

## Route failures to the actual owner

When changing an async handler, action/query integration, error boundary or recovery behavior, trace the failure from its execution context to the state owner or boundary that receives it. A render boundary need not catch event-handler, timer, subscription or detached async failures; supported action/query mechanisms may explicitly route them. Reuse that mechanism rather than wrapping every operation in a new catch. Verify the relevant rejection reaches the intended recoverable state and recovery clears pending/error state without discarding valid input. Unrelated presentation changes need no new error-routing audit.

## Web-specific boundaries

- Establish which code runs on the server, during hydration, and in the browser. Do not read browser-only globals during server rendering or expose server credentials through client imports. Server and first client render need compatible output; delaying all rendering hides rather than resolves some hydration defects.
- Put shareable navigation/filter state in the established URL contract where appropriate; preserve history/back behavior and validated deep links. Avoid serializing private data into URLs or analytics.
- Use real links for navigation and buttons for actions. For a modal, test focus entry, containment where modal semantics require it, Escape behavior, background interaction, and restoration. For async results, choose a concise status announcement instead of announcing every item.
- Treat trusted HTML insertion, third-party scripts, and embedded content as trust boundaries. Preserve sanitization, origin restrictions, and the project's security controls.
- In React-like systems, effects synchronize external systems; avoid effects for pure derivations. Respect hook/lifecycle contracts, stable subscription cleanup, and dependency semantics. Framework-specific optimizations need evidence and version-compatible documentation.

For a changed interactive journey, distinguish normal input evidence from bypasses.
Direct handler calls, injected state, dispatched DOM events or forced clicks can
help setup/diagnosis, but do not prove that a user can reach or operate the control.
Use the supported normal input path when claiming pointer/keyboard usability;
a focused unit check may still validly prove isolated logic. Do not bypass an
overlay or disabled control merely to make an end-to-end check pass. Inspect the
actual affected rendered behavior rather than treating a successful handler as
proof of visibility, focus or hit targeting.

## Text input, composition, and locale (when affected)

When changing text controls, keyboard shortcuts, live formatting, or localized input, preserve the platform's composition, caret, and selection behavior. Do not treat each key event as committed text or rewrite a composing value on every update. Enter used to confirm an IME candidate must not also invoke an application's submit/send shortcut. On the web, use composition-aware handling (including `isComposing` where supported), and verify the relevant browser/IME event ordering rather than assuming a synthetic key event proves real input behavior. The [W3C UI Events composition model](https://www.w3.org/TR/uievents/#events-composition-key-events) and [Input Events Level 2](https://www.w3.org/TR/input-events-2/) are working drafts; check actual target-platform support.

Illustrative case: in a chat composer, enter Japanese text through an IME, select a candidate, and press Enter to commit it. The text should remain editable without sending; a subsequent explicit send should submit once. Also replace a selected substring and confirm that controlled rerenders do not move the caret or erase the replacement. Test these paths when the input handling changes, not for every unrelated client edit.

For locale-sensitive fields, separate editable/display text from canonical serialized values; avoid guessing how ambiguous dates or decimal separators should parse. The [HTML form-control localization notes](https://html.spec.whatwg.org/multipage/input.html#input-impl-notes) distinguish displayed and submitted formats. Where mixed-direction user content is relevant, preserve logical text order and use appropriate direction/isolation semantics rather than reversing strings; consult [W3C bidi markup guidance](https://www.w3.org/International/articles/inline-bidi-markup/). These checks follow the affected input and supported locales, not a mandatory global internationalization audit.

## Native/mobile-specific boundaries

Distinguish screen visibility from process/application lifetime. Backgrounding may pause work; process death may erase memory; permissions can change outside the app. Decide which pending action can safely resume and which requires fresh consent or reconciliation. Persist minimal reconstructible state using platform-appropriate storage; do not assume saved UI state is a durable transaction log.

For deep links or notifications, handle cold start, already-open screens, unauthenticated entry, and stale/deleted destinations. Keep authorization checks after navigation resolution. Check accessibility names, dynamic text, safe areas, touch targets, screen-reader order, reduced motion, and relevant hardware inputs on supported platforms. Simulator evidence does not establish physical-device camera, Bluetooth, battery, or background scheduling behavior.

## Desktop-specific boundaries

Identify main/UI-thread constraints, background workers, multi-window ownership, and IPC trust boundaries. Validate IPC payloads and restrict exposed capabilities rather than granting a renderer unrestricted OS access. Long-running work must not freeze the event loop; cancellation and window closure must release handles without corrupting shared state.

Define unsaved-change behavior on close/restart and file replacement/conflict behavior when external programs edit a document. Test keyboard shortcuts against text inputs, focus restoration across windows, display scaling, and file dialogs as applicable. An in-browser preview of a desktop UI does not verify packaging, native menus, IPC, or OS permissions.

## Offline and cache transitions

Specify whether stale data is usable, visibly stale, or unsafe (for example, expired authorization or inventory availability). Key caches by all relevant identities, and clear or partition private data on account changes. A queued offline write needs ordering, deduplication, conflict handling, expiry, and visible status; do not silently turn every failed mutation into a background queue.
