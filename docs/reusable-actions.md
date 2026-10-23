# Reusable actions: native first, extra guidance only when useful

The suite does not replace host features or register another command language.
Use a suitable existing action, then apply only the missing engineering guidance.
Do not automatically run a suite pass after the same native work has completed.

| Need | Start with | Optional suite guidance when it adds value |
| --- | --- | --- |
| Review a change | The host's existing code-review action, such as Codex `/review` or Claude `/code-review` | `swe-essential-skills-software-review` for evidence-backed findings, revision/consumer checks and explicit review limits; no second full review by default |
| Clean up code | Ordinary scoped editing or an appropriate native cleanup such as Claude `/simplify` | `swe-essential-skills-software-evolution` for explicit project-wide cleanup scope, user-edit protection and result reuse |
| Diagnose a failure | Available debugger, logs and focused checks in the current workflow | `swe-essential-skills-software-debugging` for discriminating evidence and avoiding speculative repair loops |
| Verify a change | Relevant existing project checks and still-valid results | `swe-essential-skills-software-verification` when coverage, evidence or a failure needs additional reasoning |
| Refactor | Existing editor/refactor tools and current project decisions | `swe-essential-skills-software-evolution` for preserving contracts and sequencing a consequential change |

These are choices, not sequential stages. Built-in does not automatically mean
cheap: some actions fan out to several reviewers or use a background model.
Choose the least additional work that meets the request and its required checks.
Do not promise a fixed token cost or saving, or remove required quality gates.

## Short invocations, not a new DSL

If installed guidance is useful, invoke its actual skill name and add ordinary
scope text. For example:

- Codex: `$swe-essential-skills-software-evolution clean up this whole project while preserving behavior`.
- Claude Code: `/swe-essential-skills-software-evolution clean up this whole project while preserving behavior`.
- Codex: `$swe-essential-skills-software-review review my uncommitted changes; report findings without editing`.
- Claude Code: `/swe-essential-skills-software-review review my uncommitted changes; report findings without editing`.

Use the host's picker where the surface differs. Claude plugin installations
can use `/plugin-name:skill-name`; use the installed namespace. These examples
do not create `/cleanup`, and a shell is not a skill-command interface.

Whole-project cleanup requires an explicit request. Ordinary refactoring can
still use evolution guidance when relevant; its invocation policy is unchanged.
Review guidance does not authorize code edits, public comments or merging.
Cleanup does not grant new publication, deployment or destructive permissions.
Existing authorized checkpoint workflows and required checks remain applicable.

## Research behind the choice

Checked 22 October 2026 against [Codex code review](https://learn.chatgpt.com/docs/code-review),
[Codex refactoring guidance](https://learn.chatgpt.com/use-cases/refactor-your-codebase),
[Codex skill invocation](https://learn.chatgpt.com/docs/build-skills),
[Claude commands](https://code.claude.com/docs/en/commands),
[Claude local review](https://code.claude.com/docs/en/code-review-local) and
[Claude skills](https://code.claude.com/docs/en/skills).

Native cleanup/review already exists, and the current evolution skill already
handles behavior capture, dynamic consumers, reversible changes and equivalence.
A separate cleanup skill would duplicate those mechanisms. The added conditional
reference therefore covers only scope, user work, native-result reuse and unsafe
cleanup boundaries. No new skill, wrapper, permission grant or agent fanout is
introduced. Host command details may change; use the installed host's supported
interface rather than assuming these examples prove availability everywhere.

This is source-backed workflow design, not an executed host/model trial or
measured token-saving result.
