#!/usr/bin/env bash
set -euo pipefail
mkdir -p server/routes client/src
echo '{ "name": "admin", "private": true, "workspaces": ["server", "client"] }' > package.json
echo 'module.exports = require("express").Router(); // GET /orders with filters' > server/routes/orders.js
echo 'export function OrdersTable() { return null; }' > client/src/OrdersTable.jsx
cat > SPEC.md <<'EOF'
# CSV export for admin orders

## User stories
- As an admin, I click "Export" on the orders table and download a CSV of the orders that match my current filters.
- As an admin exporting more than 10,000 rows, I get an email with a download link when the export is ready.

## Acceptance
- Columns: order id, date, customer email, total, status, in that order.
- The CSV matches the filters on screen.
- Non-admins get 403 from the export endpoint and see no Export button.
- Exports over 10,000 rows finish in the background and the email link works for 24 hours.

## Out of scope
- Excel format. Scheduled exports.
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm "spec"
