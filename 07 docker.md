docker run -it --rm -p 4000:80 ccr.ccs.tencentyun.com/dockerpracticesig/docker_practice

dockerfile -> image  -> container
Repository
镜像
容器
仓库
# image
```
docker pull [选项] [Docker Registry 地址[:端口号]/]仓库名[:标签]
```

`docker image ls`

`docker image rm`

## Dockerfile

使用dockerfile 定制镜像

```dockerfile
FROM nginx
RUN echo '<h1>Hello, Docker!</h1>' > /usr/share/nginx/html/index.html
```

`FROM`


`COPY`
如果源路径为文件夹，复制的时候不是直接复制该文件夹，而是将文件夹中的内容复制到目标路径

`RUN`
- shell 格式  `RUN <命令>`
- exec格式`RUN ["可执行文件", "参数1", "参数2"]`

`docker build -t `

# container

`docker run -it --rm`

- `-it`：这是两个参数，一个是 `-i`：交互式操作，一个是 `-t` 终端。我们这里打算进入 `bash` 执行一些命令并查看返回结果，因此我们需要交互式终端。
- `--rm`：这个参数是说容器退出后随之将其删除。默认情况下，为了排障需求，退出的容器并不会立即删除，除非手动 `docker rm`。我们这里只是随便执行个命令，看看结果，不需要排障和保留结果，因此使用 `--rm` 可以避免浪费空间。

`docker container start`

`docker run -d`

`docker container stop`

## 进入容器
`docker container attach`    _注意：_ 如果从这个 stdin 中 exit，会导致容器的停止。

`docker container exec -itd containerID bin/bash`

`docker container rm containerid`

# Repository


# Volume
```
docker volume create my-vol
```


[# Docker cp命令详解：在Docker容器和主机之间复制文件/文件夹](https://blog.csdn.net/Tester_muller/article/details/131678630)


[Mac 上构建Docker配置 linux/amd64](https://www.jianshu.com/p/3119635e2196)