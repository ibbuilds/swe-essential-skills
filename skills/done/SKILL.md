---
name: done
description: 'Final check before reporting back on any task that changed code or config. Use when finishing every such task, before your last message says done, fixed, works, passing or "should work now", before committing or opening a PR, after a subagent reports success, and when the user says "make sure it works", "tell me when it''s done" or "verify it", even when the change is one line or the checks were green earlier in the session.'
metadata:
  type: discipline
---

**Done** means the claim matches fresh evidence from this exact state of the code, and every check that went green was green without lowering the bar.

```
No completion claim without a command run after the last edit, and its result line, in the same message.
```

## Process

1. **Find the gates.** From the package scripts, Makefile, CI config and README: the commands for tests, typecheck, lint and build. Done when each gate has a command or is marked "none in repo".
2. **Run them on the current code,** after the last edit. Read the output, not the exit code alone: count passed, failed and skipped. Done when each gate has a result line you can quote.
3. **Check the claim's own evidence** from the table. A green suite proves the suite, not the feature.
4. **Check the bar,** with `git diff` over everything this task changed. Done when none of the lowered-bar patterns below appears, or each one is reported to the user with its reason.
5. **Report** with the template; with a single gate, one line is enough: `<command>`: <result line>. Every line is evidence or "not verified: <why>", plus what the user should run or look at. Done when every claim in your message has its evidence line.

| Claim | Evidence it needs | Not enough |
| --- | --- | --- |
| Tests pass | Suite output from after the last edit: N passed, 0 failed | An earlier run, or "tests should pass" |
| Bug fixed | The reproduction red before and green after | The suite passing |
| UI works | Follow [UI.md](UI.md): the page in a running build, console and network | The component compiling |
| Feature done | Each acceptance item checked one by one | The build succeeding |
| Subagent finished | `git diff` and a gate run by you | The subagent's report |

## Lowered bar

Any of these in the diff turns "green" into "not verified" until the user agrees:

- skipped, focused or deleted tests: `.skip`, `xit`, `@pytest.mark.skip`, `.only`, removed assertions
- an assertion loosened to match the output: expected value changed without a behavior reason, `toBeTruthy` replacing a value
- suppressions: `@ts-ignore`, `@ts-expect-error`, `# type: ignore`, `eslint-disable`, `noqa`, `any` casts added to pass a check
- thresholds lowered: coverage, lint, perf budgets, timeouts raised to hide slowness
- empty catch blocks, or errors swallowed to stop a failure
- stubs left in: `TODO`, `throw new Error('not implemented')`, hard-coded return values
- fallbacks nobody asked for: a default value, mock data or a silent retry where the real path failed
- a subset passed: only the new test file ran, or one package of a monorepo
- hooks bypassed: `--no-verify`, CI steps disabled

<done-report>
**Claim:** <what is done>
**Evidence:**
| Check | Command | Result |
| --- | --- | --- |
| <gate or acceptance item> | `<command or steps>` | <quoted result line> / not verified: <why> |
**Bar:** unchanged, or <pattern at file:line, and why>
**For you to check:** <exact steps for every line not verified, or "nothing">
</done-report>

## Excuses

| Excuse | Reality |
| --- | --- |
| "I ran the tests earlier." | Code changed since then. Evidence is from after the last edit. |
| "It's a one-line change." | One-line changes break builds. The gate costs one command. |
| "The subagent said it passed." | A report is a claim. Read the diff and run the gate yourself. |
| "The user asked me to just make CI green." | Green with a skipped test is red with the light off. Fix the cause, or ask before lowering the bar. |
| "I can't run it here." | Then the claim is "not verified" with the exact steps, not "done". |
