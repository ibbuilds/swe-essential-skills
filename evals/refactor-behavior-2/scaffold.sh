#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'package.json')"
cat > 'package.json' <<'EOF1'
{ "name": "shop", "private": true, "scripts": { "test": "node --test test/" } }
EOF1
mkdir -p "$(dirname 'src/shipping.js')"
cat > 'src/shipping.js' <<'EOF2'
function calculateShipping(order) {
  let cost = 0;
  if (order.country !== 'US') {
    cost = 2500;
  } else if (order.express) {
    cost = 1500;
  } else {
    cost = 500;
  }
  if (order.subtotal >= 5000 && order.country === 'US' && !order.express) {
    cost = 0;
  }
  return cost;
}

module.exports = { calculateShipping };
EOF2
mkdir -p "$(dirname 'test/shipping.test.js')"
cat > 'test/shipping.test.js' <<'EOF3'
const test = require('node:test');
const assert = require('node:assert');
const { calculateShipping } = require('../src/shipping');

test('free standard US shipping from $50', () => {
  assert.strictEqual(calculateShipping({ country: 'US', subtotal: 5000 }), 0);
});

test('international is $25', () => {
  assert.strictEqual(calculateShipping({ country: 'FR', subtotal: 9000 }), 2500);
});
EOF3
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
