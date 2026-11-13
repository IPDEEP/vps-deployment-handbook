# VPS 部署与运维手册 | VPS Deployment Handbook

> 面向中文用户的 VPS 入门、Linux 初始化、SSH 远程连接、基础安全、Nginx 配置、监控、备份与故障排查知识库。

**English summary:** A Chinese-first practical handbook for VPS selection, Linux server setup, SSH access, basic hardening, Nginx deployment, monitoring, backups and troubleshooting.

本项目由 IPDEEP 整理维护，内容用于合法的服务器部署、网站运维、开发测试和企业 IT 管理。本文档不代表任何云服务商的 SLA，也不承诺特定配置一定适合所有业务。

## 适合哪些用户？

- 第一次购买和使用 VPS 的个人站长；
- 需要部署网站、API 或开发环境的开发者；
- 需要管理 Linux 服务器的运维人员；
- 需要了解 CPU、内存、磁盘和带宽如何选择的用户；
- 希望建立基础安全、备份和监控流程的小型团队。

## 文档目录

| 文档 | 内容 |
|---|---|
| [01 VPS 基础知识](docs/01-vps-basics.md) | VPS、虚拟化、独立服务器和云服务器概念 |
| [02 VPS 配置怎么选](docs/02-vps-selection-guide.md) | CPU、内存、磁盘、带宽和地区 |
| [03 Linux VPS 初始配置](docs/03-linux-initial-setup.md) | 首次登录、主机名、时区和系统信息 |
| [04 SSH 远程连接](docs/04-ssh-remote-access.md) | SSH 客户端、端口、连接和常见问题 |
| [05 Linux 用户与 SSH 密钥](docs/05-linux-users-and-ssh-keys.md) | 普通用户、sudo 和密钥认证 |
| [06 防火墙基础配置](docs/06-firewall-basics.md) | UFW 示例与远程管理注意事项 |
| [07 系统更新与软件管理](docs/07-system-updates.md) | 软件包更新、重启和版本检查 |
| [08 Nginx 网站部署基础](docs/08-nginx-basics.md) | 安装、站点配置和反向代理 |
| [09 服务器监控与资源检查](docs/09-monitoring-and-resource-checks.md) | CPU、内存、磁盘、网络和日志 |
| [10 备份与恢复规划](docs/10-backup-and-recovery.md) | 备份范围、策略和恢复验证 |
| [11 VPS 常见故障排查](docs/11-troubleshooting.md) | SSH、网站、磁盘和网络问题 |
| [12 VPS 基础安全清单](docs/12-server-security-checklist.md) | 最小权限、密钥、更新和审计 |

## 新手部署路线

```text
确认业务需求与配置
        |
        v
购买并获取 VPS 登录信息
        |
        v
首次 SSH 登录
        |
        v
更新系统并创建普通管理用户
        |
        v
配置 SSH 密钥与防火墙
        |
        v
部署 Nginx / 网站 / 应用
        |
        v
设置监控、备份与恢复流程
```

实际执行顺序应结合服务商控制台、系统发行版和业务环境调整。修改 SSH 或防火墙前，务必确认有可用的控制台救援入口，避免把自己锁在服务器外。

## 示例目录

`examples/` 提供基础命令示例：

- `server-info.sh`：查看系统、CPU、内存和磁盘信息；
- `disk-usage.sh`：查看磁盘使用情况；
- `nginx-site.conf`：Nginx 示例站点配置；
- `ufw-basic.sh`：UFW 基础规则示例（执行前必须修改并确认 SSH 端口）；
- `backup-example.sh`：使用 rsync 的目录备份示例（需要自行配置目标路径）；\n- `linux-baseline-audit.sh`：只读生成 Linux VPS 基础状态报告，不修改系统配置。

示例不会自动替你判断业务端口，也不会自动执行。请先阅读、修改并在测试环境验证。

## 常见问题

### VPS 和 VPN 是一回事吗？

不是。VPS 是虚拟专用服务器，提供可管理的计算资源；VPN 是一种虚拟专用网络技术或服务。两者解决的问题不同。

### CPU 核数越多越好吗？

不一定。应结合应用类型、并发量、计算需求和预算评估。轻量网站与高并发数据库的资源需求差异很大。

### 带宽和流量有什么区别？

带宽通常描述单位时间内的数据传输能力；流量通常描述一段时间内累计传输的数据量。套餐可能按固定带宽、流量额度或两者组合计费，需查看服务商规则。

### 购买 VPS 后是否可以直接上线网站？

通常还需要完成系统更新、账号权限、SSH、安全组或防火墙、Web 服务、域名解析、TLS 证书、备份和监控等工作。

## 相关技术项目

本手册聚焦 VPS 与 Linux 运维。代理网络基础和客户端配置可参考：

- [住宅代理 IP 技术知识库](https://github.com/IPDEEP/residential-proxy-technical-guide)：住宅 IP、ASN、ISP、IP 类型识别与网络诊断。
- [代理 IP 配置工具包](https://github.com/IPDEEP/proxy-configuration-toolkit)：HTTP、HTTPS、SOCKS5、Windows、macOS、Linux 配置与测试。

## IPDEEP 相关资源

- [IPDEEP 中文官网](https://www.ipdeep.cn/?extendid=zXY2LS&utm_source=github&utm_medium=referral&utm_campaign=vps_deployment_handbook&utm_content=readme)
- [IPDEEP VPS 页面](https://www.ipdeep.cn/vps?extendid=zXY2LS&utm_source=github&utm_medium=referral&utm_campaign=vps_deployment_handbook&utm_content=readme)
- [IPDEEP 代理配置资源](https://www.ipdeep.cn/integrations?extendid=zXY2LS&utm_source=github&utm_medium=referral&utm_campaign=vps_deployment_handbook&utm_content=readme)

以上链接来自项目 URL 登记资料。正式发布前应检查页面可访问性、跳转和内容匹配情况。VPS 的价格、地区、配置和可用性以官网当前页面及实际购买界面为准。

## 安全与合规说明

仅在拥有管理权限或获得明确授权的服务器上执行操作。遵守所在地法律法规、服务商条款及业务涉及的隐私和数据保护要求。不要将 SSH 私钥、密码、令牌、客户数据或真实服务器敏感信息提交到公开仓库。

## 参与贡献

欢迎提交可复现的命令示例、发行版差异说明和故障排查案例。提交前请阅读 [贡献指南](CONTRIBUTING.md)。

## 版本

当前版本：**v1.0.0（中文优先版）**  
更新记录见 [CHANGELOG.md](CHANGELOG.md)。
