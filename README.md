# SWE Essential Skills

Software engineering skills for Claude Code. They don't teach Claude to code. They target the moments where coding agents reliably cut corners: fixing before reproducing, writing code before tests, declaring UI work done without opening it, reviewing by skimming, and building before the spec is settled.

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
| `code-review` | You ask for a review of a diff, branch or PR | Ranked findings with file:line, trigger scenario and fix | Planned |
| `verify-ui` | Claude changes UI | Evidence from the running build: console, network, screenshot | Planned |
| `spec` | You run `/spec` or describe something to build | A `SPEC.md` written after an interview | Planned |
| `slices` | You ask to break a spec into tasks or tickets | Tracer-bullet tickets with blocking edges and acceptance | Planned |

Security review, shipping, design decisions and dependency upgrades are next, once the skills above pass their evals.

## Development

See [.claude/CLAUDE.md](.claude/CLAUDE.md) for the skill standard and the checks to run.

## License

MIT. See [LICENSE](LICENSE).
