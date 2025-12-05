 
https://liaoxuefeng.com/books/python


查看 python 版本

```python
import sys
print(sys.version)           # 完整字符串，带编译信息
print(sys.version_info)      # 具名元组 (major, minor, micro, …)
```

```python
import platform
print(platform.python_version())      # 例：'3.11.2'
print(platform.python_version_tuple())  # ('3', '11', '2')
```
# python基础

## 数据类型和变量
整数
浮点数
字符串
布尔值

`and`  `or`    `not`


 空值 `None`


字符 编码

```
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

```


## 函数
在Python中定义函数，可以用**必选参数、默认参数、可变参数、关键字参数和命名关键字参数**，这5种参数都可以组合使用。但是请注意，参数定义的顺序必须是：必选参数、默认参数、可变参数、命名关键字参数和关键字参数。

# 高级特性

## generator

```sh
>>> L = [x * x for x in range(10)]
>>> L
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
>>> g = (x * x for x in range(10))
>>> g
<generator object <genexpr> at 0x1022ef630>

```

`yeild`


# 面向对象

`__call__`

`self.__class__`         指向类

```python
hasattr(emp1, 'age')    # 如果存在 'age' 属性返回 True。
getattr(emp1, 'age')    # 返回 'age' 属性的值
setattr(emp1, 'age', 8) # 添加属性 'age' 值为 8
delattr(emp1, 'age')    # 删除属性 'age'
```

- `__dict__`      类的属性（包含一个字典，由类的数据属性组成）
- `__doc__`        类的文档字符串
- `__name__`      类名
- `__module__`    类定义所在的模块（类的全名是`__main__.className`，如果类位于一个导入模块mymod中，那么className.__module__ 等于 mymod）
- `__base`      类的所有父类构成元素（包含了一个由所有父类组成的元组）

## 基础重载方法
- `__init__`
- `__del__`
- `__repr__`
- `__str__`
- `__cmp__`


## 类的属性与方法

- `__private_attr`


### 单下划线、双下划线、头尾双下划线说明：

- `__foo__`: 定义的是特殊方法，一般是系统定义名字 ，类似 `__init__()` 之类的。
    
- `_foo`: 以单下划线开头的表示的是 `protected` 类型的变量，即保护类型只能允许其本身与子类进行访问，不能用于 `from module import *`
    
- ``__foo``: 双下划线的表示的是私有类型(private)的变量, 只能是允许这个类本身进行访问了。

# Python中__init__.py文件的作用

`__init__.py`文件是Python包中的一个特殊文件，它有几个重要作用：

## 1. 标识目录为Python包

- 当Python解释器看到一个目录中包含`__init__.py`文件时，它会将该目录视为一个Python包
- 没有`__init__.py`的目录只是一个普通目录，不能被导入为包

## 2. 执行包初始化代码

- 当包或包中的模块被导入时，`__init__.py`文件会自动执行
- 可以在这里设置包级别的变量、导入必要的模块或执行初始化操作

## 3. 控制包的导入行为

- 通过在`__init__.py`中定义`__all__`变量，可以控制`from package import *`的行为
- 可以在`__init__.py`中导入子模块，使它们在包级别可用

## 4. 简化导入路径

- 可以在`__init__.py`中导入子模块中的类或函数，使它们可以直接从包中导入
- 例如：`from package.submodule import SomeClass`，然后用户可以直接`from package import SomeClass`

## 5. 包级别的命名空间

- `__init__.py`中定义的变量和函数会成为包命名空间的一部分
- 可以在包级别共享数据和功能

## 6. 版本信息和元数据

- 常用于定义包的版本信息：`__version__ = "1.0.0"`
- 可以包含包的文档字符串，描述包的用途

## 7. 向后兼容性

- 在Python 3.3之前，`__init__.py`是必需的才能将目录识别为包
- 虽然现在有了命名空间包（不需要`__init__.py`），但传统包仍然使用它

## 示例

```python
# __init__.py
"""这是一个示例包"""

__version__ = "1.0.0"
__all__ = ["function1", "Class1"]

# 导入子模块中的函数，使它们在包级别可用
from .module1 import function1
from .module2 import Class1

# 包级别的初始化代码
print("包已初始化")
```

总之，`__init__.py`是Python包的核心组成部分，它不仅标识目录为包，还控制着包的导入行为和初始化过程。



# 常用模块

## collections

### nameedtuple

### deque
```python
>>> from collections import deque
>>> q = deque(['a', 'b', 'c'])
>>> q.append('x')
>>> q.appendleft('y')
>>> q
deque(['y', 'a', 'b', 'c', 'x'])
```

###  defaultdict

### ordereddict

```python
>>> from collections import OrderedDict
>>> d = dict([('a', 1), ('b', 2), ('c', 3)])
>>> d # dict的Key是无序的
{'a': 1, 'c': 3, 'b': 2}
>>> od = OrderedDict([('a', 1), ('b', 2), ('c', 3)])
>>> od # OrderedDict的Key是有序的
OrderedDict([('a', 1), ('b', 2), ('c', 3)])

```

### chainMap

### counter

# 常用第三方模块



# pypi

**PyPI** (全称 **Python Package Index**) 就是 **Python 语言的“应用商店”或“代码仓库”**。

pip   安装工具，从 pypi 仓库中拉取工具



# 其他

`python -m` 是 Python 解释器的一个命令行选项，用于**以模块（module）的方式运行一个 Python 模块**，而不是直接运行一个脚本文件。

---

### 语法：

```bash
python -m <模块名> [参数...]
```

---

### 作用解释：

- **`-m`** 表示“module mode”（模块模式）。
- 它会查找 `<模块名>` 对应的 Python 模块（可以是标准库模块、第三方模块或你自己写的包中的模块），并执行该模块的 `__main__.py` 文件（如果是包）或者直接运行该模块（如果是一个 `.py` 文件且在 Python 路径中）。
- 使用 `-m` 的好处是：**不需要知道模块文件的具体路径**，只要它在 `sys.path` 中（比如已安装的包、当前目录等）。

---

### 常见例子：

1. **运行内置模块**
    
    ```bash
    python -m http.server 8000
    ```
    
    启动一个简单的 HTTP 服务器（Python 3 内置模块）。
    
2. **运行 pip（推荐方式）**
    
    ```bash
    python -m pip install requests
    ```
    
    这比直接运行 `pip` 更可靠，能确保使用的是当前 `python` 对应的 pip。
    
3. **运行你自己写的包**  
    假设你有一个包结构如下：
    
    ```
    mypackage/
        __init__.py
        __main__.py
    ```
    
    那么你可以这样运行它：
    
    ```bash
    python -m mypackage
    ```
    
    Python 会自动执行 `mypackage/__main__.py`。
    
4. **运行单个模块文件（需在 PYTHONPATH 中）**  
    如果你有 `mymodule.py` 在当前目录：
    
    ```bash
    python -m mymodule
    ```
    
    注意：不能写成 `python -m mymodule.py`（不能带 `.py` 后缀）。
    

---

### 与直接运行脚本的区别：

|方式|示例|特点|
|---|---|---|
|直接运行脚本|`python script.py`|把 `script.py` 当作普通脚本执行，`__name__ == '__main__'`|
|用 `-m` 运行模块|`python -m script`|把 `script` 当作模块导入后执行，会正确设置包上下文和 `sys.path`|

尤其在涉及**相对导入**（relative import）时，必须使用 `python -m` 才能正常工作。

---

### 小贴士：

- 不要加 `.py` 后缀：✅ `python -m mymod` ❌ `python -m mymod.py`
- 模块必须在 Python 的模块搜索路径中（如当前目录、site-packages 等）
- 可用于调试、测试、启动工具等场景

