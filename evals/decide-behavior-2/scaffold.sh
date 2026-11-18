#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'package.json')"
cat > 'package.json' <<'EOF1'
{ "name": "bookings", "private": true, "dependencies": { "next": "15.1.0", "@prisma/client": "6.2.0", "resend": "4.0.0" } }
EOF1
mkdir -p "$(dirname 'vercel.json')"
cat > 'vercel.json' <<'EOF2'
{ "framework": "nextjs", "functions": { "app/api/**/*.ts": { "maxDuration": 10 } } }
EOF2
mkdir -p "$(dirname 'README.md')"
cat > 'README.md' <<'EOF3'
# Bookings

Solo project, MVP stage. Deployed on Vercel (serverless functions only). No database yet.
EOF3
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
