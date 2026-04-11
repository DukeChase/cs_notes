以下是 `wget` 命令的常见用法总结，按场景分类：

---

## 基础下载

```bash
# 下载文件到当前目录（保留原文件名）
wget https://example.com/file.zip

# 下载并指定文件名
wget -O myfile.zip https://example.com/file.zip

# 下载到指定目录
wget -P /path/to/dir https://example.com/file.zip

# 断点续传（下载中断后恢复）
wget -c https://example.com/large-file.zip

# 后台下载（输出日志到 wget-log）
wget -b https://example.com/large-file.zip
```

---

## 批量下载

```bash
# 从文件读取 URL 列表批量下载
wget -i urls.txt

# 下载多个文件
wget https://example.com/file1.zip https://example.com/file2.zip

# 下载整个网站（镜像）
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent https://example.com

# 简化的网站镜像
wget -m -k -K -E https://example.com

# 下载指定目录下的所有文件（递归）
wget -r -np -nH --cut-dirs=2 https://example.com/path/to/files/
```

---

## 限速与重试

```bash
# 限速下载（每秒 200KB）
wget --limit-rate=200k https://example.com/file.zip

# 重试次数（默认 20 次）
wget -t 5 https://example.com/file.zip

# 无限重试
wget -t 0 https://example.com/file.zip

# 重试间隔（秒）
wget --wait=10 --tries=5 https://example.com/file.zip

# 随机等待（避免被封）
wget --random-wait -r https://example.com/path/
```

---

## 认证与 Headers

```bash
# Basic 认证
wget --user=username --password=passwd https://example.com/protected

# 从密码文件读取（避免密码暴露在历史记录）
wget --user=username --password-file=pass.txt https://example.com/protected

# 添加自定义 Header
wget --header="Authorization: Bearer token123" https://api.example.com/data

# 添加多个 Header
wget --header="Accept: application/json" \
     --header="X-API-Key: abc123" \
     https://api.example.com/data

# 发送 POST 请求
wget --post-data='{"key":"value"}' \
     --header="Content-Type: application/json" \
     https://api.example.com/endpoint

# POST 文件内容
wget --post-file=data.json https://api.example.com/endpoint
```

---

## 代理与网络

```bash
# 使用 HTTP 代理
wget -e use_proxy=yes -e http_proxy=proxy.example.com:8080 https://target.com

# 通过环境变量设置代理（推荐）
export http_proxy=http://proxy.example.com:8080
export https_proxy=http://proxy.example.com:8080
wget https://target.com

# 忽略 SSL 证书验证（测试用）
wget --no-check-certificate https://self-signed.badssl.com

# 指定 DNS 解析
wget --header="Host: example.com" http://93.184.216.34/file.zip

# 设置超时（秒）
wget --timeout=30 https://example.com/file.zip
```

---

## 输出控制

```bash
# 静默模式（不显示进度）
wget -q https://example.com/file.zip

# 显示详细输出
wget -v https://example.com/file.zip

# 只显示错误信息
wget -nv https://example.com/file.zip

# 输出到标准输出（配合管道使用）
wget -qO- https://example.com/data.json | jq '.'

# 不覆盖已存在的文件
wget -nc https://example.com/file.zip

# 强制覆盖已存在的文件
wget --overwrite https://example.com/file.zip
```

---

## 递归下载选项

```bash
# 递归下载深度
wget -r -l 2 https://example.com

# 只下载指定扩展名的文件
wget -r -A pdf,zip,tar.gz https://example.com/docs/

# 排除特定文件类型
wget -r -R html,css,js https://example.com/

# 不跟随父目录链接
wget -r -np https://example.com/path/

# 转换链接为本地链接（离线浏览）
wget -r -k https://example.com/

# 下载页面必需资源（CSS、图片等）
wget -p https://example.com/page.html
```

---

## Cookie 与会话

```bash
# 发送 Cookie
wget --header="Cookie: sessionid=abc123" https://example.com/protected

# 从文件加载 Cookie
wget --load-cookies=cookies.txt https://example.com/protected

# 保存 Cookie 到文件
wget --save-cookies=cookies.txt --keep-session-cookies https://example.com/login

# 使用 Netscape 格式的 Cookie 文件
wget --load-cookies=cookies.txt --save-cookies=new_cookies.txt https://example.com/
```

---

## 常用组合示例

```bash
# 下载 GitHub Release 文件
wget https://github.com/user/repo/releases/download/v1.0/app.tar.gz

# 下载并解压（管道）
wget -qO- https://example.com/file.tar.gz | tar xz

# 下载需要登录的资源
wget --user=admin --password=secret https://example.com/private/file.zip

# 限速后台下载大文件
wget -b --limit-rate=500k https://example.com/large-file.iso

# 镜像网站用于离线浏览
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent --no-host-directories https://example.com

# 递归下载特定类型文件
wget -r -l 1 -A ".pdf,.doc,.docx" https://example.com/documents/

# 增量下载（只下载比本地新的文件）
wget -N -r https://example.com/files/

# 下载并保持时间戳
wget --timestamping https://example.com/file.zip

# 批量下载并编号
wget -r -l 1 -nd -A jpg https://example.com/images/
```

---

## 常用选项速查表

| 选项 | 说明 |
|------|------|
| `-O <file>` | 指定输出文件名 |
| `-P <dir>` | 下载到指定目录 |
| `-c` | 断点续传 |
| `-b` | 后台下载 |
| `-q` | 静默模式 |
| `-v` | 详细模式 |
| `-i <file>` | 从文件读取 URL |
| `-r` | 递归下载 |
| `-l <depth>` | 递归深度 |
| `-A <list>` | 接受的文件类型 |
| `-R <list>` | 拒绝的文件类型 |
| `-np` | 不跟随父目录 |
| `-k` | 转换链接 |
| `-m` | 镜像网站 |
| `-t <num>` | 重试次数 |
| `--limit-rate` | 限速 |
| `--user` | 用户名认证 |
| `--password` | 密码认证 |
| `--no-check-certificate` | 忽略 SSL 验证 |
| `-nc` | 不覆盖已存在文件 |
| `-N` | 时间戳模式（只下载更新的） |

---

## wget vs curl 对比

| 功能 | wget | curl |
|------|------|------|
| 下载文件 | ✅ 更简洁 | 需要 `-O` |
| 上传文件 | ❌ | ✅ `-F`, `-T` |
| 递归下载/镜像 | ✅ 原生支持 | ❌ |
| 断点续传 | `-c` | `-C -` |
| 后台下载 | ✅ `-b` | ❌ |
| API 测试 | 有限 | ✅ 更强大 |
| 协议支持 | HTTP/HTTPS/FTP | 更多协议 |

**总结**：`wget` 适合下载和镜像网站，`curl` 适合 API 交互和数据传输。