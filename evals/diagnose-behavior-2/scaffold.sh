#!/usr/bin/env bash
set -euo pipefail
mkdir -p src test fixtures
cat > package.json <<'EOF'
{
  "name": "order-summary",
  "private": true,
  "scripts": { "test": "node --test" }
}
EOF
cat > src/format.js <<'EOF'
function formatPrice(cents) {
  return '$' + (cents / 100).toFixed(2);
}

module.exports = { formatPrice };
EOF
cat > src/orders.js <<'EOF'
// Maps rows from the orders API into summary lines.
const { formatPrice } = require('./format');

function toLine(row) {
  return {
    name: row.product_name,
    qty: row.quantity,
    price: formatPrice(row.unit_price * row.quantity),
  };
}

function summarize(apiResponse) {
  return apiResponse.items.map(toLine);
}

module.exports = { summarize, toLine };
EOF
cat > fixtures/orders-api-sample.json <<'EOF'
{
  "api_version": "2026-11-17",
  "items": [
    { "product_name": "Mug", "quantity": 2, "unit_price_cents": 1250 },
    { "product_name": "Poster", "quantity": 1, "unit_price_cents": 1800 }
  ]
}
EOF
cat > CHANGELOG-orders-api.md <<'EOF'
# Orders API changelog

## 2026-11-17
- Renamed `unit_price` to `unit_price_cents` on order items. The old field is no longer sent.
EOF
cat > test/format.test.js <<'EOF'
const test = require('node:test');
const assert = require('node:assert');
const { formatPrice } = require('../src/format');

test('formats cents as dollars', () => {
  assert.strictEqual(formatPrice(1250), '$12.50');
});
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm "initial order summary"
