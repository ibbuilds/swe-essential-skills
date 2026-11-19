#!/usr/bin/env bash
# Pass when the agent's tests fail against every mutant of src/shipping.js.
set -u
cp src/shipping.js /tmp/shipping.orig.$$
node --test >/dev/null 2>&1 || { echo "suite red on the original code"; exit 1; }
survivors=0
while IFS='~' read -r from to; do
  cp /tmp/shipping.orig.$$ src/shipping.js
  if ! grep -qF "$from" src/shipping.js; then echo "missing: $from"; survivors=$((survivors+1)); continue; fi
  node -e 'const fs=require("fs");const p="src/shipping.js";fs.writeFileSync(p,fs.readFileSync(p,"utf8").replace(process.argv[1],process.argv[2]))' "$from" "$to"
  if node --test >/dev/null 2>&1; then echo "survived: $from -> $to"; survivors=$((survivors+1)); fi
done <<'M'
Math.ceil(~Math.floor(
* 150~* 100
if (international) cost *= 2~if (false) cost *= 2
cost += 999~cost += 99
weightGrams <= 0~weightGrams < 0
international || ~false || 
499 + ~449 + 
M
cp /tmp/shipping.orig.$$ src/shipping.js; rm -f /tmp/shipping.orig.$$
echo "survivors: $survivors"
[ "$survivors" -eq 0 ]
