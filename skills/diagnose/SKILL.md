---
name: diagnose
description: 'Root-cause diagnosis from a red reproduction. Use when the user says "debug this", "why is this failing", "why does this return", "it broke", or reports something throwing, returning wrong values, flaky, hanging, or worse since a release or merge, and before you propose any fix for a bug, even when the cause looks obvious from the code or the user asks for the quickest fix. For a production outage use incident.'
metadata:
  type: discipline
---

**Diagnosing** means proving the cause before changing code: a check that is red for the reported reason, a confirmed hypothesis, a fix where the wrong value is produced, and the check kept as a regression test.

```
No source edit until a check reproduces the bug and you have seen it fail.
```

## Process

1. **Build a red-capable check.** The smallest thing that shows the user's exact symptom, in the repo's own test framework when it has one. Pick the cheapest loop that works:
   - a failing unit or integration test
   - a script or `curl` against the running app, with its output
   - for "since release X" or "after merging main": a known-good and known-bad commit, then `git bisect run <check>`
   - for flaky: the check in a loop of 20–50 runs, reporting the failure rate
   - for slow-since-release: a timing on both commits

   Run it and confirm it fails *for the reported reason*, not a setup error. Done when the check is red and its failure line matches the report.
2. **Rank hypotheses.** Two to four causes, most likely first, each with a prediction that would confirm it ("if the key is mixed case, `findDiscount('Spring25')` returns null"). Test them against code, data, logs, or temporary instrumentation tagged `[DEBUG-<id>]` so one grep removes it. Done when one is confirmed by evidence and the rest are ruled out.
3. **Fix at the root.** Change the code where the wrong value is produced, not where it surfaces: no `?? 0`, empty fallback, try/catch, sleep or retry around the symptom. Run the same unmodified check: green with the fix; when cheap, stash the fix and see it go red again. Done when the check is green, the full suite still passes, and no `[DEBUG-` line remains.
4. **Report** with the template.

When the user asks only why, stop after step 2: report the confirmed cause with its evidence and offer the fix.

When you cannot run commands, still write the failing check first, give its exact command, and label every result "not run".

After three fixes that did not turn the check green, stop. Report what each attempt showed and question the design or the hypothesis, not a fourth patch.

<diagnosis>
**Symptom:** what the user saw.
**Reproduction:** `<command or test path>`; red before the fix: `<failure line>` (or "not run").
**Hypotheses:** 1. <cause>: confirmed by <evidence>. 2. <cause>: ruled out by <evidence>.
**Root cause:** `<file:line>`, and why it produces the symptom.
**Fix:** what changed.
**Regression test:** `<path>`, red before and green after (or "not run" with the command).
</diagnosis>

## Excuses

| Excuse | Reality |
| --- | --- |
| "The fix is obvious from the code." | Obvious fixes still need the red check. It costs a minute and proves the fix touched the right thing. |
| "There's a demo in 15 minutes." | A one-assertion failing test is the fastest proof the demo works. |
| "I'll add the test after the fix." | A test written after the fix never failed, so it proves nothing about this bug. |
| "It's flaky, a retry will do." | A retry hides a race. The loop's failure rate is the reproduction. |
| "I can't run commands here." | Write the check anyway and hand over the command. |
