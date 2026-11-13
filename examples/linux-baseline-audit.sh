#!/usr/bin/env bash
# Read-only Linux VPS baseline report.
# This script does not install packages, change configuration, restart services,
# open ports, or modify firewall rules.

set -u

section() {
  printf '\n===== %s =====\n' "$1"
}

show_cmd() {
  local label="$1"
  shift
  section "$label"
  if command -v "$1" >/dev/null 2>&1; then
    "$@" 2>&1 || true
  else
    printf '命令不可用：%s\n' "$1"
  fi
}

section "系统信息"
if [ -r /etc/os-release ]; then
  . /etc/os-release
  printf '发行版：%s\n' "${PRETTY_NAME:-unknown}"
fi
printf '主机名：%s\n' "$(hostname 2>/dev/null || echo unknown)"
printf '内核：%s\n' "$(uname -sr 2>/dev/null || echo unknown)"
printf '运行时间：%s\n' "$(uptime -p 2>/dev/null || uptime 2>/dev/null || echo unknown)"

show_cmd "CPU 信息" nproc
show_cmd "内存使用" free -h
show_cmd "文件系统空间" df -h
show_cmd "文件系统 inode" df -i
show_cmd "块设备" lsblk

section "负载信息"
if [ -r /proc/loadavg ]; then
  printf 'Load average：'
  cat /proc/loadavg
else
  printf '/proc/loadavg 不可用\n'
fi

section "失败的 systemd 服务"
if command -v systemctl >/dev/null 2>&1; then
  systemctl --failed --no-pager 2>&1 || true
else
  printf 'systemctl 不可用\n'
fi

section "监听中的 TCP / UDP 端口"
if command -v ss >/dev/null 2>&1; then
  ss -lntup 2>&1 || ss -lntu 2>&1 || true
else
  printf 'ss 命令不可用\n'
fi

section "防火墙状态"
if command -v ufw >/dev/null 2>&1; then
  ufw status verbose 2>&1 || true
elif command -v firewall-cmd >/dev/null 2>&1; then
  firewall-cmd --state 2>&1 || true
else
  printf '未检测到 ufw 或 firewall-cmd；不代表系统没有其他防火墙。\n'
fi

section "Nginx 状态（如已安装）"
if command -v nginx >/dev/null 2>&1; then
  nginx -v 2>&1 || true
  nginx -t 2>&1 || true
  if command -v systemctl >/dev/null 2>&1; then
    systemctl is-active nginx 2>&1 || true
  fi
else
  printf '未检测到 nginx\n'
fi

section "报告结束"
printf '本脚本为只读检查，不会修改系统配置。\n'
printf '分享报告前请检查并脱敏主机名、端口、路径和其他内部信息。\n'
