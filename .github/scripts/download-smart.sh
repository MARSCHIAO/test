#!/usr/bin/env bash
# 下载 Smart 模式配置（并行 + hash）

set -euo pipefail

# 引用库 (确保路径正确)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib_fetch.sh"

echo "📦 开始下载 Smart 配置..."

TASKS=$(cat <<'EOF'
https://raw.githubusercontent.com/666OS/YYDS/main/mihomo/config/OneSmartPro.yaml|Smart_Mode/666OS/OneSmart_Config.yaml
https://raw.githubusercontent.com/666OS/YYDS/main/mihomo/config/OneSmart.yaml|Smart_Mode/666OS/OneSmart_Lite_Config.yaml
https://raw.githubusercontent.com/HenryChiao/MIHOMO_AIO/refs/heads/main/CONFIG/SMART/MihomoSmartProPlus.yaml|Smart_Mode/HenryChiao/MihomoSmartProPlus.yaml
https://raw.githubusercontent.com/HenryChiao/MIHOMO_AIO/refs/heads/main/CONFIG/SMART/MihomoSmartAIO.yaml|Smart_Mode/HenryChiao/MihomoSmartAIO.yaml
https://raw.githubusercontent.com/HenryChiao/MIHOMO_AIO/refs/heads/main/CONFIG/SMART/MihomoSmartProMax.yaml|Smart_Mode/HenryChiao/MihomoSmartProMax.yaml
https://raw.githubusercontent.com/liandu2024/little/refs/heads/main/yaml/clash-fallback-smart-std.yaml|Smart_Mode/liandu2024/clash-fallback-smart-std.yaml
https://raw.githubusercontent.com/liandu2024/little/refs/heads/main/yaml/clash-all-smart.yaml|Smart_Mode/liandu2024/clash-all-smart.yaml
https://raw.githubusercontent.com/liandu2024/little/refs/heads/main/yaml/clash-all-fallback-smart.yaml|Smart_Mode/liandu2024/clash-all-fallback-smart.yaml
https://raw.githubusercontent.com/echs-top/proxy/heads/main/mihomo_smart.yaml|Smart_Mode/echs-top/mihomo_smart.yaml
https://raw.githubusercontent.com/qichiyuhub/rule/refs/heads/main/config/mihomo/AI/smart.yaml|Smart_Mode/qichiyuhub/smart.yaml
EOF
)

# 调用并行下载 (8线程)
run_parallel_tasks "$TASKS" 8
echo "✅ Smart 配置处理完成"
