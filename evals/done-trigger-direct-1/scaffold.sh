#!/usr/bin/env bash
set -euo pipefail
mkdir -p src test
cat > package.json <<'EOF'
{ "name": "shop", "private": true, "scripts": { "test": "node --test" } }
EOF
cat > src/price.js <<'EOF'
function formatPrice(cents) { return `$${cents / 100}`; }
module.exports = { formatPrice };
EOF
cat > test/price.test.js <<'EOF'
const test = require('node:test');
const assert = require('node:assert');
const { formatPrice } = require('../src/price');
test('whole dollars', () => assert.strictEqual(formatPrice(500), '$5'));
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm initial
