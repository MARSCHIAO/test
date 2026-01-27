#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib_fetch.sh"

echo "📦 [Official] Starting update..."

TASKS=$(cat <<'EOF'
https://wiki.metacubex.one/example/mrs|Official_Examples/Metacubex/rule-set_config.yaml
https://wiki.metacubex.one/example/geox|Official_Examples/Metacubex/geox_config.yaml
EOF
)

run_parallel_tasks "$TASKS" 2
echo "✅ official 配置处理完成"
