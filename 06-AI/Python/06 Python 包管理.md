# Python 包管理

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

---

## 3. 虚拟环境

### venv（Python 内置）

```bash
python -m venv .venv          # 创建虚拟环境
source .venv/bin/activate     # 激活（Linux/macOS）
.venv\Scripts\activate        # 激活（Windows）
deactivate                    # 退出虚拟环境
```

### 虚拟环境的作用

- 隔离项目依赖
- 避免版本冲突
- 便于项目迁移

---

## 4. uv

> 参考：[uv 中文文档](https://uv.doczh.com/)

uv 是一个快速的 Python 包管理工具，由 Rust 编写，速度比 pip 快 10-100 倍。

### 安装

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### 基本命令

```bash
uv init --name myproject      # 初始化项目
uv venv --python 3.12         # 创建虚拟环境
uv add requests               # 添加依赖
uv remove requests            # 移除依赖
uv sync                       # 同步依赖
uv run python script.py       # 运行脚本
```

### uv vs pip

| 特性 | uv | pip |
|------|----|----|
| 速度 | 快 10-100 倍 | 慢 |
| 依赖解析 | 更准确 | 有时会有问题 |
| 虚拟环境 | 内置支持 | 需要 venv |
| 锁文件 | 自动生成 | 需要额外工具 |

---

## 5. python -m 用法

以模块方式运行 Python 模块，而不是直接运行脚本文件。

**语法：**

```bash
python -m <模块名> [参数...]
```

**常见例子：**

```bash
python -m http.server 8000       # 启动 HTTP 服务器
python -m pip install requests   # 运行 pip（推荐方式）
python -m venv .venv             # 创建虚拟环境
python -m pytest                 # 运行测试
python -m mypackage              # 运行自己的包
```

**与直接运行脚本的区别：**

| 方式 | 示例 | 特点 |
|------|------|------|
| 直接运行脚本 | `python script.py` | 把 `script.py` 当作普通脚本执行 |
| 用 `-m` 运行模块 | `python -m script` | 把 `script` 当作模块导入后执行，会正确设置包上下文和 `sys.path` |

**注意：** 不要加 `.py` 后缀

---

## 6. python -c 用法

直接在命令行中执行一段 Python 代码字符串。

**语法：**

```bash
python -c "Python 代码语句"
```

**常见用法：**

```bash
python -c "print('Hello, world!')"
python -c "import sys; print(sys.version)"
python -c "print(2**10)"
python -c "import numpy; print(numpy.__version__)"
```

**与 `python -m` 的区别：**

| 选项 | 用途 |
|------|------|
| `python -c "code"` | 直接执行一段 Python **代码字符串** |
| `python -m module` | 运行一个已存在的 **模块或包** |

---

## 7. requirements.txt

### 格式

```text
requests==2.28.0
flask>=2.0.0
numpy>=1.20,<2.0
pandas  # 不指定版本
```

### 版本说明符

| 符号 | 含义 |
|------|------|
| `==` | 精确版本 |
| `>=` | 大于等于 |
| `<=` | 小于等于 |
| `>` | 大于 |
| `<` | 小于 |
| `~=` | 兼容版本（如 `~=1.4.2` 等价于 `>=1.4.2,<1.5.0`） |

---

## 8. pyproject.toml

现代 Python 项目的配置文件（PEP 517/518）：

```toml
[project]
name = "myproject"
version = "0.1.0"
dependencies = [
    "requests>=2.28.0",
]

[project.optional-dependencies]
dev = [
    "pytest>=7.0.0",
    "black>=22.0.0",
]

[build-system]
requires = ["setuptools>=45"]
build-backend = "setuptools.build_meta"
```