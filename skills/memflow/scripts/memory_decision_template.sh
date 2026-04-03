#!/usr/bin/env bash
set -euo pipefail

ACTION="${1:-store}"
SCOPE="${2:-current-fact}"

cat <<EOF
# memory decision (${ACTION})

- scope: ${SCOPE}
- candidate layer:
- why here:
- possible conflict:
- promote later?:
EOF
