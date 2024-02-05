
日志

```yaml
mybatis-plus: 
  configuration: 
    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl
```

BaseMapper

通用Service
```java
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements
UserService {

}
```

常用注解
@TableName
配置中可以设置同意前缀

@TableId   value  指定主建字段      type  id自增算法   雪花算法

@TableFiled

@TableLogic


条件构造器

- Wrapper ： 条件构造抽象类，最顶端父类
	- AbstractWrapper ： 用于查询条件封装，生成 sql 的 where 条件
		- QueryWrapper ： 查询条件封装
		- UpdateWrapper ： Update 条件封装
		- AbstractLambdaWrapper ： 使用Lambda 语法
			- LambdaQueryWrapper ：用于Lambda语法使用的查询Wrapper
			- LambdaUpdateWrapper ： Lambda 更新封装Wrapper


MyBatis Plus自带分页插件，只要简单的配置即可实现分页功能

 Pagehelper

```java
@Configuration
@MapperScan("com.atguigu.mybatisplus.mapper") //可以将主类中的注解移到此处
public class MybatisPlusConfig {
	@Bean
	public MybatisPlusInterceptor mybatisPlusInterceptor() {
		MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
		interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
		return interceptor;
	}

}
```

乐观锁