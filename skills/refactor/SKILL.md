---
name: refactor
description: 'Behavior-preserving refactoring, and finding what is worth refactoring. Use when the user says "refactor", "clean up", "tidy", "split into smaller functions", "extract", "deduplicate", "this is a mess", "untangle", "what should we refactor", or "the codebase is getting hard to change", even when the code has no tests or the request also asks for a behavior change "while you are at it".'
metadata:
  type: technique
---

**Refactoring** changes structure without changing behavior, proven by tests that pass before, between and after small steps.

When the user asks *what* to refactor rather than to refactor a named piece of code, follow [SURVEY.md](SURVEY.md) instead.

## Process

1. **Pin current behavior.** Find the tests that cover the code. Where coverage is thin, first write characterization tests through the public interface that assert what the code does today, odd cases included; a surprising case gets a test and a note, not a fix. Done when every branch you will touch is covered and the tests pass, or "not run" with the command.
2. **Move in small steps.** One mechanical change at a time (extract, rename, inline, move), running the pinned tests after each. When a step goes red, undo that step instead of patching forward. Before deleting code that looks pointless, find why it exists (`git log -L`, callers, comments); keep it if the reason still holds. Done when the target structure is reached with the tests green.
3. **Check it got simpler.** Compare before and after: fewer concepts a reader must hold, a smaller interface, less duplication. If the result is not clearly simpler, revert it and say so. Done when you can name what got simpler.
4. **Change behavior separately.** A requested behavior change ("while you're at it, make X do Y") comes after the refactor: update the test for the new behavior first, then change the code in its own edit. Done when the report lists the refactor and the behavior change as separate steps.

<refactor-report>
**Pinned by:** <tests, new ones marked>; result before: <passed / not run>
**Steps:** 1. <mechanical change> 2. ...
**Simpler because:** <what a reader no longer has to hold>
**Behavior change (separate):** <test updated, then code> or none
**Tests after:** <passed / not run with command>
</refactor-report>
