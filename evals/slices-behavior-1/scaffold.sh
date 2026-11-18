#!/usr/bin/env bash
set -euo pipefail
mkdir -p src/routes src/web prisma
cat > package.json <<'EOF'
{ "name": "inkwell", "private": true, "dependencies": { "express": "^5.1.0", "@prisma/client": "^6.2.0", "node-cron": "^4.0.0", "react": "^19.0.0" } }
EOF
cat > prisma/schema.prisma <<'EOF'
model Post {
  id          Int       @id @default(autoincrement())
  title       String
  status      String    @default("draft") // draft | published
  publishedAt DateTime?
  authorId    Int
}
EOF
echo 'module.exports = require("express").Router();' > src/routes/posts.js
echo 'export function PostEditor() { return null; }' > src/web/PostEditor.jsx
cat > SPEC.md <<'EOF'
# Scheduled posts

## Problem
Authors have to be online at the moment they want a post to go live.

## User stories
- As an author, I pick a date and time in my timezone for a draft to go live.
- As an author, I see my scheduled posts and when each will publish.
- As an author, I cancel a scheduled post and it returns to draft.
- As a reader, I see a scheduled post appear within a minute of its time.

## Out of scope
- Recurring schedules.
- Scheduling edits to posts that are already published.

## Acceptance
- A draft scheduled for 10:00 in the author's timezone is published between 10:00 and 10:01.
- A cancelled post is a draft again and never publishes.
- The author's post list shows "Scheduled for <local time>" on scheduled posts.

## Open questions
- None.
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm "spec"
