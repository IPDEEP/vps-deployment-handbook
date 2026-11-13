# 06｜Linux VPS 防火墙基础配置

防火墙用于控制进入或离开服务器的网络连接。配置错误可能导致 SSH 断开或网站无法访问。

## 1. 配置前先确认端口

常见端口示例：

| 服务 | 常见端口 |
|---|---:|
| SSH | 22（可能被管理员修改） |
| HTTP | 80 |
| HTTPS | 443 |

实际端口以服务器配置为准。不要假设 SSH 一定使用 22。

## 2. UFW 示例（Ubuntu 常见）

先检查状态：

```bash
sudo ufw status verbose
```

如果 SSH 使用默认端口 22，规则示例：

```bash
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
```

如果 SSH 使用其他端口，例如 2222，应先允许实际端口：

```bash
sudo ufw allow 2222/tcp
```

确认管理连接正常后，再按需要启用 UFW：

```bash
sudo ufw enable
```

## 3. 非默认 SSH 端口的重要提醒

启用防火墙前，务必先允许当前 SSH 实际端口，并确认服务商控制台有救援入口。否则可能把自己锁在服务器外。

## 4. 查看和删除规则

```bash
sudo ufw status numbered
```

删除规则前确认编号和影响范围：

```bash
sudo ufw delete <规则编号>
```

上面的尖括号内容是占位符，不要原样执行。

## 5. 云平台安全组

部分 VPS 还存在服务商控制台中的安全组或云防火墙。系统内 UFW 允许连接，不代表云平台入口规则也允许；反之亦然。

应同时检查云平台规则和操作系统防火墙。

## 6. 最小开放原则

只开放业务实际需要的端口。数据库、管理面板和内部服务不要无必要地暴露到公网。

## 相关文档

- [SSH 远程连接](04-ssh-remote-access.md)
- [VPS 基础安全清单](12-server-security-checklist.md)
