#!/usr/bin/env bash
set -euo pipefail

LEVEL="${1:-quick}"
TARGET="${2:-current-host}"

cat <<EOF
# ops report (${LEVEL})

- target: ${TARGET}
- conclusion:
- abnormal findings:
- risks:
- suggested next step:
EOF
