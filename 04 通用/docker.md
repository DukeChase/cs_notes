# docker

- [Docker 常用命令 与 `Dockerfile`](https://xiets.blog.csdn.net/article/details/122866186)
- [Docker 环境清理的常用方法有哪些？](https://www.zhihu.com/tardis/bd/ans/2998335721)

# 架构

`dockerfile` ->` image`  -> `container`
镜像
容器
仓库 hub

docker 从入门到实践
- https://vuepress.mirror.docker-practice.com/
- https://yeasy.gitbook.io/docker_practice/container/run
- https://github.com/yeasy/docker_practice/blob/master/SUMMARY.md
- `docker run -it --rm -p 4000:80 ccr.ccs.tencentyun.com/dockerpracticesig/docker_practice`

- `docker pull ccr.ccs.tencentyun.com/dockerpracticesig/docker_practice:latest`

# docker 

docker --help

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

`docker build -t`

## LABEL
在 Dockerfile 中，`LABEL` 命令用于为镜像添加元数据（metadata）。这些元数据以键值对的形式存储，可以用来描述镜像的用途、作者信息、版本号等。

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

#### 示例：
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

- `docker container attach [OPTIONS] CONTAINER`    _注意：_ 如果从这个 stdin 中 exit，会导致容器的停止。
- `docker container exec -it CONTAINER COMMAND`
  - `docker container exec -itd CONTAINER /bin/bash`

`docker container rm CONTAINER`

`docker container inspect` 
`docker container logs`

# Repository

# Volume

```bash
docker volume create my-vol
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
# other

[# Docker cp命令详解：在Docker容器和主机之间复制文件/文件夹](https://blog.csdn.net/Tester_muller/article/details/131678630)

[Mac 上构建Docker配置 linux/amd64](https://www.jianshu.com/p/3119635e2196)

[Docker 深度清除镜像缓存](https://juejin.cn/post/7041119023286730782)

[Dockerfile中更换国内源](https://blog.csdn.net/yyj108317/article/details/105984674)

`docker builder prune`

[[k8s#k8s概述]]
