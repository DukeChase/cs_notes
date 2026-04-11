# Python 命令行工具：-m 和 -c

## python -m 用法

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

## python -c 用法

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
