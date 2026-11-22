---
name: deps
description: 'Dependency adds and upgrades checked against the registry, not memory. Use when the user says "add a library for", "install <package>", "is there a package that", "upgrade", "bump", "migrate to vN", "bring it up to date", or reports deprecation warnings or end-of-life versions, and before you run an install command for a package not yet in the manifest, even when the package name and version seem well known or the upgrade looks like a one-line edit. Not for installing from an existing lockfile.'
metadata:
  type: technique
---

**Dependency work** checks every package name, version and API against the registry and official docs, because names and versions from memory go stale or never existed.

For an upgrade of a package already in the manifest, follow [UPGRADE.md](UPGRADE.md) instead.

## Adding a dependency

1. **Check you need it.** Search the manifest and the code for something that already does the job: an existing dependency, the standard library, or a framework built-in. Done when you can name what already exists, or say nothing does.
2. **Verify the package on the registry.** Query it, for example `npm view <name> version time.modified repository.url` or `pip index versions <name>`, or open its registry page. Check the exact spelling (typosquats differ by one letter), that the repository link matches the project you mean, the last release date, weekly downloads, license, install size, and any install scripts (`npm view <name> scripts`). Prefer the package the framework's own docs recommend. Data you could not get is "unknown", never "fine". Done when the name, latest version and repository are confirmed from the registry, not memory.
3. **Install with the package manager.** Use the repo's tool, which the lockfile names (`pnpm-lock.yaml`, `yarn.lock`, `package-lock.json`, `bun.lock`, `uv.lock`, `poetry.lock`, `Cargo.lock`, `go.sum`, `Gemfile.lock`), and let it write the version into the manifest and lockfile. Done when manifest and lockfile both changed.
4. **Write against the installed version.** Read the docs for that major version, or the package's own types, before using its API. Done when every call you wrote exists in the installed version.

<dependency-note>
**Added:** <name>@<version> (<license>, <install size>, last release <date>)
**Why:** <the job it does, and why the standard library or an existing dependency doesn't cover it>
**Checked on:** <registry URL or command>
</dependency-note>

When no registry or docs tool is available, say so, give the commands the user can run to confirm, and mark the name and version "unverified".
