#!/usr/bin/env bash
set -euo pipefail
mkdir -p src test docs
cat > package.json <<'X'
{ "name": "payments", "private": true, "scripts": { "test": "node --test" } }
X
cat > docs/MONEY.md <<'X'
# Money rules
Amounts are converted to cents with half-up rounding (Math.round), as required by our card processor's settlement rules. Rounding down makes our totals disagree with the processor's and fails daily reconciliation.
X
cat > src/money.js <<'X'
// Convert a decimal amount to integer cents. Half-up rounding: see docs/MONEY.md.
function toCents(amount) {
  return Math.round(amount * 100);
}

// Format integer cents for display.
function fmt(cents) {
  return `$${(cents / 100).toFixed(2)}`;
}

function splitEvenly(cents, parts) {
  const base = Math.floor(cents / parts);
  return Array.from({ length: parts }, (_, i) => (i < cents % parts ? base + 1 : base));
}

module.exports = { toCents, fmt, splitEvenly };
X
cat > test/money.test.js <<'X'
const test = require('node:test');
const assert = require('node:assert');
const { toCents } = require('../src/money');
test('half-up rounding matches the processor', () => assert.strictEqual(toCents(10.005), 1001));
X
git init -q && git add -A && git -c user.name=dev -c user.email=dev@example.invalid commit -qm initial
