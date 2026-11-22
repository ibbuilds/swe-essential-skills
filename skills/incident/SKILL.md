---
name: incident
description: 'Production incident response and postmortems. Use when the user says "prod is down", "outage", "on fire", "incident", "5xx since the deploy", "users can''t log in", "write the postmortem" or "what went wrong in prod", even when the cause looks findable in the code or a generic rollback command seems enough. For a failing test or a local bug use diagnose.'
metadata:
  type: technique
---

**Incident response** stops user impact first, with the repo's own commands, and writes up afterwards so the failure cannot recur.

## During an incident

1. **Find the way back.** Read the repo's deploy and runbook docs (DEPLOY.md, RUNBOOK.md, README, CHANGELOG, CI deploy config) for the exact rollback, feature-flag or revert command and the last good version. Done when you have that command with the version filled in, or know no documented one exists.
2. **Mitigate first.** When impact started after a change (deploy, config, flag), open the reply with that exact command. Otherwise pick the fastest lever that limits impact: disable the feature flag, fail over, scale up, shed the failing path, or switch off the broken third-party integration and post a status update. Root-cause work waits until users are unblocked. Done when the reply's first instruction is the mitigation.
3. **Confirm recovery** with the same signal that showed the impact (error rate, latency, one real request). Done when that signal is back to normal, or the user has the exact check to run.
4. **Keep a log** while it happens: timestamped actions, observations and numbers, in the chat or `incident-<date>.md`. The postmortem is written from it.

## Postmortem

Write it from `<postmortem>`, taking every time and number from the notes. Duration runs from first impact to recovery. Every action item has an owner and a due date; write "TBD" when the notes name none. Describe systems and process, not people.

<postmortem>
# Postmortem: <title>

## Summary
<two or three sentences: what broke, why, how it was fixed>

## Impact
- Duration: <first impact → recovery, minutes>
- Users or requests affected: <numbers>
- Support load: <tickets>

## Timeline
| Time | Event |
| --- | --- |

## Root cause
<the mechanism, and the change that introduced it>

## Action items
| Action | Type (prevent / detect / mitigate) | Owner | Due |
| --- | --- | --- | --- |
</postmortem>
