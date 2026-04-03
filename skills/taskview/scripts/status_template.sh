#!/usr/bin/env bash
set -euo pipefail

DETAIL="${1:-simple}"
TASK="${2:-current-task}"

cat <<EOF
# task status (${DETAIL})

- task: ${TASK}
- current goal:
- in progress:
- done:
- next:
- blockers:
EOF
