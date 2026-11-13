#!/usr/bin/env bash
set -euo pipefail

echo "=== Filesystem usage ==="
df -h

echo
echo "=== Inode usage ==="
df -i

echo
echo "=== Top-level directory sizes (may require sudo for full visibility) ==="
du -xhd1 / 2>/dev/null | sort -h || true
