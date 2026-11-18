#!/usr/bin/env bash
set -euo pipefail
mkdir -p src test
cat > package.json <<'EOF'
{
  "name": "timekit",
  "private": true,
  "scripts": { "test": "node --test test/" }
}
EOF
cat > src/clock.js <<'EOF'
function pad(n) {
  return String(n).padStart(2, '0');
}

function formatClock(seconds) {
  const h = Math.floor(seconds / 3600);
  const m = Math.floor((seconds % 3600) / 60);
  return `${pad(h)}:${pad(m)}`;
}

module.exports = { formatClock };
EOF
cat > test/clock.test.js <<'EOF'
const test = require('node:test');
const assert = require('node:assert');
const { formatClock } = require('../src/clock');

test('formats whole hours', () => {
  assert.strictEqual(formatClock(7200), '02:00');
});
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm "initial timekit"
