#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$(dirname 'incident-notes.txt')"
cat > 'incident-notes.txt' <<'EOF1'
14:02 deploy v2.3.1 (dana)
14:05 alert: checkout 5xx rate 38%
14:09 sam: looking at payments client logs, seeing ECONNRESET
14:21 sam: keep-alive timeout higher than the payments LB idle timeout (60s) -> reused dead sockets
14:24 dana rolled back to v2.3.0
14:27 5xx back to baseline 0.2%
about 1,900 checkout attempts failed, support got 140 tickets
nobody noticed the LB idle timeout in review
EOF1
git init -q && git add -A && git -c user.name=eval -c user.email=eval@example.invalid commit -qm fixture
