# Redis
## 数据类型
- 字符串`String`
- 散列表`hash map`
- 列表`List`
- 集合`Set`
- 有序集合 zset

## 用法
Redis 提供了丰富的命令来操作不同的数据类型，以下是一些常见用法示例：

### 字符串 (String)
- 设置和获取字符串值：
```bash
SET key "value"
GET key
```
- 设置带过期时间的键：
```bash
SETEX key 60 "value"  # 设置 key 的值为 "value"，并在 60 秒后过期
```

### 散列表 (Hash)
- 设置和获取字段值：
```bash
HSET user:1 name "Alice"
HGET user:1 name
```
- 获取所有字段和值：
```bash
HGETALL user:1
```

### 列表 (List)
- 向列表头部或尾部添加元素：
```bash
LPUSH mylist "value1"
RPUSH mylist "value2"
```
- 获取列表中的元素：
```bash
LRANGE mylist 0 -1  # 获取列表中所有元素
```

### 集合 (Set)
- 添加和获取集合中的元素：
```bash
SADD myset "value1"
SMEMBERS myset
```
- 检查元素是否存在：
```bash
SISMEMBER myset "value1"
```

### 有序集合 (Sorted Set)
- 添加元素并设置分数：
```bash
ZADD myzset 1 "value1"
ZADD myzset 2 "value2"
```
- 获取指定范围的元素：
```bash
ZRANGE myzset 0 -1 WITHSCORES  # 获取所有元素及其分数
```


