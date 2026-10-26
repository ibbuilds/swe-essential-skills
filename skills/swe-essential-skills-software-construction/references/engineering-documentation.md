# Engineering documentation that remains executable

## Find the reader and the authority

Start with the changed task: a developer setting up the project, a client integrating an API, an operator following a recovery path or a maintainer explaining an invariant. Locate the existing entrypoint for that reader. Establish which source defines the contract—implementation with tests, an accepted interface/schema, generated API metadata or an explicitly maintained specification. Resolve contradictions rather than copying whichever text is easiest to find. Generated documentation should change through its source and supported generator.

Scope the update to changed obligations and likely failure points. A private helper rename rarely needs prose; a new required environment variable, changed error response or different installation step does. Keep setup, API/client examples and configuration descriptions in the same change as the behavior they describe. Avoid separate competing guides or a narrative of every implementation line.

## Match publication to availability

Determine which documentation channel the change reaches: a local draft,
versioned/prerelease documentation or the public guide for the current release.
Preparing docs with a change does not establish that users can install its API
yet. Check the release baseline and publication process before describing a new
symbol, option or behavior as available. Use the project's supported version
label, prerelease channel or deferred publication mechanism. Preserve accurate
instructions for the released version; do not delay useful draft work or invent
a separate documentation system. Verify examples against the artifact promised
by that channel, not merely the newest checkout.

## Write the procedure the reader can follow

State prerequisites, supported versions, working directory, configuration and expected result before assuming a command works. Explain non-obvious defaults, units, permissions, error behavior and resource cleanup. Use synthetic examples and obvious placeholders, never real credentials or private payloads. Show where secrets are supplied through the project's approved mechanism without embedding them in command history or committed files.

For APIs, connect a minimal working request/call to its response, failure behavior and compatibility expectations. Use the actual exported package or public endpoint shape rather than an internal shortcut. Document essential obligations such as pagination, cancellation or retry safety when callers must implement them. Link to authoritative schemas/reference material rather than maintaining a second exhaustive field list by hand.

For a migration or behavior change, preserve a compact trace: what changed, which versions/consumers are affected, the new usage and the compatibility/removal condition. Use the project's release notes, decision record or existing documentation location; do not invent a mandatory document series. Explain consequential rationale that code cannot reveal, not temporary debugging chronology.

## Verify representative usage safely

Read a documented command and the scripts/hooks it invokes before running it. Classify external services, installation effects, deletion, permissions, credentials and shared-resource mutations. Documentation is not permission to deploy, reset a datastore, send messages or run destructive cleanup. Use a disposable authorized environment and synthetic inputs where possible; otherwise report the exact command/example left unexecuted and why.

Verify representative setup and changed examples against the intended artifact/version. For package instructions, use the built/installed package when that distinction matters; a source checkout can hide packaging defects. Check expected output, failure cases and exit status rather than only syntax. Never turn variable timings or incidental IDs into promises. Where an example is maintained as executable test data or generated from a tested source, verify that the published snippet actually uses that source.

Inspect the rendered form or supported preview when formatting affects use: fenced language, indentation, links, copied commands and placeholder boundaries. Check nearby navigation so the intended reader can find the update. Report verification precisely: a link check does not establish API correctness, and a tested example on one supported platform does not prove all platforms. If the existing instructions fail, distinguish a documentation defect from a blocked environment or implementation defect before changing the claimed behavior.

The publication distinction adapts the official
[OpenAI Agents SDK docs-sync workflow](https://github.com/openai/openai-agents-python/blob/0dc4cf152bff1f50bdc0e41f28808563406545b2/.agents/skills/docs-sync/SKILL.md)
to repository-specific release policies; its exact commands are not universal.
