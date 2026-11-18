---
name: slices
description: 'Tracer-bullet tickets from a spec or plan. Use when the user says "break this into tickets", "split into issues", "turn this into a backlog", "what are the pieces of work", or hands over a SPEC.md to plan, even when the work splits naturally by layer or by person (backend, frontend). For writing the spec itself use spec.'
metadata:
  type: technique
---

**Slices** are tracer-bullet tickets: each one cuts through every layer it needs (data, server, UI, jobs) to deliver one narrow path a user can try. Ticket 1 ships something working end to end; later tickets widen it.

## Process

1. **Read the source.** Read the spec or plan and the code it touches. Done when you can name the layers each story needs.
2. **Cut the tracer.** Make ticket 1 the narrowest path through the main story, across every layer, with the simplest choices that work. Done when ticket 1 alone gives a user something to try.
3. **Widen.** Add one ticket per remaining story, edge case or acceptance item, each still crossing the layers it needs. When the user names people by role, assign whole tickets: a server-heavy slice still includes its small UI part. Done when every acceptance item in the source belongs to exactly one ticket.
4. **Link.** Give each ticket "Blocked by" with ticket numbers or "none". Done when there are no cycles and, where the source allows it, two tickets can start in parallel after ticket 1.
5. **Publish.** With a GitHub remote and `gh` available, create one issue per ticket in order and turn the numbers into issue links. Otherwise write every ticket to `TICKETS.md`, or the file the user names. Done when every ticket exists and every blocker points at a real ticket.

<ticket-template>
## <NN>. <user-visible outcome>
**Blocked by:** <#NN, ...> or none
**Layers:** <for example schema + API + editor UI>
**Build:** <two to four sentences>
**Acceptance:**
- [ ] <checkable result>
</ticket-template>
