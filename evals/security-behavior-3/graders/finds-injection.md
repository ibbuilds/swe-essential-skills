---
type: llm
focus: last_message
---

PASS if the reply reports that anyone who can submit a ticket can put instructions in the ticket text that make the model call issueRefund (prompt injection to a side-effecting tool), names that attacker and what they send, and proposes a check outside the model (for example refunds only for the ticket's own order, under a limit, or with human approval).
FAIL if prompt injection leading to refunds is not reported as a finding.
