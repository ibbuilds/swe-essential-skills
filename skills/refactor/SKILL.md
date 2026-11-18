---
name: refactor
description: 'Behavior-preserving refactoring. Use when the user says "refactor", "clean up", "tidy", "split into smaller functions", "extract", "deduplicate", "simplify this code" or "this is a mess", even when the code has no tests or the request also asks for a behavior change "while you are at it".'
metadata:
  type: technique
---

**Refactoring** changes structure without changing behavior, proven by tests that pass before and after.

1. **Pin current behavior.** Find the tests that cover the code. Where coverage is thin, first write characterization tests through the public interface that assert what the code does today, odd cases included. Done when every branch you will touch is covered and the tests pass, or "not run" with the command.
2. **Change behavior separately.** A requested behavior change ("while you're at it, make X do Y") is its own step after the refactor: update the test for the new behavior first, then change the code in a separate edit. Done when the report lists the refactor and the behavior change as separate steps.
