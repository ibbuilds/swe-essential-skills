#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'package.json')"
cat > 'package.json' <<'EOF1'
{ "name": "ledger", "private": true, "scripts": { "test": "node --test test/" } }
EOF1
mkdir -p "$(dirname 'src/currency.js')"
cat > 'src/currency.js' <<'EOF2'
function formatCurrency(amount) {
  return '$' + amount.toFixed(2);
}

module.exports = { formatCurrency };
EOF2
mkdir -p "$(dirname 'test/currency.test.js')"
cat > 'test/currency.test.js' <<'EOF3'
const test = require('node:test');
const assert = require('node:assert');
const { formatCurrency } = require('../src/currency');

test('formats positive amounts', () => {
  assert.strictEqual(formatCurrency(5), '$5.00');
});

test('formats negative amounts', () => {
  assert.strictEqual(formatCurrency(-5), '-$5.00');
});
EOF3
mkdir -p "$(dirname 'ci-log.txt')"
cat > 'ci-log.txt' <<'EOF4'
> ledger@ test
> node --test test/

✔ formats positive amounts (0.4ms)
✖ formats negative amounts (0.6ms)
  AssertionError [ERR_ASSERTION]: Expected values to be strictly equal:

  '$-5.00' !== '-$5.00'

      at TestContext.<anonymous> (test/currency.test.js:10:10)

ℹ tests 2
ℹ pass 1
ℹ fail 1
Error: Process completed with exit code 1.
EOF4
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
