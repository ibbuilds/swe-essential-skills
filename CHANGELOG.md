# Changelog

## 2.0.0 (unreleased)

Rebuilt the pack after an audit against Claude Code's built-in skills and five practitioner skill packs.

### Changed
- Renamed `debug` to `diagnose` (Claude Code ships `/debug`), `slices` to `tickets`, and `security-review` to `security` (Claude Code ships a model-visible `security-review`).
- Merged `upgrade` into `deps`, which now also vets new dependencies on the registry: spelling, repository, maintenance, install scripts, and whether the standard library or an existing dependency already does the job.
- Merged `verify-ui` into `done`. Claude Code's built-in `run` skill launches and drives the app, and `done` calls it.
- `diagnose`: bisect regressions, loop flaky checks, tag temporary logs, re-run the same check with the fix reverted, stop after three failed fixes.
- `tdd`: name the bug a test would catch, avoid tautological, mocked-subject and change-detector tests, run the whole suite.
- `spec`: interview in rounds of up to four decisions with a recommended answer, pin domain terms, and check the spec with a fresh subagent acting as the implementer.
- `tickets`: AFK/HITL marking and an out-of-scope line per ticket.
- `decide`: write an ADR only for decisions that are hard to reverse.
- `refactor`: small steps kept green, revert when the result is not simpler, and a survey for "what should we refactor" ranked by churn and design evidence.
- `perf`: measure the noise first, change one thing at a time, keep a change only when it beats the noise.
- `ship`: blast radius and one-way or two-way door in the PR body; stop when the same CI failure returns twice.
- `security`: LLM and agent risks (prompt injection into side-effecting tools, output reaching sinks, cost bounds), SSRF and idempotency, and proof by test or command where possible.

### Added
- `done`: no completion claim without gates run after the last edit, evidence matched to the claim, and a check for lowered bars (skips, suppressions, loosened assertions, unrequested fallbacks).
- `review-feedback`: verify each review comment against the code, then fix, push back with evidence, ask, or defer.
- `llm-feature`: contract, eval set before the prompt, model IDs and prices from current docs, prompts in versioned files, structured validated output, per-call cost and latency logs. `EVALS.md` covers error analysis and judge validation.
- `humanize`: prose without AI tells, with a facts-preserved check. Adapted from blader/humanizer (MIT).
- `handoff`: resumable `HANDOFF.md` notes, verified against the repo on pickup.
- `retro` (user-invoked): turn a repeated agent mistake into a check that provably fails on it.
- `scripts/shell_trial.py` and `evals-shell/`: with and without plugin trials that can run a shell, for Windows where the eval runner cannot.
- Lint rule: Skill graders must match the plugin's namespaced skill name.

### Evals
- Trigger graders match `swe-essential-skills:<skill>`. The old graders also matched built-in skills with the same name, so `security-review` trigger scores were not evidence.
- Trivia near-misses relabeled `unrelated`; near-misses are now neighbouring skills' requests.

## 1.0.0 (2026-11-18)

- Rebuilt as a Claude Code plugin with a marketplace manifest, twelve skills, eval cases, a lint script and CI. The legacy suite remains in the history at commit `35cc01c`.
