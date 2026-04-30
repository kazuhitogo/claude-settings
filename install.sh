#!/bin/bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Claude Code settings install ==="

# ~/.claude ディレクトリ作成
mkdir -p ~/.claude/scripts

# CLAUDE.md (グローバル指示)
cp "$REPO_DIR/CLAUDE.md" ~/.claude/CLAUDE.md
echo "[OK] ~/.claude/CLAUDE.md"

# settings.json
cp "$REPO_DIR/settings.json" ~/.claude/settings.json
echo "[OK] ~/.claude/settings.json"

# deny-check.sh
cp "$REPO_DIR/scripts/deny-check.sh" ~/.claude/scripts/deny-check.sh
chmod +x ~/.claude/scripts/deny-check.sh
echo "[OK] ~/.claude/scripts/deny-check.sh"

# 完了音スクリプト
cp "$REPO_DIR/scripts/complete_sound.py" ~/.claude/scripts/complete_sound.py
chmod +x ~/.claude/scripts/complete_sound.py
echo "[OK] ~/.claude/scripts/complete_sound.py"

# genshijin スキル
mkdir -p ~/.claude/skills/genshijin
curl -fsSL \
  "https://raw.githubusercontent.com/InterfaceX-co-jp/genshijin/main/skills/genshijin/SKILL.md" \
  -o ~/.claude/skills/genshijin/SKILL.md
echo "[OK] ~/.claude/skills/genshijin/SKILL.md"

echo ""
echo "=== 完了 ==="
echo "完了音は uv が必要: https://docs.astral.sh/uv/"
