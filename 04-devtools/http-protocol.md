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

## 长连接技术

传统的 HTTP 请求是短连接模式：客户端发起请求，服务器响应后立即断开连接。但在实时通信、推送通知等场景下，需要保持连接以实现双向或单向的持续数据传输。

### HTTP Keep-Alive

HTTP/1.1 默认启用持久连接（Keep-Alive），允许在单个 TCP 连接上发送多个请求和响应。

**特点**：

- 减少连接建立和断开的开销
- 降低延迟，提高性能
- 通过 `Connection: keep-alive` 头部控制

**配置参数**：

```http
Connection: keep-alive
Keep-Alive: timeout=5, max=100
```

- `timeout`：连接保持时间（秒）
- `max`：连接上最大请求数

**适用场景**：

- 网页加载多个资源（CSS、JS、图片）
- API 连续调用
- 减少服务器负载

**局限性**：

- 仍然是请求-响应模式，无法实现真正的实时推送
- 需要客户端主动发起请求
- 连接空闲时占用服务器资源

### WebSocket

WebSocket 是一种在单个 TCP 连接上进行全双工通信的协议，支持客户端和服务器之间实时双向数据传输。

**协议特点**：

- 基于 HTTP 协议升级（握手阶段使用 HTTP）
- 全双工通信（客户端和服务器都可主动发送消息）
- 低延迟、低开销（无 HTTP 头部开销）
- 保持连接状态，无需频繁建立连接
- 支持二进制和文本数据传输

**握手过程**：

客户端发起 HTTP 请求，请求升级协议：

```http
GET /chat HTTP/1.1
Host: example.com
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==
Sec-WebSocket-Version: 13
```

服务器响应确认升级：

```http
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=
```

- `101` 状态码表示协议切换成功
- `Sec-WebSocket-Accept` 是对客户端 Key 的签名验证

**数据帧格式**：

WebSocket 使用帧（Frame）传输数据，帧格式包括：

- FIN：是否为最后一帧
- RSV1-3：保留位
- Opcode：操作类型（文本、二进制、关闭、ping、pong）
- Mask：是否掩码
- Payload length：数据长度
- Masking-key：掩码密钥（客户端发送必须掩码）
- Payload data：实际数据

**连接生命周期**：

```javascript
// 客户端代码示例
const ws = new WebSocket('ws://example.com/chat');

// 连接打开
ws.onopen = function(event) {
  console.log('WebSocket 连接已建立');
  ws.send('Hello Server');
};

// 接收消息
ws.onmessage = function(event) {
  console.log('收到消息：', event.data);
};

// 连接关闭
ws.onclose = function(event) {
  console.log('WebSocket 连接已关闭');
};

// 错误处理
ws.onerror = function(error) {
  console.error('WebSocket 错误：', error);
};

// 主动关闭连接
ws.close();
```

**服务器实现示例（Node.js）**：

```javascript
const WebSocket = require('ws');

const wss = new WebSocket.Server({ port: 8080 });

wss.on('connection', function connection(ws) {
  console.log('新客户端连接');

  // 接收消息
  ws.on('message', function incoming(message) {
    console.log('收到消息：', message);
    
    // 广播给所有客户端
    wss.clients.forEach(function each(client) {
      if (client.readyState === WebSocket.OPEN) {
        client.send(message);
      }
    });
  });

  // 发送消息
  ws.send('欢迎连接 WebSocket 服务器');
});
```

**适用场景**：

- 实时聊天应用
- 在线协作工具（文档编辑、白板）
- 实时游戏
- 股票行情推送
- IoT 设备通信
- 视频会议

**优势**：

- 实时双向通信
- 低延迟、高性能
- 服务器可主动推送
- 支持大量并发连接

**劣势**：

- 需要服务器额外支持 WebSocket 协议
- 连接保持占用服务器资源
- 断线重连机制需要自行实现
- 跨域需要特殊配置

**心跳机制**：

WebSocket 连接可能因网络问题断开，需要心跳检测：

```javascript
// 客户端心跳
let heartbeatInterval;

function startHeartbeat() {
  heartbeatInterval = setInterval(() => {
    if (ws.readyState === WebSocket.OPEN) {
      ws.send(JSON.stringify({ type: 'ping' }));
    }
  }, 30000); // 每 30 秒发送一次
}

// 服务器响应 pong
ws.on('message', function incoming(message) {
  const data = JSON.parse(message);
  if (data.type === 'ping') {
    ws.send(JSON.stringify({ type: 'pong' }));
  }
});

// 客户端检测 pong
ws.on('message', function incoming(message) {
  const data = JSON.parse(message);
  if (data.type === 'pong') {
    // 心跳正常，重置超时计时器
    resetTimeout();
  }
});
```

### SSE（Server-Sent Events）

SSE 是一种服务器向客户端单向推送数据的技术，基于 HTTP 协议，服务器保持连接并持续发送事件流。

**协议特点**：

- 单向通信（仅服务器向客户端推送）
- 基于 HTTP 协议，无需协议升级
- 自动重连机制
- 数据格式简单（文本格式）
- 支持 EventSource API

**数据格式**：

SSE 使用文本格式传输事件流：

```http
Content-Type: text/event-stream
Cache-Control: no-cache
Connection: keep-alive

data: 第一条消息

data: 第二条消息

event: custom
data: 自定义事件消息

id: 123
event: message
data: 带有 ID 的消息
retry: 3000
```

字段说明：

- `data`：消息内容（可多行，每行以 `data:` 开头）
- `event`：事件类型（默认为 `message`）
- `id`：事件 ID（用于重连时指定最后接收的事件）
- `retry`：重连间隔（毫秒）

**客户端实现**：

```javascript
// 使用 EventSource API
const eventSource = new EventSource('/events');

// 监听默认 message 事件
eventSource.onmessage = function(event) {
  console.log('收到消息：', event.data);
};

// 监听自定义事件
eventSource.addEventListener('custom', function(event) {
  console.log('收到自定义事件：', event.data);
});

// 连接打开
eventSource.onopen = function(event) {
  console.log('SSE 连接已建立');
};

// 错误处理
eventSource.onerror = function(error) {
  console.error('SSE 错误：', error);
  // EventSource 会自动重连
};

// 关闭连接
eventSource.close();
```

**服务器实现示例（Node.js）**：

```javascript
const http = require('http');

http.createServer((req, res) => {
  if (req.url === '/events') {
    // 设置 SSE 响应头
    res.writeHead(200, {
      'Content-Type': 'text/event-stream',
      'Cache-Control': 'no-cache',
      'Connection': 'keep-alive'
    });

    // 定期发送消息
    let counter = 0;
    const interval = setInterval(() => {
      // 发送消息
      res.write(`data: 消息 ${counter}\n\n`);
      counter++;

      // 发送自定义事件
      if (counter % 5 === 0) {
        res.write(`event: custom\ndata: 自定义事件触发\n\n`);
      }

      // 发送带 ID 的消息
      if (counter % 10 === 0) {
        res.write(`id: ${counter}\ndata: 重要消息\n\n`);
      }
    }, 1000);

    // 客户端断开时清理
    req.on('close', () => {
      clearInterval(interval);
      res.end();
    });
  }
}).listen(8080);
```

**适用场景**：

- 实时通知推送
- 股票价格更新
- 新闻订阅
- 社交媒体动态
- 日志流监控
- 系统状态更新

**优势**：

- 实现简单，基于 HTTP
- 自动重连机制
- 跨域支持（CORS）
- 浏览器原生支持 EventSource API
- 轻量级，适合单向推送

**劣势**：

- 仅支持单向通信（服务器推送）
- 不支持二进制数据（仅文本）
- 连接数受浏览器限制（同源最多 6 个）
- IE 浏览器不支持（需要 polyfill）

**重连机制**：

EventSource 自动重连，可通过 `id` 和 `retry` 控制：

```javascript
// 服务器发送带 ID 的消息
res.write(`id: 100\ndata: 消息内容\n\n`);

// 客户端重连时发送 Last-Event-ID 头部
// EventSource 自动处理，服务器可据此推送缺失的消息

// 服务器指定重连间隔
res.write(`retry: 5000\ndata: 请在 5 秒后重连\n\n`);
```

### 长轮询（Long Polling）

长轮询是一种模拟实时通信的技术，客户端发起请求后，服务器保持请求直到有数据或超时才响应。

**工作原理**：

1. 客户端发起 HTTP 请求
2. 服务器不立即响应，等待数据或超时
3. 有数据时返回响应，或超时返回空响应
4. 客户端收到响应后立即发起下一次请求

**实现示例**：

客户端代码：

```javascript
function longPolling() {
  fetch('/poll')
    .then(response => response.json())
    .then(data => {
      if (data.message) {
        console.log('收到消息：', data.message);
      }
      // 立即发起下一次请求
      longPolling();
    })
    .catch(error => {
      console.error('长轮询错误：', error);
      // 延迟后重试
      setTimeout(longPolling, 5000);
    });
}

longPolling();
```

服务器代码（Node.js）：

```javascript
const pendingRequests = [];

app.get('/poll', (req, res) => {
  // 将请求加入待处理队列
  pendingRequests.push(res);

  // 设置超时（30 秒）
  const timeout = setTimeout(() => {
    // 从队列移除
    const index = pendingRequests.indexOf(res);
    if (index !== -1) {
      pendingRequests.splice(index, 1);
    }
    // 返回空响应
    res.json({ message: null });
  }, 30000);

  // 客户端断开时清理
  req.on('close', () => {
    clearTimeout(timeout);
    const index = pendingRequests.indexOf(res);
    if (index !== -1) {
      pendingRequests.splice(index, 1);
    }
  });
});

// 有消息时推送给所有待处理请求
function broadcastMessage(message) {
  pendingRequests.forEach(res => {
    res.json({ message: message });
  });
  pendingRequests.length = 0; // 清空队列
}
```

**适用场景**：

- 兼容性要求高（不支持 WebSocket/SSE 的环境）
- 简单的实时通知
- 低频率数据更新
- 旧系统改造

**优势**：

- 基于 HTTP，无需额外协议
- 兼容性好，所有浏览器支持
- 实现简单
- 跨域支持（CORS）

**劣势**：

- 频繁建立连接，开销大
- 延迟较高（不是真正的实时）
- 服务器资源占用（保持大量请求）
- 不适合高频数据更新

### 技术对比

| 特性 | HTTP Keep-Alive | WebSocket | SSE | 长轮询 |
|------|----------------|-----------|-----|--------|
| 通信方向 | 双向（请求-响应） | 全双工 | 单向（服务器推送） | 双向（请求-响应） |
| 协议 | HTTP | WebSocket（基于 HTTP 升级） | HTTP | HTTP |
| 实时性 | 低 | 高 | 高 | 中 |
| 延迟 | 高 | 低 | 低 | 中 |
| 连接开销 | 低 | 低 | 低 | 高 |
| 实现复杂度 | 低 | 中 | 低 | 低 |
| 浏览器支持 | 所有 | 现代浏览器 | 现代浏览器（IE 不支持） | 所有 |
| 自动重连 | 无 | 需自行实现 | 自动 | 需自行实现 |
| 数据格式 | 文本/二进制 | 文本/二进制 | 文本 | 文本/二进制 |
| 适用场景 | 资源加载、API 调用 | 实时聊天、游戏、协作 | 通知推送、状态更新 | 兼容性要求高、简单推送 |

### 选择建议

**WebSocket**：

- 需要双向实时通信
- 高频数据交互
- 游戏、聊天、协作工具
- 性能要求高

**SSE**：

- 仅需服务器推送
- 低频率更新
- 通知、订阅、监控
- 实现简单

**长轮询**：

- 兼容性要求高
- 简单推送场景
- 旧系统改造
- 不支持 WebSocket/SSE 的环境

**HTTP Keep-Alive**：

- 传统请求-响应模式
- 资源加载
- API 连续调用
- 不需要实时推送

### 实际应用示例

**实时聊天系统（WebSocket）**：

```javascript
// 客户端
const ws = new WebSocket('ws://chat.example.com');

ws.onopen = () => {
  ws.send(JSON.stringify({
    type: 'join',
    room: 'general',
    user: 'Alice'
  }));
};

ws.onmessage = (event) => {
  const data = JSON.parse(event.data);
  displayMessage(data.user, data.message);
};

// 发送消息
function sendMessage(text) {
  ws.send(JSON.stringify({
    type: 'message',
    text: text
  }));
}
```

**股票行情推送（SSE）**：

```javascript
// 客户端
const eventSource = new EventSource('/stocks');

eventSource.addEventListener('price', (event) => {
  const data = JSON.parse(event.data);
  updateStockPrice(data.symbol, data.price);
});

eventSource.addEventListener('alert', (event) => {
  const data = JSON.parse(event.data);
  showAlert(data.message);
});

// 服务器
app.get('/stocks', (req, res) => {
  res.writeHead(200, {
    'Content-Type': 'text/event-stream',
    'Cache-Control': 'no-cache'
  });

  // 定期推送股票价格
  setInterval(() => {
    const stocks = getStockPrices();
    stocks.forEach(stock => {
      res.write(`event: price\ndata: ${JSON.stringify(stock)}\n\n`);
    });
  }, 1000);
});
```

**系统监控（SSE）**：

```javascript
// 客户端监控服务器日志
const eventSource = new EventSource('/logs/stream');

eventSource.onmessage = (event) => {
  const log = JSON.parse(event.data);
  appendLog(log.timestamp, log.level, log.message);
};

// 服务器推送日志
app.get('/logs/stream', (req, res) => {
  res.writeHead(200, {
    'Content-Type': 'text/event-stream',
    'Cache-Control': 'no-cache'
  });

  // 监听日志事件并推送
  logEmitter.on('newLog', (log) => {
    res.write(`data: ${JSON.stringify(log)}\n\n`);
  });
});
```

### 安全考虑

**WebSocket 安全**：

- 使用 `wss://`（WebSocket Secure）加密连接
- 验证 Origin 头部防止跨站攻击
- 实现身份认证和授权
- 限制消息大小防止滥用
- 实现心跳检测防止僵尸连接

```javascript
// 服务器验证 Origin
wss.on('connection', (ws, req) => {
  const origin = req.headers.origin;
  if (!allowedOrigins.includes(origin)) {
    ws.close();
    return;
  }

  // 身份验证
  const token = req.headers['sec-websocket-protocol'];
  if (!validateToken(token)) {
    ws.close();
    return;
  }
});
```

**SSE 安全**：

- 使用 HTTPS 加密连接
- 实现身份认证
- 验证 CORS 配置
- 限制连接数防止滥用

```javascript
// SSE 身份认证
app.get('/events', authenticate, (req, res) => {
  res.writeHead(200, {
    'Content-Type': 'text/event-stream',
    'Cache-Control': 'no-cache'
  });

  // 推送数据...
});
```

### 性能优化

**WebSocket 优化**：

- 使用连接池管理连接
- 实现消息压缩
- 限制消息频率
- 使用二进制格式提高效率
- 实现断线重连和消息补发

**SSE 优化**：

- 使用多个 EventSource 连接不同事件类型
- 实现事件过滤减少不必要数据
- 合理设置重连间隔
- 使用 gzip 压缩文本数据

**服务器资源管理**：

- 设置合理的连接超时
- 实现连接心跳检测
- 限制最大连接数
- 使用负载均衡分散连接
- 监控连接状态和资源占用