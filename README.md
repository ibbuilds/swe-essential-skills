# SWE Essential Skills

Twelve skills for Claude Code. Each one changes what Claude does at a moment where it tends to cut corners: fixing a bug it never reproduced, writing code before its test, saying "done" without running anything, optimizing without measuring, guessing package versions, or building a feature on guessed requirements.

They don't teach Claude to code. A skill is in this pack only if it beat Claude without the plugin on the same task, with Claude Code's own built-in skills available in both runs. Skills we built that didn't beat that baseline were removed.

Status: **unreleased (0.9.0)**. The first release will be 1.0.0, after use in real projects.

## Install

In Claude Code:

```
/plugin marketplace add ibbuilds/swe-essential-skills
/plugin install swe-essential-skills@swe-essential-skills
```

You don't call the skills yourself. Each one starts when your request or Claude's next step matches it. You can still call one by name, for example `/swe-essential-skills:diagnose`. To update, run `/plugin marketplace update swe-essential-skills`.

## Skills

### Plan

**`spec`** turns a feature idea into decisions before code.
- **Starts when:** you describe something to build that still has open product decisions ("add team workspaces so people can invite coworkers", "I want a web app for my climbing gym"), or ask for a spec, PRD or requirements.
- **Result:** Claude reads the code first, then asks only the decisions, up to four at a time, each with a recommended answer you can accept with "yes". A fresh subagent then reads the spec as an implementer who can't ask questions, to catch gaps. You get `SPEC.md`.

**`tickets`** splits a spec or plan into work that ships.
- **Starts when:** you ask to break a spec or plan into tickets, issues or a backlog.
- **Result:** tracer-bullet tickets: the first one works end to end, and each one crosses every layer it needs. Each ticket lists what blocks it, whether an agent can finish it alone or needs a person, and its acceptance criteria. Written to `TICKETS.md`, or created as GitHub issues if you ask.

**`decide`** answers "X or Y?" for your project, not in general.
- **Starts when:** you're choosing a database, framework, queue, auth provider, hosting, library or service boundary.
- **Result:** the options compared against constraints read from your repo (hosting, existing services, scale), with versions and limits checked in current docs, and one recommendation that names the deciding constraint. An ADR only when the choice is hard to reverse.

### Build

**`tdd`** builds new code one tested behavior at a time.
- **Starts when:** you ask for a new function, endpoint or option in a repo that has tests, or ask for TDD.
- **Result:** one test that fails for the right reason, the least code to pass it, then the next. Tests that prove nothing (tautologies, mocked subjects, change detectors) are avoided.

**`diagnose`** finds the cause before changing code.
- **Starts when:** something is broken, failing, flaky, hanging or worse since a release.
- **Result:** a check that reproduces the bug, a confirmed cause, and a fix where the wrong value is produced, not where it shows up. Regressions are found with `git bisect`. Copies of the same faulty pattern elsewhere are fixed or listed. The reproduction stays as a regression test.

**`refactor`** changes structure without changing behavior.
- **Starts when:** you ask to refactor or clean up code, or ask what is worth refactoring.
- **Result:** behavior pinned by tests first, small steps kept green, and any requested behavior change done separately. "What should we refactor" gets a ranked list based on churn and design evidence.

**`perf`** makes things faster with numbers, not guesses.
- **Starts when:** something is slow, too big or uses too much memory.
- **Result:** a baseline with its noise range, a profile that finds the real cost, one change at a time, and each change kept or reverted based on before and after numbers.

**`deps`** checks packages against the registry, not memory.
- **Starts when:** you add, install, upgrade or bump a dependency, or Claude is about to install one.
- **Result:** name, version, repository and install scripts checked on the registry; the standard library and existing dependencies tried first; upgrades one major version at a time, following the official migration guides.

**`llm-feature`** treats prompts like code.
- **Starts when:** you add or change a feature that calls a model, change a prompt or model, or say the AI output is bad.
- **Result:** an eval set before the prompt, prompts in versioned files, structured and validated output, a model chosen from current docs and prices, and a log line per call with cost and latency.

### Finish and ship

**`done`** makes "done" mean verified.
- **Starts when:** Claude is about to report a code change as done, fixed or working.
- **Result:** tests, typecheck, lint and build run after the last edit, with their output quoted. The evidence has to fit the claim (a fixed bug needs its reproduction, a UI change needs the running page). Skipped tests, suppressions and loosened assertions are flagged. User-visible changes update the README, docs and changelog.

**`ship`** moves changes forward on evidence.
- **Starts when:** you ask to open a PR, fix CI, release or deploy.
- **Result:** a PR body that says what actually ran, who is affected if it's wrong and how to undo it. CI is fixed at the cause, never by skipping the check. Releases follow a checklist that writes down the rollback before deploying.

**`incident`** stops the damage first.
- **Starts when:** production is down or broken, or you need a postmortem.
- **Result:** mitigation first, using your repo's own rollback or flag command, then recovery confirmed with the same signal that showed the problem. The postmortem is blameless and every action item has an owner and a date.

## Activation

Skills fire from their descriptions, so you don't have to remember names. Four needed help: Claude rarely looks for a skill in the middle of a task, so `tdd`, `diagnose`, `deps` and `done` seldom fired on their own (`done` 0 of 3 runs, `tdd` 1 of 3). The plugin adds one SessionStart hook: a single sentence, about 70 tokens, once per session, reminding Claude to call `tdd` or `diagnose` before writing code, `deps` before installing a package, and `done` before reporting back. With it, `tdd` fired 3 of 3 and `done` fired in every shell trial.

## What it leaves to Claude Code

Claude Code already ships `code-review`, `simplify`, `security-review`, `run`, `verify` and `init`, and this pack doesn't duplicate them. `done` uses `run` to check UI changes.

We also tested common workflows where Claude Code alone already did the job well. No skill was built for these, and each test stays in the repo tagged `baseline-only` to re-check when models change:

| Workflow | Claude without a skill |
| --- | --- |
| Adding tests to existing code | 1.00: tests killed all 7 injected bugs and flagged a code-vs-comment mismatch |
| Resolving a merge conflict | 1.00: kept both sides' intent, ran the tests |
| Fixing a bug without touching unrelated code | 1.00 |
| Reusing an existing helper instead of writing a new one | 1.00 |
| Finding copies of a bug elsewhere after fixing it | 1.00. `diagnose` alone narrowed to the reported file (2 of 3), so it now has a step for this |
| Security review, and building a payment webhook safely | 0.89 on reviews, 1.00 on the webhook |
| Code review, review feedback, database migrations | the same score as with a skill |

If you also use [pm-essential-skills](https://github.com/ibbuilds/pm-essential-skills), it owns `handoff`, `humanize`, `grill-me`, `breakdown`, `retro` and `write-skill`. No skill here does the same job.

## Results

RESULTS_PLACEHOLDER

## How skills are tested

Every skill has eval cases in [`evals/`](evals/), run with `claude plugin eval`:

- **Trigger cases** check that the skill fires on a direct request and on a reworded one, and stays quiet on a neighbouring skill's request and on an unrelated one.
- **Behavior cases** run the same task with and without the plugin and grade the outcome: the bug fixed at its cause, the bar not lowered, no invented package version.
- **Shell trials** in [`evals-shell/`](evals-shell/) cover the skills whose value is running things, with hidden tests and injected bugs as graders. They use `scripts/shell_trial.py`, because the eval runner can't sandbox a shell on Windows.

## Credits

These skills adapt ideas from other packs. Nothing is copied wholesale: each idea was cut down to what Claude doesn't already do and checked against a baseline.

- [obra/superpowers](https://github.com/obra/superpowers): evidence before completion claims, excuse tables built from observed failures, and the session-start reminder (cut here from about 500 words to one sentence).
- [mattpocock/skills](https://github.com/mattpocock/skills): design interviews with a recommended answer, tracer-bullet tickets, deep modules and the ADR bar.
- [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills): guarding against skipped tests and suppressions, keep-or-revert performance work, and trigger evals with paired near-misses.
- [cursor/plugins pstack](https://github.com/cursor/plugins/tree/main/pstack): reply contracts, the cheapest-first performance order, and proving a check can fail.
- [trailofbits/skills](https://github.com/trailofbits/skills): "unknown is not clean" for dependency checks, the revert arm for proving a fix, and checking for copies of a bug after fixing it.
- [hamelsmu/evals-skills](https://github.com/hamelsmu/evals-skills) and [getsentry/skills](https://github.com/getsentry/skills): error analysis before writing evals, binary judges checked against labels, and comparing prompts on held-out cases.

## Development

See [.claude/CLAUDE.md](.claude/CLAUDE.md) for the skill standard, the checks and the eval pitfalls. The suite before the plugin rebuild is in the history at [`35cc01c`](https://github.com/ibbuilds/swe-essential-skills/tree/35cc01c).

## License

MIT. See [LICENSE](LICENSE).
