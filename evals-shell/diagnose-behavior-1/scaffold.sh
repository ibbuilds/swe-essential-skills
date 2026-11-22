#!/usr/bin/env bash
set -euo pipefail
git init -q
c(){ git add -A && git -c user.name=dev -c user.email=dev@example.invalid commit -qm "$1"; }
mkdir -p src test
cat > package.json <<'X'
{ "name": "blog", "private": true, "scripts": { "test": "node --test" } }
X
cat > src/text.js <<'X'
function normalize(s) {
  return s.normalize('NFD').replace(/[̀-ͯ]/g, '');
}
function slugify(title) {
  return normalize(title).toLowerCase().trim().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
}
module.exports = { slugify, normalize };
X
cat > test/text.test.js <<'X'
const test = require('node:test');
const assert = require('node:assert');
const { slugify } = require('../src/text');
test('spaces become hyphens', () => assert.strictEqual(slugify('Hello World'), 'hello-world'));
X
c "feat: slugify"
cat > src/posts.js <<'X'
const { slugify } = require('./text');
module.exports = { postUrl: (p) => `/posts/${slugify(p.title)}` };
X
c "feat: post urls"
cat > src/search.js <<'X'
const { normalize } = require('./text');
// Search compares titles case-insensitively.
module.exports = { matches: (q, title) => normalize(title).toLowerCase().includes(normalize(q).toLowerCase()) };
X
c "feat: search"
cat > src/text.js <<'X'
// Unicode handling moved to the search index; keep this one fast.
function normalize(s) {
  return s.normalize('NFC');
}
function slugify(title) {
  return normalize(title).toLowerCase().trim().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
}
module.exports = { slugify, normalize };
X
c "perf: faster normalize"
cat > src/feed.js <<'X'
const { postUrl } = require('./posts');
module.exports = { feedItem: (p) => ({ title: p.title, url: postUrl(p) }) };
X
c "feat: rss feed items"
