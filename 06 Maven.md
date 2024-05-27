http://heavy_code_industry.gitee.io/code_heavy_industry/pro002-maven/


`-Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true`
```shell
# -D 表示后面要附加命令的参数，字母 D 和后面的参数是紧挨着的，中间没有任何其它字符
# maven.test.skip=true 表示在执行命令的过程中跳过测试
mvn clean install -Dmaven.test.skip=true
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

应用properties中的属性 properties.value
引用环境变量中的属性  env.key
# 依赖传递

# 依赖冲突

依赖调解原则
第一声明优先原则
路径近者优先原则


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

${kettle.version}

坐标

groupId

artifactId

version


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


[mavne versions  介绍](https://www.mojohaus.org/versions/versions-maven-plugin/index.html)
mvn versions:set

mvn versions:commit

```xml
<build>
2    <plugins>
3        <plugin>
4            <groupId>org.codehaus.mojo</groupId>
5            <artifactId>versions-maven-plugin</artifactId>
6            <version>2.7</version> <!-- 请检查最新版本 -->
7            <configuration>
8                <!-- 可选的配置参数 -->
9            </configuration>
10        </plugin>
11    </plugins>
12</build>
```

