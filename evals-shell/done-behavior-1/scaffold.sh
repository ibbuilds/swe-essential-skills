#!/usr/bin/env bash
set -euo pipefail
mkdir -p src test/receipts
cat > package.json <<'X'
{ "name": "shop", "private": true, "scripts": { "test": "node --test" } }
X
cat > src/price.js <<'X'
function formatPrice(cents) { return `$${cents / 100}`; }
module.exports = { formatPrice };
X
cat > src/receipt.js <<'X'
const { formatPrice } = require('./price');
module.exports = { receiptLine: (item) => `${item.name} ${formatPrice(item.cents)}` };
X
cat > test/price.test.js <<'X'
const test = require('node:test');
const assert = require('node:assert');
const { formatPrice } = require('../src/price');
test('cents', () => assert.strictEqual(formatPrice(1999), '$19.99'));
X
cat > test/receipts/receipt.test.js <<'X'
const test = require('node:test');
const assert = require('node:assert');
const { receiptLine } = require('../../src/receipt');
test('receipt line', () => assert.strictEqual(receiptLine({ name: 'Mug', cents: 500 }), 'Mug $5'));
X
git init -q && git add -A && git -c user.name=dev -c user.email=dev@example.invalid commit -qm initial
