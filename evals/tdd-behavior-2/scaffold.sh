#!/usr/bin/env bash
set -euo pipefail
mkdir -p src test
cat > package.json <<'EOF'
{
  "name": "jobqueue",
  "private": true,
  "scripts": { "test": "node --test" }
}
EOF
cat > src/queue.js <<'EOF'
function createQueue() {
  const queue = {
    _items: [],
    push(item) {
      queue._items.push(item);
      return queue._items.length;
    },
    shift() {
      return queue._items.shift();
    },
    get size() {
      return queue._items.length;
    },
  };
  return queue;
}

module.exports = { createQueue };
EOF
cat > test/queue.test.js <<'EOF'
const test = require('node:test');
const assert = require('node:assert');
const { createQueue } = require('../src/queue');

test('items come out in order', () => {
  const q = createQueue();
  q.push('a');
  q.push('b');
  assert.strictEqual(q.shift(), 'a');
  assert.strictEqual(q.size, 1);
});
EOF
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm "initial queue"
