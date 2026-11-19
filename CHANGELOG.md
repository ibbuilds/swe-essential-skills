# Changelog

## Unreleased (0.9.0)

No release has been cut yet. The first release will be 1.0.0, once the pack has been tested in real projects.

Rebuilt the pack after an audit against Claude Code's built-in skills and seven practitioner skill packs.

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
- `llm-feature`: contract, eval set before the prompt, model IDs and prices from current docs, prompts in versioned files, structured validated output, per-call cost and latency logs. `EVALS.md` covers error analysis and judge validation.
- A one-sentence SessionStart hook so `tdd`, `diagnose`, `deps` and `done` fire mid-task.
- `scripts/shell_trial.py` and `evals-shell/`: with and without plugin trials that can run a shell, for Windows where the eval runner cannot.
- Lint rule: Skill graders must match the plugin's namespaced skill name.

### Removed
- `review-feedback`, `retro` and `handoff`: built, then removed when Claude Opus 5.5 matched them without the plugin (review-feedback 1.00 vs 1.00 on two cases, retro 0.50 vs 0.50, handoff 1.00 vs 1.00).
- `humanize`: removed because pm-essential-skills ships its own `humanize`; two installed packs with the same skill name collide.

### Evals
- Fixed three grader problems that made earlier numbers unreliable: Edit and Write are gated in `claude plugin eval` and need `--allow-tools Edit Write`; LLM graders on `focus: trace` misjudged long raw traces; `focus: files` ignores edits to existing files.
- Trigger graders match `swe-essential-skills:<skill>`. The old graders also matched built-in skills with the same name, so `security-review` trigger scores were not evidence.
- Trivia near-misses relabeled `unrelated`; near-misses are now neighbouring skills' requests.
- Added `llm-feature-behavior-2` (fixing a bad inline prompt) and a `perf` shell trial with a decoy bottleneck.

## Earlier work

- The first plugin version (twelve skills, eval cases, a lint script and CI) was tagged 1.0.0 before it was ready; that tag and release were withdrawn. The legacy suite before the plugin remains in the history at commit `35cc01c`.
