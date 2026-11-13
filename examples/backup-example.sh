#!/usr/bin/env bash
set -euo pipefail

# 示例目录同步脚本。执行前必须设置并检查源目录和目标目录。
: "${SOURCE_DIR:?请设置 SOURCE_DIR}"
: "${BACKUP_DIR:?请设置 BACKUP_DIR}"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "源目录不存在：$SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$BACKUP_DIR"

echo "准备同步：$SOURCE_DIR/"
echo "目标目录：$BACKUP_DIR/"

# 注意：此示例不包含数据库一致性处理、加密、异地传输或保留策略。
rsync -a --human-readable "$SOURCE_DIR/" "$BACKUP_DIR/"

echo "目录同步完成。请检查备份文件并定期执行恢复演练。"
