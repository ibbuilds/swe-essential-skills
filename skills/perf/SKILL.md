---
name: perf
description: 'Performance work driven by measurement. Use when the user says "make it faster", "too slow", "optimize", "speed up", "takes N seconds", "high latency", "bundle too big", "memory keeps growing" or "performance", even when the bottleneck looks obvious from the code or swapping a heavy library is an easy win. For a slowdown that began with a specific release or change use diagnose.'
metadata:
  type: technique
---

**Performance work** changes code only against a measured bottleneck and a target, keeps a change only when it beats the noise, and reports numbers before and after.

## Process

1. **Pin the target.** Name the slow operation (endpoint, page, job, build, query), its current number and the goal. When the request names no operation ("the app feels slow"), ask which screen or action is slow and how slow, list what you would measure, and make no edits yet. Done when the operation, its baseline and the goal are written down.
2. **Measure the noise.** Run the same measurement at least five times on unchanged code and note the spread. Measure the real path (production build, realistic data size), not a dev server or a toy input. Done when you have a median and a range.
3. **Find where the time goes.** Profile it: a timer around each stage, query logs or `EXPLAIN ANALYZE`, a browser performance trace, a flame graph, a bundle analyzer. Done when one cost explains most of the time. When you cannot run anything, find the cost that grows with input (queries or network calls in loops, repeated work per row, an unindexed filter), estimate it from counts (3,000 queries × 3 ms ≈ 9 s) and label it an estimate.
4. **Change one thing,** cheapest first: don't do the work, do it once (cache or batch), do less of it, do it later, then do it faster. Done when the change targets the cost from step 3 only.
5. **Keep or revert.** Measure again the same way. Keep the change only when the gain is larger than the noise range. A neutral result is a revert. Repeat from step 3 until the goal is met or the remaining cost is outside the code. Done when every attempt is in the report.

<perf-report>
**Operation:** <what> · **Goal:** <number> · **Method:** <command or tool, runs, data size>
**Baseline:** median <n> (range <a–b>)
| # | Change | Median after | Kept? |
| --- | --- | --- | --- |
| 1 | <change> | <n> | kept / reverted: within noise |
**Result:** <baseline> → <final>, or "not run" with the exact steps to measure.
**Remaining cost:** <where the time goes now>
</perf-report>
