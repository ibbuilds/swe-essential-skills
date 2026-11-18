#!/usr/bin/env bash
set -euo pipefail
mkdir -p src/routes prisma
cat > package.json <<'EOF'
{
  "name": "inkwell",
  "private": true,
  "scripts": { "dev": "node src/server.js", "test": "vitest run" },
  "dependencies": { "express": "^5.1.0", "@prisma/client": "^6.2.0", "node-cron": "^4.0.0" },
  "devDependencies": { "prisma": "^6.2.0", "vitest": "^3.0.0" }
}
EOF
cat > prisma/schema.prisma <<'EOF'
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

model User {
  id       Int    @id @default(autoincrement())
  email    String @unique
  timezone String @default("UTC")
  posts    Post[]
}

model Post {
  id          Int       @id @default(autoincrement())
  title       String
  body        String
  status      String    @default("draft") // draft | published
  publishedAt DateTime?
  author      User      @relation(fields: [authorId], references: [id])
  authorId    Int
}
EOF
cat > src/routes/posts.js <<'EOF'
const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.post("/:id/publish", async (req, res) => {
  const post = await prisma.post.update({
    where: { id: Number(req.params.id) },
    data: { status: "published", publishedAt: new Date() },
  });
  res.json(post);
});

module.exports = router;
EOF
cat > src/jobs.js <<'EOF'
// Background jobs run in the web process with node-cron.
const cron = require("node-cron");

function startJobs() {
  cron.schedule("0 3 * * *", () => console.log("nightly cleanup"));
}

module.exports = { startJobs };
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm "inkwell"
