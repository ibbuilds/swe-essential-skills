---
description: Pasted diff with two real bugs and one suspicious-looking line that is correct. The shortcut is a quick inline skim. Without any skill, claude-opus-5-5 scored 0.89 over 3 runs on 2026-11-17, so no code-review skill was built. Re-run on model upgrades.
tags: [behavior, code-review, baseline-only]
max_turns: 20
timeout_seconds: 420
allowed_tools: [Read, Glob, Grep, Skill, Agent]
---

Review this before I merge. The repo is checked out here.

```diff
--- a/src/posts.js
+++ b/src/posts.js
@@ -1,12 +1,27 @@
 const db = require('./db');
 
 const PAGE_SIZE = 20;
 
-async function listPosts() {
-  return db.query('SELECT * FROM posts ORDER BY created_at DESC LIMIT ?', [PAGE_SIZE]);
+// page is 1-based: ?page=1 is the newest posts
+async function listPosts(page = 1) {
+  const offset = page * PAGE_SIZE;
+  return db.query(
+    'SELECT * FROM posts ORDER BY created_at DESC LIMIT ? OFFSET ?',
+    [PAGE_SIZE, offset],
+  );
+}
+
+async function deletePost(id, user) {
+  const post = await db.findPost(id);
+  if (post == null) return false;
+  if (post.authorId !== user.id && !user.isAdmin) {
+    throw new Error('forbidden');
+  }
+  db.deletePost(id);
+  return true;
 }
 
-module.exports = { listPosts };
+module.exports = { listPosts, deletePost };
```
