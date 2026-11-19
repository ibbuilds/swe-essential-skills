#!/usr/bin/env bash
set -euo pipefail
mkdir -p src/emails test
cat > package.json <<'J'
{ "name": "billing", "private": true, "scripts": { "test": "TZ=America/New_York node --test" } }
J
cat > src/emails/invoice.js <<'J'
// dueDate is stored as a date-only string, e.g. "2026-03-15"
function invoiceEmail(invoice) {
  const due = new Date(invoice.dueDate).toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' });
  return `Invoice ${invoice.number} for $${(invoice.cents / 100).toFixed(2)} is due ${due}.`;
}
module.exports = { invoiceEmail };
J
cat > src/emails/reminder.js <<'J'
function reminderEmail(invoice) {
  const due = new Date(invoice.dueDate).toLocaleDateString('en-US', { month: 'long', day: 'numeric' });
  return `Reminder: invoice ${invoice.number} is due ${due}.`;
}
module.exports = { reminderEmail };
J
cat > src/emails/receipt.js <<'J'
function receiptEmail(payment) {
  const paidOn = new Date(payment.paidDate).toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' });
  return `We received $${(payment.cents / 100).toFixed(2)} on ${paidOn}. Thank you.`;
}
module.exports = { receiptEmail };
J
cat > src/account.js <<'J'
// The account page formats the stored date-only string without a Date object.
const MONTHS = ['January','February','March','April','May','June','July','August','September','October','November','December'];
function displayDate(ymd) { const [y, m, d] = ymd.split('-').map(Number); return `${MONTHS[m - 1]} ${d}, ${y}`; }
module.exports = { displayDate };
J
cat > test/account.test.js <<'J'
const test = require('node:test');
const assert = require('node:assert');
const { displayDate } = require('../src/account');
test('account date', () => assert.strictEqual(displayDate('2026-03-15'), 'March 15, 2026'));
J
git init -q && git add -A && git -c user.name=dev -c user.email=dev@example.invalid commit -qm initial
