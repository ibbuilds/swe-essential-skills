#!/usr/bin/env bash
set -euo pipefail
mkdir -p src/http test
cat > src/http/hosts.js <<'EOF'
function byPriority(a, b) {
  return a.priority - b.priority;
}

module.exports = { byPriority };
EOF
cat > src/http/client.js <<'EOF'
const { byPriority } = require('./hosts');

function createClient(hosts, options = {}) {
  const retries = options.retries || 3;
  const timeoutMs = options.timeoutMs || 5000;
  const ordered = hosts.sort(byPriority);
  return { retries, timeoutMs, ordered };
}

module.exports = { createClient };
EOF
cat > src/config.js <<'EOF'
// Shared host list, also used for the health-check page, which shows hosts in config order.
const HOSTS = [
  { url: 'https://eu.api.example.com', priority: 2 },
  { url: 'https://us.api.example.com', priority: 1 },
];

// Webhook deliveries must not be retried.
const WEBHOOK_CLIENT_OPTIONS = { retries: 0 };

module.exports = { HOSTS, WEBHOOK_CLIENT_OPTIONS };
EOF
cat > test/client.test.js <<'EOF'
const test = require('node:test');
const assert = require('node:assert');
const { createClient } = require('../src/http/client');

test('defaults to 3 retries', () => {
  assert.strictEqual(createClient([]).retries, 3);
});
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm "client"
