---
name: ship
description: 'Shipping work with evidence: pull requests, CI and releases. Use when the user says "open a PR", "ship it", "deploy", "release", "CI is failing", "get it green", "what''s left before we release", even when the checks look fine or the user asks to skip a failing test to unblock a merge. For a script or app that errors use debug.'
metadata:
  type: technique
---

**Shipping** moves a change forward only on evidence: checks run, failures fixed at their cause, and a known way back.

## Open a pull request

1. **Run the gates.** Find the test, lint, typecheck and build commands in the package scripts, Makefile or CI config and run each. Done when each one passed, was fixed, or is listed as "not run" with its command.
2. **Write the body** from `<pr-body>`. Create the PR with `gh pr create` when it is available; otherwise write the body to the file the user names. Done when the PR or file exists and its Verification table matches what actually ran.

## Fix failing CI

1. **Read the failing job's log** and find the first real failure. Done when you can quote the failing assertion or error.
2. **Fix the cause.** A regression in the change gets a code fix; a test that is wrong gets a corrected test and a sentence on why; a flaky or infrastructure failure gets one rerun, then a report. When the user asks to skip, loosen or disable a check, show the real cause and its fix first: a one-line fix unblocks the merge as fast as a skip and ships no bug. Done when the fix is in and the suite passes locally, or "not run" with the command.
3. **Push and recheck.** Done when CI is green. After three rounds without progress, stop and report what was tried.

## Release or deploy

Work through `<release-checklist>` in order and report each line.

<pr-body>
## Summary
<what changed and why, two or three sentences>

## Verification
| Check | Command | Result |
| --- | --- | --- |
| Tests | `<command>` | passed / failed / not run |
| Lint | `<command>` | passed / failed / not run |
| Typecheck | `<command>` | passed / failed / not run |
| Build | `<command>` | passed / failed / not run |

## Risk and rollback
<what could break and how to undo it>
</pr-body>

<release-checklist>
- [ ] Gates green on the exact commit being released
- [ ] Migrations are backward compatible, or the rollback plan covers them
- [ ] Rollback command written down before deploying
- [ ] Deployed: `<command>` at `<time>`
- [ ] Verified after deploy: health check, one key user flow, error rate
- [ ] Announced, with the rollback command
</release-checklist>
