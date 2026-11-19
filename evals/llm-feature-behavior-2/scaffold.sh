#!/usr/bin/env bash
set -euo pipefail
mkdir -p src
cat > package.json <<'EOF'
{ "name": "release-notes", "private": true, "type": "commonjs", "scripts": { "test": "node --test" },
  "dependencies": { "@anthropic-ai/sdk": "^0.60.0" } }
EOF
cat > src/summarize.js <<'EOF'
const Anthropic = require('@anthropic-ai/sdk');
const client = new Anthropic();

// Turns a list of commit messages into a short changelog paragraph for customers.
async function summarizeCommits(commits) {
  const res = await client.messages.create({
    model: process.env.SUMMARY_MODEL,
    max_tokens: 1024,
    messages: [{ role: 'user', content: 'Summarize these commits for a changelog:\n' + commits.join('\n') }],
  });
  return res.content[0].text;
}

module.exports = { summarizeCommits };
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm initial
