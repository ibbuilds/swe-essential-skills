#!/usr/bin/env bash
set -euo pipefail
mkdir -p src test docs
cat > package.json <<'J'
{ "name": "csv2json", "version": "1.4.0", "bin": { "csv2json": "src/cli.js" }, "scripts": { "test": "node --test" } }
J
cat > src/args.js <<'J'
const HELP = `Usage: csv2json <file> [options]

Options:
  -o, --out <file>     Write JSON to <file> instead of stdout
  -d, --delimiter <c>  Field delimiter (default ",")
  -h, --help           Show this help`;

function parseArgs(argv) {
  const opts = { delimiter: ',' };
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i];
    if (a === '-o' || a === '--out') opts.out = argv[++i];
    else if (a === '-d' || a === '--delimiter') opts.delimiter = argv[++i];
    else if (a === '-h' || a === '--help') opts.help = true;
    else opts.file = a;
  }
  return opts;
}
module.exports = { parseArgs, HELP };
J
cat > src/cli.js <<'J'
#!/usr/bin/env node
const fs = require('fs');
const { parseArgs, HELP } = require('./args');
const opts = parseArgs(process.argv.slice(2));
if (opts.help || !opts.file) { console.log(HELP); process.exit(opts.help ? 0 : 1); }
const [header, ...rows] = fs.readFileSync(opts.file, 'utf8').trim().split('\n').map((l) => l.split(opts.delimiter));
const json = JSON.stringify(rows.map((r) => Object.fromEntries(header.map((h, i) => [h, r[i]]))), null, 2);
if (opts.out) fs.writeFileSync(opts.out, json); else console.log(json);
J
cat > test/args.test.js <<'J'
const test = require('node:test');
const assert = require('node:assert');
const { parseArgs } = require('../src/args');
test('--out sets the output file', () => assert.strictEqual(parseArgs(['a.csv', '--out', 'a.json']).out, 'a.json'));
test('-o sets the output file', () => assert.strictEqual(parseArgs(['a.csv', '-o', 'a.json']).out, 'a.json'));
J
cat > README.md <<'J'
# csv2json

Convert a CSV file to JSON.

```sh
npx csv2json people.csv --out people.json
```

Pass `--out` to write to a file; without it the JSON goes to stdout. See [docs/usage.md](docs/usage.md) for every option.
J
cat > docs/usage.md <<'J'
# Usage

| Option | Short | Description |
| --- | --- | --- |
| `--out <file>` | `-o` | Write JSON to a file instead of stdout |
| `--delimiter <c>` | `-d` | Field delimiter, default `,` |

Example with a semicolon-separated export:

    csv2json export.csv -d ';' --out export.json
J
cat > CHANGELOG.md <<'J'
# Changelog

## Unreleased

## 1.4.0
- Add `--delimiter`.
J
git init -q && git add -A && git -c user.name=dev -c user.email=dev@example.invalid commit -qm "csv2json 1.4.0"
