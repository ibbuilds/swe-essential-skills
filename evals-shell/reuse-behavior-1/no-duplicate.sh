#!/usr/bin/env bash
# Added code outside format.js must not do its own time math, and must call formatDuration.
set -u
git add -A -N . 2>/dev/null
added=$(git diff HEAD -U0 -- src ':!src/lib/format.js' | grep '^+' | grep -v '^+++')
[ -n "$added" ] || { echo "no changes"; exit 1; }
re='60000|% *60|/ *60\b|\* *60\b|/ *1000|padStart'
if echo "$added" | grep -Eq "$re"; then echo "duplicate time math:"; echo "$added" | grep -E "$re"; exit 1; fi
echo "$added" | grep -q 'formatDuration' || { echo "formatDuration not used"; exit 1; }
