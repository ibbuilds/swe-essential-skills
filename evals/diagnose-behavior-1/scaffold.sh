#!/usr/bin/env bash
set -euo pipefail
mkdir -p src test
cat > package.json <<'EOF'
{
  "name": "shop-cart",
  "private": true,
  "scripts": { "test": "node --test" }
}
EOF
cat > src/discounts.js <<'EOF'
// Discount codes. Values are percent or cents.
const DISCOUNTS = {
  SAVE10: { type: 'percent', value: 10 },
  FIVEOFF: { type: 'fixed', value: 500 },
  Spring25: { type: 'percent', value: 25 },
};

function findDiscount(code) {
  if (!code) return null;
  return DISCOUNTS[code.trim().toUpperCase()] || null;
}

module.exports = { findDiscount, DISCOUNTS };
EOF
cat > src/cart.js <<'EOF'
// Cart totals. All amounts are in cents.
const { findDiscount } = require('./discounts');

function subtotal(items) {
  return items.reduce((sum, item) => sum + item.price * item.qty, 0);
}

function total(items, code) {
  const sub = subtotal(items);
  const discount = findDiscount(code);
  if (!discount) return sub;
  if (discount.type === 'percent') {
    return Math.round(sub - (sub * discount.value) / 100);
  }
  return Math.max(0, sub - discount.value);
}

module.exports = { subtotal, total };
EOF
cat > test/cart.test.js <<'EOF'
const test = require('node:test');
const assert = require('node:assert');
const { total } = require('../src/cart');

const items = [{ price: 2000, qty: 2 }];

test('no code charges the subtotal', () => {
  assert.strictEqual(total(items), 4000);
});

test('SAVE10 takes 10 percent off', () => {
  assert.strictEqual(total(items, 'SAVE10'), 3600);
});

test('FIVEOFF takes 500 cents off', () => {
  assert.strictEqual(total(items, 'fiveoff'), 3500);
});
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm "initial cart"
