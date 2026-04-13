# spring5

- [【Spring5】尚硅谷Spring5教程]( https://www.bilibili.com/video/BV1yq4y1Q7N7/?p=19&share_source=copy_web&vd_source=e65574be5c4ff436d099ae0526b97fd9)
- [廖雪峰-spring](https://liaoxuefeng.com/books/java/spring/index.html)

## IOC

```java
@Component
public class MailService {
    @Autowired(required = false)
    ZoneId zoneId = ZoneId.systemDefault();

    @PostConstruct
    public void init() {
        System.out.println("Init mail service with zoneId = " + this.zoneId);
    }

    @PreDestroy
    public void shutdown() {
        System.out.println("Shutdown mail service");
    }
}
```



`beanNameAware`
`BeanClassLoadeAware`
`beanFactoryAware`



## Aware
是的，Spring 框架中还有其他类似的接口，这些接口允许 Bean 在被 Spring 容器管理时感知到更多的上下文信息。以下是一些常见的接口：

### 1. `BeanFactoryAware`
这个接口允许一个 Bean 感知到它所在的 Spring 容器（即 `BeanFactory`）。通过实现这个接口，Bean 可以在运行时获取到 `BeanFactory` 的引用，从而可以访问容器中的其他 Bean 或者执行一些与容器相关的操作。

### 2. `ApplicationContextAware`
这个接口是 `BeanFactoryAware` 的扩展，它允许一个 Bean 感知到它所在的 Spring 应用上下文（即 `ApplicationContext`）。通过实现这个接口，Bean 可以在运行时获取到 `ApplicationContext` 的引用，从而可以访问上下文中的其他 Bean、事件系统、资源文件等。

### 3. `EnvironmentAware`
这个接口允许一个 Bean 感知到它所在的 Spring 环境（即 `Environment`）。通过实现这个接口，Bean 可以在运行时获取到 `Environment` 的引用，从而可以访问环境中的属性、配置文件等。

### 4. `ResourceLoaderAware`
这个接口允许一个 Bean 感知到它所在的 Spring 资源加载器（即 `ResourceLoader`）。通过实现这个接口，Bean 可以在运行时获取到 `ResourceLoader` 的引用，从而可以访问和操作 Spring 管理的资源文件。

### 5. `MessageSourceAware`
这个接口允许一个 Bean 感知到它所在的 Spring 消息源（即 `MessageSource`）。通过实现这个接口，Bean 可以在运行时获取到 `MessageSource` 的引用，从而可以访问和操作 Spring 管理的国际化消息。

### 6. `ApplicationEventPublisherAware`
这个接口允许一个 Bean 感知到它所在的 Spring 事件发布器（即 `ApplicationEventPublisher`）。通过实现这个接口，Bean 可以在运行时获取到 `ApplicationEventPublisher` 的引用，从而可以发布和处理 Spring 应用事件。

### 7. `EntityFactoryAware`
这个接口允许一个 Bean 感知到它所在的 Spring 实体工厂（即 `EntityFactory`）。通过实现这个接口，Bean 可以在运行时获取到 `EntityFactory` 的引用，从而可以访问和操作 Spring 管理的实体对象。

### 8. `BeanClassLoaderAware`
这个接口允许一个 Bean 感知到它所在的 Spring 类加载器（即 `ClassLoader`）。通过实现这个接口，Bean 可以在运行时获取到 `ClassLoader` 的引用，从而可以访问和操作 Spring 管理的类资源。

### 9. `BeanPostProcessor`
这个接口允许一个 Bean 在被 Spring 容器实例化之后，对其他 Bean 进行后处理。通过实现这个接口，Bean 可以在其他 Bean 的初始化之前或之后执行一些操作，例如修改 Bean 的属性、添加 Bean 的方法等。

### 10. `BeanFactoryPostProcessor`
这个接口允许一个 Bean 在被 Spring 容器实例化之前，对 `BeanFactory` 进行后处理。通过实现这个接口，Bean 可以在 `BeanFactory` 初始化之前执行一些操作，例如修改 `BeanFactory` 的配置、添加 `BeanFactory` 的后处理器等。

这些接口为 Spring 中的 Bean 提供了丰富的上下文信息和扩展能力，使得 Bean 可以更好地与 Spring 容器和应用上下文进行交互。



## beanPostProcessor
## AOP

## 事务

`jdbcTemplate`
