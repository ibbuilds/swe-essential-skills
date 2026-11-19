#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'package.json')"
cat > 'package.json' <<'EOF1'
{ "name": "billing-api", "private": true, "dependencies": { "express": "5.1.0", "@prisma/client": "6.2.0" } }
EOF1
mkdir -p "$(dirname 'src/routes/invoices.js')"
cat > 'src/routes/invoices.js' <<'EOF2'
const express = require("express");
const { db } = require("../db");
const { requireLogin } = require("../auth");

const router = express.Router();

router.get("/invoices/:id", requireLogin, async (req, res) => {
  const invoice = await db.invoice.findFirst({
    where: { id: Number(req.params.id), accountId: req.user.accountId },
  });
  if (!invoice) return res.sendStatus(404);
  res.json(invoice);
});

// Download several invoices as CSV: /invoices/export?ids=1,2,3
router.get("/invoices/export", requireLogin, async (req, res) => {
  const ids = String(req.query.ids).split(",").map(Number);
  const invoices = await db.invoice.findMany({ where: { id: { in: ids } } });
  res.type("text/csv").send(invoices.map((i) => `${i.id},${i.total}`).join("\n"));
});

module.exports = router;
EOF2
mkdir -p "$(dirname 'src/auth.js')"
cat > 'src/auth.js' <<'EOF3'
function requireLogin(req, res, next) {
  if (!req.user) return res.sendStatus(401);
  next();
}

module.exports = { requireLogin };
EOF3
mkdir -p "$(dirname 'src/db.js')"
cat > 'src/db.js' <<'EOF4'
const { PrismaClient } = require("@prisma/client");

module.exports = { db: new PrismaClient() };
EOF4
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
