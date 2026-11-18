# SWE Essential Skills

Software engineering skills for Claude Code. They don't teach Claude to code. They target the moments where coding agents reliably cut corners: fixing before reproducing, writing code before tests, declaring UI work done without opening it, building before the spec is settled, skipping a failing check to ship, jumping several major versions at once, debugging an outage before rolling back, optimizing without measuring, and slipping behavior changes into a refactor.

Every skill here earned its place in an eval: Claude did measurably worse on the same task without it.

## Install

In Claude Code:

```
/plugin marketplace add ibbuilds/swe-essential-skills
/plugin install swe-essential-skills@swe-essential-skills
```

Skills start on their own when your request matches. You can also call one by name, for example `/swe-essential-skills:debug`.

## Skills

### Plan

| Skill | Starts when you | What you get |
| --- | --- | --- |
| `spec` | Run `/spec` or describe something to build | A `SPEC.md` written after an interview, with open questions kept open |
| `slices` | Ask to break a spec into tasks or tickets | Tracer-bullet tickets with blocking edges and acceptance criteria |
| `decide` | Ask "X or Y?" about a database, framework, hosting or service boundary | Options weighed against the repo's constraints, a recommendation and an ADR in `docs/adr/` |

### Build

| Skill | Starts when you | What you get |
| --- | --- | --- |
| `tdd` | Build a feature or fix a bug in a repo with tests | One failing test at a time, in vertical slices |
| `refactor` | Say "refactor", "clean up", "split into smaller functions" or "this is a mess" | Behavior pinned by tests first, and any requested behavior change kept apart from the refactor |
| `debug` | Say "debug this", or something is broken, failing, flaky or slower since a change | A reproduction first, then ranked hypotheses, then a root-cause fix with a regression test |
| `perf` | Say "make it faster", "too slow", "optimize" or "bundle too big" | A named target and baseline, the measured bottleneck fixed, numbers before and after |
| `verify-ui` | Have Claude change UI | Evidence from the running build: console, network, screenshot |

### Ship and operate

| Skill | Starts when you | What you get |
| --- | --- | --- |
| `security-review` | Ask "is this secure", or code touches auth, secrets, payments, uploads or user input | Findings with file:line, attacker preconditions, exploit and fix |
| `ship` | Say "open a PR", "deploy", "release" or "CI is failing" | Checks run before the PR, a PR body that says what ran, CI fixed at the cause, a release checklist with rollback |
| `upgrade` | Say "upgrade", "bump", "migrate to vN" or see deprecation warnings | One major version per step, from the official migration guide, with checks between steps |
| `incident` | Say "prod is down", "outage", "5xx since the deploy" or "write the postmortem" | Mitigation first with the repo's own rollback command, and a blameless postmortem whose action items have owners and due dates |

## How skills are chosen

Each skill starts as eval cases in [`evals/`](evals/), run with [`claude plugin eval`](.claude/CLAUDE.md#checks):

1. Behavior cases are run without the skill. If Claude already passes, the skill is not built.
2. The skill is written as short as possible. Trigger cases check that it fires on direct and reworded requests and stays quiet on near-misses.
3. A deletion pass removes every line whose removal does not lower a score.

Pass rates on the behavior cases, 3 runs each, model Claude Opus 5.5:

| Skill | Without skill | With skill |
| --- | --- | --- |
| `spec` | 0.50 / 0.50 | 1.00 / 1.00 |
| `slices` | 0.67 / 0.33 | 1.00 / 1.00 |
| `decide` | 0.50 / 0.00 | 1.00 / 1.00 |
| `tdd` | 0.00 / 0.50 | 1.00 / 1.00 |
| `refactor` | 0.67 / 0.00 | 1.00 / 1.00 |
| `debug` | 0.50 / 0.50 | 1.00 / 1.00 |
| `perf` | 0.67 / 0.00 | 1.00 / 1.00 |
| `verify-ui` | 0.50 / 1.00 | 0.83 / 1.00 |
| `security-review` | 0.56 / 1.00 | 1.00 / 1.00 |
| `ship` | 0.00 / 0.00 | 1.00 / 1.00 |
| `upgrade` | 0.00 / 1.00 | 1.00 / 1.00 |
| `incident` | 0.67 / 0.33 | 1.00 / 1.00 |

Not built, because Claude passed without a skill: `code-review` (0.89 / 1.00) and `db-migration` (1.00 / 1.00). Their cases stay in `evals/` so they can be re-checked when the model changes.

Not measured: evals on the author's machine cannot grant a shell, so behaviors that need to run tests, builds or a browser are graded on edit order and reply content only.

## Development

See [.claude/CLAUDE.md](.claude/CLAUDE.md) for the skill standard and the checks to run. The previous eighteen-skill suite is in the history at [`35cc01c`](https://github.com/ibbuilds/swe-essential-skills/tree/35cc01c).

## License

MIT. See [LICENSE](LICENSE).
