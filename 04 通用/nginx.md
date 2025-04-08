# Nginx

配置文件 `/etc/nginx/nginx.conf`

## http块

http块是 Nginx 配置文件中的一个重要部分，用于定义与 HTTP 协议相关的全局配置。它包含了影响所有 HTTP 请求的设置，并且可以嵌套多个 server 块，每个 server 块对应一个虚拟主机。

作用

- 配置全局 HTTP 相关的参数，例如连接超时、日志格式、文件缓存等。
- 定义影响所有 server 和 location 块的默认行为。
- 可以包含多个 server 块，用于处理不同的域名或 IP 地址。

示例

```nginx
http {
    # 设置日志格式
    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';

    # 定义访问日志文件
    access_log /var/log/nginx/access.log main;

    # 设置客户端请求的最大大小
    client_max_body_size 10m;

    # 启用 Gzip 压缩
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

    # 定义虚拟主机
    server {
        listen 80;
        server_name example.com;

        location / {
            root /var/www/html;
            index index.html;
        }
    }
}
```

配置含义  
log_format 和 access_log:

定义日志格式和日志存储位置，用于记录 HTTP 请求的详细信息。
client_max_body_size:

限制客户端请求的最大大小，防止上传过大的文件。
gzip:

启用 Gzip 压缩以减少传输数据量，提高性能。
server 块:

定义一个虚拟主机，监听 80 端口，处理 example.com 的请求。
location 块:

指定请求路径 / 的处理方式，设置根目录和默认文件。

## server 块

server 块是 http 块中的一个子块，用于定义虚拟主机的配置。每个 server 块可以处理特定的域名或 IP 地址的请求。

作用

- 定义虚拟主机的监听端口和域名。
- 配置与该虚拟主机相关的参数，例如根目录、默认文件、错误页面等。
- 可以包含多个 location 块，用于处理不同的 URL 路径。

示例

```nginx
server {
    listen 80;
    server_name example.com;

    location / {
        root /var/www/html;
        index index.html;
    }
}
```

配置含义

- `listen`: 指定虚拟主机监听的端口号。
- `server_name`: 定义虚拟主机的域名。
- `location`: 配置 URL 路径的处理方式，例如设置根目录和默认文件。

## location 块

location 块是 server 块中的一个子块，用于定义特定 URL 路径的处理方式。

作用

- 配置与特定路径相关的参数，例如根目录、默认文件、重定向等。
- 可以根据路径匹配规则处理不同的请求。
- 支持正则表达式匹配和优先级控制。

示例

```nginx
location / {
    root /var/www/html;
    index index.html;
}

location /images/ {
    root /var/www/media;
}

location ~ \.php$ {
    fastcgi_pass 127.0.0.1:9000;
    fastcgi_index index.php;
    include fastcgi_params;
}
```

配置含义

- `/`: 匹配根路径，设置根目录和默认文件。
- `/images/`: 匹配以 `/images/` 开头的路径，设置不同的根目录。
- `~ \.php$`: 使用正则表达式匹配以 `.php` 结尾的路径，配置 PHP 请求的处理方式。