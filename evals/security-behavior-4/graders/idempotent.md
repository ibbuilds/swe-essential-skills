---
type: llm
focus: trace
---

Judge the final version of the webhook handler written in the trace.
PASS if a retried delivery of the same event cannot send a second receipt email: for example the update only flips status from 'pending' to 'paid' and the email is sent only when that update changed a row, or processed event ids are recorded and checked.
FAIL if every delivery of checkout.session.completed sends the email.
