代码重工
https://www.wolai.com/rYAoeiSK9o6dc4qVEn76hw

- SqlSessionFactory
- SqlSession

# 缓存
一级缓存

二级缓存

# 其他
## 第四节 插件机制

mybatis 四大对象

Excutor

ParameterHandler

ResultSetHandler

StatementHandler

### 3、Mybatis 插件机制

如果想编写自己的 Mybatis 插件可以通过实现 org.apache.ibatis.plugin.Interceptor 接口来完成，表示对 Mybatis 常规操作进行拦截，加入自定义逻辑。