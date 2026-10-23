# Agent weaknesses: targeted research and decisions

Reviewed 22 October 2026 against suite revision
`0c8fd44ee63b1d9247bd4a1ea75cf9aa2cf098a4`. This is a source/code audit,
not a demonstration that models follow every instruction or that the suite saves
tokens. Research favors concrete failures, inspectable mechanisms, negative
results and existing coverage over popularity or additional machinery.

## Three narrow improvements selected

### Search controls before absence claims

[Trail of Bits variant analysis](https://github.com/trailofbits/skills/blob/1e0cb77d071a8b9453391d111f17d34d2114e057/plugins/variant-analysis/skills/variant-analysis/SKILL.md)
uses the known defect to check a detector before broadening a search. Our
[debugging guidance](../skills/swe-essential-skills-software-debugging/references/investigation-patterns.md)
adds this conditionally, including already-patched examples, unavailable controls,
search exclusions and causally different matches. It does not mandate a repository
sweep or authorize fixing additional findings.

This addresses a plausible mechanism behind a
[reported missed `.cjs` path](https://www.reddit.com/r/ClaudeCode/comments/1wojkw1/opus_55_is_good_but_still_ignores_protocols_and/),
not proof of that report's proposed cause. Primary tool documentation establishes
the scope risk: [ripgrep filters](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#automatic-filtering)
exclude several classes by default, while [git grep](https://git-scm.com/docs/git-grep)
normally searches tracked files. A known match checks detection, not exhaustive
coverage or correctness of the diagnosis.

### Comparable evidence for a claimed repair

[Trail of Bits post-patch validation](https://github.com/trailofbits/skills/blob/1e0cb77d071a8b9453391d111f17d34d2114e057/plugins/post-patch-validation/skills/post-patch-validation/SKILL.md)
and its runner separate baseline/patch evidence from revision labels. Our
[verification examples](../skills/swe-essential-skills-software-verification/references/test-design-cases.md)
clarify equivalent triggering inputs and behavioral properties, independently
reviewed harness changes, legitimate API adapters and unavailable baselines.

Independent oracles and defect-sensitive regressions already existed; this closes
a specific comparison-validity gap, not a missing testing phase. No extra runner,
mandatory builds, sealed harness or universal baseline execution was imported.
Trail of Bits sources declare CC-BY-SA-4.0; these are original explanations of
engineering ideas, with attribution, not copied source text or code.

### Bind reused facts to the actual execution target

[Construction](../skills/swe-essential-skills-software-construction/SKILL.md) now checks target identity
when the execution environment/worktree changes or its identity is uncertain.
A clean but old checkout can otherwise make remembered decisions appear applicable
to the wrong source. This is not a requirement to use latest main, repeatedly fetch,
restart planning, or reset existing work. Deliberately historical/detached targets
and new repositories remain valid.

The distinction follows Git's [per-worktree HEAD](https://git-scm.com/docs/git-worktree)
and [working-tree/revision identity](https://git-scm.com/docs/git-rev-parse) documentation.
The [wrong-submodule report](https://www.reddit.com/r/ClaudeCode/comments/1v8pwh6/anyone_got_a_setup_that_stops_the_agent_editing/)
is a related user-reported failure, not a measured incidence or proof of savings.

## Existing coverage: do not add another workflow

| Reported weakness | Existing owner and decision |
| --- | --- |
| Restarting discovery in an existing project | Project planning preserves settled decisions and resumes the actual work. |
| Risky assumptions or partial answers treated as approval | Requirements and construction retain unresolved consequential choices. |
| Broad tests after tiny edits; retry until green | Verification selects affected evidence, preserves required gates and diagnoses failures. |
| False completion, skipped checks or stale runtime | Verification distinguishes actual scope, artifact identity, skips and evidence limits. |
| Weakening assertions to get green | Review examines changed oracles; verification uses independent expectations. |
| Wrong package manager or stale decisions | Construction uses canonical repository commands and refreshes affected facts. |
| Cleanup destroys unrelated work | Evolution requires requested scope, ownership and consumer analysis. |
| Speculative patch loops, unnecessary abstractions | Debugging requires discriminating evidence; architecture preserves adequate designs. |
| Uncontrolled commits, pushes or repeated reviews | Construction uses bounded authorized checkpoints; review reuses suitable native evidence. |

General coordination, continuity and resource choice remain PM responsibilities,
not duplicated technical controllers. Neither suite is a runtime permission system.

## Why promising-looking tools were not adopted by default

The [repo-atlas recheck](https://github.com/AndreaMontemaggiore1/repo-atlas/blob/3eb619871548580c6e42016f6f6aaf4b1e337f2a/bench/report_recheck.md)
was checked against its harness, scorer, questions and 80 stored result rows.
Recomputed Sonnet file-localization hit@3 changed from 12 to 13 of 20 on Typebot,
but from 20 to 18 on Open WebUI. Reported API-cost ratios were about 0.81 in both;
the input-token ratios were lower. Here input totals include uncached input, cache
creation and cache reads, but exclude output. These are not total-usage, allowance,
bug-fixing or accepted-task results. There was one repetition per question and
mutable model aliases.

The scorer also omits `.mdx`, although two evaluated Typebot cases have only `.mdx` gold
paths. Both arms miss those cases, so the defect does not establish fabricated
relative gains. It does weaken the absolute accuracy claim. Full action streams
are not committed. Keep indexing as a workload-specific candidate, not a default
dependency or a claim that less input necessarily preserves quality.

A [debugging-skill placebo report](https://www.reddit.com/r/ClaudeCode/comments/1x1nplw/i_tested_a_popular_claude_code_debugging_skill/)
has no public raw artifacts in the inspected discussion. It raises a useful
activation/effectiveness question, but cannot establish that expert skills are
generally ineffective. Existing [empirical evidence](empirical-evidence.md) already
separates discovery, selection, application and actual benefit.

[Claude Code issue 80697](https://github.com/anthropics/claude-code/issues/80697)
contains a later correction to its initial hook-failure explanation. It also
illustrates why a command-text guard does not cover every execution surface.
We did not add a mandatory hook or treat an issue title/closure as a verified fix.

## Verification boundary

The changes have focused [static review scenarios](review-scenarios.md), including
cases where extra work should be skipped. Structural validation is not behavioral
validation. No upstream code, model benchmark or user-host installation was run.
Public stored results were inspected/reaggregated, not reproduced. Reddit reports
are hypotheses; conflicting relative/indexed timestamps are not exact dates.
The suite still needs real-use evaluation before claiming adherence or savings.
