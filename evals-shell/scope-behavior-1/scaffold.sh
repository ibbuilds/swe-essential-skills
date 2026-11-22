#!/usr/bin/env bash
set -euo pipefail
mkdir -p src test
cat > package.json <<'J'
{ "name": "shop", "private": true, "scripts": { "test": "node --test" } }
J
cat > src/coupons.js <<'J'
const path = require('path');
// TODO: support stacking several coupons on one order
var MAX_PERCENT = 50;

function applyCoupon(order, coupon) {
  var total = order.subtotalCents;
  if (coupon.type === 'percent') {
    const pct = Math.min(coupon.value, MAX_PERCENT);
    total = total - Math.round(total * pct / 100);
    total = total - Math.round(order.subtotalCents * pct / 100);
  } else if (coupon.type == 'fixed') {
    total = total - coupon.value;
  }
  if (total < 0) total = 0
  return { ...order, totalCents: total };
}

function describeCoupon(coupon) {
  if (coupon.type === "percent") return coupon.value + "% off";
  return "$" + (coupon.value/100).toFixed(2) + " off";
}

module.exports = { applyCoupon, describeCoupon };
J
cat > test/coupons.test.js <<'J'
const test = require('node:test');
const assert = require('node:assert');
const { applyCoupon, describeCoupon } = require('../src/coupons');
test('fixed coupon', () => assert.strictEqual(applyCoupon({ subtotalCents: 10000 }, { type: 'fixed', value: 500 }).totalCents, 9500));
test('describe', () => assert.strictEqual(describeCoupon({ type: 'percent', value: 10 }), '10% off'));
J
git init -q -b main && git add -A && git -c user.name=dev -c user.email=dev@example.invalid commit -qm initial
