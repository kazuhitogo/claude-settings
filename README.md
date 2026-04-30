# Claude Code Settings

Claude Code グローバル設定一式。

## 構成

```
claude-settings/
├── CLAUDE.md                    # グローバル指示 (原始人モード)
├── settings.json                # パーミッション・hooks・モデル設定
├── scripts/
│   ├── deny-check.sh            # PreToolUse hook: コマンド拒否チェック
│   └── complete_sound.py        # Stop hook: タスク完了時 和音再生
└── install.sh
```

## settings.json

**deny (自動拒否コマンド):**
- `git config *`
- `brew install *`
- `chmod 777 *`
- `rm -rf /*`
- `gh repo delete:*`

**hooks:**
- `PreToolUse(Bash)` → `deny-check.sh` でglob照合
- `Stop` → `complete_sound.py` で和音再生 (E4+G4+C5)

**その他:**
- `skipDangerousModePermissionPrompt: true`
- デフォルトモデル: `sonnet`

## CLAUDE.md

原始人モード: 敬語・クッション語・冗長表現を削除し、技術的中身を維持したまま簡潔に応答する。

## インストール

```bash
git clone https://github.com/kazuhitogo/claude-settings ~/Desktop/code/claude-settings
cd ~/Desktop/code/claude-settings
./install.sh
```

**前提条件:**
- `uv` — 完了音スクリプト実行: `curl -LsSf https://astral.sh/uv/install.sh | sh`
- `jq` — deny-check.sh の JSON解析: `brew install jq`
- `afplay` — 完了音再生 (macOS 標準搭載)
- Linux/WSL: `aplay` / `paplay` / `ffplay` にフォールバック

## アップデート

```bash
cd ~/Desktop/code/claude-settings
git pull
./install.sh
```

## 手動で元に戻す

```bash
rm ~/.claude/CLAUDE.md ~/.claude/settings.json
rm ~/.claude/scripts/deny-check.sh ~/.claude/scripts/complete_sound.py
```

## 参考

- https://github.com/InterfaceX-co-jp/genshijin/
- https://wasabeef.jp/blog/claude-code-secure-bash
