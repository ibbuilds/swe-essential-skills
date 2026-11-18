#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'package.json')"
cat > 'package.json' <<'EOF1'
{ "name": "admin", "private": true, "scripts": { "test": "vitest run", "lint": "eslint .", "typecheck": "tsc --noEmit", "build": "next build" } }
EOF1
mkdir -p "$(dirname 'src/export/orders-csv.ts')"
cat > 'src/export/orders-csv.ts' <<'EOF2'
export function ordersToCsv(orders: { id: string; total: number; status: string }[]) {
  const header = "id,total,status";
  return [header, ...orders.map((o) => `${o.id},${o.total.toFixed(2)},${o.status}`)].join("\n");
}
EOF2
mkdir -p "$(dirname 'src/export/orders-csv.test.ts')"
cat > 'src/export/orders-csv.test.ts' <<'EOF3'
import { expect, test } from "vitest";
import { ordersToCsv } from "./orders-csv";

test("writes a header and one line per order", () => {
  expect(ordersToCsv([{ id: "a1", total: 5, status: "paid" }])).toBe("id,total,status\na1,5.00,paid");
});
EOF3
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
