# Elicitation and conflicting evidence

Use this when the missing information concerns actual software behavior rather than business positioning. The cases below are illustrative, not executed evaluations.

## Find the missing perspective

Start with existing evidence instead of a universal questionnaire. For an unfamiliar workflow, ask a representative user to describe one actual task and the exceptions that make it difficult. For a legacy change, compare the documented contract with callers and observed behavior. For operations, ask what must be detectable, recoverable and supportable when no developer is present. Use authorized, redacted examples rather than copying production records into requirements.

Choose a lightweight representation that reveals ambiguity: a state transition for approval workflows, a decision table for conflicting rules, an input/output example for a parser, or a sequence for cross-system interactions. A diagram that omits failures is not sufficient evidence of a complete contract.

Define terms where interpretations change outcomes. A “day” may mean a local calendar date or elapsed duration. “Delete” may mean remove from active use, erase stored content or end a retention period. Record the decided meaning, affected boundary and unresolved exceptions; do not pick a convenient interpretation on the owner's behalf.

## Case: field collection with intermittent connectivity

A requester wants “offline submission.” Field workers need to capture records without connectivity; dispatchers need a truthful view of submitted work; security owners may constrain local storage; support needs recovery after device loss.

Separate capture, durable local save, transmission and authoritative acceptance. An offline success badge must not imply server acceptance if that has not occurred. Ask who owns conflict resolution when the same record changes on two devices, how identity expiration affects queued work, and which data may be kept locally. A network prototype alone does not settle those policies.

Possible requirement candidates include preserving a locally acknowledged draft through an allowed restart, distinguishing queued from accepted work, and surfacing a rejected synchronization without silently discarding edits. These remain proposals until accepted. Do not invent retention periods or permit sensitive local storage by default.

## Case: old behavior conflicts with a new request

The issue requests rejecting duplicate imports. The CLI currently allows repeats, and downstream automation intentionally reimports corrected rows. Record the conflict as a concrete example: the same external record identifier arrives with different content. Does “duplicate” mean repeated bytes, repeated business identity, or already applied operation?

Inspect the public contract and actual consumers. Offer compatible options such as an explicit mode or a revised identity/version rule, with migration consequences. Obtain the contract owner's decision, rather than declaring the old test wrong or silently breaking the script. Record the intentional behavior change and acceptance examples for both repeated and corrected input.

## Case: apparently incompatible obligations

An operator requests uninterrupted access during a disconnected interval; another requirement demands every authorization decision reflect immediate central revocation. Identify the disconnected condition where both cannot be guaranteed. Present alternatives such as refusing access while disconnected or an explicitly approved bounded offline policy. Do not choose an access policy, fabricate a bound or claim a cache meets immediate revocation.

For each material unresolved conflict retain: the competing sources, concrete incompatible case, options and consequences, decision owner, and which work remains blocked. Use the current issue/document rather than starting a new governance system.

## Expert reference

[SEBoK: Stakeholder Needs Definition](https://sebokwiki.org/wiki/Stakeholder_Needs_Definition) provides the systems-engineering basis for considering lifecycle stakeholders and consolidating their needs. The procedures and software cases here are original adaptations, not a mandated SEBoK process or copied standard.
