#!/usr/bin/env bash
set -euo pipefail
G() { git -c user.name=dev -c user.email=dev@example.invalid "$@"; }
mkdir -p src test
cat > package.json <<'J'
{ "name": "billing", "private": true, "scripts": { "test": "node --test" } }
J
cat > src/tax.js <<'J'
// Tax in cents for a list of order lines.
function calcTax(items, rate) {
  let total = 0;
  for (const it of items) {
    total += it.cents * it.qty * rate;
  }
  return Math.round(total);
}
module.exports = { calcTax };
J
cat > src/invoice.js <<'J'
const { calcTax } = require('./tax');
function invoiceTotal(order) {
  const subtotal = order.items.reduce((s, i) => s + i.cents * i.qty, 0);
  return subtotal + calcTax(order.items, order.taxRate);
}
module.exports = { invoiceTotal };
J
cat > test/tax.test.js <<'J'
const test = require('node:test');
const assert = require('node:assert');
const { calcTax } = require('../src/tax');
test('taxes a line', () => assert.strictEqual(calcTax([{ cents: 1000, qty: 2 }], 0.1), 200));
J
cat > test/invoice.test.js <<'J'
const test = require('node:test');
const assert = require('node:assert');
const { invoiceTotal } = require('../src/invoice');
test('invoice total', () => assert.strictEqual(invoiceTotal({ items: [{ cents: 1000, qty: 1 }], taxRate: 0.1 }), 1100));
J
git init -q -b main && git add -A && G commit -qm "feat: invoice totals with tax"

git checkout -q -b feat/tax-refactor
cat > src/tax.js <<'J'
// Tax in cents for a list of order lines.
function lineTax(line, rate) {
  return line.cents * line.qty * rate;
}

function computeTax(lines, rate) {
  return Math.round(lines.reduce((sum, line) => sum + lineTax(line, rate), 0));
}
module.exports = { lineTax, computeTax };
J
sed -i 's/calcTax/computeTax/g' src/invoice.js
cat > test/tax.test.js <<'J'
const test = require('node:test');
const assert = require('node:assert');
const { computeTax, lineTax } = require('../src/tax');
test('taxes a line', () => assert.strictEqual(computeTax([{ cents: 1000, qty: 2 }], 0.1), 200));
test('lineTax is unrounded', () => assert.strictEqual(lineTax({ cents: 15, qty: 1 }, 0.1), 1.5));
J
git add -A && G commit -qm "refactor: extract lineTax and rename calcTax to computeTax"

git checkout -q main
cat > src/tax.js <<'J'
// Tax in cents for a list of order lines. Exempt lines pay no tax.
function calcTax(items, rate) {
  let total = 0;
  for (const it of items) {
    if (it.exempt) continue;
    total += it.cents * it.qty * rate;
  }
  return Math.round(total);
}
module.exports = { calcTax };
J
cat >> test/tax.test.js <<'J'
test('exempt lines pay no tax', () =>
  assert.strictEqual(calcTax([{ cents: 1000, qty: 1, exempt: true }, { cents: 1000, qty: 1 }], 0.1), 100));
J
git add -A && G commit -qm "fix: exempt lines are not taxed"
git checkout -q feat/tax-refactor
