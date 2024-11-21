- [【Spring5】尚硅谷Spring5教程]( https://www.bilibili.com/video/BV1yq4y1Q7N7/?p=19&share_source=copy_web&vd_source=e65574be5c4ff436d099ae0526b97fd9)
- [廖雪峰-spring](https://liaoxuefeng.com/books/java/spring/index.html)

ioc

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
AOP

事务

`jdbcTemplate`