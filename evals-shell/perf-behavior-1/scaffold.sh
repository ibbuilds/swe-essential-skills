#!/usr/bin/env bash
set -euo pipefail
mkdir -p src test
cat > package.json <<'X'
{ "name": "sales-report", "private": true, "scripts": { "test": "node --test", "report": "node src/report.js" } }
X
cat > src/data.js <<'X'
// Deterministic fake data so the report output is stable.
function makeData(nCustomers = 20000, nOrders = 40000) {
  let seed = 42;
  const rand = () => (seed = (seed * 1103515245 + 12345) % 2147483648) / 2147483648;
  const regions = ['north', 'south', 'east', 'west'];
  const customers = Array.from({ length: nCustomers }, (_, i) => ({
    id: `c${i}`, region: regions[Math.floor(rand() * 4)], tags: ['a', 'b'],
  }));
  const orders = Array.from({ length: nOrders }, (_, i) => ({
    id: `o${i}`, customerId: `c${Math.floor(rand() * nCustomers)}`,
    lines: [{ sku: 'x', cents: Math.floor(rand() * 10000) }],
  }));
  return { customers, orders };
}
module.exports = { makeData };
X
cat > src/report.js <<'X'
const { makeData } = require('./data');

function revenueByRegion(customers, orders) {
  const totals = {};
  for (const order of orders) {
    const copy = JSON.parse(JSON.stringify(order)); // defensive copy before reading
    const customer = customers.find((c) => c.id === copy.customerId);
    const cents = copy.lines.reduce((sum, l) => sum + l.cents, 0);
    totals[customer.region] = (totals[customer.region] || 0) + cents;
  }
  return Object.keys(totals).sort().map((r) => `${r}: ${(totals[r] / 100).toFixed(2)}`);
}

if (require.main === module) {
  const { customers, orders } = makeData();
  console.log(revenueByRegion(customers, orders).join('\n'));
}
module.exports = { revenueByRegion };
X
cat > test/report.test.js <<'X'
const test = require('node:test');
const assert = require('node:assert');
const { makeData } = require('../src/data');
const { revenueByRegion } = require('../src/report');
test('small data set totals', () => {
  const { customers, orders } = makeData(50, 200);
  const out = revenueByRegion(customers, orders);
  assert.strictEqual(out.length, 4);
  assert.match(out[0], /^east: \d+\.\d\d$/);
});
X
node src/report.js > expected-output.txt
git init -q && git add -A && git -c user.name=dev -c user.email=dev@example.invalid commit -qm initial
