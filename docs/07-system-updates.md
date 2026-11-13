# 07｜Linux 系统更新与软件包管理

系统更新可以修复已知漏洞、缺陷和兼容性问题，但生产环境需要控制更新窗口和回滚风险。

## 1. 确认发行版

```bash
cat /etc/os-release
```

先确认发行版和版本，再使用对应包管理器。

## 2. Debian / Ubuntu

刷新软件包索引：

```bash
sudo apt update
```

查看可升级软件包：

```bash
apt list --upgradable
```

执行升级：

```bash
sudo apt upgrade
```

## 3. RHEL 系发行版

常见 DNF 系统可使用：

```bash
sudo dnf check-update
sudo dnf upgrade
```

具体命令应以发行版版本和官方文档为准。

## 4. 更新前检查

- 确认磁盘空间充足；
- 查看关键服务和依赖；
- 确认备份可用；
- 安排维护窗口；
- 记录当前软件版本；
- 确认是否需要重启。

## 5. 检查服务状态

```bash
systemctl --failed
systemctl status nginx
```

将 `nginx` 替换为实际服务名称。

## 6. 自动更新是否适合生产环境？

自动安全更新有助于及时修补漏洞，但应用、内核和数据库升级可能影响兼容性。应根据业务等级、测试环境、维护窗口和回滚方案制定策略。

## 相关文档

- [Linux VPS 初始配置](03-linux-initial-setup.md)
- [备份与恢复规划](10-backup-and-recovery.md)
