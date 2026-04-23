# docker

- [Docker 常用命令 与 `Dockerfile`](https://xiets.blog.csdn.net/article/details/122866186)
- [Docker 环境清理的常用方法有哪些？](https://www.zhihu.com/tardis/bd/ans/2998335721)
- [dockerfile](https://docs.docker.com/reference/dockerfile/)

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

# docker pull

```bash
docker pull --platform=linux/arm64 image:tag
docker pull [选项] [Docker Registry 地址[:端口号]/]仓库名[:标签]
```

# docker image

`docker image ls`

`docker image rm`

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

`docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`
`docker container run -it --rm IMAGE [COMMAND] [ARG...]`

- `-it`：这是两个参数，一个是 `-i`：交互式操作，一个是 `-t` 终端。我们这里打算进入 `bash` 执行一些命令并查看返回结果，因此我们需要交互式终端。
- `--rm`：这个参数是说容器退出后随之将其删除。默认情况下，为了排障需求，退出的容器并不会立即删除，除非手动 `docker rm`。我们这里只是随便执行个命令，看看结果，不需要排障和保留结果，因此使用 `--rm` 可以避免浪费空间。

`docker container start CONTAINER`

`docker run -d`

`docker container stop`

## docker container

- `docker container attach [OPTIONS] CONTAINER`    *注意：* 如果从这个 stdin 中 exit，会导致容器的停止。
- `docker container exec -it CONTAINER COMMAND`
  - `docker container exec -itd CONTAINER /bin/bash`

`docker container rm CONTAINER`

`docker container inspect`
`docker container logs`

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

- 查看所有网络：
    `docker network ls`
- 查看网络详情：
    `docker network inspect my_network`
- 删除网络：
    `docker network rm my_network`

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

# other

[# Docker cp命令详解：在Docker容器和主机之间复制文件/文件夹](https://blog.csdn.net/Tester_muller/article/details/131678630)

[Mac 上构建Docker配置 linux/amd64](https://www.jianshu.com/p/3119635e2196)

[Docker 深度清除镜像缓存](https://juejin.cn/post/7041119023286730782)

[Dockerfile中更换国内源](https://blog.csdn.net/yyj108317/article/details/105984674)

`docker builder prune`

[[k8s#k8s概述]]
