# Spring
内容介绍

1. 框架概述
2. IOC容器
    1. IOC底层原理
    2. IOC接口（BeanFactory）
    3. IOC操作Bean管理（基于XML）
    4. IOC操作Bean管理（基于注解）
3. AOP
4. JdbcTemplate
5. 事务管理
6. Spring5新特性

## 1. Spring简介
1、Spring 是轻量级的开源的 JavaEE 框架  
2、Spring 可以解决企业应用开发的复杂性  
3、Spring 有两个核心部分：IOC 和 Aop  
（1）IOC：**控制反转，把创建对象过程交给 Spring 进行管理**  
（2）Aop：**面向切面，不修改源代码进行功能增强**  
4、Spring 特点  
（1）方便解耦，简化开发  
（2）Aop 编程支持  
（3）方便程序测试  
（4）方便和其他框架进行整合  
（5）方便进行事务操作  
（6）降低 API 开发难度

## IOC
### IOC概念和原理
思想  
IOC 就是一种反转控制的思想， 而 DI（Dependency Injection） 是对 IOC 的一种具体实现。

1. 控制反转，把对象创建和对象之间的调用过程，交给spring进行管理
2. 使用IOC的目的：为了降低耦合度

### IOC容器
IOC思想  
IOC：Inversion of Control，翻译过来是反转控制。

IOC容器在Spring中的实现  
Spring 的 IOC 容器就是 IOC 思想的一个落地的产品实现。IOC 容器中管理的组件也叫做 bean。在创建bean 之前，首先需要创建 IOC 容器。Spring 提供了 IOC 容器的两种实现方式（两个接口）：  
（1） `BeanFactory`  
（2） `ApplicationContext`

ApplicationContext的主要实现类

| 类型名 | 简介 |
| --- | --- |
| ClassPathXmlApplicationContext | 通过读取类路径下的 XML 格式的配置文件创建 IOC 容器对象 |
| FileSystemXmlApplicationContext | 通过文件系统路径读取 XML 格式的配置文件创建 IOC 容器对象 |
| ConfigurableApplicationContext | ApplicationContext 的子接口，包含一些扩展方法refresh() 和 close() ，让 ApplicationContext 具有启动、关闭和刷新上下文的能力。 |
| WebApplicationContext | 专门为 Web 应用准备，基于 Web 环境创建 IOC 容器对象，并将对象引入存入 ServletContext 域中。 |


### 基于XML管理bean
#### 1、入门案例
1. 引入依赖
2. 创建类

```java
public class HelloWorld {
public void sayHello(){
    System.out.println("helloworld");
    }
}
```

3. 创建Spring的配置文件
4. 在Spring的配置文件中配置bean

```xml
<!--
    配置HelloWorld所对应的bean，即将HelloWorld的对象交给Spring的IOC容器管理
    通过bean标签配置IOC容器所管理的bean
    属性：
    id：设置bean的唯一标识
    class：设置bean所对应类型的全类名
-->
<bean id="helloworld" class="com.atguigu.spring.bean.HelloWorld"></bean>

```

5. 创建测试类

```java
@Test
public void testHelloWorld(){
    ApplicationContext ac = new
        ClassPathXmlApplicationContext("applicationContext.xml");
        // 获取bean
    HelloWorld helloworld = (HelloWorld) ac.getBean("helloworld");
    helloworld.sayHello();
}
```

#### 2、获取bean
1. 根据**id**获取`ac.getBean("helloworld")`
2. 根据**类型**获取`ac.getBean(HelloWorld.class);`
3. 根据**类型和id**获取`ac.getBean("helloworld", HelloWorld.class)`

#### 3、依赖注入之setter注入
```xml
<bean id="studentOne" class="com.atguigu.spring.bean.Student">
    <!-- property标签：通过组件类的setXxx()方法给组件对象设置属性 -->
    <!-- name属性：指定属性名（这个属性名是getXxx()、setXxx()方法定义的，和成员变量无关）-->
    <!-- value属性：指定属性值 -->
    <property name="id" value="1001"></property>

    <property name="name" value="张三"></property>

    <property name="age" value="23"></property>

    <property name="sex" value="男"></property>

</bean>

```

#### 4、依赖注入之构造器注入
```xml
<bean id="studentTwo" class="com.atguigu.spring.bean.Student">
    <constructor-arg value="1002"></constructor-arg>

    <constructor-arg value="李四"></constructor-arg>

    <constructor-arg value="33"></constructor-arg>

    <constructor-arg value="女"></constructor-arg>

</bean>

```

#### 5、特殊值处理
+ null值

```xml
<property name="name">
    <null />
</property>

```

+ xml实体

```xml
<!-- 小于号在XML文档中用来定义标签的开始，不能随便使用 -->

<!-- 解决方案一：使用XML实体来代替 -->

<property name="expression" value="a < b"/>
```

+ CDATA节

```xml
<property name="expression">
    <!-- 解决方案二：使用CDATA节 -->
    <!-- CDATA中的C代表Character，是文本、字符的含义，CDATA就表示纯文本数据 -->
    <!-- XML解析器看到CDATA节就知道这里是纯文本，就不会当作XML标签或属性来解析 -->
    <!-- 所以CDATA节中写什么符号都随意 -->
    <value><![CDATA[a < b]]></value>

</property>

```

#### 6、为类类型属性赋值
1. 引用外部已声明的bean  

```xml
<bean id="studentFour" class="com.atguigu.spring.bean.Student">
    <property name="id" value="1004"></property>

    <property name="name" value="赵六"></property>

    <property name="age" value="26"></property>

    <property name="sex" value="女"></property>

    <!-- ref属性：引用IOC容器中某个bean的id，将所对应的bean为属性赋值 -->
    <property name="clazz" ref="clazzOne"></property>

</bean>

```

2. 内部bean

```xml
<bean id="studentFour" class="com.atguigu.spring.bean.Student">
    <property name="id" value="1004"></property>

    <property name="name" value="赵六"></property>

    <property name="age" value="26"></property>

    <property name="sex" value="女"></property>

    <property name="clazz">
        <!-- 在一个bean中再声明一个bean就是内部bean -->
        <!-- 内部bean只能用于给属性赋值，不能在外部通过IOC容器获取，因此可以省略id属性 -->
        <bean id="clazzInner" class="com.atguigu.spring.bean.Clazz">
        <property name="clazzId" value="2222"></property>

        <property name="clazzName" value="远大前程班"></property>

        </bean>

    </property>

</bean>

```

3. 级联属性赋值

```xml
<bean id="studentFour" class="com.atguigu.spring.bean.Student">
    <property name="id" value="1004"></property>

    <property name="name" value="赵六"></property>

    <property name="age" value="26"></property>

    <property name="sex" value="女"></property>

    <!-- 一定先引用某个bean为属性赋值，才可以使用级联方式更新属性 -->
    <property name="clazz" ref="clazzOne"></property>

    <property name="clazz.clazzId" value="3333"></property>

    <property name="clazz.clazzName" value="最强王者班"></property>

</bean>

```

#### 7、为数组类型属性赋值
```xml
<bean id="studentFour" class="com.atguigu.spring.bean.Student">
    <property name="id" value="1004"></property>

    <property name="name" value="赵六"></property>

    <property name="age" value="26"></property>

    <property name="sex" value="女"></property>

    <!-- ref属性：引用IOC容器中某个bean的id，将所对应的bean为属性赋值 -->
    <property name="clazz" ref="clazzOne"></property>

    <property name="hobbies">
        <array>
        <value>抽烟</value>

        <value>喝酒</value>        
        <value>烫头</value>

        </array>

    </property>

</bean>

```

#### 8、为集合类型属性赋值
1. 为List集合类型属性赋值

```xml
<bean id="clazzTwo" class="com.atguigu.spring.bean.Clazz">
    <property name="clazzId" value="4444"></property>

    <property name="clazzName" value="Javaee0222"></property>

    <property name="students">
        <list>
            <ref bean="studentOne"></ref>

            <ref bean="studentTwo"></ref>

            <ref bean="studentThree"></ref>

        </list>

    </property>

</bean>

```

2. 为Map集合类型属性赋值

```xml
<bean id="teacherOne" class="com.atguigu.spring.bean.Teacher">
    <property name="teacherId" value="10010"></property>

    <property name="teacherName" value="大宝"></property>

</bean>

<bean id="teacherTwo" class="com.atguigu.spring.bean.Teacher">
    <property name="teacherId" value="10086"></property>

    <property name="teacherName" value="二宝"></property>

</bean>

<bean id="studentFour" class="com.atguigu.spring.bean.Student">
    <property name="id" value="1004"></property>

    <property name="name" value="赵六"></property>

    <property name="age" value="26"></property>

    <property name="sex" value="女"></property>

    <!-- ref属性：引用IOC容器中某个bean的id，将所对应的bean为属性赋值 -->
    <property name="clazz" ref="clazzOne"></property>

    <property name="hobbies">
    <array>
        <value>抽烟</value>

        <value>喝酒</value>

        <value>烫头</value>

    </array>

    </property>

    <property name="teacherMap">
        <map>
            <entry>
                <key>
                    <value>10010</value>

                </key>

                <ref bean="teacherOne"></ref>

                </entry>

                <entry>
                <key>
                    <value>10086</value>

                </key>

            <ref bean="teacherTwo"></ref>

            </entry>

        </map>

    </property>

</bean>

```

3. 引用集合类型的bean

```xml
<!--list集合类型的bean-->
<util:list id="students">
    <ref bean="studentOne"></ref>

    <ref bean="studentTwo"></ref>

    <ref bean="studentThree"></ref>

</util:list>

<!--map集合类型的bean-->
<util:map id="teacherMap">
    <entry>
        <key>
        <value>10010</value>

        </key>

        <ref bean="teacherOne"></ref>

    </entry>

    <entry>
        <key>
        <value>10086</value>

        </key>

        <ref bean="teacherTwo"></ref>

    </entry>

</util:map>

<bean id="clazzTwo" class="com.atguigu.spring.bean.Clazz">
    <property name="clazzId" value="4444"></property>

    <property name="clazzName" value="Javaee0222"></property>

    <property name="students" ref="students"></property>

</bean>

<bean id="studentFour" class="com.atguigu.spring.bean.Student">
    <property name="id" value="1004"></property>

    <property name="name" value="赵六"></property>

    <property name="age" value="26"></property>

    <property name="sex" value="女"></property>

    <!-- ref属性：引用IOC容器中某个bean的id，将所对应的bean为属性赋值 -->
    <property name="clazz" ref="clazzOne"></property>

    <property name="hobbies">
        <array>
            <value>抽烟</value>

            <value>喝酒</value>

            <value>烫头</value>

        </array>

    </property>

    <property name="teacherMap" ref="teacherMap"></property>

</bean>

```

#### 9、p命名空间
#### 10、引入外部属性文件
1. 引入依赖

```xml
<!-- MySQL驱动 -->
<dependency>
<groupId>mysql</groupId>

<artifactId>mysql-connector-java</artifactId>

<version>8.0.16</version>

</dependency>

<!-- 数据源 -->
<dependency>
<groupId>com.alibaba</groupId>

<artifactId>druid</artifactId>

<version>1.0.31</version>

</dependency>

```

2. 创建外部属性文件

```properties
jdbc.user=root

jdbc.password=atguigu

jdbc.url=jdbc:mysql://localhost:3306/ssm?serverTimezone=UTC

jdbc.driver=com.mysql.cj.jdbc.Driver
```

3. 引入属性文件 `<context:property-placeholder location="classpath:jdbc.properties"/>`
4. 配置bean

```xml
<bean id="druidDataSource" class="com.alibaba.druid.pool.DruidDataSource">
    <property name="url" value="${jdbc.url}"/>
    <property name="driverClassName" value="${jdbc.driver}"/>
    <property name="username" value="${jdbc.user}"/>
    <property name="password" value="${jdbc.password}"/>
</bean>

```

 测试

```java
@Test
public void testDataSource() throws SQLException {
    ApplicationContext ac = new ClassPathXmlApplicationContext("spring
    datasource.xml");
    DataSource dataSource = ac.getBean(DataSource.class);
    Connection connection = dataSource.getConnection();
    System.out.println(connection);
}
```

#### 11、bean的作用域
概念：在Spring中可以通过配置bean标签的scope属性来指定bean的作用域范围，各取值含义参加下表：

| 取值 | 含义 | 创建对象时机 |
| --- | --- | --- |
| singleton | 在IOC容器中，这个bean的对象始终为单实例 | IOC容器初始化时 |
| prototype | 这个bean在IOC容器中有多个实例 | 获取bean时 |


#### 12、bean的生命周期
具体的生命周期过程

+ bean对象创建
+ 给bean对象设置属性
+ bean对象初始化之前操作（由bean的后置处理器负责）
+ bean对象初始化（需在配置bean是指定初始化方法）
+ bean初始化之后操作（由bean的后置处理器负责）
+ bean对象就绪可以使用
+ bean对象销毁（需在配置bean时指定销毁方法）
+ IOC容器关闭

#### 13、FactoryBean
`FactoryBean`是Spring提供的一种整合第三方框架的常用机制。和普通的bean不同，配置一个`FactoryBean`类型的`bean`，在获取`bean`的时候得到的并不是`class`属性中配置的这个类的对象，而是  
`getObject()`方法的返回值。通过这种机制，Spring可以帮我们把复杂组件创建的详细过程和繁琐细节都屏蔽起来，只把最简洁的使用界面展示给我们。  
将来我们整合Mybatis时，Spring就是通过FactoryBean机制来帮我们创建SqlSessionFactory对象的。

```java

    public class UserFactoryBean implements FactoryBean<User> {
        `@Override
        public User getObject() throws Exception {
        return new User();
        }
        @Override    
        public Class<?> getObjectType() {
        return User.class;
        }
    }
```

`<bean id="user" class="com.atguigu.bean.UserFactoryBean"></bean>`

```java
@Test
public void testUserFactoryBean(){
    //获取IOC容器
    ApplicationContext ac = new ClassPathXmlApplicationContext("spring
    factorybean.xml");
    User user = (User) ac.getBean("user");
    System.out.println(user);
}
```

#### 14、基于XML的自动装配
配置bean  
使用_**bean标签的autowire属性**_设置自动装配效果  
自动装配：  
根据指定的策略，在IOC容器中匹配某一个bean，自动为指定的bean中所依赖的类类型或接口类  
型属性赋值

##### 1. 自动装配方式：`byType`
根据类型匹配IOC容器中的某个兼容类型的bean，为属性自动赋值  
若在IOC中，没有任何一个兼容类型的bean能够为属性赋值，则该属性不装配，即值为默认值  
`null`  
若在IOC中，有多个兼容类型的bean能够为属性赋值，则抛出异常`NoUniqueBeanDefinitionException`

```xml
<bean id="userController"
class="com.atguigu.autowire.xml.controller.UserController" autowire="byType">
</bean>

<bean id="userService"
class="com.atguigu.autowire.xml.service.impl.UserServiceImpl" autowire="byType">
</bean>

<bean id="userDao" class="com.atguigu.autowire.xml.dao.impl.UserDaoImpl"></bean>

```

##### 2. 自动装配方式：`byName`
将自动装配的属性的属性名，作为bean的`id`在IOC容器中匹配相对应的bean进行赋值  

```xml
<bean id="userController"
class="com.atguigu.autowire.xml.controller.UserController" autowire="byName">
</bean>

<bean id="userService"
class="com.atguigu.autowire.xml.service.impl.UserServiceImpl" autowire="byName">
</bean>

<bean id="userServiceImpl"
class="com.atguigu.autowire.xml.service.impl.UserServiceImpl" autowire="byName">
</bean>

<bean id="userDao" class="com.atguigu.autowire.xml.dao.impl.UserDaoImpl"></bean>

<bean id="userDaoImpl" class="com.atguigu.autowire.xml.dao.impl.UserDaoImpl">
</bean>

```

### 基于注解管理bean
#### 标记与扫描
标识组件的常用注解:  

+ `@Component`：将类标识为普通组件
+ `@Controller`：将类标识为控制层组件
+ `@Service`：将类标识为业务层组件
+ `@Repository：` 将类标识为持久层组件

`@Controller、@Service、@Repository`这三个注解只是在@Component注解的基础上起了三个新的名字

扫描组件

```xml
<context:component-scan base-package="com.atguigu">
</context:component-scan>

```

指定要排除的组件

```xml
<context:component-scan base-package="com.atguigu">
<!-- context:exclude-filter标签：指定排除规则 -->
<!--
type：设置排除或包含的依据
type="annotation"，根据注解排除，expression中设置要排除的注解的全类名
type="assignable"，根据类型排除，expression中设置要排除的类型的全类名
-->
    <context:exclude-filter type="annotation"
expression="org.springframework.stereotype.Controller"/>
    <!--<context:exclude-filter type="assignable"
expression="com.atguigu.controller.UserController"/>-->
</context:component-scan>

```

仅扫描指定组件

```xml
<context:component-scan base-package="com.atguigu" use-default-filters="false">
<!-- context:include-filter标签：指定在原有扫描规则的基础上追加的规则 -->
<!-- use-default-filters属性：取值false表示关闭默认扫描规则 -->
<!-- 此时必须设置use-default-filters="false"，因为默认规则即扫描指定包下所有类 -->
<!--
    type：设置排除或包含的依据
    type="annotation"，根据注解排除，expression中设置要排除的注解的全类名
    type="assignable"，根据类型排除，expression中设置要排除的类型的全类名
-->
    <context:include-filter type="annotation"
expression="org.springframework.stereotype.Controller"/>
    <!--<context:include-filter type="assignable"
expression="com.atguigu.controller.UserController"/>-->
</context:component-scan>

```

#### 基于注解的自动装配
1. 导入依赖

```xml
<dependencies>  
    <!-- 基于Maven依赖传递性，导入spring-context依赖即可导入当前所需所有jar包 -->  
    <dependency>  
        <groupId>org.springframework</groupId>  
        <artifactId>spring-context</artifactId>  
        <version>5.3.1</version>  
    </dependency>    
    <!-- junit测试 -->  
    <dependency>  
        <groupId>junit</groupId>  
        <artifactId>junit</artifactId>  
        <version>4.12</version>  
        <scope>test</scope>  
    </dependency>

</dependencies>

```

    - `@Component`
    - `@Controller`
    - `@Service`
    - `Repository`
2. `@Autowired`注解
+ 通过注解+扫描所配置的`bean`的`id`，默认值为类的小驼峰，即类名的首字母为小写的结果  
+ 可以通过标识组件的注解的`value`属性值设置bean的自定义的id  
+ `@Autowired`:实现自动装配功能的注解
1. `@Autowired`注解能够标识的位置  
    - a>标识在成员变量上，此时不需要设置成员变量的set方法  
    - b>标识在set方法上  
    - c>标识在为当前成员变量赋值的有参构造上
2. `@Autowired`注解的原理  
    - 默认通过`byType`的方式，在IOC容器中通过类型匹配某个`bean`为属性赋值  
    - 若有多个类型匹配的`bean`，此时会自动转换为`byName`的方式实现自动装配的效果，即将要赋值的属性的属性名作为`bean`的id匹配某个`bean`为属性赋值  
    - 若`byType`和`byName`的方式都无妨实现自动装配，即IOC容器中有多个类型匹配的bean 且这些bean的id和要赋值的属性的属性名都不一致，此时抛异常：`NoUniqueBeanDefinitionException`  
    - 此时可以在要赋值的属性上，添加一个注解`@Qualifier`通过该注解的`value`属性值，指定某个`bean`的`id`，将这个`bean`为属性赋值
+ 注意：若IOC容器中没有任何一个类型匹配的bean，此时抛出异常：`NoSuchBeanDefinitionException`
+ 在`@Autowired`注解中有个属性`required`，默认值为true，要求必须完成自动装配  
+ 可以将required设置为false，此时能装配则装配，无法装配则使用属性的默认值

## AOP
### 代理模式
二十三种设计模式中的一种，属于结构型模式。它的作用就是通过提供一个_代理类_，让我们在调用目标方法的时候，不再是直接对目标方法进行调用，而是通过代理类间接调用。让不属于目标方法核心逻辑的代码从目标方法中剥离出来——_解耦_。调用目标方法时先调用代理对象的方法，减少对目标方法的调用和打扰，同时让附加功能能够集中在一起也有利于统一维护。

### AOP概念及相关术语
概述：AOP（Aspect Oriented Programming）是一种设计思想，是软件设计领域中的面向切面编程，它是面向对象编程的一种补充和完善，它以通过_预编译方式和运行期动态代理方式_实现，在不修改源代码的情况下给程序动态统一添加额外功能的一种技术。

相关术语

1. 横向关注点
2. 通知
3. 切面
4. 目标
5. 代理
6. 连接点
7. 切入点  
作用
+ 简化代码：把方法中固定位置的重复的代码抽取出来，让被抽取的方法更专注于自己的核心功能，提高内聚性。
+ 代码增强：把特定的功能封装到切面类中，看哪里有需要，就往上套，被套用了切面逻辑的方法就被切面给增强了。

### 基于注解的AOP
#### 技术说明
+ 动态代理（`InvocationHandler`）：JDK原生的实现方式，需要被代理的目标类必须实现_接口_。因为这个技术要求代理对象和目标对象实现同样的接口（兄弟两个拜把子模式）。
+ `cglib`：通过继承被代理的目标类（认干爹模式）实现代理，所以不需要目标类实现接口。
+ `AspectJ`：本质上是静态代理，将_代理逻辑“织入”被代理的目标类编译得到的字节码文件_，所以最终效果是动态的。`weaver`就是织入器。Spring只是借用了`AspectJ`中的注解。

#### 注解AOP准备工作
1. 添加依赖

```xml
<!-- spring-aspects会帮我们传递过来aspectjweaver -->
<dependency>
    <groupId>org.springframework</groupId>

    <artifactId>spring-aspects</artifactId>

    <version>5.3.1</version>

</dependency>

```

2. 准备被代理的目标资源

```java
public interface Calculator {
    int add(int i, int j);
    int sub(int i, int j);
    int mul(int i, int j);
    int div(int i, int j);
}
```

```java
@Component
public class CalculatorPureImpl implements Calculator {
    @Override
    public int add(int i, int j) {
        int result = i + j;
        System.out.println("方法内部 result = " + result);
        return result;
    }
    @Override
    public int sub(int i, int j) {
        int result = i - j;
        System.out.println("方法内部 result = " + result);
        return result;
    }

    @Override
    public int mul(int i, int j) {
        int result = i * j;
        System.out.println("方法内部 result = " + result);
        return result;
    }
    @Override
    public int div(int i, int j) {
        int result = i / j;
        System.out.println("方法内部 result = " + result);
        return result;
    }
}
```

3. 创建切面类并配置

```java
// @Aspect表示这个类是一个切面类
// @Component注解保证这个切面类能够放入IOC容器
@Aspect
@Component
public class LogAspect {
    @Before("execution(public int com.atguigu.aop.annotation.CalculatorImpl.*
(..))")
    public void beforeMethod(JoinPoint joinPoint){
        String methodName = joinPoint.getSignature().getName();
        String args = Arrays.toString(joinPoint.getArgs());
        System.out.println("Logger-->前置通知，方法名："+methodName+"，参
        数："+args);
    }
    @After("execution(* com.atguigu.aop.annotation.CalculatorImpl.*(..))")
    public void afterMethod(JoinPoint joinPoint){
        String methodName = joinPoint.getSignature().getName();
        System.out.println("Logger-->后置通知，方法名："+methodName);
    }
                       
    @AfterReturning(value = "execution(*
com.atguigu.aop.annotation.CalculatorImpl.*(..))", returning = "result")
    public void afterReturningMethod(JoinPoint joinPoint, Object result){
        String methodName = joinPoint.getSignature().getName();
        System.out.println("Logger-->返回通知，方法名："+methodName+"，结
        果："+result);
    }

@AfterThrowing(value = "execution(*
com.atguigu.aop.annotation.CalculatorImpl.*(..))", throwing = "ex")
    public void afterThrowingMethod(JoinPoint joinPoint, Throwable ex){
        String methodName = joinPoint.getSignature().getName();
        System.out.println("Logger-->异常通知，方法名："+methodName+"，异常："+ex);
    }

@Around("execution(* com.atguigu.aop.annotation.CalculatorImpl.*(..))")
    public Object aroundMethod(ProceedingJoinPoint joinPoint){
        String methodName = joinPoint.getSignature().getName();
        String args = Arrays.toString(joinPoint.getArgs());
        Object result = null;
        try {
        System.out.println("环绕通知-->目标对象方法执行之前");
        //目标对象（连接点）方法的执行
        result = joinPoint.proceed();
        System.out.println("环绕通知-->目标对象方法返回值之后");
        } catch (Throwable throwable) {
        throwable.printStackTrace();
        System.out.println("环绕通知-->目标对象方法出现异常时");
        } finally {
        System.out.println("环绕通知-->目标对象方法执行完毕");
        }
        return result;
    }
}
```

在spring的配置文件中配置：

```xml
<!--
    基于注解的AOP的实现：
    1、将目标对象和切面交给IOC容器管理（注解+扫描）
    2、开启AspectJ的自动代理，为目标对象自动生成代理
    3、将切面类通过注解@Aspect标识
-->
<context:component-scan base-package="com.atguigu.aop.annotation">
</context:component-scan>

<aop:aspectj-autoproxy />
```

各种通知

+ 前置通知：使用`@Before`注解标识，在被代理的目标方法前执行
+ 返回通知：使用`@AfterReturning`注解标识，在被代理的目标方法成功结束后执行（寿终正寝）
+ 异常通知：使用`@AfterThrowing`注解标识，在被代理的目标方法异常结束后执行（死于非命）
+ 后置通知：使用`@After`注解标识，在被代理的目标方法最终结束后执行（盖棺定论）
+ 环绕通知：使用@Around注解标识，使用try...catch...finally结构围绕整个被代理的目标方法，包括上面四种通知对应的所有位置

#### 切入点表达式语法
#### 重用切入表达式
1. 声明

```java
@PointCut("excution(* com.atguigu.aop.annotation.*.*(..))")
public void pointCut(){}
```

2. 在同一个切面中使用

```java
@Before("pointCut()")
public void beforeMethod(JoinPoint joinPoint){
    String methodName = joinPoint.getSignature().getName();
    String args = Arrays.toString(joinPoint.getArgs());
    System.out.println("Logger-->前置通知，方法名："+methodName+"，参数："+args);
}
```

3. 在不同切面中使用

```java
@Before("com.atguigu.aop.CommonPointCut.pointCut()")
public void beforeMethod(JoinPoint joinPoint){
    String methodName = joinPoint.getSignature().getName();
    String args = Arrays.toString(joinPoint.getArgs());    
    System.out.println("Logger-->前置通知，方法名："+methodName+"，参数："+args);

}
```

#### 获取通知的相关信息
1. 获取连接点信息
2. 获取目标方法返回值
3. 获取目标方法异常

#### 环绕通知
#### 切面的优先级
### 基于XML的AOP（了解）
## 声明式事务
### JdbcTemplate
### 声明式事务概念
编程式事务

```java
Connection conn = ...;
try {
// 开启事务：关闭事务的自动提交conn.setAutoCommit(false);
// 核心操作
// 提交事务
conn.commit();
}catch(Exception e){
// 回滚事务
conn.rollBack();
}finally{
conn.close();
}
```

声明式事务  
既然事务控制的代码有规律可循，代码的结构基本是确定的，所以框架就可以将固定模式的代码抽取出来，进行相关的封装。  
封装起来后，我们只需要在配置文件中进行简单的配置即可完成操作。  
好处1：提高开发效率  
好处2：消除了冗余的代码  
好处3：框架会综合考虑相关领域中在实际开发环境下有可能遇到的各种问题，进行了健壮性、性  
能等各个方面的优化  
所以，我们可以总结下面两个概念：  
编程式：自己写代码实现功能  
声明式：通过配置让框架实现功能

### 基于注解的声明式事务
#### 注解声明式事务准备工作
```xml
<!-- 基于Maven依赖传递性，导入spring-context依赖即可导入当前所需所有jar包 -->  
<dependency>  
    <groupId>org.springframework</groupId>  
    <artifactId>spring-context</artifactId>  
    <version>5.3.1</version>  
</dependency>  
<!-- Spring 持久化层支持jar包 -->  
<!-- Spring 在执行持久化层操作、与持久化层技术进行整合过程中，需要使用orm、jdbc、tx三个  
jar包 -->  
<!-- 导入 orm 包就可以通过 Maven 的依赖传递性把其他两个也导入 -->  
<dependency>  
    <groupId>org.springframework</groupId>  
    <artifactId>spring-orm</artifactId>  
    <version>5.3.1</version>  
</dependency>  
<!-- Spring 测试相关 -->  
<dependency>  
    <groupId>org.springframework</groupId>  
    <artifactId>spring-test</artifactId>  
    <version>5.3.1</version>  
</dependency>  
<!-- junit测试 -->  
<dependency>  
    <groupId>junit</groupId>  
    <artifactId>junit</artifactId>  
    <version>4.13.2</version>  
    <scope>test</scope>  
</dependency>  
<!-- MySQL驱动 -->  
<dependency>  
    <groupId>mysql</groupId>  
    <artifactId>mysql-connector-java</artifactId>  
    <version>8.0.16</version>  
</dependency>  
<!-- 数据源 -->  
<dependency>  
    <groupId>com.alibaba</groupId>  
    <artifactId>druid</artifactId>  
    <version>1.0.31</version>  
</dependency>  
<!-- spring-aspects会帮我们传递过来aspectjweaver -->  
<dependency>  
    <groupId>org.springframework</groupId>  
    <artifactId>spring-aspects</artifactId>  
    <version>5.3.1</version>  
</dependency>

```

#### 加入事务
1. 添加事务配置

```xml
<bean id="transactionManager"
class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
<property name="dataSource" ref="dataSource"></property>

</bean>

<!
开启事务的注解驱动
通过注解@Transactional所标识的方法或标识的类中所有的方法，都会被事务管理器管理事务
>
<! transaction manager属性的默认值是transactionManager，如果事务管理器bean的id正好就
是这个默认值，则可以省略这个属性 >
<tx:annotation driven transaction manager="transactionManager" />
```

2. 添加事务注解  
因为service层表示业务逻辑层，一个方法表示一个完成的功能，因此处理事务一般在`service`层处理  
在`BookServiceImpl`的`buybook()`添加注解`@Transactional`

`@Transactional`注解标识的位置  
`@Transactional`标识在方法上，咋只会影响该方法  
`@Transactional`标识的类上，咋会影响类中所有的方法

#### 事务属性：只读
`@Transactional(readOnly = true)`

#### 事务属性：超时
`@Transactional(timeout = 3)`

#### 事务属性：回滚策略
声明式事务默认只针对运行时异常回滚，编译时异常不回滚。  
可以通过@Transactional中相关属性设置回滚策略  
rollbackFor属性：需要设置一个Class类型的对象  
rollbackForClassName属性：需要设置一个字符串类型的全类名  
noRollbackFor属性：需要设置一个Class类型的对象  
rollbackFor属性：需要设置一个字符串类型的全类名

#### 事务属性：事务隔离级别
数据库系统必须具有隔离并发运行各个事务的能力，使它们不会相互影响，避免各种并发问题。一个事务与其他事务隔离的程度称为隔离级别。SQL标准中规定了多种事务隔离级别，不同隔离级别对应不同的干扰程度，隔离级别越高，数据一致性就越好，但并发性越弱。  
隔离级别一共有四种：

+ 读未提交：READ UNCOMMITTED  
允许Transaction01读取Transaction02未提交的修改。
+ 读已提交：READ COMMITTED、  
要求Transaction01只能读取Transaction02已提交的修改。
+ 可重复读：REPEATABLE READ  
确保Transaction01可以多次从一个字段中读取到相同的值，即Transaction01执行期间禁止其它事务对这个字段进行更新。
+ 串行化：SERIALIZABLE  
确保Transaction01可以多次从一个表中读取到相同的行，在Transaction01执行期间，禁止其它事务对这个表进行添加、更新、删除操作。可以避免任何并发问题，但性能十分低下。

```java
@Transactional(isolation = Isolation.DEFAULT)//使用数据库默认的隔离级别
@Transactional(isolation = Isolation.READ UNCOMMITTED)//读未提交@Transactional(isolation = Isolation.READ COMMITTED)//读已提交@Transactional(isolation = Isolation.REPEATABLE READ)//可重复读@Transactional(isolation = Isolation.SERIALIZABLE)//串行化
```

#### 事务属性：事务传播行为
@Transactional(propagation = Propagation.REQUIRED)，  
@Transactional(propagation = Propagation.REQUIRES_NEW)

