#!/usr/bin/env bash
# Only src/coupons.js changed under src, with at most 4 added+deleted lines. Tests may change.
set -u
git add -A -N . 2>/dev/null
others=$(git diff HEAD --name-only -- src ':!src/coupons.js')
[ -z "$others" ] || { echo "other src files changed: $others"; exit 1; }
read -r add del _ < <(git diff HEAD --numstat -- src/coupons.js)
[ -n "${add:-}" ] || { echo "coupons.js unchanged"; exit 1; }
echo "added=$add deleted=$del"
[ $((add + del)) -le 4 ]
