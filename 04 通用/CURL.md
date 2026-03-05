以下是 `curl` 命令的常见用法总结，按场景分类：

---

## 基础下载

```bash
# 下载文件到当前目录（保留原文件名）
curl -O https://example.com/file.zip

# 下载并指定文件名
curl -o myfile.zip https://example.com/file.zip

# 跟随重定向（很多URL需要这个）
curl -L -O https://example.com/file.zip

# 断点续传（下载中断后恢复）
curl -C - -O https://example.com/large-file.zip
```

---

## 请求方法与数据

```bash
# GET 请求（默认）
curl https://api.example.com/users

# POST 请求
curl -X POST https://api.example.com/users

# POST JSON 数据
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"name":"john","age":30}' \
  https://api.example.com/users

# POST 表单数据
curl -X POST \
  -d "name=john&age=30" \
  https://api.example.com/users

# POST 文件内容
curl -X POST \
  -d @data.json \
  https://api.example.com/users
```

---

## Headers 与认证

```bash
# 添加自定义 Header
curl -H "Authorization: Bearer token123" \
     -H "Accept: application/json" \
     https://api.example.com/data

# Basic 认证
curl -u username:password https://api.example.com/protected

# 只输密码（会提示输入）
curl -u username https://api.example.com/protected

# 使用 .netrc 文件存储凭证
curl --netrc https://api.example.com/protected
```

---

## 输出控制

```bash
# 静默模式（不显示进度条）
curl -s https://api.example.com/data

# 静默但显示错误
curl -sS https://api.example.com/data

# 只显示 HTTP 响应头
curl -I https://example.com

# 显示请求和响应的详细信息（调试神器）
curl -v https://example.com

# 将响应头和主体一起输出
curl -i https://example.com
```

---

## 高级下载

```bash
# 限速下载（每秒100KB）
curl --limit-rate 100K -O https://example.com/file.zip

# 下载多个文件
curl -O https://example.com/file1.zip \
     -O https://example.com/file2.zip

# 使用通配符序列下载
curl -O https://example.com/file[1-10].jpg

# 下载到指定目录
curl -o /path/to/dir/file.zip https://example.com/file.zip

# 配合管道直接使用（不保存文件）
curl -s https://example.com/data.json | jq '.items'
```

---

## 代理与网络

```bash
# 使用 HTTP 代理
curl -x http://proxy.example.com:8080 https://target.com

# 使用 SOCKS5 代理
curl --socks5 proxy.example.com:1080 https://target.com

# 忽略 SSL 证书验证（测试用，不安全）
curl -k https://self-signed.badssl.com

# 指定解析的 IP（绕过 DNS）
curl --resolve example.com:443:93.184.216.34 https://example.com
```

---

## Cookie 与会话

```bash
# 发送 Cookie
curl -b "sessionid=abc123; user=john" https://example.com

# 从文件读取 Cookie
curl -b cookies.txt https://example.com

# 保存 Cookie 到文件
curl -c cookies.txt https://example.com/login

# 同时读取和保存（维持会话）
curl -b cookies.txt -c cookies.txt https://example.com/profile
```

---

## 常用组合示例

```bash
# 下载 GitHub Release 文件（跟随重定向）
curl -L -o app.tar.gz \
  https://github.com/user/repo/releases/download/v1.0/app.tar.gz

# 测试 API 并格式化 JSON 输出
curl -s https://api.github.com/users/octocat | jq

# 上传文件（multipart/form-data）
curl -F "file=@photo.jpg" \
     -F "description=My photo" \
     https://api.example.com/upload

# 下载需要登录的文件（先登录保存 cookie，再下载）
curl -c cookies.txt -d "user=admin&pass=123" https://site.com/login
curl -b cookies.txt -O https://site.com/private/file.zip
```

---

## 常用选项速查表

| 选项 | 说明 |
|------|------|
| `-O` | 保留远程文件名 |
| `-o <file>` | 指定输出文件名 |
| `-L` | 跟随重定向 |
| `-C -` | 断点续传 |
| `-s` | 静默模式 |
| `-v` | 详细模式（调试） |
| `-I` | 只取响应头 |
| `-H` | 添加 Header |
| `-d` | POST 数据 |
| `-X` | 指定请求方法 |
| `-u` | 用户认证 |
| `-b` | 发送 Cookie |
| `-c` | 保存 Cookie |
| `-x` | 使用代理 |
| `-k` | 忽略 SSL 验证 |

需要针对某个具体场景（比如配合你的 PyTorch 模型下载、或者与 Hugging Face API 交互）展开说明吗？