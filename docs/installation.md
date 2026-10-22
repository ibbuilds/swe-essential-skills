# Install and discover the skills

These are local instruction folders, not a daemon, application server or model.
You can copy them without making a model request. No API key, Python dependency,
custom installer or PM Essentials installation is required to consume them.
The root `requirements-dev.txt` and validation commands are for maintaining this
repository, not for installing the skills in another project.

Host documentation checked 22 October 2026:
[Codex](https://learn.chatgpt.com/docs/build-skills),
[Claude Code](https://code.claude.com/docs/en/skills).
Host behavior can change; consult its current documentation if discovery differs.

If your normal skill manager already installed the selected folders, skip the
manual-copy sections and go to [normal automatic selection](#3-use-normal-automatic-selection).
The copy instructions below are an alternative, not extra setup.

## 1. Choose scope and source

Download this repository using GitHub's **Code → Download ZIP** and extract it,
or clone it with Git. For reproducibility, retain the source commit or tag you
selected. `main` changes over time; a downloaded copy does not update itself.

Copy selected complete folders from `skills/`, or all of them if you want the
whole catalogue available. Availability is not a request to load every skill for
every task. Starting with `project-planning` is sufficient to try the planning
entry point; it does not require the other skills to be installed.

| Host | This project only | Personal, across projects |
| --- | --- | --- |
| Codex | `<project>/.agents/skills/<skill-name>/` | `$HOME/.agents/skills/<skill-name>/` |
| Claude Code | `<project>/.claude/skills/<skill-name>/` | `$HOME/.claude/skills/<skill-name>/` |

Use the filesystem/home of the environment actually running the coding host.
Native Windows and WSL are different environments; a local installation is not
a promise of availability in a cloud session. Project-local installation is the
narrower starting scope. Keep the suite repository itself separate from the
project receiving its skills.

## 2. Copy complete skill folders

Each installed folder must contain `SKILL.md`, its `LICENSE`, and any local
`references/` files. Do not copy only `SKILL.md`, nest another `skills/` directory
between the host root and skill name, or copy this repository's root `AGENTS.md`
into your application. That file governs maintenance of this suite only.

Expected layout, for example:

```text
<your-project>/.agents/skills/project-planning/
  SKILL.md
  LICENSE
  references/
    plan-intake.md
    gap-coverage-and-readiness.md
    usable-plan-shape.md
```

### Windows PowerShell: selected skills or the whole suite

Replace both example paths before running. This refuses existing destination
folders so your customized skills are not silently overwritten. The loop copies
local files; it does not launch a coding agent or install third-party software.

```powershell
$sourceRoot = 'C:\path\to\swe-essential-skills\skills'
$targetRoot = 'C:\path\to\your-project\.agents\skills' # Codex project scope
# Claude Code project scope instead:
# $targetRoot = 'C:\path\to\your-project\.claude\skills'
# Personal scope instead: Join-Path $HOME '.agents\skills' or '.claude\skills'

$ErrorActionPreference = 'Stop'
$names = @('project-planning')
# For the complete suite, replace the line above with:
# $names = @(Get-ChildItem -LiteralPath $sourceRoot -Directory |
#   Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName 'SKILL.md') } |
#   Select-Object -ExpandProperty Name)

if ($names.Count -eq 0) { throw 'No skill folders selected.' }
foreach ($name in $names) {
    $source = Join-Path $sourceRoot $name
    $destination = Join-Path $targetRoot $name
    if (-not (Test-Path -LiteralPath (Join-Path $source 'SKILL.md'))) {
        throw "Missing source skill: $name"
    }
    if (Test-Path -LiteralPath $destination) {
        throw "Already exists; review before replacing: $destination"
    }
}
New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null
foreach ($name in $names) {
    Copy-Item -LiteralPath (Join-Path $sourceRoot $name) `
        -Destination (Join-Path $targetRoot $name) -Recurse
}
$names | ForEach-Object { Get-Item -LiteralPath (Join-Path (Join-Path $targetRoot $_) 'SKILL.md') }
```

For macOS/Linux, the same complete-folder layout works through your file manager
or ordinary copy tools. Preserve existing destinations and verify the actual
result before replacing anything. If a copy is interrupted, inspect its partial
folders before retrying; the example is not a transactional installer.

### Optional maintained CLI

If you already use Vercel's Skills CLI, run from the intended target project:

```text
npx skills add ibbuilds/swe-essential-skills --list
npx skills add ibbuilds/swe-essential-skills --skill project-planning --agent codex --copy
```

Use `--agent claude-code` for Claude Code and `--global` only when you intend
personal scope. The interactive selection flow can choose several skills. Avoid
`--all` as a shortcut for this repo's full suite: that option also selects all
agents. `--copy` avoids a symlink-based installation.

`npx` can download and execute the CLI; this is optional software execution, not
the dependency-free copy route above. Review the current [CLI commands](https://github.com/vercel-labs/skills/blob/main/docs/commands.md)
and [host paths](https://github.com/vercel-labs/skills/blob/main/docs/agents.md).
Do not accept an overwrite without reviewing the existing folder.

## 3. Use normal automatic selection

Ask for your task normally. Codex's default is `allow_implicit_invocation: true`;
these skills do not disable it. Their names/descriptions are discovery metadata,
and full instructions are loaded when a relevant skill is selected. No custom
installer, hooks or global `AGENTS.md` rule is required. Do not load every skill
just to make use visible, and do not confuse ordinary selection with a guaranteed
always-running controller.

If behavior is uncertain, distinguish these evidence levels:

1. **Installed:** the complete folder exists in the intended environment.
2. **Discovered:** that host lists the intended copy without loading errors or a
   disabled setting. A copy in another scope may not be the one you expected.
3. **Selected and loaded:** supported read/injection evidence shows the relevant
   skill entered the task's context. Merely naming it or saying it was used is
   not proof of the whole workflow.
4. **Applied:** the actual result follows the applicable instructions and skip
   conditions. Structural checks cannot establish this.

The first two can be checked without a model request. Inspect the skill picker
and existing settings first; do not start a usage-consuming evaluation merely to
check that files were copied. Later, an ordinary relevant task without naming a
skill can test implicit selection when the user chooses to spend that usage.

## Explicit invocation or discovery troubleshooting

- **Codex CLI/IDE:** use `/skills`, or type `$` and select `project-planning`.
  Codex detects changes automatically; restart if the skill remains absent.
- **Claude Code:** use `/skills`, then start a message with `/project-planning`.
  Skill folders are watched; `/reload-skills` is useful if the top-level skills
  directory was created after the session started.

Optional explicit planning example, not a required first step:

> Review the project plan I supplied. Use its existing answers, identify only
> consequential gaps, and help me choose the remaining decisions. Do not start
> implementation yet. Keep the explanation direct and specific.

For an idea without a plan, say that and describe the problem and constraints.
For already-defined work, continue construction or debugging rather than
starting a new project interview; explicit selection is optional. See the [project walkthrough](project-walkthrough.md).

If absent, check the environment, directory depth, exact `SKILL.md` filename,
valid frontmatter and existing same-name skills in other scopes. Inspect what the
host actually discovered; do not blindly install another duplicate. A connector
or skill folder cannot override the host's permissions or usage limits.

## Updates and removal

Record which source revision and folders you installed. Review upstream changes
and your local customizations before replacing complete owned folders. Do not
merge new files over an old folder blindly: retired references may remain and
local edits may be lost. Preserve a recoverable copy when needed. Removing a skill
means removing only its known installed folder through your normal recoverable
file-management workflow, not deleting shared host configuration or other skills.
After changes, verify discovery again using the host's documented refresh behavior.

## What has and has not been established

On 22 October 2026, Skills CLI **1.7.4** was checked against source revision
[`befd47f`](https://github.com/ibbuilds/swe-essential-skills/commit/befd47f99a5982859d1802eeba50e035d902fdaf)
in isolated Linux project/home directories, with CLI telemetry disabled:

- Both local-source `--list` and the documented GitHub-source `--list` discovered
  all 18 skills; the latter successfully cloned the public repository.
- Selecting `project-planning` with `--agent codex --copy` installed its complete
  folder, including its references and license.
- Explicitly selecting all 18 skills for `codex` and `claude-code` with `--copy`
  produced both expected project-local layouts. Every installed skill file
  matched its source hash; no installed skill was a symlink.

After the final recovery/model-tool instructions were integrated, the full local
copy check was repeated against skills-tree
`d2f011f856cd6439c26d645f7bc866a71128f28c`: all 18 skills and all **74 files per
host** matched in both project-local layouts, including the new security
reference. This is package-copy evidence for that content, not host activation.

This establishes CLI source discovery, public-repository retrieval and local-source
package copying, not personal/global installation, updates or overwrite safety.
A **CLI source listing is not coding-host discovery**. A host listing establishes
discovery; explicit invocation establishes loading, not reliable implicit
selection or successful engineering behavior. Neither coding model was invoked.
Live-host activation and model evaluation remain unverified. PowerShell commands
are a reviewed example, not a claim they were executed on Windows or your computer.
