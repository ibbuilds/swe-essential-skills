#!/usr/bin/env bash
# Hidden behavior test: main's exemption fix and the branch's API must both be present.
set -u
ROOT=$(pwd -W 2>/dev/null || pwd)
t=$(mktemp -d); trap 'rm -rf "$t"' EXIT
cat > "$t/hidden.test.js" <<J
const test = require('node:test');
const assert = require('node:assert');
const { computeTax, lineTax } = require('$ROOT/src/tax');
const { invoiceTotal } = require('$ROOT/src/invoice');
const items = [{ cents: 1000, qty: 1, exempt: true }, { cents: 1000, qty: 1 }];
test('branch API', () => { assert.strictEqual(typeof lineTax, 'function'); assert.strictEqual(typeof computeTax, 'function'); });
test('exempt skipped (main fix)', () => assert.strictEqual(computeTax(items, 0.1), 100));
test('invoice honours exemption', () => assert.strictEqual(invoiceTotal({ items, taxRate: 0.1 }), 2100));
test('plain lines still taxed', () => assert.strictEqual(computeTax([{ cents: 1000, qty: 2 }], 0.1), 200));
J
node --test "$t/hidden.test.js" >/dev/null 2>&1
