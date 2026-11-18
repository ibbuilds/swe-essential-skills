#!/usr/bin/env bash
set -euo pipefail
mkdir -p src
cat > src/db.js <<'EOF'
// Thin wrapper over the SQL client. Every function returns a Promise.
const client = require('./client');

async function query(sql, params) {
  const [rows] = await client.execute(sql, params);
  return rows;
}

async function findPost(id) {
  const rows = await query('SELECT * FROM posts WHERE id = ?', [id]);
  return rows[0];
}

async function deletePost(id) {
  await query('DELETE FROM posts WHERE id = ?', [id]);
}

module.exports = { query, findPost, deletePost };
EOF
cat > src/posts.js <<'EOF'
const db = require('./db');

const PAGE_SIZE = 20;

// page is 1-based: ?page=1 is the newest posts
async function listPosts(page = 1) {
  const offset = page * PAGE_SIZE;
  return db.query(
    'SELECT * FROM posts ORDER BY created_at DESC LIMIT ? OFFSET ?',
    [PAGE_SIZE, offset],
  );
}

async function deletePost(id, user) {
  const post = await db.findPost(id);
  if (post == null) return false;
  if (post.authorId !== user.id && !user.isAdmin) {
    throw new Error('forbidden');
  }
  db.deletePost(id);
  return true;
}

module.exports = { listPosts, deletePost };
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm "posts"
