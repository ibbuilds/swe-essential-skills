---
name: tdd
description: 'Test-first development in vertical slices. Use when the user says "TDD", "test-first", "red-green-refactor", "start from a failing test", "build it up one test at a time", or asks for a new function, class, endpoint or option in a repo that already has tests, and before writing implementation code for it, even when the change looks like three lines and writing the code first seems faster. For a bug report use diagnose.'
metadata:
  type: discipline
---

**Test-driven development** grows code one behavior at a time: one test that fails for the right reason, the least code that passes it, then the next.

```
No implementation line before a test for it has failed.
```

## Process

1. **List behaviors.** Short list, simplest first, each one observable input → expected result. For a password rule: minimum length, then each character class, then the error message. Done when the list covers the request and nothing more.
2. **Red.** Add one test for the next behavior in the repo's existing test files and framework. Before writing it, name the bug it would catch. Call only the public interface: exported functions, public methods, routes, CLI output. Run it. Done when exactly one new test fails, and its failure is the missing behavior, not an import or syntax error.
3. **Green.** Write the least code that passes. Run the whole suite. Done when every test passes; name any failure that was already red before you started instead of hiding it.
4. **Refactor** while green, then return to step 2. Done when the list is empty.

When you cannot run commands, keep the rhythm (one test, then its code, then the next test) and mark each red and green "not run" with the suite command.

## Tests that prove nothing

- **Tautology:** the expected value is computed the same way the code computes it. Write the literal: `expect(total).toBe(3600)`, not `expect(total).toBe(price * qty * 0.9)`.
- **Mocked subject:** mocking the module under test, or so much around it that the test checks the mocks. Mock only what crosses a process boundary: network, clock, randomness, paid APIs.
- **Change detector:** asserting private calls or internal structure, so any refactor breaks it while bugs pass.
- **Bundled behaviors:** five behaviors in one test, written after the code.

## Report

<tdd-report>
| # | Behavior | Test | Red seen | Green |
| --- | --- | --- | --- | --- |
| 1 | <behavior> | `<file>`: "<test name>" | yes: <failure line> / not run | yes / not run |

Suite: `<command>`: <N passed, M failed> or not run. Pre-existing failures: <names or none>.
</tdd-report>

## Excuses

| Excuse | Reality |
| --- | --- |
| "It's three lines, I'll test after." | A test written after passes on the first run, so you never learn whether it can fail. |
| "I'll write all the tests first, then the code." | Horizontal batches test imagined behavior. One test, then its code. |
| "The test failed, that's red." | Red from a missing import is not red. The failure must name the missing behavior. |
