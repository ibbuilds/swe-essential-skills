#!/usr/bin/env bash
set -euo pipefail
mkdir -p src
cat > package.json <<'EOF'
{ "name": "forum", "private": true, "dependencies": { "dayjs": "^1.11.13", "express": "^4.21.2" } }
EOF
cat > src/posts.js <<'EOF'
const dayjs = require('dayjs');
module.exports = { postDate: (p) => dayjs(p.createdAt).format('MMM D, YYYY') };
EOF
cat > src/comments.js <<'EOF'
module.exports = { renderComment: (c) => `${c.author} · ${c.createdAt.toISOString()}\n${c.body}` };
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm initial
