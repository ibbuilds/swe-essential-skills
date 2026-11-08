# Software design interview review

This review covers Software Requirements' explicit design challenge, which already
routes to `references/design-interview.md` even for an accepted plan. Only that
conditional reference changes; ordinary accepted implementation retains its direct
path, and PM Essentials remains optional.

## Sources and correction

The comparison checked [Matt Pocock's grilling](https://github.com/mattpocock/skills/blob/main/skills/productivity/grilling/SKILL.md),
content blob `d2f09a18e6a6c65c55f1271ba08dfeaf06f0bed3`, alongside the
already-attributed [Addy Osmani interview](https://github.com/addyosmani/agent-skills/blob/aeac41d4d005999432bb7312f7ff06383a91d59d/skills/interview-me/SKILL.md).
The former provides the dependency frontier and research/answer loop; the latter
examines intent before committing to requirements. Existing requirements validation
guidance also distinguishes agreed behavior from passing implementation tests.
Source-specific exhaustive stopping, mandatory formats, leading assent and invented
confidence percentages remain excluded.

The old closure wording could count “investigated” or “delegated” as resolved.
Running, failed or inconclusive investigation now explicitly blocks dependent
contracts until evidence or a safe deferral exists. A delegated choice must actually
be exercised within bounds. Answers are reconciled with constraints and prior
answers using concrete input/state/outcome examples; ambiguous assent cannot select
among alternatives. Closure checks normal and adverse behavior and retains an
owner, reason and latest safe point for explicit deferrals. An interview does not
grant implementation authority.

## Observed application

A fresh independent executor received the revised skill and fictional booking-code
facts, without the expected answers or this review. Across three conversational turns:

- It exposed the read-then-insert race against the promise of no double booking
  and asked one owner-policy question, leaving provider atomicity research pending.
- After approval of the existing `ROOM_BUSY` response and bounded technique
  delegation, a timed-out provider lookup did not become evidence of atomicity.
  It retained that blocker and asked an independent identity question grounded in
  client-local retry IDs.
- After approval of client-plus-request identity and a stop request, it produced
  normal, concurrent, collision, retry and occupied-room acceptance examples.
  It labeled them unverified, left the technical guarantee unresolved before
  implementation and did not modify code.

A separate explanation-only control answered what `return x + 1` does without an
interview or planning. These synthetic applications check meaningful behavior but
do not establish universal correctness, native activation rates or statistical
superiority over GrillMe. Metadata/reference validation has a separate, mechanical
scope. No paid model evaluation or live service mutation was performed.
