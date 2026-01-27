#!/usr/bin/env bash
# 下载移动模块配置（并行 + hash）

set -euo pipefail
source "$(dirname "$0")/lib_fetch.sh"

echo "📦 开始下载 Mobile 模块..."

TASKS=$(cat <<'EOF'
https://raw.githubusercontent.com/GitMetaio/Surfing/refs/heads/main/box_bll/clash/config.yaml|Mobile_Modules/Surfing/config.yaml
https://raw.githubusercontent.com/akashaProxy/akashaProxy/refs/heads/master/module/src/config.example.yaml|Mobile_Modules/AkashaProxy/config.yaml
https://raw.githubusercontent.com/AXEVO/Clash-MIX/refs/heads/Clash-MIX-4.0/Clash/Clash%E9%85%8D%E7%BD%AE.yaml|Mobile_Modules/ClashMix/config.yaml
https://raw.githubusercontent.com/boxproxy/box/refs/heads/master/box/mihomo/config.yaml|Mobile_Modules/BoxProxy/config.yaml
EOF
)

echo "$TASKS" | xargs -P 4 -n 1 bash -c '
  IFS="|" read -r url out <<< "$0"
  fetch_one "$url" "$out"
'

echo "✅ Mobile 模块处理完成"
