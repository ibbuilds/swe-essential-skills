#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'README.md')"
cat > 'README.md' <<'EOF1'
# accounts-api

Production: 4 million users. Deploys are rolling restarts with zero downtime: old and new app versions serve traffic side by side for about ten minutes.
EOF1
mkdir -p "$(dirname 'migrations/0007_add_users.sql')"
cat > 'migrations/0007_add_users.sql' <<'EOF2'
CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  fullname TEXT NOT NULL
);
EOF2
mkdir -p "$(dirname 'src/users.js')"
cat > 'src/users.js' <<'EOF3'
const { pool } = require("./db");

async function getUser(id) {
  const { rows } = await pool.query("SELECT id, email, fullname FROM users WHERE id = $1", [id]);
  return rows[0];
}

async function renameUser(id, fullname) {
  await pool.query("UPDATE users SET fullname = $2 WHERE id = $1", [id, fullname]);
}

module.exports = { getUser, renameUser };
EOF3
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
