#!/usr/bin/env bash
set -euo pipefail
mkdir -p src test
cat > package.json <<'X'
{ "name": "timekit", "private": true, "scripts": { "test": "node --test" } }
X
cat > src/format.js <<'X'
function formatSeconds(total) {
  const h = Math.floor(total / 3600), m = Math.floor((total % 3600) / 60), s = total % 60;
  return [h && `${h}h`, m && `${m}m`, s && `${s}s`].filter(Boolean).join('') || '0s';
}
module.exports = { formatSeconds };
X
cat > test/format.test.js <<'X'
const test = require('node:test');
const assert = require('node:assert');
const { formatSeconds } = require('../src/format');
test('formats hours and minutes', () => assert.strictEqual(formatSeconds(5400), '1h30m'));
X
git init -q && git add -A && git -c user.name=dev -c user.email=dev@example.invalid commit -qm initial
