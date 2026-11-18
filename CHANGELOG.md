# Changelog

## Unreleased

- Rebuilt as a Claude Code plugin with a marketplace manifest.
- Removed the legacy suite: eighteen skills, design and audit documents, evaluation fixtures, validators and Codex adapters. It remains available at the `legacy-v0` tag.
- Added `scripts/lint_skills.py`, its tests, a CI workflow and the first eval case.
- Added the `debug`, `tdd`, `spec`, `slices` and `verify-ui` skills, each with trigger and behavior eval cases and a measured gain over a no-skill baseline.
- Dropped the planned `code-review` skill: Claude passed its behavior cases without one. The cases stay in `evals/` to re-check on model upgrades.
