#!/usr/bin/env bash
# 通用 fetch + hash 工具库（无噪音）

set -euo pipefail

# 选择 hash 工具
if command -v sha256sum >/dev/null 2>&1; then
  HASH_CMD="sha256sum"
elif command -v shasum >/dev/null 2>&1; then
  HASH_CMD="shasum -a 256"
else
  echo "❌ 未找到 sha256 工具"
  exit 1
fi

fetch_one() {
  local url="$1"
  local out="$2"

  mkdir -p "$(dirname "$out")"
  local tmp="${out}.tmp.$$"

  if ! curl -fsSL "$url" -o "$tmp"; then
    echo "FAILED  $out"
    rm -f "$tmp"
    return
  fi

  if [[ -f "$out" ]]; then
    local old_hash new_hash
    old_hash="$($HASH_CMD "$out" | awk '{print $1}')"
    new_hash="$($HASH_CMD "$tmp" | awk '{print $1}')"

    if [[ "$old_hash" == "$new_hash" ]]; then
      rm -f "$tmp"
      echo "SKIPPED $out"
      return
    fi
  fi

  mv "$tmp" "$out"
  echo "UPDATED $out"
}

export -f fetch_one
export HASH_CMD
