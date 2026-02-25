
## npm镜像

配置淘宝源

`npm config set registry https://registry.npmmirror.com`

`npm config set registry http://192.168.55.12:8001/nexus/repository/npm-all/`


淘宝：`https://registry.npmmirror.com/`
腾讯云：`https://mirrors.cloud.tencent.com/npm/`
CNPM：`https://r.cnpmjs.org/`

```bash
#查询当前使用的镜像源
npm get registry

#设置为淘宝镜像源 
npm config set registry https://registry.npmmirror.com/

#验证设置
npm get registry

#还原为官方源
npm config set registry https://registry.npmjs.org/ 
```