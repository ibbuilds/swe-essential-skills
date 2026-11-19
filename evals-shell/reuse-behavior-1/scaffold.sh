#!/usr/bin/env bash
set -euo pipefail
mkdir -p src/lib test
cat > package.json <<'J'
{ "name": "runner", "private": true, "scripts": { "test": "node --test" } }
J
cat > src/lib/format.js <<'J'
// Human-readable helpers shared across the CLI and reports.
function formatDuration(ms) {
  const total = Math.round(ms / 1000);
  const m = Math.floor(total / 60);
  const s = total % 60;
  if (m === 0) return `${s}s`;
  return `${m}m ${String(s).padStart(2, '0')}s`;
}
function pad(str, width) { return String(str).padEnd(width); }
module.exports = { formatDuration, pad };
J
cat > src/cli.js <<'J'
const { formatDuration } = require('./lib/format');
function summary(jobs) {
  const ms = jobs.reduce((s, j) => s + (j.finishedAt - j.startedAt), 0);
  return `${jobs.length} jobs, total ${formatDuration(ms)}`;
}
module.exports = { summary };
J
cat > src/report.js <<'J'
// Plain-text jobs table.
function renderJobs(jobs) {
  const rows = jobs.map((j) => `${j.name.padEnd(12)} ${j.status}`);
  return ['NAME         STATUS', ...rows].join('\n');
}
module.exports = { renderJobs };
J
cat > test/report.test.js <<'J'
const test = require('node:test');
const assert = require('node:assert');
const { renderJobs } = require('../src/report');
test('lists jobs', () => assert.match(renderJobs([{ name: 'build', status: 'ok', startedAt: 0, finishedAt: 1000 }]), /build\s+ok/));
J
git init -q -b main && git add -A && git -c user.name=dev -c user.email=dev@example.invalid commit -qm initial
