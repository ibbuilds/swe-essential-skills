#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'package.json')"
cat > 'package.json' <<'EOF1'
{
  "name": "storefront",
  "private": true,
  "scripts": { "dev": "next dev", "build": "next build", "lint": "next lint" },
  "dependencies": {
    "next": "12.3.4",
    "react": "17.0.2",
    "react-dom": "17.0.2"
  }
}
EOF1
mkdir -p "$(dirname 'pages/index.js')"
cat > 'pages/index.js' <<'EOF2'
import Link from "next/link";
import Image from "next/legacy/image";

export default function Home() {
  return (
    <main>
      <Link href="/about"><a>About</a></Link>
    </main>
  );
}
EOF2
mkdir -p "$(dirname 'pages/about.js')"
cat > 'pages/about.js' <<'EOF3'
export default function About() {
  return <p>About us</p>;
}
EOF3
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
