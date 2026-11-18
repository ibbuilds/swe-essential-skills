#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'DEPLOY.md')"
cat > 'DEPLOY.md' <<'EOF1'
# Deploying

Deploy: `./scripts/deploy.sh <version>`
Rollback: `./scripts/deploy.sh <previous version>` (takes about 2 minutes). Versions are listed in CHANGELOG.md.
EOF1
mkdir -p "$(dirname 'CHANGELOG.md')"
cat > 'CHANGELOG.md' <<'EOF2'
# Changelog

## v2.3.1 (today)
- Switched checkout to the new payments client.
- Bumped the HTTP keep-alive timeout.

## v2.3.0
- Order history pagination.
EOF2
mkdir -p "$(dirname 'src/checkout.js')"
cat > 'src/checkout.js' <<'EOF3'
const { payments } = require("./payments-client");

async function checkout(cart) {
  return payments.charge(cart.total, cart.token);
}

module.exports = { checkout };
EOF3
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
