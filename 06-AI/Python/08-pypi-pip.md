# PyPI 与 pip

## 1. PyPI

**PyPI**（Python Package Index）是 Python 语言的"应用商店"或"代码仓库"。

**pip** 是安装工具，从 PyPI 仓库中拉取包。

---

## 2. pip

### 基本命令

```bash
pip install requests          # 安装包
pip install requests==2.28.0  # 安装指定版本
pip install -r requirements.txt  # 从文件安装

pip uninstall requests        # 卸载包
pip list                      # 列出已安装的包
pip show requests             # 显示包信息
pip freeze > requirements.txt # 导出依赖
```

### python -m pip

推荐使用 `python -m pip` 确保使用正确的 Python 环境：

```bash
python -m pip install requests
```

### 指定镜像源（-i）

使用 `-i` 参数可以指定包的下载源（镜像源）：

```bash
# 使用清华镜像安装
pip install requests -i https://pypi.tuna.tsinghua.edu.cn/simple

# 使用阿里云镜像安装
pip install requests -i https://mirrors.aliyun.com/pypi/simple/
```

**常用国内镜像源：**

| 镜像源 | 地址 |
|--------|------|
| 清华 | https://pypi.tuna.tsinghua.edu.cn/simple |
| 阿里云 | https://mirrors.aliyun.com/pypi/simple/ |
| 中科大 | https://pypi.mirrors.ustc.edu.cn/simple/ |
| 豆瓣 | https://pypi.douban.com/simple/ |
| 腾讯 | https://mirrors.cloud.tencent.com/pypi/simple/ |

**永久设置镜像源：**

```bash
# 设置全局默认镜像源
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# 查看当前配置
pip config list

# 删除配置
pip config unset global.index-url
```
