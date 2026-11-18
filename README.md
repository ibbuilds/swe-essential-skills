# SWE Essential Skills

Software engineering skills for Claude Code. They don't teach Claude to code. They target the moments where coding agents reliably cut corners: fixing before reproducing, writing code before tests, declaring UI work done without opening it, building before the spec is settled, skipping a failing check to ship, and jumping several major versions at once.

> **Rebuild in progress.** The previous eighteen-skill suite is preserved at the [`legacy-v0`](https://github.com/ibbuilds/swe-essential-skills/tree/legacy-v0) tag. A skill is added here only after an eval shows Claude does worse without it.

## Install

In Claude Code:

```
/plugin marketplace add ibbuilds/swe-essential-skills
/plugin install swe-essential-skills@swe-essential-skills
```

## Skills

| Skill | How it starts | What you get | Status |
| --- | --- | --- | --- |
| `debug` | You say "debug this", or something is broken, failing or slow | A reproduction first, then ranked hypotheses, then a root-cause fix with a regression test | Ready |
| `tdd` | You build a feature or fix a bug in a repo with tests | One failing test at a time, in vertical slices | Ready |
| `code-review` | You ask for a review of a diff, branch or PR | Ranked findings with file:line, trigger scenario and fix | Dropped: Claude already does this without a skill |
| `verify-ui` | Claude changes UI | Evidence from the running build: console, network, screenshot | Ready |
| `spec` | You run `/spec` or describe something to build | A `SPEC.md` written after an interview | Ready |
| `slices` | You ask to break a spec into tasks or tickets | Tracer-bullet tickets with blocking edges and acceptance | Ready |
| `security-review` | You ask "is this secure", or code touches auth, secrets, payments, uploads or user input | Findings with file:line, attacker preconditions, exploit and fix | Ready |
| `ship` | You say "open a PR", "deploy", "release" or "CI is failing" | Checks run before the PR, a PR body that says what ran, CI fixed at the cause, a release checklist with rollback | Ready |
| `decide` | You ask "X or Y?" about a database, framework, hosting or service boundary | Options compared against the repo's constraints, a recommendation and an ADR in `docs/adr/` | Ready |
| `upgrade` | You say "upgrade", "bump", "migrate to vN" or see deprecation warnings | One major version per step, from the official migration guide, with checks between steps | Ready |
| `incident` | You say "prod is down", "outage", "5xx since the deploy" or "write the postmortem" | Mitigation first with the repo's own rollback command; a blameless postmortem whose action items have owners and due dates | Ready |
| `db-migration` | You ask for a schema change on a live database | Expand-contract phases and batched backfills | Dropped: Claude already does this without a skill |

## Development

See [.claude/CLAUDE.md](.claude/CLAUDE.md) for the skill standard and the checks to run.

## License

MIT. See [LICENSE](LICENSE).
