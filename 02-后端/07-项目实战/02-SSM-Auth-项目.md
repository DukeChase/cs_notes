[【【尚硅谷】SSM项目教程，SSM+SpringBoot+SpringSecurity框架整合项目】]( https://www.bilibili.com/video/BV1ad4y1y7LU/?share_source=copy_web&vd_source=e65574be5c4ff436d099ae0526b97fd9)

三层架构
controler
service
dao（mapper）


swagger整合
knif4j


# API管理
`@Api`
`@ApiOperation`

```java
@Api(tags = "角色管理")
@RestController
@RequestMapping("/admin/system/sysRole")
public class SysRoleController {

    @Autowired
    private SysRoleService sysRoleService;

    @ApiOperation(value = "获取全部角色列表")
    @GetMapping("/findAll")
    public Result<List<SysRole>> findAll() {
        List<SysRole> roleList = sysRoleService.list();
        return Result.ok(roleList);
    }
}
```

项目路径/doc.html