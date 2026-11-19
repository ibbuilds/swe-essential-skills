# Changelog

## Unreleased (0.9.0)

No release has been cut yet. The first release will be 1.0.0, once the pack has been tested in real projects.

Rebuilt the pack after an audit against Claude Code's built-in skills and seven practitioner skill packs, then audited the whole engineering lifecycle for gaps.

### Lifecycle audit
- Probed six workflows the pack did not cover, each with a no-plugin baseline first: adding tests to existing code (graded by injected bugs), merge conflicts, scope discipline, reusing existing helpers, building a payment webhook safely, and copies of a bug elsewhere in the repo. Claude without a skill scored 1.00 on all of them, so no skill was built; the first five cases stay tagged `baseline-only`. With `diagnose` loaded, Claude found the copies in only 2 of 3 runs, so `diagnose` gained a step for it (3 of 3 after).
- `spec` now has trigger cases for a plain feature request and for a one-sentence app idea in an empty folder. It fired 3 of 3 on both.

### Changed
- Renamed `debug` to `diagnose` (Claude Code ships `/debug`) and `slices` to `tickets`.
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

### Added
- `done`: no completion claim without gates run after the last edit, evidence matched to the claim, and a check for lowered bars (skips, suppressions, loosened assertions, unrequested fallbacks).
- `llm-feature`: contract, eval set before the prompt, model IDs and prices from current docs, prompts in versioned files, structured validated output, per-call cost and latency logs. `EVALS.md` covers error analysis and judge validation.
- A one-sentence SessionStart hook so `tdd`, `diagnose`, `deps` and `done` fire mid-task.
- `scripts/shell_trial.py` and `evals-shell/`: with and without plugin trials that can run a shell, for Windows where the eval runner cannot.
- Lint rule: Skill graders must match the plugin's namespaced skill name.

- `done`: user-visible changes must update the README, docs, help text and the changelog's Unreleased section. On a renamed CLI flag, the changelog entry went from 0 of 3 runs to 3 of 3.
- `diagnose`: after the fix, search for the same faulty pattern and fix or list each copy.
- `scripts/shell_trial.py`: `command` graders run a script in the trial folder, for hidden tests and injected bugs.

### Removed
- `security`: Claude without the skill found the same issues on three review cases (0.89 vs 1.00, the gap from one wording grader) and built a payment webhook with signature checks and idempotency (1.00 vs 1.00). Claude Code's built-in `security-review` covers the diff.
- `review-feedback`, `retro` and `handoff`: built, then removed when Claude Opus 5.5 matched them without the plugin (review-feedback 1.00 vs 1.00 on two cases, retro 0.50 vs 0.50, handoff 1.00 vs 1.00).
- `humanize`: removed because pm-essential-skills ships its own `humanize`; two installed packs with the same skill name collide.

### Evals
- Fixed three grader problems that made earlier numbers unreliable: Edit and Write are gated in `claude plugin eval` and need `--allow-tools Edit Write`; LLM graders on `focus: trace` misjudged long raw traces; `focus: files` ignores edits to existing files.
- Trigger graders match `swe-essential-skills:<skill>`. The old graders also matched built-in skills with the same name, so `security-review` trigger scores were not evidence.
- Trivia near-misses relabeled `unrelated`; near-misses are now neighbouring skills' requests.
- Added `llm-feature-behavior-2` (fixing a bad inline prompt) and a `perf` shell trial with a decoy bottleneck.

## Earlier work

- The first plugin version (twelve skills, eval cases, a lint script and CI) was tagged 1.0.0 before it was ready; that tag and release were withdrawn. The legacy suite before the plugin remains in the history at commit `35cc01c`.
