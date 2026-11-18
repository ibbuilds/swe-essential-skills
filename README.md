# SWE Essential Skills

Thirteen skills for Claude Code that target the moments where coding agents cut corners: fixing a bug they never reproduced, writing code before its test, saying "done" without running anything, turning CI green by skipping the failing test, upgrading three major versions in one jump, optimizing without measuring, and shipping an LLM feature with an inline prompt and no eval set.

They don't teach Claude to code. Each one changes what Claude does at one specific moment. A skill stays only if it beats Claude without the plugin on the same task, with Claude Code's own built-in skills available in both runs.

Status: **unreleased (0.9.0)**. The first release will be 1.0.0, after use in real projects.

## Install

In Claude Code:

```
/plugin marketplace add ibbuilds/swe-essential-skills
/plugin install swe-essential-skills@swe-essential-skills
```

Skills start on their own when your request matches. You can also call one directly, for example `/swe-essential-skills:diagnose`. To update later, run `/plugin marketplace update swe-essential-skills`.

## Skills

### Plan

| Skill | Starts when | What changes |
| --- | --- | --- |
| `spec` | You describe a feature that still has open decisions, or ask for a spec, PRD or requirements | Claude reads the code first, then asks only the decisions, in rounds of up to four with a recommended answer you can accept with "yes". A fresh subagent then reads the spec as an implementer who can't ask questions. Output: `SPEC.md`. |
| `tickets` | You ask to break a spec into tickets, issues or a backlog | Tracer-bullet tickets that each cross every layer, with blocking edges, AFK/HITL marking and acceptance criteria. Written to `TICKETS.md`, or created as GitHub issues when you ask. |
| `decide` | You ask "X or Y?" about a database, framework, hosting, library or service boundary | A comparison against your repo's real constraints and a recommendation. An ADR only when the choice is hard to reverse. |

### Build

| Skill | Starts when | What changes |
| --- | --- | --- |
| `tdd` | You ask for a new function, endpoint or option in a repo with tests | One test that fails for the right reason, the least code to pass it, then the next. Tautological and mock-only tests are named and avoided. |
| `diagnose` | Something is broken, failing, flaky, or worse since a release | No fix before a red reproduction. Regressions are bisected. The fix goes where the wrong value is produced, and the reproduction stays as a test. |
| `refactor` | You ask to refactor or clean up a named piece of code, or ask what is worth refactoring | Behavior is pinned by tests first, small steps stay green, and requested behavior changes are kept separate. A survey ranks candidates by churn and design evidence. |
| `perf` | Something is too slow or too big | A baseline with its noise range, a profile, one change at a time, and keep or revert based on the numbers. |
| `deps` | You add, install, upgrade or bump a dependency | Names, versions and install scripts are checked on the registry, not from memory. Existing dependencies and the standard library come first. Upgrades go one major version at a time. |
| `llm-feature` | You add or change a feature that calls a model | The eval set comes before the prompt, and prompts live in versioned files. Output is structured and validated. Model IDs come from current docs, and every call logs its cost and latency. |

### Finish and ship

| Skill | Starts when | What changes |
| --- | --- | --- |
| `done` | Claude is about to report a code change as done, fixed or passing | Gates run after the last edit, and their output is quoted. The evidence must fit the claim. Skips, suppressions and loosened assertions are flagged. |
| `ship` | You ask to open a PR, fix CI, release or deploy | A PR body that says what actually ran, the blast radius and the way back. CI is fixed at the cause. Releases follow a checklist that includes the rollback. |
| `security` | You ask whether a route or feature is secure, or launch code that touches auth, payments, uploads, secrets or an LLM with tools | Every path to the asset is mapped. A finding is reported only with an attacker, their preconditions and an exploit. Prompt injection into tools with side effects is covered. |
| `incident` | Production is down, or you need a postmortem | Mitigation comes first, using the repo's own rollback command, and recovery is confirmed. The postmortem is blameless, and every action item has an owner and a date. |

## The one hook

Claude rarely stops to look for a skill just before its final message. On their own, `done`, `tdd` and `deps` would almost never fire mid-task: in trigger evals, `done` fired 0 times in 3 runs.

The plugin adds one SessionStart hook. Once per session it prints a single sentence, about 70 tokens, reminding Claude to:
- call `tdd` or `diagnose` before writing code
- call `deps` before installing a package
- call `done` before reporting back

With the hook, `tdd` went from firing in 1 of 3 runs to 3 of 3.

## What it leaves to Claude Code

Claude Code ships its own `code-review`, `simplify`, `security-review` (for the pending diff) and `run` (launch and drive the app) skills, and this pack doesn't duplicate them. `done` calls `run` for UI checks when it is available. `security` covers a named surface, while `security-review` covers your diff.

If you also use [pm-essential-skills](https://github.com/ibbuilds/pm-essential-skills), it owns `handoff`, `humanize`, `grill-me`, `breakdown`, `retro` and `write-skill`. This pack has no skill with the same job.

## Results

Measured with Claude Opus 5.5 on 2026-11-18, 3 runs per arm. "Without" is Claude Code with no plugin, with every built-in skill available. Scores are the share of graders passed.

**Behavior** (`claude plugin eval`, mean over each skill's cases):

| Skill | Cases | With | Without |
| --- | --- | --- | --- |
| `perf` | 2 | 1.00 | 0.00 |
| `ship` | 2 | 1.00 | 0.00 |
| `tdd` | 2 | 0.92 | 0.25 |
| `refactor` | 2 | 1.00 | 0.33 |
| `llm-feature` | 1 | 0.83 | 0.25 |
| `incident` | 2 | 1.00 | 0.58 |
| `spec` | 2 | 0.92 | 0.50 |
| `tickets` | 2 | 0.92 | 0.50 |
| `diagnose` | 2 | 0.83 | 0.50 |
| `done` | 3 | 0.83 | 0.50 |
| `decide` | 3 | 1.00 | 0.67 |
| `deps` | 3 | 1.00 | 0.67 |
| `security` | 3 | 1.00 | 0.89 |

**Shell trials** (`scripts/shell_trial.py`, real shell, the author's own environment and global `CLAUDE.md` in both arms):

| Case | With | Without |
| --- | --- | --- |
| `diagnose`: regression hidden in git history | 1.00 | 0.67. It edited code before reproducing, 3 of 3 runs. |
| `done`: a one-line change breaks a test in another folder | 1.00 | 0.67 |
| `tdd`: new function in a tested repo | 1.00 | 0.33. It never saw a test fail first. |

**Triggers:** 219 runs across 73 cases, each checking that the skill fires or stays quiet when it should; 215 are correct. The misses:
- `deps` on "add date-fns": 2 of 3.
- `done` on "change this and tell me when it's done": 0 of 3 under `claude plugin eval`. In the shell trials, which run a normal headless session with the hook, `done` fired in all 9 runs.

**Limits:**
- Each skill has only one to three behavior cases.
- The `security` gain comes from one case (stating the attacker's preconditions). On the other two cases, Claude without the plugin already found the vulnerability.

## How skills earn their place

Every skill has eval cases in [`evals/`](evals/), run with `claude plugin eval`:

- **Trigger cases** check that the skill fires on a direct request and on a reworded one. They also check that it stays quiet on a neighbouring skill's request and on an unrelated one. Graders match `swe-essential-skills:<skill>`, so a built-in skill with a similar name can't pass for ours.
- **Behavior cases** run with and without the plugin, and grade the outcome: the bug fixed at its cause, the bar not lowered, no invented package version.
- **Shell trials** in [`evals-shell/`](evals-shell/) cover the skills whose value is running things. They use `scripts/shell_trial.py`, because the eval runner can't sandbox a shell on Windows.

A skill that doesn't beat its baseline is removed:
- `code-review`, `db-migration`, `review-feedback`, `retro` and `handoff` were dropped because Claude scored the same without them. Their behavior cases (except `retro`'s) stay in `evals/`, tagged `baseline-only`, to re-check when the model changes.
- `humanize` was dropped because pm-essential-skills already covers it.

## Credits

These skills adapt ideas from packs whose authors have spent a long time testing what makes agents behave. Nothing is copied wholesale. Each idea was cut down to what Claude doesn't already do and checked against a baseline.

- [obra/superpowers](https://github.com/obra/superpowers): evidence before completion claims, excuse tables built from observed failures, and the session-start reminder (here cut from about 500 words to one sentence).
- [mattpocock/skills](https://github.com/mattpocock/skills): grilling interviews with a recommended answer, tracer-bullet tickets, deep modules and the deletion test, and the ADR bar.
- [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills): guarding the bar against skipped tests and suppressions, keep-or-revert performance work, and trigger evals with paired near-misses.
- [cursor/plugins pstack](https://github.com/cursor/plugins/tree/main/pstack): reply contracts, the cheapest-first performance order, and proving a check can fail.
- [trailofbits/skills](https://github.com/trailofbits/skills): "unknown is not clean" for dependency checks, and the revert arm for proving a fix.
- [hamelsmu/evals-skills](https://github.com/hamelsmu/evals-skills) and [getsentry/skills](https://github.com/getsentry/skills): error analysis before writing evals, binary judges validated against labels, and comparing prompt candidates on held-out cases.
- [blader/humanizer](https://github.com/blader/humanizer) was studied for this pack's writing skill, which now lives in pm-essential-skills.

## Development

See [.claude/CLAUDE.md](.claude/CLAUDE.md) for the skill standard, the checks and the eval pitfalls. The suite before the plugin rebuild is in the history at [`35cc01c`](https://github.com/ibbuilds/swe-essential-skills/tree/35cc01c).

## License

MIT. See [LICENSE](LICENSE).
