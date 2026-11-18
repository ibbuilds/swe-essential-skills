---
name: tickets
description: 'Tracer-bullet tickets from a spec or plan. Use when the user says "break this into tickets", "split into issues", "turn this into a backlog", "what are the pieces of work", "plan the work so we can start", or hands over a SPEC.md to plan, even when the work splits naturally by layer or by person (backend, frontend). For writing the spec itself use spec.'
metadata:
  type: technique
---

**Tickets** here are tracer bullets: each cuts through every layer it needs (data, server, UI, jobs) to deliver one narrow path a user can try. Ticket 1 ships something working end to end; later tickets widen it.

## Process

1. **Read the source.** The spec or plan, and the code it touches. Done when you can name the layers each story needs and the existing modules it extends.
2. **Cut the tracer.** Ticket 1 is the narrowest path through the main story, across every layer, with the simplest choices that work. Done when ticket 1 alone gives a user something to try.
3. **Widen.** One ticket per remaining story, edge case or acceptance item, each still crossing the layers it needs. When the user names people by role, assign whole tickets: a server-heavy slice still includes its small UI part. Done when every acceptance item in the source belongs to exactly one ticket.
4. **Mark who can do it.** **AFK** when an agent can finish it from the ticket alone; **HITL** when it needs a human decision, credentials, design review or a manual step, and say which. Done when every ticket is marked.
5. **Link.** "Blocked by" with ticket numbers or "none". Done when there are no cycles and, where the source allows it, two tickets can start in parallel after ticket 1.
6. **Publish.** With a GitHub remote and `gh` available, create one issue per ticket in order and rewrite blockers as issue links. Otherwise write every ticket to `TICKETS.md`, or the file the user names. Done when every ticket exists and every blocker points at a real ticket.

Write each ticket so it stays true while the code moves: describe behavior and acceptance, name modules rather than line numbers, and say what is out of scope.

<ticket-template>
## <NN>. <user-visible outcome>
**Blocked by:** <#NN, ...> or none · **Mode:** AFK | HITL: <what the human does>
**Layers:** <for example schema + API + editor UI>
**Build:** <two to four sentences on behavior>
**Acceptance:**
- [ ] <checkable result>
**Out of scope:** <the nearby thing this ticket does not do>
</ticket-template>
