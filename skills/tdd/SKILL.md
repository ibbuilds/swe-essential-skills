---
name: tdd
description: 'Test-first development in vertical slices. Use when the user says "TDD", "test-first", "red-green-refactor", "start from a failing test", or asks to add a function, feature or option in a repo that has tests, even when the change looks like three lines and writing the code first seems faster. For bug reports use debug.'
metadata:
  type: technique
---

**Test-driven development** grows the code one behavior at a time: one failing test, the least code that passes it, then the next test.

## Process

1. **List behaviors.** Write the behaviors the change needs as a short list, simplest first. For a password rule: minimum length, then each required character class, then the error message. Done when each item is one observable input and its expected result.
2. **Red.** Add one test for the next behavior, in the repo's existing test files and framework, calling only the public interface: exported functions, public methods, routes, CLI output. Run it and watch it fail for the expected reason. Done when exactly one new test fails.
3. **Green.** Write the least code that makes that test pass. Run the suite. Done when every test passes.
4. **Refactor** while green, then go back to step 2 for the next behavior. Done when the list is empty.

When you cannot run commands, keep the same rhythm: one test, then its code, then the next test. Give the command that runs the suite and mark the results "not run".

## Report

<tdd-report>
| # | Behavior | Test | Red seen | Green |
| --- | --- | --- | --- | --- |
| 1 | <behavior> | `<file>`: "<test name>" | yes / not run | yes / not run |

Suite command: `<command>`
</tdd-report>
