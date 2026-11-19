#!/usr/bin/env bash
# Hidden test: percentage discount applied once.
set -u
ROOT=$(pwd -W 2>/dev/null || pwd)
t=$(mktemp -d); trap 'rm -rf "$t"' EXIT
cat > "$t/hidden.test.js" <<J
const test = require('node:test');
const assert = require('node:assert');
const { applyCoupon } = require('$ROOT/src/coupons');
test('20% off once', () => assert.strictEqual(applyCoupon({ subtotalCents: 10000 }, { type: 'percent', value: 20 }).totalCents, 8000));
test('cap at 50%', () => assert.strictEqual(applyCoupon({ subtotalCents: 10000 }, { type: 'percent', value: 90 }).totalCents, 5000));
test('fixed unchanged', () => assert.strictEqual(applyCoupon({ subtotalCents: 10000 }, { type: 'fixed', value: 500 }).totalCents, 9500));
J
node --test "$t/hidden.test.js" >/dev/null 2>&1
