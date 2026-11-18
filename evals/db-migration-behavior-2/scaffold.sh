#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'README.md')"
cat > 'README.md' <<'EOF1'
# orders-db

Postgres 16. orders has about 30 million rows and takes writes all day.
EOF1
mkdir -p "$(dirname 'migrations/0012_orders.sql')"
cat > 'migrations/0012_orders.sql' <<'EOF2'
CREATE TABLE orders (
  id BIGSERIAL PRIMARY KEY,
  customer_id BIGINT NOT NULL REFERENCES customers(id),
  total_cents INTEGER NOT NULL
);
EOF2
mkdir -p "$(dirname 'migrations/0010_customers.sql')"
cat > 'migrations/0010_customers.sql' <<'EOF3'
CREATE TABLE customers (
  id BIGSERIAL PRIMARY KEY,
  address_country CHAR(2) NOT NULL
);
EOF3
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
