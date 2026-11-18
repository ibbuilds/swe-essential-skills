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

Solo project. Deployed on Vercel (serverless functions only, no always-on servers). Database: Postgres on Neon. Budget: hobby tier, under $20 a month in total.
EOF3
mkdir -p "$(dirname 'prisma/schema.prisma')"
cat > 'prisma/schema.prisma' <<'EOF4'
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

model Booking {
  id    Int    @id @default(autoincrement())
  email String
  start DateTime
}
EOF4
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
