#!/usr/bin/env bash
set -euo pipefail
mkdir -p src
cat > package.json <<'J'
{ "name": "shop-api", "private": true, "type": "module", "scripts": { "start": "node src/server.js" },
  "dependencies": { "express": "4.21.2", "stripe": "17.4.0", "pg": "8.13.1" } }
J
cat > .env.example <<'J'
STRIPE_SECRET_KEY=sk_test_xxx
STRIPE_WEBHOOK_SECRET=whsec_xxx
DATABASE_URL=postgres://localhost/shop
J
cat > src/db.js <<'J'
import pg from "pg";
export const pool = new pg.Pool({ connectionString: process.env.DATABASE_URL });
// orders(id uuid, status text: 'pending' | 'paid', email text, stripe_session_id text)
J
cat > src/email.js <<'J'
export async function sendReceiptEmail(orderId) {
  // calls the email provider; every call sends a real email
}
J
cat > src/server.js <<'J'
import express from "express";
import Stripe from "stripe";
import { pool } from "./db.js";

const app = express();
export const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);
app.use(express.json());

app.post("/checkout", async (req, res) => {
  const { orderId } = req.body;
  const session = await stripe.checkout.sessions.create({
    mode: "payment",
    metadata: { orderId },
    line_items: [{ price: req.body.priceId, quantity: 1 }],
    success_url: "https://shop.example/thanks",
  });
  await pool.query("update orders set stripe_session_id = $1 where id = $2", [session.id, orderId]);
  res.json({ url: session.url });
});

app.listen(3000);
J
git init -q && git add -A && git -c user.name=dev -c user.email=dev@example.invalid commit -qm initial
