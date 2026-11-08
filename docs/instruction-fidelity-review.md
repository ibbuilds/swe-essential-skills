# Instruction fidelity in construction and client work

The user requested exact execution of the specified change, without agents
inventing adjacent fixes or compensating adjustments. If target or meaning is
ambiguous, the agent should present its interpretation and ask before dependent
edits. Clear instructions should proceed without redundant confirmation.

Construction now separates necessary internal mechanics from additional behavior,
cleanup and inferred requirements. Client Engineering applies the same boundary
to UI changes: moving one element does not authorize moving/restyling its neighbor
merely because natural reflow changes the appearance. Material effects are reported;
actual conflicts with the requested result or a binding obligation are surfaced
instead of silently choosing a different outcome. Existing verification and
platform/accessibility requirements remain. These instructions work independently
of PM Essentials and do not create another skill or a mandatory interview.

A fresh independent executor read the working procedures and two raw fictional
HTML files, with no expected answers. For “move Export to the right action group,”
it moved only that DOM node. Parent inspection confirmed that the other buttons,
labels, styles and inputs remained. This was source inspection, not browser-based
visual acceptance. For “move Settings up” in a file containing Account Settings
and Module Settings, it asked which target and destination and made no edit.

This scoped application supports the intended behavior but is not a guarantee
that every model or host follows it. Metadata/reference validation remains a
separate mechanical check. No application code, global instructions, permissions,
models, hooks or unrelated skills change in this revision.
