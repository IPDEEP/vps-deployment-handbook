# Linux Baseline Audit：VPS 基础状态审计

## 工具用途

`linux-baseline-audit.sh` 在 Linux VPS 上生成一份基础状态报告，覆盖：

- Linux 发行版、内核、主机名和运行时间；
- CPU、内存、磁盘空间和 inode；
- 块设备和系统负载；
- systemd 失败服务；
- 正在监听的 TCP / UDP 端口；
- UFW 或 firewalld 状态；
- Nginx 版本、配置语法和服务状态（如已安装）。

## 安全设计

这是只读检查脚本，不会：

- 安装或卸载软件；
- 修改 SSH、防火墙或 Nginx 配置；
- 开放或关闭端口；
- 重启服务；
- 修改系统用户或权限；
- 上传系统信息到外部服务。

默认不要求 root 权限。部分命令在普通用户下可能无法显示完整信息，脚本会尽力输出可读取的结果。

## 环境要求

- Linux VPS；
- Bash；
- 常见系统命令：uname、hostname、df；
- free、lsblk、ss、systemctl、ufw、firewall-cmd、nginx 等命令按需提供，缺少时会提示。

## 运行方式

在 VPS 上下载仓库后：

```bash
chmod +x examples/linux-baseline-audit.sh
./examples/linux-baseline-audit.sh
```

也可以不修改文件权限，直接执行：

```bash
bash examples/linux-baseline-audit.sh
```

保存报告：

```bash
bash examples/linux-baseline-audit.sh > baseline-report.txt 2>&1
```

保存报告前请确认当前目录权限合适。报告可能包含主机名、监听端口、文件系统挂载点和服务信息；对外分享前必须检查并脱敏。

## 如何解读

- 磁盘空间和 inode 都应检查，二者任意一项耗尽都可能影响服务。
- systemd 失败服务需要结合日志判断，不应仅凭服务失败就直接重启或删除。
- 监听端口应与实际业务清单核对，未知端口需要进一步确认所属进程。
- 防火墙工具未安装或命令不可用，不代表系统没有其他网络访问控制。
- Nginx 配置测试通过不等于网站端到端访问正常。

## 相关文档

- [VPS 基础安全检查清单](../docs/12-server-security-checklist.md)
- [服务器监控与资源检查](../docs/09-monitoring-and-resource-checks.md)
- [VPS 产品与配置信息](https://www.ipdeep.cn/vps)

服务器规格、价格和地区以官网当前页面和购买界面为准。
