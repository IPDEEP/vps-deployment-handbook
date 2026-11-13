# 03｜Linux VPS 首次登录后的基础配置

新购 VPS 通常需要完成系统信息确认、软件更新、时区设置、用户管理和安全配置。不同发行版的命令可能不同。

## 1. 查看系统信息

```bash
cat /etc/os-release
uname -a
hostnamectl
```

确认发行版、内核和主机名，后续安装软件时应参考对应发行版文档。

## 2. 更新软件包

Debian / Ubuntu：

```bash
sudo apt update
sudo apt upgrade
```

RHEL 系发行版（具体命令随版本和包管理器变化）：

```bash
sudo dnf check-update
sudo dnf upgrade
```

更新前应确认磁盘空间、维护窗口和业务兼容性。生产环境不要未经测试就自动升级所有核心组件。

## 3. 查看资源

```bash
nproc
free -h
df -h
lsblk
```

这些命令分别用于查看 CPU 逻辑核心数、内存、文件系统使用情况和块设备。

## 4. 设置主机名

查看当前主机名：

```bash
hostnamectl
```

如需修改：

```bash
sudo hostnamectl set-hostname server-01
```

请使用符合团队命名规则的名称，并确认相关监控和自动化配置不会因此受到影响。

## 5. 设置时区

查看当前时间：

```bash
timedatectl
```

查看可用时区：

```bash
timedatectl list-timezones
```

示例设置为 UTC：

```bash
sudo timedatectl set-timezone Etc/UTC
```

如果业务需要其他时区，请按实际要求设置。日志和跨地区系统通常使用 UTC 更便于统一分析。

## 6. 重启前检查

- 是否有未保存的配置；
- SSH 是否仍可用；
- 是否有正在运行的任务；
- 是否需要维护窗口；
- 服务是否配置为开机启动；
- 是否有服务商控制台或救援方式。

## 注意

不要直接复制不理解的初始化脚本到生产服务器。先检查命令作用、权限范围和发行版兼容性。
