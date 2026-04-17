---
title: Docker Compose 配置详解
description: Docker Compose 文件配置语法和使用方法详解
tags:
  - docker
  - devtools
date: 2024-01-01
---

# Docker Compose 配置详解

Docker Compose 是用于定义和运行多容器 Docker 应用程序的工具。通过 Compose，您可以使用 YAML 文件配置应用程序的服务、网络和卷。

## 文档链接

[Compose file reference](https://docs.docker.com/reference/compose-file)

## 核心概念

Docker Compose 文件包含三个顶级元素：

| 元素 | 说明 |
|------|------|
| `services` | 定义应用程序的服务（容器） |
| `networks` | 定义网络配置 |
| `volumes` | 定义数据卷配置 |

## 基础结构

```yaml
version: '3'
name: myapp
services: 
  eureka:
    build: .
    ports:
      - "8761:8761"
    command: /bin/bash
    container_name: my-web-container
    dns: 8.8.8.8
    environment: 
      RACK_ENV: development
      SHOW: 'true'
    env_file: 
      - .env
    expose:
      - '3000'
    image: java
    networks:
      - frontend
    volumes:
      - /host/path:/container/path
networks:
  frontend:
volumes:
  db-data:
```

## Services 配置详解

### build

从 Dockerfile 构建镜像：

```yaml
services:
  webapp:
    build: .
    # 或详细配置
    build:
      context: ./dir
      dockerfile: Dockerfile-alternate
      args:
        buildno: 1
```

### image

指定使用的镜像：

```yaml
services:
  webapp:
    image: nginx:latest
    # 或使用私有仓库
    image: my-registry:5000/myapp:v1.0
```

### ports

端口映射，格式为 `主机端口:容器端口`：

```yaml
services:
  webapp:
    ports:
      - "8080:80"
      - "443:443"
      - "3000-3005:3000-3005"  # 端口范围
```

### expose

暴露端口给链接的服务，不发布到主机：

```yaml
services:
  webapp:
    expose:
      - "3000"
      - "8000"
```

### volumes

数据卷挂载：

```yaml
services:
  webapp:
    volumes:
      # 命名卷
      - db-data:/var/lib/mysql
      # 绑定挂载
      - ./data:/app/data
      # 匿名卷
      - /app/tmp
      # 只读挂载
      - ./config:/etc/config:ro
```

### environment

设置环境变量：

```yaml
services:
  webapp:
    # 映射语法
    environment:
      RACK_ENV: development
      SHOW: "true"
      USER_INPUT:
    # 或数组语法
    environment:
      - RACK_ENV=development
      - SHOW=true
```

### env_file

从文件加载环境变量：

```yaml
services:
  webapp:
    env_file: .env
    # 或多个文件
    env_file:
      - ./a.env
      - ./b.env
    # 详细配置
    env_file:
      - path: ./default.env
        required: true
      - path: ./override.env
        required: false
```

### depends_on

服务依赖关系，控制启动顺序：

```yaml
services:
  web:
    depends_on:
      - db
      - redis
  # 详细配置
  web:
    depends_on:
      db:
        condition: service_healthy
        restart: true
      redis:
        condition: service_started
```

### networks

指定服务连接的网络：

```yaml
services:
  webapp:
    networks:
      - frontend
      - backend
    # 详细配置
    networks:
      frontend:
        aliases:
          - alias1
          - alias2
        ipv4_address: 172.16.238.10
```

### network_mode

设置网络模式：

```yaml
services:
  webapp:
    network_mode: "host"
    # 其他选项
    # network_mode: "none"
    # network_mode: "service:another-service"
    # network_mode: "container:container-id"
```

### command

覆盖默认命令：

```yaml
services:
  webapp:
    command: bundle exec thin -p 3000
    # 或列表形式
    command: ["bundle", "exec", "thin", "-p", "3000"]
```

### entrypoint

覆盖默认入口点：

```yaml
services:
  webapp:
    entrypoint: /code/entrypoint.sh
    # 或列表形式
    entrypoint:
      - php
      - -d
      - zend_extension=/usr/local/lib/php/extensions/xdebug.so
```

### restart

重启策略：

```yaml
services:
  webapp:
    restart: always
    # 其他选项
    # restart: on-failure
    # restart: unless-stopped
    # restart: no (默认)
```

### healthcheck

健康检查配置：

```yaml
services:
  webapp:
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost"]
      interval: 1m30s
      timeout: 10s
      retries: 3
      start_period: 40s
      start_interval: 5s
    # 禁用健康检查
    healthcheck:
      disable: true
```

### container_name

指定容器名称：

```yaml
services:
  webapp:
    container_name: my-web-container
```

### dns

自定义 DNS 服务器：

```yaml
services:
  webapp:
    dns: 8.8.8.8
    # 或多个
    dns:
      - 8.8.8.8
      - 9.9.9.9
```

### labels

添加元数据标签：

```yaml
services:
  webapp:
    # 映射语法
    labels:
      com.example.description: "Accounting webapp"
      com.example.department: "Finance"
    # 或数组语法
    labels:
      - "com.example.description=Accounting webapp"
      - "com.example.department=Finance"
```

### logging

日志配置：

```yaml
services:
  webapp:
    logging:
      driver: json-file
      options:
        max-size: "10m"
        max-file: "3"
```

### links

链接到其他服务（已弃用，建议使用 networks）：

```yaml
services:
  web:
    links:
      - db
      - db:database
      - redis
```

### extra_hosts

添加主机名映射：

```yaml
services:
  webapp:
    extra_hosts:
      - "somehost=162.242.195.82"
      - "otherhost=50.31.209.229"
```

### working_dir / user

工作目录和用户：

```yaml
services:
  webapp:
    working_dir: /app
    user: appuser
```

## Networks 配置

### 基本配置

```yaml
networks:
  frontend:
  backend:
```

### 自定义网络

```yaml
networks:
  frontend:
    driver: bridge
    driver_opts:
      com.docker.network.bridge.host_binding_ipv4: "127.0.0.1"
    ipam:
      driver: default
      config:
        - subnet: 172.28.0.0/16
          gateway: 172.28.0.1
```

### 外部网络

```yaml
networks:
  outside:
    external: true
    name: my-external-network
```

## Volumes 配置

### 基本配置

```yaml
volumes:
  db-data:
```

### 详细配置

```yaml
volumes:
  db-data:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: /path/to/data
```

### 外部卷

```yaml
volumes:
  db-data:
    external: true
    name: my-external-volume
```

## 常用命令

| 命令 | 说明 |
|------|------|
| `docker compose up -d` | 后台启动所有服务 |
| `docker compose down` | 停止并移除容器、网络 |
| `docker compose ps` | 列出运行中的服务 |
| `docker compose logs -f` | 查看日志输出 |
| `docker compose exec SERVICE CMD` | 在服务中执行命令 |
| `docker compose build` | 构建或重建服务 |
| `docker compose pull` | 拉取服务镜像 |
| `docker compose restart` | 重启服务 |
| `docker compose stop` | 停止服务 |
| `docker compose start` | 启动服务 |
| `docker compose config` | 验证并查看配置 |

## 完整示例

### Web 应用 + 数据库

```yaml
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html:ro
    depends_on:
      - app
    networks:
      - frontend

  app:
    build: ./app
    environment:
      - NODE_ENV=production
      - DB_HOST=db
    depends_on:
      db:
        condition: service_healthy
    networks:
      - frontend
      - backend

  db:
    image: postgres:15
    environment:
      POSTGRES_USER: appuser
      POSTGRES_PASSWORD: secret
      POSTGRES_DB: myapp
    volumes:
      - db-data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U appuser"]
      interval: 10s
      timeout: 5s
      retries: 5
    networks:
      - backend

networks:
  frontend:
  backend:

volumes:
  db-data:
```

### 开发环境配置

```yaml
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "3000:3000"
    volumes:
      - .:/app
      - /app/node_modules
    environment:
      - NODE_ENV=development
      - DEBUG=app:*
    env_file:
      - .env.development
    command: npm run dev

  db:
    image: mysql:8.0
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: myapp
    volumes:
      - db-data:/var/lib/mysql
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql

  redis:
    image: redis:alpine
    ports:
      - "6379:6379"

volumes:
  db-data:
```