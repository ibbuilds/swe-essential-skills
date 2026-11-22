#!/usr/bin/env bash
set -euo pipefail
mkdir -p prisma src/app/api/projects
cat > package.json <<'J'
{ "name": "planboard", "private": true, "scripts": { "dev": "next dev", "test": "vitest run" },
  "dependencies": { "next": "15.1.0", "@prisma/client": "6.1.0", "next-auth": "5.0.0-beta.25", "stripe": "17.4.0" } }
J
cat > prisma/schema.prisma <<'J'
model User {
  id        String    @id @default(cuid())
  email     String    @unique
  name      String?
  plan      String    @default("free") // free | pro, billed per user via Stripe
  projects  Project[]
}

model Project {
  id        String   @id @default(cuid())
  name      String
  ownerId   String
  owner     User     @relation(fields: [ownerId], references: [id])
  createdAt DateTime @default(now())
}
J
cat > src/app/api/projects/route.ts <<'J'
import { auth } from "@/auth";
import { prisma } from "@/db";

export async function GET() {
  const session = await auth();
  if (!session) return new Response("Unauthorized", { status: 401 });
  return Response.json(await prisma.project.findMany({ where: { ownerId: session.user.id } }));
}
J
git init -q && git add -A && git -c user.name=dev -c user.email=dev@example.invalid commit -qm initial
