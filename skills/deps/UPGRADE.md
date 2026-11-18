# Upgrading a dependency

Move one major version per step, read the official migration guide for that step, and get the project's checks green before the next step.

1. **Inventory.** Read the installed version from the lockfile, the target, and the packages that must move with it: peer dependencies (React for Next.js), type packages, plugins, the runtime version (Node, Python). Done when the path is written out, for example 12 → 13 → 14 → 15, with the companion bumps for each step.
2. **Read the guide for each step.** Open the official upgrade guide and changelog for that version with a docs or web tool, and search the codebase for each breaking change. When no docs tool is available, say so and list the guide URLs. Done when every breaking change that touches this codebase is listed for that step.
3. **Take one step.** Bump the versions with the package manager, apply the required changes or the official codemod, then run install, build, tests and lint. Start the next major only after this step's checks pass. When you cannot run the checks, stop after the first step and hand over the commands. Done when the step's checks pass.

For "deal with the deprecation warnings": list each warning with the package that emits it (`npm ls <name>` shows who pulls it in), fix the ones from direct dependencies, and report transitive ones with the parent that needs upgrading.

<upgrade-report>
| Step | From → to | Companion bumps | Breaking changes handled | Checks |
| --- | --- | --- | --- | --- |
| 1 | <x → y> | <packages> | <changes, with files> | passed / failed / not run |

Next step: <the next version, or done>
Guides read: <URLs>
</upgrade-report>
