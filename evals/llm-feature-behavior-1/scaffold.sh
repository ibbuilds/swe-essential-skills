#!/usr/bin/env bash
set -euo pipefail
mkdir -p src
cat > package.json <<'EOF'
{ "name": "helpdesk", "private": true, "type": "commonjs", "scripts": { "test": "node --test" },
  "dependencies": { "@anthropic-ai/sdk": "^0.60.0" } }
EOF
cat > src/tickets.js <<'EOF'
// Support tickets arrive here from the inbox webhook.
async function handleTicket(ticket) {
  return { id: ticket.id, text: ticket.text, category: null };
}
module.exports = { handleTicket };
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm initial
