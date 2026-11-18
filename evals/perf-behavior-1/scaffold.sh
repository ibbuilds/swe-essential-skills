#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'src/reports.js')"
cat > 'src/reports.js' <<'EOF1'
const { db } = require("./db");

function formatRow(order, customer) {
  // string building looks slow but runs once per row
  return [order.id, customer.name, (order.total / 100).toFixed(2)].join(",");
}

async function monthlyReport(month) {
  const orders = await db.query("SELECT * FROM orders WHERE month = $1", [month]); // about 3,000 rows
  const lines = [];
  for (const order of orders) {
    const [customer] = await db.query("SELECT * FROM customers WHERE id = $1", [order.customer_id]);
    lines.push(formatRow(order, customer));
  }
  return lines.join("\n");
}

module.exports = { monthlyReport };
EOF1
mkdir -p "$(dirname 'src/db.js')"
cat > 'src/db.js' <<'EOF2'
module.exports = { db: require("./pg-pool") };
EOF2
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
