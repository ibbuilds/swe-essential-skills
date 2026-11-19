---
type: command
run: bash "$CASE_DIR/check.sh"
---

A hidden test shows main's exemption fix still works through the branch's `computeTax`/`lineTax` API, and `invoiceTotal` honours it.
