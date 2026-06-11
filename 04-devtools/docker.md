# docker

- [Docker 常用命令 与 `Dockerfile`](https://xiets.blog.csdn.net/article/details/122866186)
- [Docker 环境清理的常用方法有哪些？](https://www.zhihu.com/tardis/bd/ans/2998335721)
- [Dockerfile reference](https://docs.docker.com/reference/dockerfile/)

# 架构

`dockerfile` ->`image`  -> `container`
镜像
容器
仓库 hub

docker 从入门到实践

- <https://vuepress.mirror.docker-practice.com/>
- <https://yeasy.gitbook.io/docker_practice/container/run>
- <https://github.com/yeasy/docker_practice/blob/master/SUMMARY.md>
- `docker run -it --rm -p 4000:80 ccr.ccs.tencentyun.com/dockerpracticesig/docker_practice`

- `docker pull ccr.ccs.tencentyun.com/dockerpracticesig/docker_practice:latest`

# docker

`docker --help`

# docker run

`docker run`

```text
Usage:  docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

Create and run a new container from an image

Aliases:
  docker container run, docker run

Options:
      --add-host list                  Add a custom host-to-IP mapping
                                       (host:ip)
      --annotation map                 Add an annotation to the container
                                       (passed through to the OCI
                                       runtime) (default map[])
  -a, --attach list                    Attach to STDIN, STDOUT or STDERR
      --blkio-weight uint16            Block IO (relative weight),
                                       between 10 and 1000, or 0 to
                                       disable (default 0)
      --blkio-weight-device list       Block IO weight (relative device
                                       weight) (default [])
      --cap-add list                   Add Linux capabilities
      --cap-drop list                  Drop Linux capabilities
      --cgroup-parent string           Optional parent cgroup for the
                                       container
      --cgroupns string                Cgroup namespace to use
                                       (host|private)
                                       'host':    Run the container in
                                       the Docker host's cgroup namespace
                                       'private': Run the container in
                                       its own private cgroup namespace
                                       '':        Use the cgroup
                                       namespace as configured by the
                                                  default-cgroupns-mode
                                       option on the daemon (default)
      --cidfile string                 Write the container ID to the file
      --cpu-period int                 Limit CPU CFS (Completely Fair
                                       Scheduler) period
      --cpu-quota int                  Limit CPU CFS (Completely Fair
                                       Scheduler) quota
      --cpu-rt-period int              Limit CPU real-time period in
                                       microseconds
      --cpu-rt-runtime int             Limit CPU real-time runtime in
                                       microseconds
  -c, --cpu-shares int                 CPU shares (relative weight)
      --cpus decimal                   Number of CPUs
      --cpuset-cpus string             CPUs in which to allow execution
                                       (0-3, 0,1)
      --cpuset-mems string             MEMs in which to allow execution
                                       (0-3, 0,1)
  -d, --detach                         Run container in background and
                                       print container ID
      --detach-keys string             Override the key sequence for
                                       detaching a container
      --device list                    Add a host device to the container
      --device-cgroup-rule list        Add a rule to the cgroup allowed
                                       devices list
      --device-read-bps list           Limit read rate (bytes per second)
                                       from a device (default [])
      --device-read-iops list          Limit read rate (IO per second)
                                       from a device (default [])
      --device-write-bps list          Limit write rate (bytes per
                                       second) to a device (default [])
      --device-write-iops list         Limit write rate (IO per second)
                                       to a device (default [])
      --disable-content-trust          Skip image verification (default true)
      --dns list                       Set custom DNS servers
      --dns-option list                Set DNS options
      --dns-search list                Set custom DNS search domains
      --domainname string              Container NIS domain name
      --entrypoint string              Overwrite the default ENTRYPOINT
                                       of the image
  -e, --env list                       Set environment variables
      --env-file list                  Read in a file of environment variables
      --expose list                    Expose a port or a range of ports
      --gpus gpu-request               GPU devices to add to the
                                       container ('all' to pass all GPUs)
      --group-add list                 Add additional groups to join
      --health-cmd string              Command to run to check health
      --health-interval duration       Time between running the check
                                       (ms|s|m|h) (default 0s)
      --health-retries int             Consecutive failures needed to
                                       report unhealthy
      --health-start-period duration   Start period for the container to
                                       initialize before starting
                                       health-retries countdown
                                       (ms|s|m|h) (default 0s)
      --health-timeout duration        Maximum time to allow one check to
                                       run (ms|s|m|h) (default 0s)
      --help                           Print usage
  -h, --hostname string                Container host name
      --init                           Run an init inside the container
                                       that forwards signals and reaps
                                       processes
  -i, --interactive                    Keep STDIN open even if not attached
      --ip string                      IPv4 address (e.g., 172.30.100.104)
      --ip6 string                     IPv6 address (e.g., 2001:db8::33)
      --ipc string                     IPC mode to use
      --isolation string               Container isolation technology
      --kernel-memory bytes            Kernel memory limit
  -l, --label list                     Set meta data on a container
      --label-file list                Read in a line delimited file of labels
      --link list                      Add link to another container
      --link-local-ip list             Container IPv4/IPv6 link-local
                                       addresses
      --log-driver string              Logging driver for the container
      --log-opt list                   Log driver options
      --mac-address string             Container MAC address (e.g.,
                                       92:d0:c6:0a:29:33)
  -m, --memory bytes                   Memory limit
      --memory-reservation bytes       Memory soft limit
      --memory-swap bytes              Swap limit equal to memory plus
                                       swap: '-1' to enable unlimited swap
      --memory-swappiness int          Tune container memory swappiness
                                       (0 to 100) (default -1)
      --mount mount                    Attach a filesystem mount to the
                                       container
      --name string                    Assign a name to the container
      --network network                Connect a container to a network
      --network-alias list             Add network-scoped alias for the
                                       container
      --no-healthcheck                 Disable any container-specified
                                       HEALTHCHECK
      --oom-kill-disable               Disable OOM Killer
      --oom-score-adj int              Tune host's OOM preferences (-1000
                                       to 1000)
      --pid string                     PID namespace to use
      --pids-limit int                 Tune container pids limit (set -1
                                       for unlimited)
      --platform string                Set platform if server is
                                       multi-platform capable
      --privileged                     Give extended privileges to this
                                       container
  -p, --publish list                   Publish a container's port(s) to
                                       the host
  -P, --publish-all                    Publish all exposed ports to
                                       random ports
      --pull string                    Pull image before running
                                       ("always", "missing", "never")
                                       (default "missing")
  -q, --quiet                          Suppress the pull output
      --read-only                      Mount the container's root
                                       filesystem as read only
      --restart string                 Restart policy to apply when a
                                       container exits (default "no")
      --rm                             Automatically remove the container
                                       when it exits
      --runtime string                 Runtime to use for this container
      --security-opt list              Security Options
      --shm-size bytes                 Size of /dev/shm
      --sig-proxy                      Proxy received signals to the
                                       process (default true)
      --stop-signal string             Signal to stop the container
      --stop-timeout int               Timeout (in seconds) to stop a
                                       container
      --storage-opt list               Storage driver options for the
                                       container
      --sysctl map                     Sysctl options (default map[])
      --tmpfs list                     Mount a tmpfs directory
  -t, --tty                            Allocate a pseudo-TTY
      --ulimit ulimit                  Ulimit options (default [])
  -u, --user string                    Username or UID (format:
                                       <name|uid>[:<group|gid>])
      --userns string                  User namespace to use
      --uts string                     UTS namespace to use
  -v, --volume list                    Bind mount a volume
      --volume-driver string           Optional volume driver for the
                                       container
      --volumes-from list              Mount volumes from the specified
                                       container(s)
  -w, --workdir string                 Working directory inside the container
```

```bash
docker run -itd --rm --name container_name --env-file .env\ 
-v host_path:path\
-v host_paht:path\
-p 80:80\
--network bridge\
image:tag
```

# docker build

`docker build` 命令用于从 Dockerfile 构建镜像。

## 基本语法

```bash
docker build [OPTIONS] PATH | URL | -
```

## 常用选项

| 选项 | 说明 | 示例 |
|------|------|------|
| `-t, --tag` | 镜像名称和标签 | `-t myapp:1.0` |
| `-f, --file` | 指定 Dockerfile 路径 | `-f Dockerfile.prod .` |
| `--build-arg` | 传递构建参数 | `--build-arg VERSION=2.0` |
| `--no-cache` | 不使用构建缓存 | `--no-cache` |
| `--platform` | 指定目标平台 | `--platform=linux/amd64` |
| `--target` | 构建到指定阶段（多阶段构建） | `--target builder` |
| `--progress` | 构建进度显示方式 | `--progress=plain` |
| `-q, --quiet` | 静默模式，只输出镜像 ID | `-q` |
| `--rm` | 构建成功后删除中间容器（默认 true） | `--rm=false` |

## 常用示例

```bash
# 基本构建（当前目录的 Dockerfile）
docker build -t myapp:1.0 .

# 指定 Dockerfile 路径
docker build -t myapp:1.0 -f docker/Dockerfile.prod .

# 传递构建参数
docker build -t myapp:1.0 --build-arg VERSION=2.0 .

# 不使用缓存（全量重建）
docker build --no-cache -t myapp:1.0 .

# 跨平台构建
docker build --platform=linux/amd64,linux/arm64 -t myapp:1.0 .

# 多阶段构建：只构建到指定阶段
docker build --target builder -t myapp:builder .

# 查看 详细构建日志
docker build --progress=plain -t myapp:1.0 .

# 从 Git 仓库构建
docker build -t myapp:1.0 https://github.com/user/repo.git#main

# 从 stdin 读取 Dockerfile（无构建上下文）
docker build -t myapp:1.0 - <<EOF
FROM alpine
RUN echo "hello"
EOF
```

## 构建缓存与优化

```dockerfile
# ❌ 错误：每次代码变更都重新安装依赖
COPY . /app
RUN pip install -r requirements.txt

# ✅ 正确：先复制依赖文件，利用缓存
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app
```

**缓存失效规则**：
- 指令本身变更 → 该层及后续所有层缓存失效
- COPY/ADD 的源文件变更 → 该层及后续缓存失效
- 尽量将变化频率低的指令放在前面

## 多阶段构建

```dockerfile
# 阶段 1：构建
FROM golang:1.21 AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp

# 阶段 2：运行
FROM alpine:3.19
COPY --from=builder /app/myapp /usr/local/bin/myapp
CMD ["myapp"]
```

```bash
# 只构建到 builder 阶段（调试用）
docker build --target builder -t myapp:builder .

# 正常构建最终镜像
docker build -t myapp:1.0 .
```

## .dockerignore

在构建上下文根目录创建 `.dockerignore` 文件，排除不需要的文件：

```text
node_modules
.git
dist
*.md
.env
.DS_Store
__pycache__
*.pyc
.venv
```

**作用**：减小构建上下文大小，加速构建，避免敏感信息泄露。

## docker builder prune

清理构建缓存：

```bash
# 清理所有构建缓存
docker builder prune

# 清理超过 24 小时的缓存
docker builder prune --filter "until=24h"

# 强制清理，不确认
docker builder prune -f
```

# docker pull

```bash
# 基本拉取
docker pull nginx:latest

# 指定平台拉取
docker pull --platform=linux/arm64 nginx:latest
docker pull --platform=linux/amd64 nginx:latest

# 从私有仓库拉取
docker pull [Docker Registry 地址[:端口号]/]仓库名[:标签]
docker pull registry.example.com/myapp:1.0

# 拉取所有标签
docker pull --all-tags nginx

# 静默模式
docker pull -q nginx:latest
```

### 镜像加速配置

国内拉取 Docker Hub 镜像较慢，可配置镜像加速器。配置文件路径：

- **macOS**：`~/.docker/daemon.json`（Docker Desktop → Settings → Docker Engine）
- **Linux**：`/etc/docker/daemon.json`

配置示例见 [registry](#registry) 章节。

# docker push

```bash
# 推送镜像到仓库
docker push myapp:1.0

# 推送到私有仓库
docker tag myapp:1.0 registry.example.com/myapp:1.0
docker push registry.example.com/myapp:1.0

# 推送所有标签
docker push --all-tags myapp
```

### 登录仓库

```bash
# 登录 Docker Hub
docker login

# 登录私有仓库
docker login registry.example.com

# 登出
docker logout registry.example.com
```

# docker image

```bash
# 列出本地镜像
docker image ls                    # 等同于 docker images
docker image ls -a                 # 显示所有镜像（包括中间层）
docker image ls -q                 # 只显示镜像 ID
docker image ls --format "{{.Repository}}:{{.Tag}}"  # 自定义输出格式
docker image ls --filter "dangling=true"             # 只显示悬空镜像（无标签）

# 删除镜像
docker image rm <镜像名或ID>        # 等同于 docker rmi
docker image rm $(docker image ls -q)  # 删除所有镜像（危险）
docker image rm -f <ID>            # 强制删除（即使有容器在使用）

# 构建镜像
docker image build -t myapp:1.0 .  # 等同于 docker build

# 查看镜像详情
docker image inspect <镜像名或ID>

# 查看镜像构建历史
docker image history <镜像名或ID>

# 清理悬空镜像
docker image prune                 # 删除所有无标签的镜像
docker image prune -a              # 删除所有未被容器使用的镜像

# 标记镜像
docker image tag source:tag target:tag   # 等同于 docker tag

# 推送镜像
docker image push <镜像名:标签>

# 保存/加载镜像
docker image save -o myapp.tar myapp:1.0   # 导出镜像为 tar 文件
docker image load -i myapp.tar             # 从 tar 文件导入镜像

# 查看镜像占用空间
docker image ls --format "{{.Repository}}:{{.Tag}}\t{{.Size}}"
```

### 常用组合命令

```bash
# 批量删除悬空镜像
docker image prune -f

# 删除所有未被任何容器引用的镜像
docker image prune -a -f

# 查找并删除特定仓库的镜像
docker image ls --filter "reference=myrepo/*" -q | xargs docker image rm

# 导出多个镜像
docker image save -o images.tar image1:tag image2:tag

# 查看镜像层信息
docker image inspect --format='{{json .RootFS.Layers}}' myapp:1.0
```

# `dockerfile`

- `Dockerfie` 官方文档：<https://docs.docker.com/engine/reference/builder/>

- `Dockerfile` 最佳实践文档：<https://docs.docker.com/develop/develop-images/dockerfile_best-practices/>

- `Docker` 官方镜像 `Dockerfile`：<https://github.com/docker-library/docs>

使用`dockerfile`定制镜像

```dockerfile
FROM nginx
RUN echo '<h1>Hello, Docker!</h1>' > /usr/share/nginx/html/index.html
```

## 不同架构的镜像

`FROM  --platform=linux/amd64`
`FROM  --platform=linux/arm64`

## `ADD`

## `COPY`

如果源路径为文件夹，复制的时候不是直接复制该文件夹，而是将文件夹中的内容复制到目标路径

## `RUN`

- shell 格式  `RUN <命令>`
- exec格式`RUN ["可执行文件", "参数1", "参数2"]`

## `CMD`

`CMD` 指令的格式和 `RUN` 相似，也是两种格式：

- shell 格式  `RUN <命令>`
- exec格式`RUN ["可执行文件", "参数1", "参数2"]`

在指令格式上，一般推荐使用 `exec` 格式，这类格式在解析时会被解析为 JSON 数组，因此一定要使用双引号 `"`，而不要使用单引号。

## ENTRYPOINT

`ENTRYPOINT` 指定容器启动时**必定执行**的主命令，作为容器的"入口程序"。

### 格式

```dockerfile
# exec 格式（推荐）
ENTRYPOINT ["executable", "param1", "param2"]

# shell 格式（不推荐，会屏蔽 CMD 和 docker run 参数）
ENTRYPOINT command param1 param2
```

### 特点

- 每个 Dockerfile 中只能有一个 `ENTRYPOINT`（多个时只有最后一个生效）
- `docker run` 传入的参数会**追加**到 ENTRYPOINT 后，而不是覆盖
- 可以用 `--entrypoint` 参数强制覆盖

### 示例

```dockerfile
FROM ubuntu
ENTRYPOINT ["echo"]
CMD ["Hello Docker"]
```

```bash
# 默认执行 ENTRYPOINT + CMD
docker run myimage          # 输出: Hello Docker

# 参数追加到 ENTRYPOINT 后
docker run myimage "World"  # 输出: World（CMD 被替换）

# 强制覆盖 ENTRYPOINT
docker run --entrypoint ls myimage /   # 执行 ls /
```

---

## CMD 与 ENTRYPOINT 的区别

| 特性 | CMD | ENTRYPOINT |
|------|-----|------------|
| **作用** | 默认启动命令 | 必定执行的主命令 |
| **docker run 参数** | **完全覆盖** CMD | **追加**到 ENTRYPOINT 后 |
| **覆盖方式** | 直接传命令 | 需用 `--entrypoint` |
| **组合使用** | 作为 ENTRYPOINT 的默认参数 | 作为主命令，CMD 提供默认参数 |
| **推荐场景** | 可变参数、可选命令 | 固定主命令、类似"可执行程序" |

### 组合使用模式（最佳实践）

```dockerfile
# 模式 1：ENTRYPOINT + CMD（推荐）
FROM ubuntu
ENTRYPOINT ["curl"]        # 主命令固定
CMD ["https://example.com"] # 默认参数可变

docker run myimage                          # curl https://example.com
docker run myimage https://google.com       # curl https://google.com
docker run myimage -I https://example.com   # curl -I https://example.com
```

```dockerfile
# 模式 2：只用 CMD（灵活场景）
FROM ubuntu
CMD ["nginx", "-g", "daemon off;"]

docker run myimage          # 启动 nginx
docker run myimage bash     # 改为执行 bash（调试）
```

```dockerfile
# 模式 3：只用 ENTRYPOINT（固定命令）
FROM ubuntu
ENTRYPOINT ["python", "app.py"]

docker run myimage          # python app.py
docker run myimage --debug  # python app.py --debug
```

### Shell 格式 vs Exec 格式

| 格式 | CMD | ENTRYPOINT | 特点 |
|------|-----|------------|------|
| **exec 格式** | `CMD ["cmd", "args"]` | `ENTRYPOINT ["cmd", "args"]` | 推荐，信号能正确传递 |
| **shell 格式** | `CMD cmd args` | `ENTRYPOINT cmd args` | 不推荐，会启动 shell 子进程 |

**exec 格式的优势**：
- 容器能正确接收 `SIGTERM`、`SIGINT` 等信号（优雅停止）
- PID 1 就是你的程序，而不是 shell

**shell 格式的问题**：
```dockerfile
# shell 格式：信号无法传递
ENTRYPOINT python app.py
# 容器停止时，python 进程收不到 SIGTERM，会被强制杀死
```

### 实战场景选择

| 场景 | 推荐方案 | 示例 |
|------|----------|------|
| **Web 服务** | ENTRYPOINT + CMD | `ENTRYPOINT ["nginx"]` + `CMD ["-g", "daemon off;"]` |
| **脚本工具** | ENTRYPOINT | `ENTRYPOINT ["./entrypoint.sh"]` |
| **调试友好** | 只用 CMD | `CMD ["java", "-jar", "app.jar"]` |
| **参数可变** | ENTRYPOINT + CMD | `ENTRYPOINT ["curl"]` + `CMD ["url"]` |

---

## ENV

格式有两种：

- `ENV <key> <value>`
- `ENV <key1>=<value1> <key2>=<value2>...`

这个指令很简单，就是设置环境变量而已，无论是后面的其它指令，如 `RUN`，还是运行时的应用，都可以直接使用这里定义的环境变量。

```dockerfile
ENV VERSION=1.0 DEBUG=on \
    NAME="Happy Feet"
```

这个例子中演示了如何换行，以及对含有空格的值用双引号括起来的办法，这和 Shell 下的行为是一致的。

## ARG

格式：`ARG <参数名>[=<默认值>]`

构建参数和 `ENV` 的效果一样，都是设置环境变量。所不同的是，`ARG` 所设置的构建环境的环境变量，在将来容器运行时是不会存在这些环境变量的。但是不要因此就使用 `ARG` 保存密码之类的信息，因为 `docker history` 还是可以看到所有值的。

`Dockerfile` 中的 `ARG` 指令是定义参数名称，以及定义其默认值。该默认值可以在构建命令 `docker build` 中用 `--build-arg <参数名>=<值>` 来覆盖。

灵活的使用 `ARG` 指令，能够在不修改 Dockerfile 的情况下，构建出不同的镜像。

## VOLUME

`VOLUME` 指令用于在 Dockerfile 中声明挂载点，创建匿名卷。

### 语法格式

```dockerfile
VOLUME ["<路径1>", "<路径2>"...]
VOLUME <路径>
```

### 示例

```dockerfile
# JSON 数组格式（推荐）
VOLUME ["/data", "/logs"]

# 字符串格式
VOLUME /data
```

### 作用与特点

1. **声明挂载点**：
   - 在镜像中声明哪些目录应该被挂载为卷
   - 容器运行时，这些目录会自动创建匿名卷

2. **防止数据丢失**：
   - 容器删除后，匿名卷中的数据不会丢失
   - 适合需要持久化的数据目录（如数据库、日志等）

3. **防止镜像膨胀**：
   - 挂载目录的数据不会写入镜像层
   - 减少镜像体积，提高构建效率

4. **数据共享**：
   - 其他容器可以通过 `--volumes-from` 共享这些卷
   - 实现容器间数据传递

### 使用场景

```dockerfile
# MySQL 镜像示例
FROM mysql:latest
VOLUME /var/lib/mysql

# Nginx 镜像示例
FROM nginx:latest
VOLUME /var/log/nginx

# 应用镜像示例
FROM openjdk:11
VOLUME ["/app/data", "/app/logs"]
```

### 注意事项

1. **匿名卷的创建**：
   - `VOLUME` 指令创建的是匿名卷
   - Docker 会自动分配随机名称
   - 不适合生产环境（难以管理）

2. **运行时覆盖**：
   - 运行容器时可以用 `-v` 或 `--mount` 覆盖 `VOLUME` 指定的挂载点
   - 推荐使用命名卷覆盖匿名卷

   ```bash
   # Dockerfile 中声明：VOLUME /data
   # 运行时覆盖为命名卷
   docker run -d --name app -v app-data:/data myapp
   ```

3. **数据初始化**：
   - `VOLUME` 指令后的目录在构建时如果有数据，会被复制到卷中
   - 但如果运行时挂载了宿主机目录，宿主机目录的内容会覆盖容器内的数据

   ```dockerfile
   # 错误示例：在 VOLUME 后写入数据
   VOLUME /data
   RUN echo "test" > /data/test.txt  # 数据不会保留在镜像中
   
   # 正确示例：在 VOLUME 前写入数据
   RUN echo "test" > /data/test.txt
   VOLUME /data  # 数据会被复制到卷中
   ```

4. **不能在 VOLUME 后修改数据**：
   - `VOLUME` 指令之后的 `RUN`、`COPY` 等指令对挂载目录的修改不会生效
   - 因为这些修改发生在挂载之后，数据会被挂载点覆盖

### 最佳实践

1. **声明而非创建**：
   - `VOLUME` 指令主要用于声明挂载点
   - 实际挂载应在运行时使用 `-v` 或 `--mount` 指定命名卷

2. **避免在 VOLUME 后修改数据**：
   ```dockerfile
   # 推荐：先准备数据，再声明 VOLUME
   RUN mkdir -p /app/data && echo "init" > /app/data/init.txt
   VOLUME /app/data
   
   # 不推荐：在 VOLUME 后修改数据
   VOLUME /app/data
   RUN echo "test" > /app/data/test.txt  # 不会生效
   ```

3. **生产环境使用命名卷**：
   ```bash
   # Dockerfile 中声明 VOLUME
   VOLUME /data
   
   # 运行时使用命名卷覆盖
   docker run -d --name app -v app-data:/data myapp
   ```

4. **多路径使用 JSON 数组格式**：
   ```dockerfile
   # 推荐：JSON 数组格式
   VOLUME ["/data", "/logs", "/config"]
   
   # 不推荐：多行字符串格式
   VOLUME /data
   VOLUME /logs
   VOLUME /config
   ```

### VOLUME 与运行时挂载的关系

| 场景 | Dockerfile VOLUME | 运行时挂载 | 结果 |
|------|-------------------|------------|------|
| 无运行时挂载 | `VOLUME /data` | 无 | 创建匿名卷 |
| 使用命名卷 | `VOLUME /data` | `-v app-data:/data` | 使用命名卷 |
| 使用绑定挂载 | `VOLUME /data` | `-v /host/path:/data` | 使用绑定挂载 |
| 多容器共享 | `VOLUME /data` | `--volumes-from container1` | 共享 container1 的卷 |

### 示例：完整的 Dockerfile 使用 VOLUME

```dockerfile
# 基础镜像
FROM openjdk:11-jre-slim

# 设置工作目录
WORKDIR /app

# 复制应用文件
COPY target/app.jar /app/app.jar
COPY config /app/config

# 创建数据目录并初始化
RUN mkdir -p /app/data /app/logs \
    && echo "Application initialized" > /app/data/init.txt

# 声明挂载点
VOLUME ["/app/data", "/app/logs"]

# 设置环境变量
ENV APP_ENV=production

# 启动应用
CMD ["java", "-jar", "app.jar"]
```

```bash
# 运行容器，使用命名卷覆盖匿名卷
docker run -d --name myapp \
  -v app-data:/app/data \
  -v app-logs:/app/logs \
  myapp:latest

# 查看卷信息
docker volume inspect app-data
docker volume inspect app-logs
```

### 总结

- `VOLUME` 指令用于声明挂载点，创建匿名卷
- 主要作用是防止数据丢失和镜像膨胀
- 生产环境应使用命名卷覆盖匿名卷
- 注意在 `VOLUME` 指令前完成数据初始化
- 推荐使用 JSON 数组格式声明多个挂载点

## LABEL

[参考](https://github.com/opencontainers/image-spec/blob/master/annotations.md)

在 Dockerfile 中，`LABEL` 命令用于为镜像添加元数据（metadata）。这些元数据以键值对的形式存储，可以用来描述镜像的*用途、作者信息、版本号*等。

### **作用**

1. **提供镜像信息**：
   - `LABEL` 可以用来标注镜像的作者、版本、描述等信息。
   - 例如：

     ```dockerfile
     LABEL maintainer="your_email@example.com"
     LABEL version="1.0"
     LABEL description="This is a sample Docker image for my application."
     ```

2. **帮助管理和分类镜像**：
   - 使用 `LABEL` 添加的元数据可以通过工具（如 `docker inspect`）查看，便于开发者和运维人员对镜像进行分类和管理。

3. **支持自动化工具**：
   - 某些 CI/CD 工具或容器编排工具（如 Kubernetes）可以根据 `LABEL` 的内容来执行特定的操作。例如，根据标签筛选镜像或分配资源。

4. **标准化镜像信息**：
   - 在团队协作中，通过约定使用统一的 `LABEL` 键值对，可以让镜像更加标准化，便于维护。

---

### **语法**

```dockerfile
LABEL <key>=<value> [<key>=<value> ...]
```

- `key` 和 `value` 是键值对，必须用双引号括起来（如果包含空格或其他特殊字符）。
- 可以在一行中定义多个键值对，也可以分多行定义。

#### 示例

```dockerfile
# 单行定义多个标签
LABEL maintainer="team@example.com" version="1.0" environment="production"

# 多行定义标签
LABEL maintainer="team@example.com" \
      version="1.0" \
      environment="production"
```

---

### **查看 LABEL 信息**

使用以下命令可以查看镜像中的 `LABEL` 元数据：

```bash
docker inspect <image_name>
```

输出是一个 JSON 格式的文件，`LABEL` 的信息会出现在 `"Labels"` 字段中。例如：

```json
"Labels": {
    "maintainer": "team@example.com",
    "version": "1.0",
    "environment": "production"
}
```

---

### **最佳实践**

1. **保持一致性**：
   - 在团队中约定统一的 `LABEL` 键命名规则。例如，使用 `org.label-schema.*` 或 `com.example.*` 作为前缀。
   - 示例：

     ```dockerfile
     LABEL org.label-schema.version="1.0"
     LABEL org.label-schema.description="Sample application"
     ```

2. **避免敏感信息**：
   - 不要在 `LABEL` 中存储敏感信息（如密码、密钥等），因为这些信息可以通过 `docker inspect` 轻松查看。

3. **结合其他工具使用**：
   - 配合容器编排工具（如 Kubernetes）或镜像扫描工具，利用 `LABEL` 实现更高效的镜像管理。

---

### **常见用法**

1. **标注作者**：

   ```dockerfile
   LABEL maintainer="your_email@example.com"
   ```

2. **标注版本号**：

   ```dockerfile
   LABEL version="2.3.1"
   ```

3. **标注构建时间**：

   ```dockerfile
   LABEL build-date="2025-04-21"
   ```

4. **标注镜像用途**：

   ```dockerfile
   LABEL purpose="web-application"
   ```

---

总结来说，`LABEL` 是一个非常轻量但功能强大的命令，可以为镜像提供丰富的元数据，有助于镜像的管理和维护。

# 操作容器

## docker run

`docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`

```bash
# 交互式运行（进入容器）
docker run -it --rm ubuntu:latest /bin/bash

# 后台运行
docker run -d --name myapp -p 8080:80 nginx:latest

# 带环境变量
docker run -d --name myapp \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=mydb \
  mysql:latest

# 使用 env 文件
docker run -d --name myapp --env-file .env myapp:1.0

# 指定重启策略
docker run -d --name myapp --restart=always nginx:latest
# restart 策略：no | on-failure[:max-retries] | always | unless-stopped

# 限制资源
docker run -d --name myapp \
  --cpus=2 \
  --memory=512m \
  --memory-swap=1g \
  nginx:latest

# 使用 GPU
docker run -d --name myapp --gpus all pytorch/pytorch:latest
docker run -d --name myapp --gpus '"device=0,1"' pytorch/pytorch:latest
```

- `-it`：`-i` 保持 STDIN 打开，`-t` 分配伪终端
- `--rm`：容器退出后自动删除
- `-d`：后台运行（detached 模式）
- `--name`：指定容器名称
- `-p`：端口映射（`宿主机端口:容器端口`）
- `-v`：挂载卷
- `-e`：设置环境变量
- `--restart`：重启策略
- `--network`：指定网络模式

## docker ps

列出容器信息：

```bash
# 列出运行中的容器
docker ps

# 列出所有容器（包括已停止的）
docker ps -a

# 只显示容器 ID
docker ps -q

# 显示最近创建的 N 个容器
docker ps -n 5

# 按状态过滤
docker ps --filter "status=running"
docker ps --filter "status=exited"
docker ps --filter "status=paused"

# 按名称过滤
docker ps --filter "name=myapp"

# 按镜像过滤
docker ps --filter "ancestor=nginx:latest"

# 自定义输出格式
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"
docker ps --format "{{.Names}}: {{.Status}}"

# 显示容器文件大小
docker ps -s
```

### 状态说明

| 状态 | 含义 |
|------|------|
| `created` | 已创建但未启动 |
| `running` | 正在运行 |
| `paused` | 已暂停 |
| `restarting` | 重启中 |
| `removing` | 迁移中 |
| `exited` | 已停止 |
| `dead` | 无法启动（通常因资源不足） |

## docker start / stop / restart

```bash
# 启动已停止的容器
docker start <容器名或ID>
docker start -ai <容器名或ID>   # 交互式启动（附加到终端）

# 停止运行中的容器（发送 SIGTERM，超时后 SIGKILL）
docker stop <容器名或ID>
docker stop -t 30 <容器名或ID>  # 指定超时时间（秒）

# 重启容器
docker restart <容器名或ID>

# 暂停/恢复容器（冻结/解冻进程）
docker pause <容器名或ID>
docker unpause <容器名或ID>

# 强制终止容器（直接发送 SIGKILL）
docker kill <容器名或ID>
```

## docker exec

在运行中的容器内执行命令：

```bash
# 进入容器的交互式终端
docker exec -it <容器名或ID> /bin/bash
docker exec -it <容器名或ID> /bin/sh    # Alpine 等精简镜像无 bash

# 在容器内执行单条命令
docker exec <容器名或ID> ls /app
docker exec <容器名或ID> cat /etc/os-release

# 以指定用户执行
docker exec -u root <容器名或ID> apt-get update

# 设置环境变量
docker exec -e DEBUG=1 <容器名或ID> python app.py

# 指定工作目录
docker exec -w /app <容器名或ID> ls

# 后台执行
docker exec -d <容器名或ID> python background_task.py
```

> **注意**：`docker exec` 是在运行中的容器内新开一个进程，不会影响容器的主进程。

## docker attach

附加到容器的主进程（PID 1）：

```bash
# 附加到容器
docker attach <容器名或ID>
```

> **⚠️ 注意**：`docker attach` 连接的是容器主进程的 STDIN/STDOUT/STDERR，从 attach 的终端退出（`Ctrl+C` 或 `exit`）会导致**容器停止**。如需在容器内执行命令而不影响容器运行，请使用 `docker exec`。
>
> 安全退出 attach（不停止容器）：`Ctrl+P` → `Ctrl+Q`

## docker logs

查看容器日志：

```bash
# 查看全部日志
docker logs <容器名或ID>

# 实时跟踪日志（类似 tail -f）
docker logs -f <容器名或ID>

# 显示最近 N 行日志
docker logs --tail 100 <容器名或ID>

# 显示时间戳
docker logs -t <容器名或ID>

# 按时间范围过滤
docker logs --since "2025-01-01T00:00:00" <容器名或ID>
docker logs --since 30m <容器名或ID>            # 最近 30 分钟
docker logs --until "2025-01-01T12:00:00" <容器名或ID>

# 组合使用
docker logs -f --tail 50 <容器名或ID>   # 实时跟踪最后 50 行
```

### 日志驱动

```bash
# 查看当前日志驱动
docker inspect --format '{{.HostConfig.LogConfig.Type}}' <容器名或ID>

# 运行时指定日志驱动
docker run -d --log-driver=json-file \
  --log-opt max-size=10m \
  --log-opt max-file=3 \
  nginx:latest

# 常用日志驱动
# json-file（默认）：JSON 格式，支持日志轮转
# local：专为 Docker 优化，默认启用轮转
# syslog：发送到 syslog
# none：禁用日志
```

## docker cp

在容器和宿主机之间复制文件/文件夹：

```bash
# 从容器复制到宿主机
docker cp <容器名或ID>:/app/config.yml ./config.yml
docker cp <容器名或ID>:/app/logs/ ./logs/

# 从宿主机复制到容器
docker cp ./config.yml <容器名或ID>:/app/config.yml
docker cp ./data/ <容器名或ID>:/app/data/

# 复制并保留权限
docker cp -a <容器名或ID>:/app/data/ ./data/

# 查看容器内文件（不复制）
docker exec <容器名或ID> ls -la /app/
docker exec <容器名或ID> cat /app/config.yml
```

> **注意**：`docker cp` 不要求容器正在运行，已停止的容器也可以复制文件。

## docker rm

删除容器：

```bash
# 删除已停止的容器
docker rm <容器名或ID>

# 强制删除运行中的容器（先停止再删除）
docker rm -f <容器名或ID>

# 删除容器时同时删除匿名卷
docker rm -v <容器名或ID>

# 批量删除所有已停止的容器
docker container prune
docker rm $(docker ps -a -q -f "status=exited")

# 删除所有容器（危险）
docker rm -f $(docker ps -aq)
```

## docker inspect

查看容器/镜像详细信息：

```bash
# 查看容器详情
docker inspect <容器名或ID>

# 查看镜像详情
docker inspect <镜像名:标签>

# 提取特定字段
docker inspect --format '{{.NetworkSettings.IPAddress}}' <容器名或ID>
docker inspect --format '{{.State.Status}}' <容器名或ID>
docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <容器名或ID>
docker inspect --format '{{.Config.Env}}' <容器名或ID>
docker inspect --format '{{json .State}}' <容器名或ID> | python3 -m json.tool

# 查看端口映射
docker port <容器名或ID>
```

## docker top / stats

监控容器资源使用：

```bash
# 查看容器内进程
docker top <容器名或ID>

# 实时资源使用统计
docker stats
docker stats <容器名或ID>
docker stats --no-stream   # 只显示一次，不持续刷新
docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"
```

## docker commit

从容器创建新镜像：

```bash
# 基于容器当前状态创建镜像
docker commit <容器名或ID> myapp:1.0

# 附带提交信息
docker commit -m "添加配置文件" -a "author" <容器名或ID> myapp:1.0

# 修改启动命令
docker commit --change 'CMD ["python", "app.py"]' <容器名或ID> myapp:1.0
```

> **注意**：`docker commit` 适合快速调试，**不建议**用于生产镜像构建。应优先使用 Dockerfile。

## docker diff

查看容器文件系统的变更：

```bash
docker diff <容器名或ID>
# A = 新增文件
# C = 修改文件
# D = 删除文件
```

## docker export / import

导出/导入容器文件系统：

```bash
# 导出容器为 tar 文件
docker export <容器名或ID> -o myapp.tar

# 从 tar 文件导入为镜像
docker import myapp.tar myapp:1.0

# 从 URL 导入
docker import http://example.com/myapp.tar myapp:1.0
```

> **与 `docker save/load` 的区别**：`export/import` 操作容器快照（丢失历史和层信息），`save/load` 操作镜像（保留完整层信息）。

# Repository

# Volume

Docker Volume（数据卷）是 Docker 容器数据持久化的核心机制，用于在容器和宿主机之间共享数据，或在不同容器之间共享数据。

## Volume 的作用

1. **数据持久化**：容器删除后数据不会丢失
2. **数据共享**：多个容器可以共享同一个 Volume
3. **数据隔离**：将应用数据与容器文件系统分离
4. **性能优化**：Volume 的读写性能优于绑定挂载
5. **跨平台兼容**：Volume 在不同操作系统上行为一致

## Volume 的类型

### 1. 命名卷（Named Volume）

由 Docker 管理的卷，存储在 Docker 的特定目录中（通常在 `/var/lib/docker/volumes/`）。

```bash
# 创建命名卷
docker volume create my-vol

# 查看卷详情
docker volume inspect my-vol

# 列出所有卷
docker volume ls

# 使用命名卷运行容器
docker run -d --name myapp -v my-vol:/app/data nginx
```

**特点**：
- Docker 自动管理存储位置
- 易于备份和迁移
- 可以在多个容器间共享
- 适合生产环境使用

### 2. 匿名卷（Anonymous Volume）

没有指定名称的卷，Docker 会自动分配一个随机名称。

```bash
# 创建匿名卷（Dockerfile 中 VOLUME 指令）
VOLUME /app/data

# 运行时创建匿名卷
docker run -d --name myapp -v /app/data nginx

# 查看匿名卷
docker volume ls
# 输出类似：DRIVER    VOLUME NAME
#          local     1b2e3f4g5h6i7j8k9l0m
```

**特点**：
- 名称随机生成，难以管理
- 容器删除时默认不会删除匿名卷（除非使用 `--rm`）
- 不适合生产环境

### 3. 绑定挂载（Bind Mount）

将宿主机的特定目录或文件直接挂载到容器中。

```bash
# 绑定挂载宿主机目录
docker run -d --name myapp \
  -v /host/path:/container/path \
  nginx

# 绑定挂载单个文件
docker run -d --name myapp \
  -v /host/config.yml:/app/config.yml \
  nginx

# 指定读写权限
docker run -d --name myapp \
  -v /host/path:/container/path:ro \
  nginx  # ro 表示只读（read-only）
```

**特点**：
- 完全控制挂载路径
- 适合开发环境（代码同步）
- 跨平台路径差异需要注意
- 性能略低于命名卷

## Volume 管理命令

### 创建卷

```bash
# 创建命名卷
docker volume create my-vol

# 创建卷并指定驱动
docker volume create --driver local my-vol

# 创建卷并指定选项（如挂载 NFS）
docker volume create --driver local \
  --opt type=nfs \
  --opt o=addr=192.168.1.1,rw \
  --opt device=:/export/data \
  nfs-vol
```

### 查看卷

```bash
# 列出所有卷
docker volume ls

# 查看卷详情
docker volume inspect my-vol

# 查看卷的使用情况（哪些容器在使用）
docker ps --filter volume=my-vol
```

### 删除卷

```bash
# 删除单个卷（必须没有被容器使用）
docker volume rm my-vol

# 删除所有未使用的卷
docker volume prune

# 删除所有卷（包括正在使用的，危险操作）
docker volume prune --force
```

### 备份与恢复

```bash
# 备份卷数据到 tar 文件
docker run --rm \
  -v my-vol:/data \
  -v $(pwd):/backup \
  alpine \
  tar cvf /backup/my-vol-backup.tar /data

# 从 tar 文件恢复数据到卷
docker run --rm \
  -v my-vol:/data \
  -v $(pwd):/backup \
  alpine \
  tar xvf /backup/my-vol-backup.tar -C /
```

## Volume 挂载方式

### `-v` 参数（简写格式）

```bash
# 格式：-v <source>:<target>:<options>
docker run -d --name myapp \
  -v my-vol:/app/data \
  nginx

# 绑定挂载
docker run -d --name myapp \
  -v /host/path:/app/data:ro \
  nginx

# 多个卷
docker run -d --name myapp \
  -v vol1:/app/data \
  -v vol2:/app/logs \
  nginx
```

**选项说明**：
- `ro`：只读（read-only）
- `rw`：读写（read-write，默认）
- `z`：SELinux 重新标记私有标签
- `Z`：SELinux 重新标记共享标签

### `--mount` 参数（详细格式）

```bash
# 命名卷挂载
docker run -d --name myapp \
  --mount type=volume,source=my-vol,target=/app/data \
  nginx

# 绑定挂载
docker run -d --name myapp \
  --mount type=bind,source=/host/path,target=/app/data,readonly \
  nginx

# tmpfs 挂载（临时文件系统，内存中）
docker run -d --name myapp \
  --mount type=tmpfs,target=/app/tmp \
  nginx
```

**参数说明**：
- `type`：挂载类型（`volume`、`bind`、`tmpfs`）
- `source`：源路径或卷名（可简写为 `src`）
- `target`：容器内路径（可简写为 `dst` 或 `destination`）
- `readonly`：只读挂载
- `volume-opt`：卷驱动选项

### `-v` 与 `--mount` 的区别

| 特性 | `-v` | `--mount` |
|------|------|-----------|
| 语法简洁性 | 简洁 | 详细 |
| 错误提示 | 不明确 | 明确 |
| SELinux 支持 | 支持（z/Z） | 不支持 |
| 卷不存在时 | 自动创建 | 报错 |
| 推荐场景 | 开发环境 | 生产环境 |

## Volume 使用场景

### 1. 数据持久化

```bash
# MySQL 数据库持久化
docker run -d --name mysql \
  -v mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  mysql:latest

# Redis 数据持久化
docker run -d --name redis \
  -v redis-data:/data \
  redis:latest
```

### 2. 配置文件挂载

```bash
# 挂载应用配置文件
docker run -d --name nginx \
  -v nginx-conf:/etc/nginx \
  -v nginx-html:/usr/share/nginx/html \
  nginx:latest

# 挂载单个配置文件
docker run -d --name app \
  -v /host/app.yml:/app/config.yml:ro \
  myapp:latest
```

### 3. 开发环境代码同步

```bash
# 挂载本地代码目录（开发环境）
docker run -d --name dev-app \
  -v $(pwd)/src:/app/src \
  -v $(pwd)/config:/app/config \
  myapp:latest
```

### 4. 容器间数据共享

```bash
# 创建共享卷
docker volume create shared-data

# 多个容器共享同一个卷
docker run -d --name app1 -v shared-data:/data nginx
docker run -d --name app2 -v shared-data:/data nginx
```

### 5. 日志收集

```bash
# 挂载日志目录到宿主机
docker run -d --name app \
  -v app-logs:/var/log/app \
  myapp:latest

# 在宿主机查看日志
docker volume inspect app-logs
# 查看挂载点路径，直接访问日志文件
```

## Volume 最佳实践

### 1. 使用命名卷而非匿名卷

```bash
# 推荐：使用命名卷
docker run -d --name app -v app-data:/data myapp

# 不推荐：使用匿名卷
docker run -d --name app -v /data myapp
```

### 2. 生产环境使用 `--mount`

```bash
# 生产环境推荐格式
docker run -d --name app \
  --mount type=volume,source=app-data,target=/data,readonly \
  myapp
```

### 3. 及时清理未使用的卷

```bash
# 定期清理未使用的卷
docker volume prune

# 查看未使用的卷
docker volume ls -q -f "dangling=true"
```

### 4. 卷命名规范

```bash
# 使用有意义的卷名
docker volume create mysql-data
docker volume create nginx-conf
docker volume create app-logs

# 避免使用随机名称
docker volume create vol1  # 不推荐
```

### 5. 备份重要数据

```bash
# 定期备份关键卷
docker run --rm \
  -v mysql-data:/data \
  -v /backup:/backup \
  alpine tar cvf /backup/mysql-backup-$(date +%Y%m%d).tar /data
```

### 6. 使用只读挂载保护数据

```bash
# 配置文件只读挂载
docker run -d --name app \
  -v app-conf:/etc/app:ro \
  myapp
```

## Volume 驱动

Docker 支持多种 Volume 驱动，用于不同的存储需求：

### 1. local 驱动（默认）

```bash
# 本地存储驱动
docker volume create --driver local my-vol
```

### 2. NFS 驱动

```bash
# NFS 远程存储
docker volume create --driver local \
  --opt type=nfs \
  --opt o=addr=192.168.1.1,rw \
  --opt device=:/export/data \
  nfs-vol
```

### 3. 第三方驱动

```bash
# 使用第三方驱动（如 Azure File Storage）
docker volume create --driver azurefile \
  --opt share_name=myshare \
  azure-vol

# 使用 AWS S3
docker volume create --driver s3 \
  --opt bucket=mybucket \
  s3-vol
```

## Volume 与 Bind Mount 的选择

| 场景 | 推荐类型 | 原因 |
|------|----------|------|
| 生产环境数据持久化 | Volume | Docker 管理，易备份迁移 |
| 开发环境代码同步 | Bind Mount | 直接访问宿主机文件 |
| 配置文件挂载 | Bind Mount | 方便修改配置 |
| 多容器数据共享 | Volume | 集中管理，易于维护 |
| 临时数据（缓存） | tmpfs | 内存存储，性能高 |

## Volume 常见问题

### 1. 权限问题

```bash
# 容器内用户与宿主机用户不一致导致权限问题
# 解决方案：指定容器用户
docker run -d --name app \
  -v /host/data:/data \
  --user $(id -u):$(id -g) \
  myapp

# 或在容器内修改权限
docker exec app chown -R appuser:appgroup /data
```

### 2. SELinux 问题（CentOS/RHEL）

```bash
# SELinux 阻止访问挂载目录
# 解决方案：添加 SELinux 标签
docker run -d --name app \
  -v /host/data:/data:z \
  myapp  # z 表示重新标记私有标签

# 或共享标签
docker run -d --name app \
  -v /host/data:/data:Z \
  myapp  # Z 表示重新标记共享标签
```

### 3. 路径不存在问题

```bash
# -v 模式：宿主机路径不存在会自动创建目录
docker run -d --name app -v /new/path:/data myapp

# --mount 模式：路径不存在会报错
docker run -d --name app \
  --mount type=bind,source=/new/path,target=/data \
  myapp  # Error: path not found
```

### 4. Windows/Mac 路径问题

```bash
# Windows 路径格式
docker run -d --name app \
  -v C:/Users/data:/data \
  myapp

# Mac 路径格式
docker run -d --name app \
  -v /Users/data:/data \
  myapp

# 注意：Docker Desktop 需要在设置中允许访问目录
```

## Volume 相关命令汇总

```bash
# 创建卷
docker volume create [VOLUME_NAME]

# 列出卷
docker volume ls

# 查看卷详情
docker volume inspect [VOLUME_NAME]

# 删除卷
docker volume rm [VOLUME_NAME]

# 清理未使用的卷
docker volume prune

# 查看使用卷的容器
docker ps --filter volume=[VOLUME_NAME]

# 挂载卷运行容器
docker run -v [VOLUME_NAME]:[CONTAINER_PATH] [IMAGE]
docker run --mount type=volume,source=[VOLUME_NAME],target=[CONTAINER_PATH] [IMAGE]

# 绑定挂载
docker run -v [HOST_PATH]:[CONTAINER_PATH] [IMAGE]
docker run --mount type=bind,source=[HOST_PATH],target=[CONTAINER_PATH] [IMAGE]

# tmpfs 挂载
docker run --mount type=tmpfs,target=[CONTAINER_PATH] [IMAGE]

# 复制卷数据
docker run --rm -v [SRC_VOL]:/src -v [DEST_VOL]:/dest alpine cp -a /src/. /dest/
```

# Network

Docker 容器支持多种网络模式，不同的模式决定了容器如何与宿主机、其他容器及外部网络通信。以下是常见的 Docker 网络模式及其配置方法：

---

### 1. ​**​默认桥接模式 (`bridge`)​**​

- ​**​特点​**​：
  - 默认的网络模式，每个容器分配独立 IP。
  - 容器间通过 `容器IP` 互相通信。
  - 容器需通过 `-p` 参数映射端口才能被外部访问。
- ​**​适用场景​**​：
  - 单机环境下需要隔离的容器（默认模式）。
- ​**​配置​**​：

    ``# 运行容器（默认使用 `bridge` 网络）   docker run -d --name my_container -p 8080:80 nginx      # 查看容器 IP 和网络信息   docker inspect my_container | grep IPAddress``

---

### 2. ​**​主机模式 (`host`)​**​

- ​**​特点​**​：
  - 容器共享宿主机的网络命名空间，直接使用宿主机 IP 和端口。
  - 容器无需端口映射即可通过宿主机 IP 访问。
  - ​**​性能更高​**​（无 NAT 开销），但隔离性差。
- ​**​适用场景​**​：
  - 对网络性能要求高的场景（如高并发服务）。
- ​**​配置​**​：

```bash
# 使用 host 模式运行容器   
docker run -d --name my_container --network=host nginx
```

---

### 3. ​**​无网络模式 (`none`)​**​

- ​**​特点​**​：
  - 容器完全禁用网络（无网卡、无 IP）。
  - 仅适用于不需要网络通信的场景。
- ​**​适用场景​**​：
  - 安全敏感的任务（如离线数据处理）。
- ​**​配置​**​：

```bash
docker run -d --name my_container --network=none nginx
```

---

### 4. ​**​容器共享模式 (`container:<name|id>`)​**​

- ​**​特点​**​：
  - 新容器共享另一个容器的网络命名空间。
  - 两个容器使用相同的 IP 和端口。
- ​**​适用场景​**​：
  - 需要多个容器共享同一网络栈（如 Sidecar 模式）。
- ​**​配置​**​：

```bash
    # 启动第一个容器   
    docker run -d --name container1 nginx      
    # 启动第二个容器，共享 container1 的网络   
    docker run -d --name container2 --network=container:container1 alpine
```

---

### 5. ​**​自定义网络 (`user-defined`)​**​

- ​**​特点​**​：
  - 用户自定义的桥接网络或 Overlay 网络。
  - 支持容器间 DNS 自动解析（通过容器名通信）。
  - 提供更好的隔离性和灵活性。
- ​**​适用场景​**​：
  - 多容器应用需要安全通信（如微服务架构）。
- ​**​配置​**​：

```bash
    # 创建自定义桥接网络   
    docker network create my_network      
    # 运行容器并加入自定义网络   
    docker run -d --name app1 --network=my_network nginx   
    docker run -d --name app2 --network=my_network mysql      
    # 在 app2 中直接通过容器名访问 app1   
    ping app1
```

---

### 6. ​**​Overlay 网络 (`overlay`)​**​

- ​**​特点​**​：
  - 用于跨主机的容器通信（Docker Swarm 集群）。
  - 支持多主机间的容器互联。
- ​**​适用场景​**​：
  - 分布式应用或容器集群（如 Docker Swarm、Kubernetes）。
- ​**​配置​**​：

```bash
    # 在 Swarm 集群中创建 overlay 网络   
    docker network create -d overlay my_overlay_net
```

---

### 7. ​**​Macvlan/IPvlan 网络​**​

- ​**​特点​**​：
  - `macvlan`：为容器分配独立的 MAC 地址，使其直接连接到物理网络。
  - `ipvlan`：共享物理接口的 MAC 地址，但分配不同 IP。
- ​**​适用场景​**​：
  - 需要容器直接暴露在物理网络中（如虚拟机替代方案）。
- ​**​配置​**​：

```bash
    # 创建 macvlan 网络   
    docker network create -d macvlan \     
    --subnet=192.168.1.0/24 \     
    --gateway=192.168.1.1 \     
    --parent=eth0 \     my_macvlan_net
```

---

### ​**​如何选择网络模式？​**​

|模式|隔离性|性能|适用场景|
|---|---|---|---|
|`bridge`|高|中等|默认隔离环境（单机）|
|`host`|低|高|高性能需求|
|`none`|最高|无|无网络需求|
|`container`|低|高|共享网络栈（如 Sidecar）|
|`user-defined`|高|中等|多容器应用（DNS 自动解析）|
|`overlay`|高|中等|跨主机通信（集群）|
|`macvlan`|高|高|直接暴露在物理网络|

---

### ​**​常用命令​**​

```bash
# 列出所有网络
docker network ls

# 查看网络详情
docker network inspect my_network
docker network inspect bridge

# 创建自定义网络
docker network create my_network
docker network create --driver bridge --subnet 172.20.0.0/16 my_network
docker network create --driver bridge --subnet 172.20.0.0/16 --gateway 172.20.0.1 my_network

# 连接/断开容器与网络
docker network connect my_network my_container      # 将运行中容器加入网络
docker network disconnect my_network my_container   # 将容器从网络断开

# 运行时指定网络
docker run -d --name app --network=my_network nginx

# 删除网络（必须无容器使用）
docker network rm my_network

# 清理未使用的网络
docker network prune
```

---

### ​**​总结​**​

- ​**​开发测试​**​：默认 `bridge` 或自定义网络。
- ​**​生产环境​**​：建议使用 `host` 模式（高性能）或自定义网络（隔离性）。
- ​**​跨主机通信​**​：使用 `overlay` 网络（Swarm 集群）。
- ​**​物理网络集成​**​：选择 `macvlan`/`ipvlan`。

通过合理选择网络模式，可以优化容器的网络性能和安全性。

# registry

```json
{
  "registry-mirrors" : [
    "https://docker.1ms.run",
    "https:\/\/dockerhub.xianfish.site",
    "https:\/\/registry.docker-cn.com",
    "http:\/\/hub-mirror.c.163.com",
    "https:\/\/docker.mirrors.ustc.edu.cn",
    "https:\/\/dockerhub.azk8s.cn",
    "https:\/\/mirror.ccs.tencentyun.com",
    "https:\/\/docker.mirrors.ustc.edu.cn",
     "https:\/\/docker.registry.cyou",
    "https:\/\/docker-cf.registry.cyou",
    "https:\/\/dockercf.jsdelivr.fyi",
    "https:\/\/docker.jsdelivr.fyi",
    "https:\/\/dockertest.jsdelivr.fyi",
    "https:\/\/mirror.aliyuncs.com",
    "https:\/\/dockerproxy.com",
    "https:\/\/mirror.baidubce.com",
    "https:\/\/docker.m.daocloud.io",
    "https:\/\/docker.nju.edu.cn",
    "https:\/\/docker.mirrors.sjtug.sjtu.edu.cn",
    "https:\/\/docker.mirrors.ustc.edu.cn",
    "https:\/\/mirror.iscas.ac.cn",
    "https:\/\/docker.rainbond.cc"
  ],
  "insecure-registries" : [
    "http:\/\/10.11.3.164"
  ]
}

```

```json
{
  "registry-mirrors" : [
    "https:\/\/dockerhub.xianfish.site"
  ],
  "insecure-registries" : [
    "http:\/\/10.11.3.164"
  ]
}
```

# Docker Compose

Docker Compose 是定义和运行多容器应用的工具，通过 `compose.yaml` 文件声明式管理服务。

## compose.yaml 基本结构

```yaml
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html
    depends_on:
      - db
    networks:
      - app-network
    restart: unless-stopped

  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: mydb
    volumes:
      - db-data:/var/lib/mysql
    networks:
      - app-network

  redis:
    image: redis:7-alpine
    command: redis-server --appendonly yes
    volumes:
      - redis-data:/data

volumes:
  db-data:
  redis-data:

networks:
  app-network:
    driver: bridge
```

## 常用命令

```bash
# 启动所有服务（后台运行）
docker compose up -d

# 启动并强制重建镜像
docker compose up -d --build

# 启动指定服务
docker compose up -d web redis

# 停止并删除所有容器
docker compose down

# 停止并删除容器+卷（清除数据）
docker compose down -v

# 查看服务状态
docker compose ps

# 查看服务日志
docker compose logs
docker compose logs -f web          # 跟踪指定服务日志
docker compose logs --tail 50 web   # 最近 50 行

# 在服务中执行命令
docker compose exec web /bin/bash
docker compose exec db mysql -uroot -proot

# 运行一次性命令
docker compose run --rm web python manage.py migrate

# 重新构建镜像
docker compose build
docker compose build --no-cache     # 不使用缓存

# 拉取最新镜像
docker compose pull

# 重启服务
docker compose restart web

# 暂停/恢复服务
docker compose pause web
docker compose unpause web

# 查看服务配置（验证 yaml 是否正确）
docker compose config

# 查看服务资源使用
docker compose top
```

## 多环境配置

```bash
# 使用不同配置文件
docker compose -f compose.yaml -f compose.prod.yaml up -d

# 指定项目名称（默认使用目录名）
docker compose -p myproject up -d

# 指定环境变量文件
docker compose --env-file .env.prod up -d
```

### 环境变量优先级

```
1. compose.yaml 中硬编码的值
2. shell 环境变量
3. .env 文件
4. Dockerfile 中的 ENV
5. 上述都没有时使用变量定义的默认值
```

## 构建配置

```yaml
services:
  app:
    build:
      context: .                    # 构建上下文
      dockerfile: Dockerfile.prod   # 指定 Dockerfile
      args:                         # 构建参数
        VERSION: "2.0"
      target: production            # 多阶段构建目标
    image: myapp:2.0               # 构建后镜像名称
```

## 健康检查

```yaml
services:
  web:
    image: nginx:latest
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
```

## 资源限制

```yaml
services:
  app:
    image: myapp:latest
    deploy:
      resources:
        limits:
          cpus: "2"
          memory: 512M
        reservations:
          cpus: "0.5"
          memory: 256M
```

## 常用 compose.yaml 模板

### Web + DB + Redis

```yaml
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/mydb
      - REDIS_URL=redis://redis:6379
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started

  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: mydb
    volumes:
      - pg-data:/var/lib/mysql
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U user"]
      interval: 10s
      timeout: 5s
      retries: 5

  redis:
    image: redis:7-alpine
    volumes:
      - redis-data:/data

volumes:
  pg-data:
  redis-data:
```

---

# docker system

Docker 系统级管理命令，用于清理磁盘空间和查看资源使用。

## docker system df

查看 Docker 磁盘使用情况：

```bash
# 概览
docker system df

# 详细信息（每个镜像/容器/卷/构建缓存的具体占用）
docker system df -v
```

输出示例：

```text
TYPE            TOTAL   ACTIVE  SIZE    RECLAIMABLE
Images          15      5       5.2GB   3.1GB (59%)
Containers      8       3       120MB   80MB (66%)
Local Volumes   6       3       800MB   400MB (50%)
Build Cache     25      0       2.1GB   2.1GB (100%)
```

## docker system prune

一键清理未使用的 Docker 资源：

```bash
# 清理已停止的容器、未使用的网络、悬空镜像、构建缓存
docker system prune

# 同时清理未被容器使用的镜像（常用）
docker system prune -a

# 同时清理卷（⚠️ 会删除数据）
docker system prune --volumes

# 全量清理（危险，需确认）
docker system prune -a --volumes

# 不需要确认提示
docker system prune -f
```

### 清理范围对比

| 命令 | 停止的容器 | 悬空镜像 | 未使用镜像 | 未使用网络 | 未使用卷 | 构建缓存 |
|------|-----------|---------|-----------|-----------|---------|---------|
| `docker system prune` | ✅ | ✅ | ❌ | ✅ | ❌ | ✅ |
| `docker system prune -a` | ✅ | ✅ | ✅ | ✅ | ❌ | ✅ |
| `docker system prune -a --volumes` | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

## 分项清理命令

```bash
# 清理已停止的容器
docker container prune

# 清理悬空镜像（无标签）
docker image prune

# 清理所有未使用的镜像
docker image prune -a

# 清理未使用的卷
docker volume prune

# 清理未使用的网络
docker network prune

# 清理构建缓存
docker builder prune
```

### 按条件过滤清理

```bash
# 清理超过 24 小时的构建缓存
docker builder prune --filter "until=24h"

# 清理 2025-01-01 之前创建的镜像
docker image prune -a --filter "until=2025-01-01"

# 清理指定标签的镜像
docker image prune -a --filter "label!=keep"
```

## docker system info

查看 Docker 系统信息：

```bash
docker system info      # 等同于 docker info
```

## 磁盘空间排查流程

```bash
# 1. 查看 Docker 整体占用
docker system df -v

# 2. 找出最大的镜像
docker image ls --format "{{.Repository}}:{{.Tag}}\t{{.Size}}" | sort -k2 -h

# 3. 清理不需要的资源
docker system prune -a          # 清理未使用的镜像和容器

# 4. 如需更深度的清理
docker system prune -a --volumes  # 同时清理卷

# 5. 清理构建缓存
docker builder prune -a
```

---

# other

## 参考链接

- [Docker cp 命令详解：在容器和主机之间复制文件/文件夹](https://blog.csdn.net/Tester_muller/article/details/131678630)
- [Mac 上构建 Docker 配置 linux/amd64](https://www.jianshu.com/p/3119635e2196)
- [Docker 深度清除镜像缓存](https://juejin.cn/post/7041119023286730782)
- [Dockerfile 中更换国内源](https://blog.csdn.net/yyj108317/article/details/105984674)

## 常用技巧

### Mac 上构建 linux/amd64 镜像

```bash
# 方法 1：使用 --platform
docker build --platform=linux/amd64 -t myapp:1.0 .
docker run --platform=linux/amd64 myapp:1.0

# 方法 2：使用 buildx 多平台构建
docker buildx build --platform=linux/amd64,linux/arm64 -t myapp:1.0 .

# 方法 3：Dockerfile 中指定
FROM --platform=linux/amd64 python:3.11
```

### 清理构建缓存

```bash
docker builder prune
docker builder prune -a            # 清理全部
docker builder prune --filter "until=24h"
```

### Dockerfile 中更换国内源

```dockerfile
# Ubuntu/Debian 换源
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list

# Alpine 换源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# pip 换源
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# npm 换源
RUN npm config set registry https://registry.npmmirror.com
```

[[k8s#k8s概述]]
