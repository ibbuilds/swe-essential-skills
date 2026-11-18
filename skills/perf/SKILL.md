---
name: perf
description: 'Performance work driven by measurement. Use when the user says "make it faster", "too slow", "optimize", "speed up", "takes N seconds", "high latency", "bundle too big" or "performance", even when the bottleneck looks obvious from the code or swapping a heavy library is an easy win. For a slowdown that began with a specific release or change use debug.'
metadata:
  type: technique
---

**Performance work** changes code only against a measured bottleneck and a target, and reports the numbers before and after.

1. **Pin the target.** Name the slow operation (endpoint, page, job, build), its current number and the goal. When the request names no operation ("the app feels slow"), ask which screen or action is slow and how slow, list what you would measure, and make no edits yet. Done when the operation and its baseline are written down.
2. **Find where the time goes.** Time or profile it: a timer around the call, query logs or EXPLAIN ANALYZE, a browser performance trace, a bundle analyzer. When you cannot run anything, find the cost that grows with input (queries or network calls in loops, repeated work per row), estimate it from counts (3,000 queries × 3 ms ≈ 9 s) and label it an estimate. Done when one cost explains most of the time.
3. **Measure again** with the same method. Done when the report has before and after numbers, or the exact steps to get them marked "not run".
