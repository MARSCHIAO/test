#!/usr/bin/env bash
# 通用 fetch + hash + parallel 工具库

set -euo pipefail

# 1. 确定 Hash 工具
if command -v sha256sum >/dev/null 2>&1; then
  HASH_CMD="sha256sum"
elif command -v shasum >/dev/null 2>&1; then
  HASH_CMD="shasum -a 256"
else
  echo "❌ Error: sha256sum or shasum not found"
  exit 1
fi

# 2. 单个文件下载函数
fetch_one() {
  local url="$1"
  local out="$2"

  # 跳过空行
  [[ -z "$url" || -z "$out" ]] && return

  mkdir -p "$(dirname "$out")"
  local tmp="${out}.tmp.$$"

  # 下载 (静默但显示错误)
  if ! curl -fsSL "$url" -o "$tmp"; then
    echo "❌ FAILED: $url"
    rm -f "$tmp"
    return
  fi

  # Hash 对比
  if [[ -f "$out" ]]; then
    local old_hash new_hash
    old_hash="$($HASH_CMD "$out" | awk '{print $1}')"
    new_hash="$($HASH_CMD "$tmp" | awk '{print $1}')"

    if [[ "$old_hash" == "$new_hash" ]]; then
      rm -f "$tmp"
      echo "⏭️  SKIPPED: $out"
      return
    fi
  fi

  mv "$tmp" "$out"
  echo "✅ UPDATED: $out"
}

# 3. 并行调度器 (替代 xargs)
# 用法: run_parallel_tasks "$TASKS_STRING" [MAX_JOBS]
run_parallel_tasks() {
  local tasks="$1"
  local max_jobs="${2:-4}" # 默认 4 线程
  local running=0

  # 按行读取任务
  while IFS="|" read -r url out; do
    # 忽略空行或注释
    [[ -z "$url" || "$url" =~ ^# ]] && continue

    # 后台运行
    fetch_one "$url" "$out" &
    ((running++))

    # 限制并发数
    if (( running >= max_jobs )); then
      wait -n  # 等待任意一个子进程结束 (需要 Bash 4.3+)
      ((running--))
    fi
  done <<< "$tasks"

  # 等待剩余任务
  wait
}
