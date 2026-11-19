#!/usr/bin/env bash
# Merge is resolved: no markers, no unmerged paths, repo's own suite green.
set -u
! grep -rIEq '^(<<<<<<< |=======$|>>>>>>> )' --exclude-dir=.git --exclude-dir=node_modules . || { echo "conflict markers"; exit 1; }
[ -z "$(git ls-files -u)" ] || { echo "unmerged paths"; exit 1; }
git merge-base --is-ancestor main HEAD || { echo "main is not merged"; exit 1; }
node --test >/dev/null 2>&1 || { echo "suite red"; exit 1; }
