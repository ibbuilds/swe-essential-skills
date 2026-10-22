---
name: ibbuilds-swe-product-discovery
description: Investigate a software product opportunity, actual user problem, context and current alternatives; distinguish evidence from assumptions and choose proportionate problem-validation work. Use when deciding whether or what problem to pursue, not for routine implementation of an adequate brief, marketing campaigns or generic project coordination.
---

# ibbuilds SWE Essentials / Product Discovery

Resolve the uncertainty that could change whether a problem is worth solving, for whom, or under what conditions. A requested feature is a candidate response, not evidence of a problem; an explicit user decision to build is still a decision to respect, not an invitation to restart discovery. This applies to internal tools, libraries, native applications, embedded products and services as well as commercial web products.

## Start from what is already known

Read the relevant brief, prior decisions, support or research records and accessible product evidence. Preserve their sources and scope. Reuse settled facts and accepted constraints unless new evidence materially conflicts with them. Do not demand interviews, competitive research or a discovery document before every change. For a well-specified request, identify any consequential gap and otherwise hand the existing context onward.

Frame the actual question: choosing an audience, understanding an unmet need, comparing opportunities, checking adoption barriers, or deciding whether more evidence justifies investment. Establish the decision owner and the consequence of being wrong. Scale investigation to that decision, not to a universal discovery process.

## Recover the situation, not just the feature request

Identify the relevant actors and distinguish users, buyers, approvers, maintainers and affected non-users where those differ. Describe a concrete situation: trigger, intended outcome, current sequence, obstacles, frequency and consequences. Separate inconvenience from severe cost or harm; do not infer frequency from a vivid anecdote.

Inspect current alternatives, including manual work, spreadsheets, existing software, outsourcing and doing nothing. Ask what makes the current method tolerable and what would make switching difficult: habits, trust, migration, interoperability, training, procurement or constrained environments. For a developer tool, the alternative may be an existing dependency or a few lines of code rather than a competing company.

Keep distinct:

- **Observed evidence:** what actually occurred, for whom, when and in what context, with a retrievable source where permitted.
- **Reported experience:** what someone says occurred or wants; useful but not automatically representative behavior or demand.
- **Inference or assumption:** the interpretation and the evidence that could weaken it.
- **Decision:** a chosen direction, its owner and authorization status; approval does not turn its assumptions into facts.

Do not invent personas, quotes, market sizes, usage, willingness to pay or completed validation. A synthetic scenario can help inspect an idea, but cannot stand in for a real user observation. Avoid copying private user data into new research artifacts when a minimized summary suffices.

## Investigate the uncertainty that matters next

Identify the few assumptions whose failure would reverse the decision or substantially change the solution. Separate problem importance, reach, adoption/value, usability, technical feasibility and viability under business, operational or institutional constraints: evidence for one does not prove the others. If the user has fixed the direction, investigate risks within that direction rather than silently substituting a new product.

Retrieve missing facts from authorized records, code, analytics or current authoritative public sources when useful; verify relevance, population and freshness. Ask the user only for material information unavailable through permitted investigation or choices they must own. Batch independent, currently answerable questions with a recommended answer and consequence. Hold dependent questions until their prerequisites are settled; continue unrelated useful work. Do not repeatedly ask settled questions or exhaust every possible branch of an idea.

For a material unknown, choose the least costly credible evidence that can change the decision. Read [validation choices](references/validation-choices.md) when designing research or an experiment. Existing evidence may already be sufficient; sometimes a reversible implementation is cheaper than further research. State what remains uncertain rather than treating “not worth investigating now” as “validated.”

Research proposals are not authorization for interviews, recruitment, contacting customers, telemetry changes, publication, spending or exposing data. Separate proposed methods from actions permitted now. If access or authority is absent, name the missing evidence and the specific action requiring permission; complete independent analysis without simulating the missing result.

## Conclude with a decision-ready result

Report the useful finding first: pursue, narrow, change direction, defer, stop, or proceed provisionally, with rationale and confidence appropriate to the evidence. Distinguish your recommendation from the owner's decision. Avoid declaring market fit or product success from isolated positive feedback.

Leave only the context needed next, in the existing brief or task convention: target actors and situation, desired outcome, current alternatives, strongest evidence and contrary evidence, material assumptions, constraints and unresolved decisions. If another check is warranted, identify the question it can resolve, its authority needs, and what result would change the recommendation. Stop investigation when the available evidence supports the next authorized decision at its risk level, or when progress requires unavailable evidence or authorization; do not drift into indefinite research.

Product definition turns the chosen opportunity into positioning, scope and outcome choices. Engineering requirements turn that scope into behavioral contracts. Neither downstream step requires a separate installed skill or a duplicate document.
