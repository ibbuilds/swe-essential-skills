#!/usr/bin/env bash
set -euo pipefail
mkdir -p src/components
cat > package.json <<'EOF'
{
  "name": "notes-app",
  "private": true,
  "scripts": { "dev": "vite", "build": "vite build", "test": "vitest run" },
  "dependencies": { "react": "^18.3.1", "react-dom": "^18.3.1" },
  "devDependencies": { "vite": "^5.4.0", "vitest": "^2.1.0" }
}
EOF
cat > src/components/ThemeToggle.jsx <<'EOF'
import { useEffect, useState } from 'react';

export function ThemeToggle() {
  const [dark, setDark] = useState(() => localStorage.getItem('theme') === 'dark');
  useEffect(() => {
    document.documentElement.dataset.theme = dark ? 'dark' : 'light';
    localStorage.setItem('theme', dark ? 'dark' : 'light');
  }, [dark]);
  return (
    <button aria-pressed={dark} onClick={() => setDark(!dark)}>
      {dark ? 'Light mode' : 'Dark mode'}
    </button>
  );
}
EOF
cat > src/theme.css <<'EOF'
:root { --bg: #fff; --fg: #111; }
:root[data-theme='dark'] { --bg: #111; --fg: #eee; }
body { background: var(--bg); color: var(--fg); }
EOF
git add -A >/dev/null 2>&1 && git -c user.email=e@x -c user.name=e commit -qm "add dark mode toggle" >/dev/null 2>&1 || true
