#!/usr/bin/env bash
set -euo pipefail

echo "=== OS ==="
cat /etc/os-release 2>/dev/null || true

echo
echo "=== Kernel ==="
uname -a

echo
echo "=== CPU ==="
nproc 2>/dev/null || true

echo
echo "=== Memory ==="
free -h 2>/dev/null || true

echo
echo "=== Filesystems ==="
df -h
