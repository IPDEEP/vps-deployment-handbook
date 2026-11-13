#!/usr/bin/env bash
set -euo pipefail

# 重要：执行前确认 SSH_PORT 是当前真实 SSH 端口。
# 建议先逐条检查规则，不要在远程生产服务器上盲目执行。

SSH_PORT="${SSH_PORT:-22}"

echo "将准备允许 SSH TCP 端口：${SSH_PORT}"
echo "将准备允许 HTTP/HTTPS：80/tcp、443/tcp"
echo "请先确认以上端口与业务环境一致。"

if ! command -v ufw >/dev/null 2>&1; then
  echo "未检测到 ufw，请按当前发行版选择防火墙工具。"
  exit 1
fi

sudo ufw allow "${SSH_PORT}/tcp"
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

echo "规则已添加。请检查 sudo ufw status verbose。"
echo "本脚本不会自动启用 UFW，避免未经确认导致远程连接中断。"
