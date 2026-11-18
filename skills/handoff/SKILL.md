---
name: handoff
description: 'Resumable handoff notes between sessions. Use when the user says "write a handoff", "we''ll continue later", "pick this up tomorrow", "I''m going to clear the context", "start a fresh session for this", "where were we", "continue from the handoff", or a long task must stop before it is finished, even when the summary seems obvious from the conversation or the git log.'
metadata:
  type: technique
---

**A handoff** lets a fresh session with no memory of this one continue the work without redoing it. It points at artifacts instead of copying them, and records the decisions and dead ends that the code cannot show.

## Writing one

1. **Check the state.** `git status`, `git log --oneline -10`, the branch, and the last gate results; list uncommitted files. Done when you know exactly what is and is not saved.
2. **Write the note** from the template to `HANDOFF.md` in the repo root, or the path the user names. Use pointers (files, commits, issue links, spec sections) instead of pasted content. Leave out secrets and `.env` values. Under 60 lines. Done when every "next step" can be started without asking anything.
3. **Tell the user** the path and the one-line prompt to start the next session, for example `Continue from HANDOFF.md`. Offer to add `HANDOFF.md` to `.gitignore` if it is not ignored.

## Picking one up

When `HANDOFF.md` (or the named note) exists:

1. **Read the note, then verify it.** Check that the branch, commits and files it names exist, and rerun the gate it reports. Done when what the note claims matches the repo, or the mismatch is reported.
2. **Treat the trail as decided.** Decisions and dead ends in the note are not re-litigated or retried unless new evidence says so. Continue from the first unchecked next step.
3. **Update or delete it** when the work is finished. Done when no stale handoff is left behind.

<handoff>
# Handoff: <task>
Updated: <YYYY-MM-DD HH:MM> · Branch: `<branch>` · Last commit: `<sha> <subject>`

## Goal
<what done looks like, one or two sentences; link the spec or issue>

## State
- Done and verified: <items, with the check that proved each>
- Done, not verified: <items>
- Uncommitted: <files, or none>

## Decisions
- <decision>: <why>. Cost if wrong: <what breaks>

## Dead ends
- <approach tried>: <why it failed>

## Next steps
1. [ ] <concrete action, starting file or command>

## Watch out
<traps, flaky checks, things the user must do>
</handoff>
