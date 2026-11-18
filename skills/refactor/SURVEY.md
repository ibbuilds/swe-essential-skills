# Finding what to refactor

Rank candidates by evidence, not taste. Propose; refactor only the one the user picks.

1. **Find the hotspots.** Files that change most often and are large or complex: `git log --since=6.months --name-only --format= | sort | uniq -c | sort -rn | head -20`, crossed with file size. Add places where the same bug was fixed twice, and where a small feature touched many files. Done when you have five to ten files with the evidence for each.
2. **Test each candidate:**
   - **Shallow module:** the interface is nearly as complex as the implementation. Callers must know its internals to use it.
   - **Deletion test:** if you inlined or deleted the module, would complexity vanish, or reappear at every caller? Vanish means it is a pass-through and should go. Reappear means it earns its place.
   - **Hypothetical seam:** an interface with one implementation and no test double is speculation. Two implementations make a real seam.
   - **Change amplification:** one conceptual change needs edits in many places.
3. **Rate each one** Strong (hot, and fails a test above), Worth exploring, or Speculative. Done when every candidate has a rating and one sentence of evidence.

<refactor-candidates>
| # | Where | Evidence (churn, size, test failed) | Proposed change | Rating |
| --- | --- | --- | --- | --- |

Recommended first: <#> because <reason>.
</refactor-candidates>

Propose no new interfaces until the user picks a candidate. When the user rejects one for a lasting reason, offer to record that reason as an ADR so it is not proposed again.
