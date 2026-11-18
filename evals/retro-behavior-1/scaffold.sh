#!/usr/bin/env bash
set -euo pipefail
mkdir -p src/routes src/repo
cat > package.json <<'EOF'
{ "name": "api", "private": true, "scripts": { "lint": "eslint src", "test": "node --test" },
  "devDependencies": { "eslint": "^9.0.0" } }
EOF
cat > eslint.config.js <<'EOF'
module.exports = [{ files: ['src/**/*.js'], rules: { 'no-unused-vars': 'error' } }];
EOF
cat > src/db.js <<'EOF'
module.exports = { query: async () => [] };
EOF
cat > src/repo/orders.js <<'EOF'
const db = require('../db');
module.exports = { listOrders: () => db.query('SELECT * FROM orders') };
EOF
cat > src/routes/orders.js <<'EOF'
const db = require('../db');
module.exports = (app) => app.get('/orders', async (req, res) => res.json(await db.query('SELECT * FROM orders')));
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm initial
