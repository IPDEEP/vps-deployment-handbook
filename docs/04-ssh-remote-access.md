# 04｜SSH 是什么？如何远程连接 VPS？

SSH（Secure Shell）是一种用于远程登录和执行命令的加密协议。Linux VPS 通常通过 SSH 管理。

## 1. 连接前需要准备

- 服务器公网 IP 或主机名；
- SSH 端口（默认通常为 22，但服务商或管理员可能修改）；
- 登录用户名；
- 密码或 SSH 私钥；
- 本地网络允许访问该端口。

请通过服务商控制台或管理员获取准确参数。

## 2. Linux / macOS 终端连接

```bash
ssh username@203.0.113.10
```

如使用非默认端口：

```bash
ssh -p 2222 username@203.0.113.10
```

`203.0.113.10` 是文档示例地址，不是真实服务器地址。

## 3. Windows 连接

新版 Windows 通常可通过 PowerShell 使用 OpenSSH 客户端：

```powershell
ssh username@203.0.113.10
```

也可以使用支持 SSH 的终端或图形化客户端。使用第三方工具时，应从官方渠道下载。

## 4. 首次连接主机指纹

首次连接时，SSH 可能提示确认主机指纹。应通过服务商控制台或可信渠道核对指纹后再确认，不要在无法确认身份时盲目接受。

## 5. 常见错误

| 错误 | 可能原因 |
|---|---|
| Connection timed out | 网络、路由、防火墙或安全组阻断 |
| Connection refused | SSH 服务未监听该端口或端口错误 |
| Permission denied | 用户名、密码、密钥或认证策略错误 |
| Host key verification failed | 主机密钥变化或本地记录不一致 |

## 6. 安全建议

- 使用独立管理账户；
- 优先考虑 SSH 密钥认证；
- 妥善保管私钥；
- 不要把私钥上传到 GitHub；
- 不要在公开场合展示登录凭据；
- 修改 SSH 配置前，保留当前会话并准备控制台救援方式。

## 相关文档

- [Linux 用户与 SSH 密钥](05-linux-users-and-ssh-keys.md)
- [防火墙基础配置](06-firewall-basics.md)
