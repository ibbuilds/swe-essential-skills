#!/usr/bin/env bash
# Hidden test of the table output.
set -u
ROOT=$(pwd -W 2>/dev/null || pwd)
t=$(mktemp -d); trap 'rm -rf "$t"' EXIT
cat > "$t/hidden.test.js" <<J
const test = require('node:test');
const assert = require('node:assert');
const { renderJobs } = require('$ROOT/src/report');
const out = renderJobs([
  { name: 'build', status: 'ok', startedAt: 1000, finishedAt: 126000 },
  { name: 'lint', status: 'ok', startedAt: 0, finishedAt: 42000 },
  { name: 'deploy', status: 'failed', startedAt: 0, finishedAt: 3725000 },
]);
test('minutes and seconds', () => assert.match(out, /build.*2m 05s/));
test('under a minute', () => assert.match(out, /lint.*\b42s\b/));
test('hours roll into minutes like the shared helper', () => assert.match(out, /deploy.*62m 05s/));
J
node --test "$t/hidden.test.js" >/dev/null 2>&1
