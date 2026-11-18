#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'package.json')"
cat > 'package.json' <<'EOF1'
{ "name": "shop", "private": true, "scripts": { "test": "node --test" } }
EOF1
mkdir -p "$(dirname 'src/pricing.js')"
cat > 'src/pricing.js' <<'EOF2'
function price(items, coupon, member) {
  var t = 0;
  for (var i = 0; i < items.length; i++) {
    if (items[i].qty > 0) { t = t + items[i].price * items[i].qty }
  }
  if (coupon == "TENOFF") { if (t >= 5000) { t = t - 1000 } }
  if (member) { t = Math.floor(t * 0.95) }
  if (t < 0) t = 0
  return t
}
module.exports = { price }
EOF2
mkdir -p "$(dirname 'test/smoke.test.js')"
cat > 'test/smoke.test.js' <<'EOF3'
const test = require('node:test');
const assert = require('node:assert');

test('runs', () => assert.ok(true));
EOF3
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
