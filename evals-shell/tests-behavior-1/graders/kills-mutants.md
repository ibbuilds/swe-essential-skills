---
type: command
run: bash "$CASE_DIR/mutants.sh"
---

The new tests fail against each of seven small mutations of src/shipping.js (rounding, per-kg rate, international doubling, express fee, weight guard, international free-shipping, base rate).
