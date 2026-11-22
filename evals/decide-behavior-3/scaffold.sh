#!/usr/bin/env bash
set -euo pipefail
mkdir -p src/api src/pages
cat > package.json <<'EOF'
{ "name": "app", "private": true, "dependencies": { "next": "15.1.0", "react": "19.0.0", "zod": "^3.24.1" } }
EOF
cat > src/api/schemas.ts <<'EOF'
import { z } from "zod";
export const Order = z.object({ id: z.string(), total: z.number().int().nonnegative() });
EOF
cat > src/pages/signup.tsx <<'EOF'
export default function Signup() { return <form>{/* email, password */}</form>; }
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm initial
