#!/usr/bin/env bash
set -euo pipefail

CYCLE="${1:-}"
if [ -z "$CYCLE" ]; then
  echo "用法：bash scripts/new_cycle.sh cycle-001"
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CYCLE_DIR="$ROOT_DIR/cycles/$CYCLE"

mkdir -p "$CYCLE_DIR"
cp "$ROOT_DIR/templates/feedback_table.csv" "$CYCLE_DIR/feedback.csv"
cp "$ROOT_DIR/templates/iteration_contract.md" "$CYCLE_DIR/iteration_contract.md"
cp "$ROOT_DIR/rules/rule_cards.md" "$CYCLE_DIR/rules_snapshot.md"

cat > "$CYCLE_DIR/README.md" <<EOF_README_CYCLE
# $CYCLE

- feedback.csv：本轮人类负反馈
- iteration_contract.md：本轮迭代契约
- rules_snapshot.md：本轮开始时的规则库快照
- outputs/：小批量产出，请手动创建或由执行器写入
- regression_report.md：回归报告，请手动创建或由测试器写入
EOF_README_CYCLE

mkdir -p "$CYCLE_DIR/outputs"
echo "已创建：$CYCLE_DIR"
