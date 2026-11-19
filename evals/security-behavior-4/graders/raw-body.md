---
type: regex
target: { source: file, path: src/server.js }
pattern: 'express\.raw\(|bodyParser\.raw\(|verify:\s*\(|rawBody'
---

The signature is checked against the raw request body, not the JSON-parsed one.
