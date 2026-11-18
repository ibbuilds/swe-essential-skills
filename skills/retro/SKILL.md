---
name: retro
description: Turn a mistake the agent keeps repeating into a check that catches it automatically, and prove the check fails on the mistake.
disable-model-invocation: true
metadata:
  type: technique
---

**A retro** turns a repeated agent mistake into enforcement. A rule in prose asks; a check enforces. Prefer the strongest enforcer that fits, and prove it bites.

## Process

1. **Name the mistake class.** From the conversation, `git log`, review comments or what the user describes: the concrete instances, where they happened, and what the correct behavior was. Done when the class is one sentence that a check could decide, for example "imports `db` directly from route handlers instead of through `repo/`".
2. **Pick the strongest enforcer that can decide it,** in this order:
   1. **Structure:** make the mistake impossible (a type, a module boundary, removing the wrong API).
   2. **Types or lint:** a typecheck rule, a lint rule (an existing one, `no-restricted-imports`, a custom rule) whose message names the fix.
   3. **Test:** a test that fails when the mistake is present.
   4. **Hook:** a Claude Code hook in `.claude/settings.json` (PreToolUse to block an action, PostToolUse or Stop to run a check) for mistakes in how the agent works rather than what the code says.
   5. **Prose:** one line in `CLAUDE.md` or a skill, only for judgment calls no check can decide.

   Done when the choice is made and you can say why each stronger option does not fit.
3. **Prove it bites.** Apply the check to a real past instance, or reintroduce the mistake on a scratch change: it must fail with a message that names the fix. Then run it on the current code: it must pass, or list the existing violations for the user. Revert the scratch change. Done when you have both outputs.
4. **Prune.** Remove any `CLAUDE.md` or skill line that the new check now makes redundant. Done when the rule exists in exactly one place.

<retro-report>
**Mistake:** <class, with instances>
**Enforcer:** <structure / type / lint / test / hook / prose>: `<file>`
**Bites:** `<command>` on the mistake → <failure line>
**Clean:** `<command>` on current code → <result>
**Removed:** <redundant prose lines, or none>
</retro-report>
