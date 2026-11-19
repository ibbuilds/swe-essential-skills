# Runtime requirements

Skills change how Claude reasons about a task. Some of what the skills ask for is mechanical: a pattern in a diff, a command that has or hasn't run since the last edit, a package name that does or doesn't exist on a registry. A hook or a script checks those things every time, at no token cost, and a skill only checks them when it fires. This file lists those parts so a later runtime layer (global hooks, mods or CI) can take them over. None of it is built here.

Until that layer exists, the skills keep their instructions for these checks. Once a mechanism ships and is verified, remove the matching lines from the skill and re-run its behavior evals.

| # | Requirement | Mechanism | Event or trigger | Backs skill lines |
| --- | --- | --- | --- | --- |
| 1 | Block the final message when code changed after the last gate run | Hook that tracks Edit and Write times and the last test, typecheck, lint or build command, keyed by repo | `PostToolUse` (Edit, Write, Bash) + `Stop` returning `decision: block` with the stale gate's name | `done` steps 1–2, "I ran the tests earlier" |
| 2 | Flag lowered-bar patterns added in the diff | Script over `git diff`: `.skip`, `.only`, `xit`, `@pytest.mark.skip`, `@ts-ignore`, `@ts-expect-error`, `# type: ignore`, `eslint-disable`, `noqa`, empty `catch`, `--no-verify`, lowered thresholds | `Stop`, and `PreToolUse` on `Bash(git commit*)` | `done` "Lowered bar" |
| 3 | Leftover debug instrumentation | Grep the diff for `[DEBUG-` | `Stop` | `diagnose` step 3 |
| 4 | Verify a package before it is installed | Hook that reads the package name from the install command, queries the registry (exists, latest version, repository, last release, install scripts) and checks edit distance to popular names | `PreToolUse` with `if: Bash(npm install*)`, `pnpm add`, `yarn add`, `bun add`, `pip install`, `uv add`, `poetry add`, `cargo add`, `go get` | `deps` step 2 |
| 5 | Fire `tdd`, `diagnose`, `deps` and `done` in the middle of a task | Today: one sentence at `SessionStart` (shipped in `hooks/hooks.json`). Later: inject the reminder at the first source edit in a repo with tests, and before the final message | `PreToolUse` (first Edit or Write of a source file), `Stop` | Activation of the four mid-task skills |
| 6 | Evidence for UI claims | Hook that notices edits to UI files and requires a screenshot, console read or network read after the last such edit | `PostToolUse` + `Stop` | `done` UI row, `UI.md` |
| 7 | Secrets in a commit | Pre-commit scanner (for example gitleaks) and CI | git pre-commit hook, CI | none: left to Claude Code's `security-review` and the repo's CI |
| 8 | Gates on every PR | The repo's own CI workflow | CI | `ship` reads CI results; it does not replace them |
| 9 | Per-feature LLM cost and latency | Logging middleware in the app, not a skill | app code | `llm-feature` step 5 asks Claude to add it |

## Why these are not in the plugin today

- A plugin hook runs in every project the plugin is installed in. Rules 1, 2 and 6 need per-repo gate discovery and a low false-positive rate, so they need their own tests before they can block anyone's turn.
- Rule 4 needs network access and a per-ecosystem parser for install commands, which makes it a runtime component, not a few lines of instructions.
- The global environment already handles orchestration, delegation and context limits. This pack does not add hooks for those.

## Design constraints for the runtime

- Hooks report problems; they do not rewrite code. A block reason names the file and line and the command to run.
- Every blocking hook has an escape the user controls (an env var or setting) and a test suite with false-positive cases (a test file that legitimately uses `.skip` with a reason, a vendored file with `eslint-disable`).
- Keep hook output under about 100 tokens per event. The SessionStart line costs about 70 tokens.
