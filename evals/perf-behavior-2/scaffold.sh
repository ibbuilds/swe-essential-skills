#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'package.json')"
cat > 'package.json' <<'EOF1'
{ "name": "dashboard", "private": true, "scripts": { "dev": "vite", "build": "vite build" }, "dependencies": { "react": "19.0.0", "moment": "2.30.1", "lodash": "4.17.21" } }
EOF1
mkdir -p "$(dirname 'src/App.jsx')"
cat > 'src/App.jsx' <<'EOF2'
import moment from "moment";
import _ from "lodash";

export default function App({ rows }) {
  const sorted = _.sortBy(rows, "date");
  return <ul>{sorted.map((r) => <li key={r.id}>{moment(r.date).format("LL")}</li>)}</ul>;
}
EOF2
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
