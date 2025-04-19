# 参考

- http://heavy_code_industry.gitee.io/code_heavy_industry/pro002-maven/
- [maven official documentation](https://maven.apache.org/guides/index.html)


`-Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true`
- -Dmaven.wagon.http.ssl.insecure=true
	- 这个参数告诉Maven允许不安全的SSL连接
	- 它会忽略SSL证书验证
	- 主要用于处理自签名证书或证书链不完整的情况
- -Dmaven.wagon.http.ssl.allowall=true
	- 这个参数允许Maven接受所有的SSL证书
	- 它会跳过证书验证过程
	- 主要用于开发环境或测试环境

```shell
# -D 表示后面要附加命令的参数，字母 D 和后面的参数是紧挨着的，中间没有任何其它字符
# maven.test.skip=true 表示在执行命令的过程中跳过测试


mvn groupId:artifactId:goal -P \!profile-1,\!profile-2,\!?profile-3

mvn groupId:artifactId:goal -P=-profile-1,-profile-2,-?profile-3
```


# 继承

父工程  打包方式  pom


### 在父工程中声明自定义属性
```xml
<!-- 通过自定义属性，统一指定Spring的版本 -->
<properties>
	<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
	
	<!-- 自定义标签，维护Spring版本数据 -->
	<atguigu.spring.version>4.3.6.RELEASE</atguigu.spring.version>
</properties>
```

```xml
<dependency>
	<groupId>org.springframework</groupId>
	<artifactId>spring-core</artifactId>
	<version>${atguigu.spring.version}</version>
</dependency>
```

应用`properties`中的属性 `properties.value`
引用环境变量中的属性  `env.key`
# 依赖传递

# 依赖冲突

- 依赖调解原则
- 第一声明优先原则
- 路径近者优先原则


## pom.xml

dependencyManagement

dependencies

排除依赖
`exclusion`

锁定版本
`dependencyManagement`


maven

父pom 继承

依赖传递 a 依赖b b依赖c

dependencyManagement

`${kettle.version}`

maven坐标
- groupId
- artifactId
- version

## settings.xml


profile
`<repositories>`
`<activation>`
`<properties> <name> <value>`
`propertities.value`
`env.key`
`<os>`
`<file>`

`mvn -p -s`




## scope

- `compile` 默认
	- 该依赖在项目**编译、测试以及运行时**都有效。
	- 这是最常用的依赖范围，如果没有明确指定`<scope>`，则默认为`compile`。
- `runtime` 
	- 依赖在运行和测试时需要，但在编译时不需要。
	- 常见的例子是JDBC驱动程序，它在编译时并不直接使用，但在运行时需要加载具体的数据库驱动。
- `test`
	- 仅在测试阶段有效。
	- 用于单元测试或集成测试相关的依赖。例如，JUnit 是典型的测试依赖。
- `provided` 
	- 表示该依赖预期由运行环境提供，如Servlet API通常由容器提供。
	- 在编译和测试阶段有效，但在运行时不需要包含进打包文件中，因为它假定由运行环境（如应用服务器）提供
- `system`
	- 类似于`provided`，但要求你显式地指定该依赖所在的jar包路径。
	- 使用`<systemPath>`元素来定义本地jar文件的位置，这使得构建过程与本机环境紧密耦合，因此应谨慎使用。
- `import`
	- 用于在`<dependencyManagement>`部分导入其他pom文件中的依赖管理配置。
	- 它允许从其他`POM`文件中继承依赖版本信息，而不会实际引入任何依赖。
## optional

```xml
<!-- spring-boot-devtools -->  
<dependency>  
    <groupId>org.springframework.boot</groupId>  
    <artifactId>spring-boot-devtools</artifactId>  
    <optional>true</optional> <!-- 表示依赖不会传递 -->  
</dependency>
```


#  [maven versions  介绍](https://www.mojohaus.org/versions/versions-maven-plugin/index.html)
`mvn versions:set`

`mvn versions:commit`

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.codehaus.mojo</groupId>
            <artifactId>versions-maven-plugin</artifactId>
            <version>2.7</version> <!-- 请检查最新版本 -->
            <configuration>
                <!-- 可选的配置参数 -->
            </configuration>
        </plugin>
    </plugins>
</build>
```

- **maven使用assembly插件打包zip/tar** [https://blog.csdn.net/qq_17303159/article/details/123996669](https://blog.csdn.net/qq_17303159/article/details/123996669)
- [https://blog.csdn.net/qq_44795091/article/details/130327247](https://blog.csdn.net/qq_44795091/article/details/130327247) **maven工程多模块、项目打包问题**
- 【Maven】多模块项目打包最佳实践 [https://www.cnblogs.com/slankka/p/17474587.html](https://www.cnblogs.com/slankka/p/17474587.html)
- **maven的命令-deploy** [https://blog.csdn.net/aaaaa2428572/article/details/108402495](https://blog.csdn.net/aaaaa2428572/article/details/108402495)