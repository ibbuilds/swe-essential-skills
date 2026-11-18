# Changelog

## Unreleased

- Rebuilt as a Claude Code plugin with a marketplace manifest.
- Removed the legacy suite: eighteen skills, design and audit documents, evaluation fixtures, validators and Codex adapters. It remains available at the `legacy-v0` tag.
- Added `scripts/lint_skills.py`, its tests, a CI workflow and the first eval case.
- Added the `debug`, `tdd`, `spec`, `slices` and `verify-ui` skills, each with trigger and behavior eval cases and a measured gain over a no-skill baseline.
- Dropped the planned `code-review` skill: Claude passed its behavior cases without one. The cases stay in `evals/` to re-check on model upgrades.
- Added the `security-review`, `ship`, `decide` and `upgrade` skills, with the same eval coverage.
- Dropped the planned `db-migration` skill: Claude passed its behavior cases without one (expand-contract rename and batched backfill, 6/6 runs). The cases stay in `evals/` to re-check on model upgrades.
- Added the `incident` skill: rollback with the repo's documented command before debugging, and postmortems with owned, dated action items.
- Added the `perf` skill: no speed edits without a named target, and numbers or measurement steps before and after.
- Added the `refactor` skill: characterization tests before restructuring, and behavior changes kept out of the refactor.
