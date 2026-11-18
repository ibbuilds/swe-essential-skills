#!/usr/bin/env bash
set -euo pipefail
mkdir -p src/pages src/components
cat > vite.config.js <<'EOF'
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  server: { port: 3000 },
  preview: { port: 4173 },
});
EOF
cat > package.json <<'EOF'
{
  "name": "acme-web",
  "private": true,
  "type": "module",
  "scripts": { "dev": "vite", "build": "vite build", "preview": "vite preview" },
  "dependencies": { "react": "^19.0.0", "react-dom": "^19.0.0", "react-router-dom": "^7.0.0" },
  "devDependencies": { "vite": "^6.0.0", "@vitejs/plugin-react": "^4.3.0" }
}
EOF
cat > src/App.jsx <<'EOF'
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Header from "./components/Header.jsx";
import ProfileSettings from "./pages/ProfileSettings.jsx";

export default function App() {
  return (
    <BrowserRouter>
      <Header />
      <Routes>
        <Route path="/settings/profile" element={<ProfileSettings />} />
      </Routes>
    </BrowserRouter>
  );
}
EOF
cat > src/pages/ProfileSettings.jsx <<'EOF'
import { useState } from "react";

export default function ProfileSettings() {
  const [name, setName] = useState("");

  async function save() {
    await fetch("/api/profile", { method: "PUT", body: JSON.stringify({ name }) });
  }

  return (
    <form onSubmit={(e) => { e.preventDefault(); save(); }}>
      <input value={name} onChange={(e) => setName(e.target.value)} />
      <button type="submit">Save</button>
    </form>
  );
}
EOF
cat > src/components/Header.jsx <<'EOF'
export default function Header() {
  return <header><a href="/">Acme</a></header>;
}
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm "profile settings"
