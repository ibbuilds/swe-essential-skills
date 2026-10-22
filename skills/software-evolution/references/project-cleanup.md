# Explicit cleanup without duplicate machinery

Use only for a user-requested cleanup, not automatic project-wide housekeeping.
The parent skill's refactoring method already covers behavior preservation,
consumer analysis and equivalence checks; do not repeat it as a second process.

## Reuse the right execution path

Use a known native cleanup/review capability or trusted project tool when it
fits the requested scope, editing authority and verification needs without
unnecessary overhead. A built-in that starts several reviewers is not required
for a small edit the current agent can safely handle. Do not invent a slash
command, run a user-only command through a shell, or search all integrations
merely to find an alternative to an already adequate workflow.

Reuse applicable native findings and check results for the same relevant state.
Investigate material gaps, changed facts and decisive assertions, not the entire
scope again. Do not stack native cleanup, suite cleanup and another review by
default. Native output is evidence to assess, not proof of completeness.

## Keep cleanup within the actual request

Reuse the stated scope. For whole-project cleanup, map first-party areas once
and work in coherent batches; do not silently substitute only the latest diff.
Exclude vendor/generated output and unrelated areas unless they are relevant.
Preserve pre-existing staged, unstaged and untracked work and concurrent changes.
An existing plan or architecture does not need to be recreated.

Code cleanup is not filesystem wiping: inspect unfamiliar `clean` or autofix
scripts before running them. Do not reset the checkout, delete unknown local
files/state, remove licensing notices or suppress checks to produce a clean
report. Keep behavior changes, dependency upgrades and architectural migrations
separate unless already authorized. Apparent non-use still requires the parent
skill's dynamic/configuration/external-consumer checks.

Reuse valid verification and preserve required project gates; add checks only
for meaningful uncovered claims. Existing bounded commit/push authority can
cover coherent checkpoints, but cleanup does not grant new publication or
deployment permission. Preserve ownership when staging; report local versus
remote completion accurately.

Report useful changes, checks, examined/excluded scope and uncertain candidates.
No change is a valid result when candidates lack justified benefit. Stop when
the requested scope is addressed or identify precisely what remains blocked;
do not invent further cleanup to keep working or claim coverage not performed.
