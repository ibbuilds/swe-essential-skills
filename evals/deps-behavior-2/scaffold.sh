#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'package.json')"
cat > 'package.json' <<'EOF1'
{
  "name": "scraper",
  "private": true,
  "dependencies": {
    "request": "^2.88.2",
    "cheerio": "^1.0.0"
  },
  "devDependencies": {
    "rimraf": "^3.0.2"
  }
}
EOF1
mkdir -p "$(dirname 'src/fetch-page.js')"
cat > 'src/fetch-page.js' <<'EOF2'
const request = require("request");

function fetchPage(url) {
  return new Promise((resolve, reject) => {
    request(url, (err, res, body) => (err ? reject(err) : resolve(body)));
  });
}

module.exports = { fetchPage };
EOF2
mkdir -p "$(dirname 'install-log.txt')"
cat > 'install-log.txt' <<'EOF3'
npm WARN deprecated har-validator@5.1.5: this library is no longer supported
npm WARN deprecated uuid@3.4.0: Please upgrade  to version 7 or higher.
npm WARN deprecated request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
npm WARN deprecated inflight@1.0.6: This module is not supported, and leaks memory.
npm WARN deprecated glob@7.2.3: Glob versions prior to v9 are no longer supported
npm WARN deprecated rimraf@3.0.2: Rimraf versions prior to v4 are no longer supported

added 74 packages in 3s
EOF3
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
