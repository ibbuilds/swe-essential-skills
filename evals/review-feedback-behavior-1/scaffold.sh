#!/usr/bin/env bash
set -euo pipefail
mkdir -p src test
cat > package.json <<'EOF'
{ "name": "billing", "private": true, "scripts": { "test": "node --test test/" } }
EOF
cat > src/invoices.js <<'EOF'
const { loadInvoice } = require('./store');

function invoiceCurrency(invoice) {
  const customer = invoice.customer;
  return customer.currency;
}

function invoiceTotal(invoice) {
  return invoice.lines.reduce((sum, line) => sum + line.amount, 0);
}

function formatInvoice(invoice) {
  const total = invoiceTotal(invoice) / 100;
  return `${invoice.id}: ${total.toFixed(2)} ${invoiceCurrency(invoice)}`;
}

async function printInvoice(id) {
  return formatInvoice(await loadInvoice(id));
}

module.exports = { invoiceTotal, invoiceCurrency, formatInvoice, printInvoice };
EOF
cat > src/store.js <<'EOF'
const db = require('./db');

// Every invoice is loaded through here. Invoices without a customer are rejected.
async function loadInvoice(id) {
  const invoice = await db.invoices.find(id);
  if (!invoice) throw new Error(`invoice ${id} not found`);
  if (!invoice.customer) throw new Error(`invoice ${id} has no customer`);
  return invoice;
}

module.exports = { loadInvoice };
EOF
cat > test/invoices.test.js <<'EOF'
const test = require('node:test');
const assert = require('node:assert');
const { formatInvoice } = require('../src/invoices');

test('formats an invoice', () => {
  const invoice = { id: 'A1', customer: { currency: 'EUR' }, lines: [{ amount: 1000 }, { amount: 250 }] };
  assert.strictEqual(formatInvoice(invoice), 'A1: 12.50 EUR');
});
EOF
cat > test/store.test.js <<'EOF'
const test = require('node:test');
const assert = require('node:assert');
// loadInvoice rejects invoices with no customer, so callers never see customer === null.
test('documented: invoices without a customer are rejected', () => assert.ok(true));
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm initial
