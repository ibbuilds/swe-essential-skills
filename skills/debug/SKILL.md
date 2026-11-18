---
name: debug
description: 'Root-cause debugging from a failing reproduction. Use when the user says "debug this", "why is this failing", "what''s going on", or reports something broken, throwing, returning wrong values, flaky, hanging or slower since a release, even when the cause looks obvious from the code or the user asks for the quickest fix.'
metadata:
  type: discipline
---

**Debugging** means proving the cause before changing code: reproduce it red, rank hypotheses, then fix at the root and keep the reproduction as a regression test.

```
No source edit until a check reproduces the bug and fails.
```

## Process

1. **Reproduce.** Write the smallest check that shows the bug, in the repo's own test framework when it has one: a failing test, a script, or a command and its output. For slow bugs the check is a timing; for flaky bugs it is a loop that shows the failure rate. Run it and watch it fail for the reported reason. Done when the check is red and its failure matches the report.
   - When you cannot run commands, still write the failing test first, give the exact command to run it, and label it "not run".
2. **Hypothesize.** List two to four causes, most likely first, each with a prediction that would confirm it ("if the key is mixed case, the lookup returns undefined"). Check them against code, data, logs or temporary instrumentation. Done when one cause is confirmed by evidence and the rest are ruled out.
3. **Fix at the root.** Change the code where the wrong value is produced, not where it surfaces. Done when the reproduction passes, the existing tests still pass, and temporary instrumentation is gone.
4. **Report** with the template below.

<debug-report>
**Symptom:** what the user saw.
**Reproduction:** `<path or command>`, red before the fix: `<failure line>`
**Hypotheses:** 1. <cause>: confirmed by <evidence>. 2. <cause>: ruled out by <evidence>.
**Root cause:** `<file:line>` and why it produces the symptom.
**Fix:** what changed.
**Regression test:** `<path>`, failed before and passes after (or "not run" and the command to run it).
</debug-report>

## Excuses

| Excuse | Reality |
| --- | --- |
| "The fix is obvious from the code." | Obvious fixes still need the red test. It costs a minute and proves the fix touched the right thing. |
| "There's a demo in 15 minutes." | A one-assertion failing test is the fastest proof the demo works. Keep it small and write it first. |
| "I'll add the test after the fix." | A test written after the fix never failed, so it proves nothing about this bug. |
| "I can't run commands here." | Write the test anyway and hand over the command. |

## Red flags

- Editing source while no failing check exists.
- Guarding the bad value where it shows up (`?? 0`, an empty-string fallback) instead of where it is produced.
- "Should work now" with no test result or "not run" label.
