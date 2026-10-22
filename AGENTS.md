# Maintaining SWE Essential Skills

This repository contains engineering instructions, not an application or an
always-running agent controller. Read only the skills and references relevant
to the requested change.

- Preserve practical technical depth. Prefer useful decision procedures,
  invariants and failure handling over generic expertise or blanket ceremony.
- Each skill must be individually portable; required local references stay
  inside its folder. PM Essentials is complementary, not a hard dependency.
- Use expert sources for mechanisms and verify current platform details. Do not
  copy third-party content without checking its exact license and attribution.
- Keep observed results distinct from proposed scenarios and unexecuted model
  evaluations. No claim of measured token savings or universal correctness.
- Do not run paid model evaluations, deploy infrastructure, upload private
  evidence or change permissions merely to validate this repository.

For skill metadata or local-reference changes, run:

    python scripts/validate_skills.py

For changes to that helper, also run:

    python -m unittest discover -s tests

The helper checks canonical publisher/suite names, optional-host UI presentation
metadata required by this suite, and ordinary inline Markdown file links. It does
not test host activation, all Markdown syntax, external links, engineering
correctness or model behavior. Review the affected engineering instructions and
their failure cases directly; use docs/review-scenarios.md when relevant.

Write every skill for direct, concise, professional, answer-first replies. Omit
filler, but preserve necessary evidence, uncertainty and requested depth.
