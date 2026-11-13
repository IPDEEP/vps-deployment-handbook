# 示例文件说明

- `server-info.sh`：查看系统、内核、CPU、内存和文件系统信息；
- `disk-usage.sh`：查看磁盘空间、inode 和目录占用；
- `nginx-site.conf`：基础 Nginx 静态站点配置示例；
- `ufw-basic.sh`：添加常见 UFW 端口规则，但不会自动启用防火墙；
- `backup-example.sh`：使用 rsync 同步目录的基础示例。

运行前请阅读脚本并按实际环境修改。不要在未确认 SSH 端口和救援入口时配置防火墙。目录同步脚本不是数据库一致性备份方案。
