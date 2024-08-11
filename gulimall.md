# 基础篇

spring cloud   微服务框架

`spring cloud alibaba`
- 配置、服务注册中心`nacos`

nacos docker 启动命令
`docker run -itd -p 8848:8848 --name nacos -e MODE=standalone nacos/nacos-server:v2.3.2-slim`

api网关  ` spring cloud gateway`
配置路由转发

oss 对象存储

policy

跨域问题


jsr303 统一校验

统一异常处理   `controllerAdvice`

`javax persistence`
`@Vlalid`

`group`

自定义校验


# 高级篇

```sh
docker run --name elasticsearch --net dev -p 9200:9200 -p 9300:9300 \
-e "discovery.type=single-node" \
-e ES_JAVA_OPTS="-Xms64m -Xmx512m" \
-v ~/DevelopTools/elasticsearch/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
-v ~/DevelopTools/elasticsearch/data:/usr/share/elasticsearch/data \
-v ~/DevelopTools/elasticsearch/plugins:/usr/share/elasticsearch/plugins -itd elasticsearch:7.17.21
```

```sh
docker run --name kibana --net dev -e "ELASTICSEARCH_HOSTS=http://127.0.0.1:9200" -p 5601:5601 -d kibana:7.17.21
```


```sh
docker run -p 80:80 --name nginx --net dev \
-v ~/DevelopTools/nginx/html:/usr/share/nginx/html \
-v ~/DevelopTools/nginx/logs:/var/log/nginx \
-v ~/DevelopTools/nginx/conf:/etc/nginx \
-d arm64v8/nginx

