---
title: HTTP 协议
---

# HTTP 协议

HTTP（HyperText Transfer Protocol，超文本传输协议）是应用层协议，用于在 Web 浏览器和 Web 服务器之间传输数据。

## HTTP 报文结构

HTTP 报文分为请求报文和响应报文，都由三部分组成：

### 请求报文

```
请求行      // 方法、URL、版本
请求头部    // Header 字段
空行
请求体      // Body（可选）
```

### 响应报文

```
响应行      // 版本、状态码、状态描述
响应头部    // Header 字段
空行
响应体      // Body（可选）
```

## 请求行

请求行格式：`方法 URL 版本`

```
GET /index.html HTTP/1.1
```

### HTTP 方法

| 方法 | 说明 | 是否包含 Body |
|------|------|---------------|
| GET | 获取资源 | 否 |
| POST | 提交数据 | 是 |
| PUT | 更新资源 | 是 |
| DELETE | 删除资源 | 否 |
| HEAD | 获取响应头 | 否 |
| OPTIONS | 获取支持的方法 | 否 |
| PATCH | 部分更新 | 是 |

## 响应行

响应行格式：`版本 状态码 状态描述`

```
HTTP/1.1 200 OK
```

## 状态码

HTTP 状态码分为五类：

### 1xx 信息性状态码

| 状态码 | 说明 |
|--------|------|
| 100 | Continue，继续发送请求体 |
| 101 | Switching Protocols，协议切换 |

### 2xx 成功状态码

| 状态码 | 说明 |
|--------|------|
| 200 | OK，请求成功 |
| 201 | Created，资源创建成功 |
| 204 | No Content，成功但无响应体 |

### 3xx 重定向状态码

| 状态码 | 说明 |
|--------|------|
| 301 | Moved Permanently，永久重定向 |
| 302 | Found，临时重定向 |
| 304 | Not Modified，资源未修改（缓存有效） |

### 4xx 客户端错误状态码

| 状态码 | 说明 |
|--------|------|
| 400 | Bad Request，请求格式错误 |
| 401 | Unauthorized，未授权（需要认证） |
| 403 | Forbidden，禁止访问 |
| 404 | Not Found，资源不存在 |
| 405 | Method Not Allowed，方法不被允许 |
| 408 | Request Timeout，请求超时 |
| 429 | Too Many Requests，请求过多 |

### 5xx 服务器错误状态码

| 状态码 | 说明 |
|--------|------|
| 500 | Internal Server Error，服务器内部错误 |
| 502 | Bad Gateway，网关错误 |
| 503 | Service Unavailable，服务不可用 |
| 504 | Gateway Timeout，网关超时 |

## 常见请求头

| Header | 说明 | 示例 |
|--------|------|------|
| Host | 目标主机 | `Host: www.example.com` |
| User-Agent | 客户端信息 | `User-Agent: Mozilla/5.0` |
| Accept | 可接受的响应类型 | `Accept: text/html` |
| Accept-Encoding | 可接受的编码方式 | `Accept-Encoding: gzip` |
| Content-Type | 请求体类型 | `Content-Type: application/json` |
| Content-Length | 请求体长度 | `Content-Length: 1024` |
| Authorization | 认证信息 | `Authorization: Bearer token` |
| Cookie | Cookie 信息 | `Cookie: session=abc123` |
| Connection | 连接控制 | `Connection: keep-alive` |

## 常见响应头

| Header | 说明 | 示例 |
|--------|------|------|
| Content-Type | 响应体类型 | `Content-Type: application/json` |
| Content-Length | 响应体长度 | `Content-Length: 2048` |
| Content-Encoding | 响应体编码 | `Content-Encoding: gzip` |
| Location | 重定向地址 | `Location: /new-url` |
| Set-Cookie | 设置 Cookie | `Set-Cookie: session=xyz` |
| Cache-Control | 缓存控制 | `Cache-Control: max-age=3600` |
| ETag | 资源版本标识 | `ETag: "abc123"` |
| Last-Modified | 最后修改时间 | `Last-Modified: Wed, 21 Oct 2015` |

## HTTP 版本

### HTTP/1.0

- 每次请求都需要建立新连接
- 连接完成后立即断开

### HTTP/1.1

- 默认持久连接（Keep-Alive）
- 支持管道化（Pipelining）
- 支持分块传输编码
- 新增 Host 头（支持虚拟主机）

### HTTP/2

- 二进制分帧
- 多路复用（一个连接并行多个请求）
- 头部压缩（HPACK）
- 服务器推送

### HTTP/3

- 基于 QUIC 协议（UDP）
- 更快的连接建立
- 更好的移动端支持
- 无队头阻塞

## HTTPS

HTTPS = HTTP + TLS/SSL

- 加密传输，防止窃听
- 身份认证，防止冒充
- 数据完整性，防止篡改

## 相关概念

### Cookie

服务器通过 `Set-Cookie` 响应头设置，客户端通过 `Cookie` 请求头发送。

### Session

服务器端存储的用户状态，通常通过 Cookie 中的 Session ID 关联。

### 缓存

通过 `Cache-Control`、`ETag`、`Last-Modified` 等头部控制缓存策略。

### CORS

跨域资源共享，通过 `Access-Control-Allow-Origin` 等头部控制跨域访问。