# MyBatis
## 1 MyBatis introduction
## 2 搭建MyBatis
### 2.1创建MyBatis核心配置文件
文件位置：`src/main/resource/mybatis_config.xml`    `MyBatis`核心配置文件

> 习惯上命名为mybatis-config.xml，这个文件名仅仅只是建议，并非强制要求。将来整合Spring之后，这个配置文件可以省略，所以大家操作时可以直接复制、粘贴。  
核心配置文件主要用于配置连接数据库的环境以及MyBatis的全局配置信息核心配置文件存放的位置是src/main/resources目录下
>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration
    PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
  <!--设置连接数据库的环境-->
  <environments default="development">
    <environment id="development">
      <transactionManager type="JDBC"/>
      <dataSource type="POOLED">
        <property name="driver" value="com.mysql.cj.jdbc.Driver"/>
        <property name="url" value="jdbc:mysql://localhost:3306/ssm? serverTimezone=UTC"/>
        <property name="username" value="root"/>
        <property name="password" value="123456"/>
      </dataSource>

    </environment>

  </environments>

  <!--引入映射文件-->
  <mappers>
    <package name="mappers/UserMapper.xml"/>
  </mappers>

</configuration>

```

### 2.2 创建 mapper接口
相当于`Dao`，区别在于`mapper`仅仅是接口，不需要实现  
`UserMapper`  是一个接口，定义数据库的方法，

```java
public interface UserMapper {
/**
* 添加用户信息
*/
int insertUser();
}
```

### 2.3 MyBatis映射文件
+ 相关概念：ORM（Object Relation Mapping）对象关系映射
    - 对象：java的实体类对象
    - 关系：关系型数据库
    - 映射：二者之间的关系

| Java概念 | 数据库概念 |
| --- | --- |
| 类 | 表 |
| 属性 | 字段/列 |
| 对象 | 记录/行 |


1. 映射文件的命名规则：  
表所对应的`实体类的类名+Mapper.xml`  
例如：表`t_user`，映射的实体类为`User`，所对应的映射文件为`UserMapper.xml`  
因此一个映射文件对应一个实体类，对应一张表的操作  
`MyBatis`映射文件用于编写SQL，访问以及操作表中的数据  
`MyBatis`映射文件存放的位置是`src/main/resources/mappers`目录下
2. MyBatis中可以面向接口操作数据，要保证两个一致：
    - mapper接口的全类名和映射文件的命名空间（namespace）保持一致
    - mapper接口中方法的方法名和映射文件中编写SQL的标签的id属性保持一致  
`UserMapper.xml`

```xml
<?xml version="1.0" encoding="UTF-8" ?> 
<!DOCTYPE mapper 
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd"> 
<mapper namespace="com.atguigu.mybatis.mapper.UserMapper"> 
    <!--int insertUser();--> 
    <insert id="insertUser"> 
        insert into t_user values(null,'admin','123456',23,'男','12345@qq.com') 
    </insert> 
</mapper>

```

### 2.4 通过`junit`测试功能
```java
//读取MyBatis的核心配置文件 
InputStream is = Resources.getResourceAsStream("mybatis-config.xml"); 
//创建SqlSessionFactoryBuilder对象 
SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder(); 
//通过核心配置文件所对应的字节输入流创建工厂类SqlSessionFactory，生产SqlSession对象 
SqlSessionFactory sqlSessionFactory = sqlSessionFactoryBuilder.build(is); 

//创建SqlSession对象，此时通过SqlSession对象所操作的sql都必须手动提交或回滚事务 
//SqlSession sqlSession = sqlSessionFactory.openSession(); 
//创建SqlSession对象，此时通过SqlSession对象所操作的sql都会自动提交 
SqlSession sqlSession = sqlSessionFactory.openSession(true); 

//通过代理模式创建UserMapper接口的代理实现类对象 UserMapper 
userMapper = sqlSession.getMapper(UserMapper.class); 
//调用UserMapper接口中的方法，就可以根据UserMapper的全类名匹配元素文件，
//通过调用的方法名匹配 映射文件中的SQL标签，并执行标签中的SQL语句 
int result = userMapper.insertUser(); 
//sqlSession.commit(); 
System.out.println("结果："+result);
```

+ `SqlSession`：代表Java程序和数据库之间的会话。（HttpSession是Java程序和浏览器之间的会话）
+ `SqlSessionFactory`： 是“生产”`SqlSession的`“工厂”
+ 工厂模式：如果创建某一个对象，使用的过程基本固定，那么我们就可以把创建这个对象的相关代码封装到一个“工厂类”中，以后都使用这个工厂类来“生产”我们需要的对象。

## 3 核心配置文件详解
核心配置文件中的标签必须按照固定的顺序：  
`properties?,settings?,typeAliases?,typeHandlers?,objectFactory?,objectWrapperFactory?,reflectorFactory?,plugins?,environments?,databaseIdProvider?,mappers?`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration
PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <!--
        MyBatis核心配置文件中，标签的顺序：
        properties?,settings?,typeAliases?,typeHandlers?,
        objectFactory?,objectWrapperFactory?,reflectorFactory?,
        plugins?,environments?,databaseIdProvider?,mappers?
    -->
  <!--引入properties文件-->
  <properties resource="jdbc.properties"/>
  <!--设置类型别名-->
  <typeAliases>
    <!--
        typeAlias：设置某个类型的别名
        属性：
        type：设置需要设置别名的类型
        alias：设置某个类型的别名，若不设置该属性，那么该类型拥有默认的别名，即类名
        且不区分大小写
    -->
    <!--<typeAlias type="com.atguigu.mybatis.pojo.User"></typeAlias>-->
    <!--以包为单位，将包下所有的类型设置默认的类型别名，即类名且不区分大小写-->
    <package name="com.atguigu.mybatis.pojo"/>
  </typeAliases>

    <!--
        environments：配置多个连接数据库的环境
        属性：
        default：设置默认使用的环境的id
    -->
  <environments default="development">
    <!--
    environment：配置某个具体的环境
    属性：
    id：表示连接数据库的环境的唯一标识，不能重复
    -->
    <environment id="development">
    <!--
        transactionManager：设置事务管理方式
        属性：
        type="JDBC|MANAGED"
        JDBC：表示当前环境中，执行SQL时，使用的是JDBC中原生的事务管理方式，事
        务的提交或回滚需要手动处理
        MANAGED：被管理，例如Spring
    -->
      <transactionManager type="JDBC"/>
      <!--
    dataSource：配置数据源
    属性：
    type：设置数据源的类型
    type="POOLED|UNPOOLED|JNDI"
    POOLED：表示使用数据库连接池缓存数据库连接
    UNPOOLED：表示不使用数据库连接池
    JNDI：表示使用上下文中的数据源
    -->
      <dataSource type="POOLED">
        <!--设置连接数据库的驱动-->
        <property name="driver" value="${jdbc.driver}"/>
        <!--设置连接数据库的连接地址-->
        <property name="url" value="${jdbc.url}"/>
        <!--设置连接数据库的用户名-->
        <property name="username" value="${jdbc.username}"/>
        <!--设置连接数据库的密码-->
        <property name="password" value="${jdbc.password}"/>
      </dataSource>

    </environment>

    <environment id="test">
      <transactionManager type="JDBC"/>
      <dataSource type="POOLED">
        <property name="driver" value="com.mysql.cj.jdbc.Driver"/>
        <property name="url" value="jdbc:mysql://localhost:3306/ssmserverTimezone=UTC"/>
        <property name="username" value="root"/>
        <property name="password" value="123456"/>
      </dataSource>

    </environment>

  </environments>

  <!--引入映射文件-->
  <mappers>
    <!--<mapper resource="mappers/UserMapper.xml"/>-->
    <!--
        以包为单位引入映射文件
        要求：
        1、mapper接口所在的包要和映射文件所在的包一致
        2、mapper接口要和映射文件的名字一致
    -->
    <package name="com.atguigu.mybatis.mapper"/>
  </mappers>

</configuration>

```

## 4 增删改查
```xml
<!--int insertUser();--> 
<insert id="insertUser"> 
    insert into t_user values(null,'admin','123456',23,'男') 
</insert>


<!--int deleteUser();--> 
<delete id="deleteUser"> 
    delete from t_user where id = 7 
</delete>


<!--int updateUser();--> 
<update id="updateUser"> 
    update t_user set username='ybc',password='123' where id = 6 
</update>


<!--查询一个实体对象-->
<!--User getUserById();--> 
<select id="getUserById" resultType="com.atguigu.mybatis.bean.User"> 
    select * from t_user where id = 2 
</select>


<!-- 查询list集合-->
<!--List<User> getUserList();--> 
<select id="getUserList" resultType="com.atguigu.mybatis.bean.User"> 
    select * from t_user 
</select>

```

> 注意：  
1、查询的标签select必须设置属性resultType或resultMap，用于设置实体类和数据库表的映射  
关系  
resultType：自动映射，用于属性名和表中字段名一致的情况  
resultMap：自定义映射，用于一对多或多对一或字段名和属性名不一致的情况
>

## 5 获取参数值的两种方式
MyBatis获取参数值的两种方式：`${}`和`#{}`

+ `${}`的本质就是字符串拼接，`#{}`的本质就是占位符赋值
+ `${}`使用字符串拼接的方式拼接sql，若为字符串类型或日期类型的字段进行赋值时，需要手动加单引号；但是`#{}`使用占位符赋值的方式拼接sql，此时为字符串类型或日期类型的字段进行赋值时，可以自动添加单引号
1. 单个字面量类型的参数  
 若mapper接口中的方法参数为单个的字面量类型  
此时可以使用`${}`和`#{}`以任意的名称获取参数的值，注意`${}`需要手动加单引号
2. 多个字面量类型的参数  
 若mapper接口中的方法参数为多个时  
此时MyBatis会自动将这些参数放在一个`map`集合中，以`arg0,arg1...`为键，以参数为值；以`param1,param2...`为键，以参数为值；因此只需要通过`${}`和`#{}`访问map集合的键就可以获取相对应的值，注意`${}`需要手动加单引号
3. map集合参数的类型  
 若mapper接口中的方法需要的参数为多个时，此时可以手动创建map集合，将这些数据放在map中只需要通过`${}`和`#{}`访问map集合的键就可以获取相对应的值，注意`${}`需要手动加单引号
4. 实体类类型的参数  
 若mapper接口中的方法参数为实体类对象时此时可以使用`${}`和`#{}`，通过访问实体类对象中的属性名获取属性值，注意`${}`需要手动加单引号
5. 使用`@Param`标识参数  
 可以通过`@Param`注解标识mapper接口中的方法参数  
此时，会将这些参数放在map集合中，以@Param注解的value属性值为键，以参数为值；以`param1,param2...`为键，以参数为值；只需要通过`${}`和`#{}`访问map集合的键就可以获取相对应的值，注意`${}`需要手动加单引号

## 6 各种查询功能
1. 查询一个实体类对象

```java
/**
* 根据用户id查询用户信息
* @param id
* @return
*/
User getUserById(@Param("id") int id);
```

```xml
<!--User getUserById(@Param("id") int id);-->
<select id="getUserById" resultType="User">
select * from t_user where id = #{id}
</select>

```

2. 查询一个list集合

```java
/**

* 查询所有用户信息

* @return

*/

List<User> getUserList();
```

```xml
<!--List<User> getUserList();-->
<select id="getUserList" resultType="User">
select * from t_user
</select>

```

3. 查询单个数据

```java
/**
* 查询用户的总记录数
* @return
* 在MyBatis中，对于Java中常用的类型都设置了类型别名
* 例如： java.lang.Integer-->int|integer
* 例如： int-->_int|_integer
* 例如： Map-->map,List-->list
*/
int getCount();
```

```xml
<!--int getCount();-->
<select id="getCount" resultType="_integer">
select count(id) from t_user
</select>

```

4. 查询一条数据为map集合

```java
/**
* 根据用户id查询用户信息为map集合
* @param id
* @return
*/
Map<String, Object> getUserToMap(@Param("id") int id);
```

```xml
<!--Map<String, Object> getUserToMap(@Param("id") int id);-->
<!--结果： {password=123456, sex=男 , id=1, age=23, username=admin}-->
<select id="getUserToMap" resultType="map">
select * from t_user where id = #{id}
</select>

```

5. 查询多条数据为map集合

```java
/**
* 查询所有用户信息为map集合
* @return
* 将表中的数据以map集合的方式查询，一条数据对应一个map；若有多条数据，就会产生多个map集合，此
时可以将这些map放在一个list集合中获取
*/
List<Map<String, Object>> getAllUserToMap();
```

```xml
<!--Map<String, Object> getAllUserToMap();-->
<select id="getAllUserToMap" resultType="map">
select * from t_user
</select>

```

```java
/**
* 查询所有用户信息为map集合
* @return
* 将表中的数据以map集合的方式查询，一条数据对应一个map；若有多条数据，就会产生多个map集合，并且最终要以一个map的方式返回数据，此时需要通过@MapKey注解设置map集合的键，值是每条数据所对应的map集合
*/
@MapKey("id")
Map<String, Object> getAllUserToMap();
```

```xml
<!--Map<String, Object> getAllUserToMap();-->
<!--
    {
    1={password=123456, sex=男, id=1, age=23, username=admin},
    2={password=123456, sex=男, id=2, age=23, username=张三},
    3={password=123456, sex=男, id=3, age=23, username=张三}
    }
-->
<select id="getAllUserToMap" resultType="map">
select * from t_user
</select>

```

    - 方式一
    - 方式二

## 7 特殊SQL的执行
### 模糊查询
```java
/** 
* 测试模糊查询 
* @param mohu 
* @return 
* */ 
List<User> testMohu(@Param("mohu") String mohu);
```

```xml
<!--List<User> testMohu(@Param("mohu") String mohu);-->
<select id="testMohu" resultType="User">
    <!--select * from t_user where username like '%${mohu}%'-->
    <!--select * from t_user where username like concat('%',#{mohu},'%')-->
    select * from t_user where username like "%"#{mohu}"%"
</select>

```

### 批量删除
```java
/** 
* 批量删除 
* @param ids 
* @return 
* */ 
int deleteMore(@Param("ids") String ids);
```

```xml
<!--int deleteMore(@Param("ids") String ids);-->
<delete id="deleteMore">
delete from t_user where id in (${ids})
</delete>

```

### 动态设置表名
```java
/** 
* 动态设置表名，查询所有的用户信息 
* @param tableName 
* @return 
* */ 
List<User> getAllUser(@Param("tableName") String tableName);
```

```xml
<!--List<User> getAllUser(@Param("tableName") String tableName);-->
<select id="getAllUser" resultType="User">
select * from ${tableName}
</select>

```

### 添加功能获取自增的组件
```java
/** 
* 添加用户信息 
* @param user 
* @return 
* useGeneratedKeys：设置使用自增的主键 
* keyProperty：因为增删改有统一的返回值是受影响的行数，因此只能将获取的自增的主键放在传输的参 数user对象的某个属性中 */
int insertUser(User user);
```

```xml
<!--int insertUser(User user);--> 
<insert id="insertUser" useGeneratedKeys="true" keyProperty="id"> 
insert into t_user values(null,#{username},#{password},#{age},#{sex})
</insert>

```

## 8 自定义映射resultMap
### 8.1 resultMap处理字段和属性的映射关系
```xml

<!--
resultMap：设置自定义映射
属性：
id：表示自定义映射的唯一标识
type：查询的数据要映射的实体类的类型
子标签：
id：设置主键的映射关系
result：设置普通字段的映射关系
association：设置多对一的映射关系
collection：设置一对多的映射关系
属性：
property：设置映射关系中实体类中的属性名
column：设置映射关系中表中的字段名
-->

<resultMap id="userMap" type="User">

<id property="id" column="id"></id>

<result property="userName" column="user_name"></result>

<result property="password" column="password"></result>

<result property="age" column="age"></result>

<result property="sex" column="sex"></result>

</resultMap>

<!--List<User> testMohu(@Param("mohu") String mohu);-->

<select id="testMohu" resultMap="userMap">

<!--select * from t_user where username like '%${mohu}%'-->

select id,user_name,password,age,sex from t_user where user_name like

concat('%',#{mohu},'%')

</select>

```

### 8.2 多对一映射处理
### 8.3 一对多映射处理
## 9 动态SQL
### `if`
`if`标签可通过`test`属性的表达式进行判断，若表达式的结果为true，则标签中的内容会执行；反之标签中的内容不会执行

```xml
<!--List<Emp> getEmpListByCondition(Emp emp);-->

<select id="getEmpListByMoreTJ" resultType="Emp">
    select * from t_emp where 1=1
    <if test="ename != '' and ename != null">
    and ename = #{ename}
    </if>

    <if test="age != '' and age != null">
    and age = #{age}
    </if>

    <if test="sex != '' and sex != null">
    and sex = #{sex}
    </if>

</select>

```

### `where`
`where`和`if`一般结合使用：

1. 若`where`标签中的if条件都不满足，则where标签没有任何功能，即不会添加where关键字  
2. 若`where`标签中的if条件满足，则where标签会自动添加`where`关键字，并将条件最前方多余的and去掉

注意：where标签不能去掉条件最后多余的and

```xml
<select id="getEmpListByMoreTJ2" resultType="Emp">
    select * from t_emp
    <where>
        <if test="ename != '' and ename != null">
        ename = #{ename}
        </if>

        <if test="age != '' and age != null">
        and age = #{age}
        </if>

        <if test="sex != '' and sex != null">
        and sex = #{sex}
        </if>

    </where>

</select>

```

### `trim`
`trim`用于去掉或添加标签中的内容  
常用属性：  
`prefix`：在trim标签中的内容的前面添加某些内容  
`prefixOverrides`：在trim标签中的内容的前面去掉某些内容  
`suffix`：在trim标签中的内容的后面添加某些内容  
`suffixOverrides`：在trim标签中的内容的后面去掉某些内容

```xml
<select id="getEmpListByMoreTJ" resultType="Emp">
    select * from t_emp
    <trim prefix="where" suffixOverrides="and">
        <if test="ename != '' and ename != null">
        ename = #{ename} and
        </if>

        <if test="age != '' and age != null">
        age = #{age} and
        </if>

        <if test="sex != '' and sex != null">
        sex = #{sex}
        </if>

    </trim>

</select>

```

### `choose when otherwise`
`choose、when、 otherwise`相当于`if...else if..else`

```xml
<!--List<Emp> getEmpListByChoose(Emp emp);-->
<select id="getEmpListByChoose" resultType="Emp">
    select <include refid="empColumns"></include> from t_emp
    <where>
        <choose>
            <when test="ename != '' and ename != null">
            ename = #{ename}
            </when>

            <when test="age != '' and age != null">
            age = #{age}
            </when>

            <when test="sex != '' and sex != null">
            sex = #{sex}
            </when>

            <when test="email != '' and email != null">
            email = #{email}
            </when>

        </choose>

    </where>

</select>

```

### `foreach`
```xml
<!--int insertMoreEmp(List<Emp> emps);-->
<insert id="insertMoreEmp">
    insert into t_emp values
    <foreach collection="emps" item="emp" separator=",">
    (null,#{emp.ename},#{emp.age},#{emp.sex},#{emp.email},null)
    </foreach>

</insert>

<!--int deleteMoreByArray(int[] eids);-->
<delete id="deleteMoreByArray">
    delete from t_emp where
    <foreach collection="eids" item="eid" separator="or">
    eid = #{eid}
    </foreach>

</delete>

<!--int deleteMoreByArray(int[] eids);-->
<delete id="deleteMoreByArray">
    delete from t_emp where eid in
    <foreach collection="eids" item="eid" separator="," open="(" close=")">
    #{eid}
    </foreach>

</delete>

```

### `SQL片段`
SQL片段  
sql片段，可以记录一段公共sql片段，在使用的地方通过`include`标签进行引入

```xml
<sql id="empColumns">
    eid,ename,age,sex,did
</sql>

select <include refid="empColumns"></include> from t_emp
```

## 10 缓存
### 一级缓存
一级缓存是`SqlSession`级别的，通过同一个`SqlSession`查询的数据会被缓存，下次查询相同的数据，就会从缓存中直接获取，不会从数据库重新访问

使一级缓存失效的四种情况：

1. 不同的`SqlSession`对应不同的一级缓存
2. 同一个`SqlSession`但是查询条件不同
3. 同一个`SqlSession`两次查询期间执行了任何一次增删改操作
4. 同一个`SqlSession`两次查询期间手动清空了缓存

### 二级缓存
二级缓存是`SqlSessionFactory`级别，通过同一个`SqlSessionFactory`创建的`SqlSession`查询的结果会被缓存；此后若再次执行相同的查询语句，结果就会从缓存中获取

二级缓存开启的条件：

1. 在核心配置文件中，设置全局配置属性cacheEnabled="true"，默认为true，不需要设置
2. 在映射文件中设置标签`<cache/>`
3. 二级缓存必须在SqlSession关闭或提交之后有效
4. 查询的数据所转换的实体类类型必须实现序列化的接口

使二级缓存失效的情况：  
两次查询之间执行了任意的增删改，会使一级和二级缓存同时失效

### 二级缓存的相关配置
### MyBatis缓存查询的顺序
### 整合第三方缓存EHCache
## 11 逆向工程
正向工程：先创建Java实体类，由框架负责根据实体类生成数据库表。 Hibernate是支持正向工程的。  
**逆向工程**：先创建数据库表，由框架负责根据数据库表，反向生成如下资源：

+ Java实体类
+ Mapper接口
+ Mapper映射文件

### 创建逆向工程的步骤
1. 添加依赖和插件

```xml
<!-- 依赖MyBatis核心包 -->

<dependencies>

<dependency>
    <groupId>org.mybatis</groupId>

    <artifactId>mybatis</artifactId>    
    <version>3.5.7</version>

</dependency> 

<!-- junit测试 -->
<dependency>
    <groupId>junit</groupId>

    <artifactId>junit</artifactId>    
    <version>4.12</version>

    <scope>test</scope>

</dependency>

<!-- log4j日志 -->
<dependency>
    <groupId>log4j</groupId>

    <artifactId>log4j</artifactId>

    <version>1.2.17</version>

</dependency>

<dependency>
    <groupId>mysql</groupId>

    <artifactId>mysql-connector-java</artifactId>

    <version>8.0.16</version>

</dependency>

</dependencies>

<!-- 控制Maven在构建过程中相关配置 -->
<build>
    <!-- 构建过程中用到的插件 -->
    <plugins>
        <!-- 具体插件，逆向工程的操作是以构建过程中插件形式出现的 -->
        <plugin>
        <groupId>org.mybatis.generator</groupId>

        <artifactId>mybatis-generator-maven-plugin</artifactId>

        <version>1.3.0</version>

        <!-- 插件的依赖 -->
            <dependencies>
                <!-- 逆向工程的核心依赖 -->
                <dependency>
                <groupId>org.mybatis.generator</groupId>

                <artifactId>mybatis-generator-core</artifactId>

                <version>1.3.2</version>

                </dependency>

                <!-- MySQL驱动 -->    
                <dependency>
                <groupId>mysql</groupId>

                <artifactId>mysql-connector-java</artifactId>

                <version>8.0.16</version>

                </dependency>

            </dependencies>

        </plugin>

    </plugins>

</build>

```

2. 创建MyBatis的核心配置文件
3. 创建逆向工程的配置文件,文件名必须是generatorConfig.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE generatorConfiguration PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN" "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">

<generatorConfiguration>
    <!-targetRuntime: 执行生成的逆向工程的版本 MyBatis3Simple: 生成基本的CRUD（清新简洁版） MyBatis3: 生成带条件的CRUD（奢华尊享版） -->    
    <context id="DB2Tables" targetRuntime="MyBatis3"> <!-- 数据库的连接信息 -->    
        <jdbcConnection driverClass="com.mysql.cj.jdbc.Driver"
        connectionURL="jdbc:mysql://localhost:3306/mybatis? serverTimezone=UTC" userId="root"        
        password="123456"> </jdbcConnection> <!-- javaBean的生成策略-->        
        <javaModelGenerator targetPackage="com.atguigu.mybatis.pojo" targetProject=".\src\main\java">        
        <property name="enableSubPackages" value="true" />    
        <property name="trimStrings" value="true" />        
        </javaModelGenerator> <!--    
        SQL映射文件的生成策略 -->        
        <sqlMapGenerator targetPackage="com.atguigu.mybatis.mapper"        
        targetProject=".\src\main\resources">        
        <property name="enableSubPackages" value="true" />        
        </sqlMapGenerator> <!--        
        Mapper接口的生成策略 -->        
        <javaClientGenerator type="XMLMAPPER" targetPackage="com.atguigu.mybatis.mapper"        
        targetProject=".\src\main\java">        
        <property name="enableSubPackages" value="true" />        
        </javaClientGenerator> <!--        
        逆向分析的表 --> <!--        
        tableName设置为*号，可以对应所有表，此时不写domainObjectName --> <!--        
        domainObjectName属性指定生成出来的实体类的类名 -->        
        <table tableName="t_emp" domainObjectName="Emp" />        
        <table tableName="t_dept" domainObjectName="Dept" />    
    </context>

</generatorConfiguration>

```

4. 执行MBG插件的generate目标

QCB查询

```java
@Test public void testMBG(){ 
    try { 
        InputStream is = Resources.getResourceAsStream("mybatis-config.xml"); 
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is); 
        SqlSession sqlSession = sqlSessionFactory.openSession(true); EmpMapper mapper = sqlSession.getMapper(EmpMapper.class); 
        //查询所有数据 
        /*List<Emp> list = mapper.selectByExample(null);
        list.forEach(emp -> System.out.println(emp));*/
        //根据条件查询 
        /*EmpExample example = new EmpExample();
        example.createCriteria().andEmpNameEqualTo("张 三").andAgeGreaterThanOrEqualTo(20); 
        example.or().andDidIsNotNull(); List<Emp> list = mapper.selectByExample(example);
        list.forEach(emp -> System.out.println(emp));*/

        mapper.updateByPrimaryKeySelective(new Emp(1,"admin",22,null,"456@qq.com",3));
        } catch (IOException e) { 
        e.printStackTrace(); 
        }
}
```

## 分页插件
pageHelper  
添加依赖

```xml
<dependency>
    <groupId>com.github.pagehelper</groupId>

    <artifactId>pagehelper</artifactId>

    <version>5.2.0</version>

</dependency>

```

配置分页插件

```xml
<plugins>
    <!--设置分页插件-->
    <plugin interceptor="com.github.pagehelper.PageInterceptor"></plugin>

</plugins>

```

使用

