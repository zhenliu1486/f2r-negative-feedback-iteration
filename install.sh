#!/usr/bin/env bash
# WorkBuddy 一键安装「负反馈迭代」专家
# 用法：在仓库根目录运行  bash install.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$SCRIPT_DIR/expert"
CONFIG_DIR="${WORKBUDDY_CONFIG_DIR:-$HOME/.workbuddy}"
PLUGINS_DIR="$CONFIG_DIR/plugins/marketplaces/my-experts/plugins"
TARGET="$PLUGINS_DIR/negative-feedback-iteration"
MARKET_DIR="$CONFIG_DIR/plugins/marketplaces/my-experts/.codebuddy-plugin"
MARKET_FILE="$MARKET_DIR/marketplace.json"

if [ ! -f "$SRC/.codebuddy-plugin/plugin.json" ]; then
  echo "找不到专家源文件，请在本仓库根目录运行 install.sh" >&2
  exit 1
fi

if [ -d "$TARGET" ]; then
  echo "已存在同名专家：$TARGET" >&2
  echo "为避免覆盖你的改动，请先自行备份或移除该目录后再运行。" >&2
  exit 1
fi

mkdir -p "$PLUGINS_DIR" "$MARKET_DIR"
cp -R "$SRC" "$TARGET"
echo "已安装：$TARGET"

if [ -f "$MARKET_FILE" ]; then
  cp "$MARKET_FILE" "$MARKET_FILE.bak.$(date +%Y%m%d%H%M%S)"
fi

python3 - "$MARKET_FILE" <<'PY'
import json
import sys
from pathlib import Path

path = Path(sys.argv[1])
default = {
    "name": "my-experts",
    "description": "my-experts marketplace (auto-generated)",
    "plugins": [],
}
if path.exists():
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except (json.JSONDecodeError, OSError):
        data = default
else:
    data = default

plugins = data.setdefault("plugins", [])
if not any(isinstance(x, dict) and x.get("name") == "negative-feedback-iteration" for x in plugins):
    plugins.append({
        "name": "negative-feedback-iteration",
        "source": "./plugins/negative-feedback-iteration",
        "description": "A feedback-to-rules meta-expert that turns human negative feedback into verifiable rule cards, converges rule libraries through small-sample loops and regression gates, and freezes versions before full rollout.",
        "version": "1.0.0",
    })
    path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print("已登记到专家列表")
else:
    print("专家列表里已有记录，跳过")
PY

echo ""
echo "完成。打开【专家中心 → 我的专家】即可看到「负反馈迭代」；没显示就刷新列表或重启 WorkBuddy。"
