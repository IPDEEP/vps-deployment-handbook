# 05｜Linux 用户管理与 SSH 密钥认证

合理的用户权限和 SSH 密钥管理是服务器基础安全的重要部分。

## 1. 为什么不建议日常使用 root？

root 拥有系统最高权限。日常操作若误执行命令，影响范围可能很大。更稳妥的方式是创建普通管理用户，并在需要时通过 sudo 提升权限。

## 2. 创建普通用户

Debian / Ubuntu 常见示例：

```bash
sudo adduser deploy
sudo usermod -aG sudo deploy
```

部分发行版使用 `wheel` 组管理 sudo 权限，具体应查阅发行版文档。

## 3. 生成 SSH 密钥

在本地计算机执行：

```bash
ssh-keygen -t ed25519 -C "your-device"
```

私钥保留在本地，公钥用于配置到服务器。不要把私钥发送给他人或提交到仓库。

## 4. 配置公钥

可以使用 `ssh-copy-id`（若本机有该工具）：

```bash
ssh-copy-id deploy@203.0.113.10
```

也可以在服务器用户的 `~/.ssh/authorized_keys` 中添加公钥。注意目录和文件权限应符合 OpenSSH 要求。

## 5. 测试密钥登录

```bash
ssh -i ~/.ssh/id_ed25519 deploy@203.0.113.10
```

先确认新用户和密钥登录成功，再考虑调整密码认证或 root 登录策略。

## 6. 修改 SSH 配置前的安全步骤

1. 保持当前 SSH 会话不要关闭；
2. 确认新用户有 sudo 权限；
3. 确认密钥登录成功；
4. 检查 SSH 配置语法；
5. 重新加载或重启 SSH 服务；
6. 从另一个终端测试新连接；
7. 确认成功后再结束旧会话。

SSH 服务名称可能是 `ssh` 或 `sshd`，随发行版而异。

## 7. 私钥保护

- 私钥文件应设置适当权限；
- 为私钥设置口令；
- 使用 SSH Agent 或受控密钥管理工具；
- 私钥泄露后立即更换并移除旧公钥；
- 不要把密钥放入公开仓库、截图或工单。

## 相关文档

- [SSH 远程连接](04-ssh-remote-access.md)
- [VPS 基础安全清单](12-server-security-checklist.md)
