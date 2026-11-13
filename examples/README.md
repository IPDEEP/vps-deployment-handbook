# 示例文件说明

- `server-info.sh`：查看系统、内核、CPU、内存和文件系统信息；
- `disk-usage.sh`：查看磁盘空间、inode 和目录占用；
- `nginx-site.conf`：基础 Nginx 静态站点配置示例；
- `ufw-basic.sh`：添加常见 UFW 端口规则，但不会自动启用防火墙；
- `backup-example.sh`：使用 rsync 同步目录的基础示例；
- `linux-baseline-audit.sh`：只读检查 Linux VPS 基础状态，包括系统资源、失败服务、监听端口、防火墙和 Nginx。

## Linux VPS 基础状态审计

该脚本无需安装额外依赖，默认不要求 root 权限：

```bash
bash examples/linux-baseline-audit.sh
```

保存报告：

```bash
bash examples/linux-baseline-audit.sh > baseline-report.txt 2>&1
```

脚本不会安装软件、修改配置、开放端口或重启服务。普通用户权限下，部分命令输出可能不完整。报告可能包含主机名、监听端口和内部路径，对外分享前请检查并脱敏。

详细说明见 [Linux VPS 基础状态审计工具](../docs/13-linux-baseline-audit.md)。

## 安全提醒

运行前阅读脚本和对应文档。不要在未确认 SSH 端口和救援入口时修改防火墙。目录同步脚本不是数据库一致性备份方案。
