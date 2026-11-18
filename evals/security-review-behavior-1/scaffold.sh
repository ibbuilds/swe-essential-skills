#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'package.json')"
cat > 'package.json' <<'EOF1'
{ "name": "shopfront", "private": true, "dependencies": { "next": "15.1.0", "stripe": "17.4.0", "next-auth": "4.24.11" } }
EOF1
mkdir -p "$(dirname '.env.example')"
cat > '.env.example' <<'EOF2'
NEXT_PUBLIC_STRIPE_SECRET_KEY=sk_test_replace_me
STRIPE_WEBHOOK_SECRET=whsec_replace_me
DATABASE_URL=postgres://localhost/shopfront
EOF2
mkdir -p "$(dirname 'src/lib/stripe.ts')"
cat > 'src/lib/stripe.ts' <<'EOF3'
import Stripe from "stripe";

export const stripe = new Stripe(process.env.NEXT_PUBLIC_STRIPE_SECRET_KEY!);
EOF3
mkdir -p "$(dirname 'src/pages/api/stripe-webhook.ts')"
cat > 'src/pages/api/stripe-webhook.ts' <<'EOF4'
import type { NextApiRequest, NextApiResponse } from "next";
import { db } from "../../lib/db";

// Stripe calls this after checkout.
export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const event = req.body;
  if (event.type === "checkout.session.completed") {
    await db.order.update({
      where: { id: event.data.object.metadata.orderId },
      data: { status: "paid" },
    });
  }
  res.status(200).end();
}
EOF4
mkdir -p "$(dirname 'src/pages/api/orders/[id].ts')"
cat > 'src/pages/api/orders/[id].ts' <<'EOF5'
import type { NextApiRequest, NextApiResponse } from "next";
import { getServerSession } from "next-auth";
import { db } from "../../../lib/db";

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const session = await getServerSession(req, res, {});
  if (!session) return res.status(401).end();
  const order = await db.order.findFirst({
    where: { id: String(req.query.id), userId: session.user.id },
  });
  if (!order) return res.status(404).end();
  res.json(order);
}
EOF5
mkdir -p "$(dirname 'src/lib/db.ts')"
cat > 'src/lib/db.ts' <<'EOF6'
import { PrismaClient } from "@prisma/client";

export const db = new PrismaClient();
EOF6
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
