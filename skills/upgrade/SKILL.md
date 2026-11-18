---
name: upgrade
description: 'Dependency and framework upgrades one major version at a time. Use when the user says "upgrade", "bump", "migrate to vN", "bring it up to date", or reports deprecation warnings or end-of-life versions, even when the target version looks like a single edit in package.json or the breaking changes seem well known.'
metadata:
  type: technique
---

**Upgrading** means moving one major version per step, reading the official migration guide for that step, and getting the project's checks green before the next step.

## Process

1. **Inventory.** Read the installed version from the lockfile, the target, and the packages that must move with it (peer dependencies such as React for Next.js, type packages, plugins). Done when the path is written out, for example 12 → 13 → 14 → 15, with the companion bumps for each step.
2. **Read the guide for each step.** Open the official upgrade guide and changelog for that version with a docs or web tool, and search the codebase for each breaking change. Versions and APIs from memory go stale; when no docs tool is available, say so and list the guide URLs. Done when every breaking change that touches this codebase is listed for that step.
3. **Take one step.** Bump the versions, apply the required changes or official codemods, then run install, build, tests and lint. Done when all pass. Start the next major only after this step's checks pass. When you cannot run the checks, stop after the first step and hand over the commands.

<upgrade-report>
| Step | From → to | Companion bumps | Breaking changes handled | Checks |
| --- | --- | --- | --- | --- |
| 1 | <x → y> | <packages> | <changes, with files> | passed / failed / not run |

Next step: <the next version, or done>
Guides read: <URLs>
</upgrade-report>
