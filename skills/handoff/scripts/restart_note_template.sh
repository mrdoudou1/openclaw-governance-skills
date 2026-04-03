#!/usr/bin/env bash
set -euo pipefail

LEVEL="${1:-quick}"
SCOPE="${2:-current-task}"

cat <<EOF
# restart note (${LEVEL})

- scope: ${SCOPE}
- current objective:
- done:
- current state:
- next exact action:
- blockers / questions:
- memory update needed:
EOF
