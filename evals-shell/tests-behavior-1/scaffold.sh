#!/usr/bin/env bash
set -euo pipefail
mkdir -p src
cat > package.json <<'J'
{ "name": "shop", "private": true, "scripts": { "test": "node --test" } }
J
cat > src/shipping.js <<'J'
// Shipping cost in cents.
// Orders of $50.00 or more ship free (domestic only).
// Otherwise: $4.99 up to 1 kg, then $1.50 per started extra kg.
// International orders pay double, and never ship free.
// Express adds a flat $9.99.
function shippingCost({ subtotalCents, weightGrams, international = false, express = false }) {
  if (weightGrams <= 0) throw new Error('weight must be positive');
  let cost = 0;
  if (international || subtotalCents <= 5000) {
    const extraKg = Math.max(0, Math.ceil((weightGrams - 1000) / 1000));
    cost = 499 + extraKg * 150;
    if (international) cost *= 2;
  }
  if (express) cost += 999;
  return cost;
}
module.exports = { shippingCost };
J
cat > src/cart.js <<'J'
const { shippingCost } = require('./shipping');
function total(cart) {
  const subtotalCents = cart.items.reduce((s, i) => s + i.cents * i.qty, 0);
  return subtotalCents + shippingCost({ subtotalCents, weightGrams: cart.weightGrams, international: cart.international, express: cart.express });
}
module.exports = { total };
J
git init -q && git add -A && git -c user.name=dev -c user.email=dev@example.invalid commit -qm initial
