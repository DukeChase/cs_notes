 
[廖雪峰python教程](https://liaoxuefeng.com/books/python/introduction/index.html)

# python基础

## 数据类型和变量
- 整数
- 浮点数
- 字符串
- 布尔值

`and`  `or`    `not`


 空值 `None`


字符 编码

```
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
```


##  list  tuple
```shell
>>> classmates = ['Michael', 'Bob', 'Tracy']
>>> classmates
['Michael', 'Bob', 'Tracy']

```


```shell
>>> classmates = ('Michael', 'Bob', 'Tracy')
```
## dict    set
dict
```python
>>> d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
>>> d['Michael']
95
```

set
```python
>>> s = {1, 2, 3}
>>> s
{1, 2, 3}

```
## 函数
在Python中定义函数，可以用**必选参数、默认参数、可变参数、关键字参数和命名关键字参数**，这5种参数都可以组合使用。但是请注意，参数定义的顺序必须是：必选参数、默认参数、可变参数、命名关键字参数和关键字参数。


[How to Use Python Lambda Functions](https://realpython.com/python-lambda/)

# 高级特性

## 列表生成式

```sh
>>> [x * x for x in range(1, 11)]
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

```
## 生成器generator

```sh
# 列表生成式
>>> L = [x * x for x in range(10)]
>>> L
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
# 要创建一个generator，有很多种方法。第一种方法很简单，只要把一个列表生成式的`[]`改成`()`，就创建了一个generator：
>>> g = (x * x for x in range(10))
>>> g
<generator object <genexpr> at 0x1022ef630>
```

函数实现
```python
def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
        yield b
        a, b = b, a + b
        n = n + 1
    return 'done'
```

## 迭代器


# 函数式编程


# 面向对象

## `__call__`

python中的_call__。 是什么作用

好的，我们来详细讲解一下 Python 中的 `__call__` 方法。 我会用一个非常直观的比喻来开始，这样能帮助你更好地理解。 
### 核心比喻：
可调用的对象 想象一下，在 Python 的世界里： 
* **函数 (Function)**：就像一个 **遥控器**。你拿起它，按一下按钮（也就是调用它 `my_function()`），它就会执行一个特定的动作（比如开空调、换台）。 
* **普通对象 (Object)**：就像一个 **电视机**。它有很多属性（比如尺寸、品牌）和方法（比如 `turn_on()`、`change_channel()`），但你不能直接“按”电视机本身。 

那么，`__call__` 方法的作用就是：**让一个“电视机”（对象）也变成一个“遥控器”（可调用的东西）。** 

当你在一个对象上定义了 `__call__` 方法后，这个对象就成了一个 **“可调用对象” (Callable)**。你可以像调用函数一样去调用它。 

 --- 
### 详细解释 
`__call__` 是 Python 中的一个特殊方法（也叫魔法方法）。当你尝试像调用函数一样去调用一个对象时，Python 解释器就会自动调用这个对象的 `__call__` 方法。 **语法结构：** 

```python 
class MyClass: 
	def __call__(self, *args, **kwargs): 
		# *args 和 **kwargs 是为了能接受任意数量和类型的参数 
		print("你正在调用一个对象！") 
		print(f"位置参数: {args}") 
		print(f"关键字参数: {kwargs}") 
		# 在这里可以执行任何你想让这个对象“被调用时”做的事情 
		return "调用成功！"
```

**使用示例：** 

```python 
# 1. 创建一个类的实例（对象） 
my_instance = MyClass() 
# 2. 像调用函数一样调用这个对象 
result = my_instance(1, 2, name="Python", version=3.10) 
# 输出： 
# 你正在调用一个对象！ 
# 位置参数: (1, 2) # 关键字参数: {'name': 'Python', 'version': 3.10} print(result) 
# 输出： # 调用成功！
```

在这个例子中，`my_instance()` 这个动作触发了 `my_instance.__call__(1, 2, name="Python", version=3.10)` 的执行。 --- 
### 为什么需要 `__call__`？（它的作用和优势） 
你可能会问，为什么不直接定义一个普通的方法，比如 `my_instance.execute()` 呢？`__call__` 提供了以下几个独特的优势： 
#### 1. 状态保持 (State Retention) 
这是 `__call__` 最强大的功能。一个可调用对象可以在多次调用之间“记住”自己的状态（即实例变量）。 
**场景：** 实现一个简单的计数器。 
**使用 `__call__` 的方式：** 

```python 
class Counter: 
	def __init__(self): 
		self.count = 0 
		# 初始化计数器状态 
	def __call__(self): 
		self.count += 1 
		return self.count 

# 创建一个计数器实例 
counter_a = Counter() 
print(counter_a()) 
# 输出: 1 print(counter_a()) 
# 输出: 2 print(counter_a()) 
# 输出: 3 
# 这个对象“记住”了上一次调用后的 count 值 
print(f"当前计数值是: {counter_a.count}") 
# 输出: 当前计数值是: 3
```


**对比：如果用普通函数实现，你需要使用 `nonlocal` 或全局变量，代码会更复杂或不那么优雅。** 

```python
# 使用普通函数和 nonlocal 的方式 
def make_counter(): 
	count = 0 
	def counter(): 
		nonlocal count 
		count += 1 
		return count 
	return counter 
counter_b = make_counter() 
print(counter_b()) 
# 1 print(counter_b()) 
# 2
```

可以看到，使用 `__call__` 的方式在语义上更清晰，将数据（`count`）和行为（`__call__`）完美地封装在了一个对象中。 
#### 2. 简化调用接口 
当一个类的主要目的就是执行一个核心任务时，让它的实例可调用可以简化 API。用户拿到对象后，不用去查文档找 `run()`、`execute()` 还是 `start()` 方法，直接 `obj()` 就能执行核心功能。 
#### 3. 用作装饰器 (Decorators) 
Python 的装饰器本质上就是一个接受函数作为参数并返回一个新函数的可调用对象。很多高级的装饰器就是用类实现的，而 `__call__` 方法正是执行装饰逻辑的地方。 
**示例：一个简单的计时装饰器** 

```python
 import time 
 class TimerDecorator: 
	 def __init__(self, func): 
		 self.func = func 
	 # 保存被装饰的函数 
	 def __call__(self, *args, **kwargs): 
	 print(f"开始执行函数: {self.func.__name__}") 
	 start_time = time.time() 
	 # 调用原始函数 
	 result = self.func(*args, **kwargs) 
	 end_time = time.time() 
	 print(f"函数 {self.func.__name__} 执行完毕，耗时: {end_time - start_time:.4f}秒") 
	 return result 

 # 使用类装饰器 
 @TimerDecorator 
 def my_task(duration): print("任务开始...") 
 time.sleep(duration) 
 print("任务结束。") 
 return "任务结果" 
 # 调用被装饰后的函数 
 my_task(1) 
 # 输出： 
 # 开始执行函数: my_task 
 # 任务开始... 
 # 任务结束。 
 # 函数 my_task 执行完毕，耗时: 1.0012秒 

``` 
在这个例子中，`@TimerDecorator` 语法糖等价于 `my_task = TimerDecorator(my_task)`。`my_task` 变成了 `TimerDecorator` 的一个实例。当我们调用 `my_task(1)` 时，实际上调用的是这个实例的 `__call__` 方法。 
#### 4. 实现仿函数 (Functor) 
在函数式编程中，`__call__` 让 Python 的对象可以模拟函数的行为，这在 C++ 等语言中被称为“仿函数” (Functor)。这使得对象可以像函数一样被传递和使用，同时又拥有自己的状态。 -

--- 
### 总结 

| 特性       | 描述                                                         |
| -------- | ---------------------------------------------------------- |
| **是什么**  | Python 的一个特殊方法 (`__call__`)。                               |
| **作用**   | 让一个对象变得 **可调用 (Callable)**，即可以像函数一样使用 `()` 运算符来调用。         |
| **触发时机** | 当执行 `my_instance(...)` 时，自动调用 `my_instance.__call__(...)`。 |
| **核心优势** | **状态保持**：在多次调用之间可以保留和修改对象的内部状态。                            |
| **主要用途** | 1. 创建有状态的“函数”。<br>2. 简化 API 调用。<br>3. 实现装饰器。<br>4. 实现仿函数。  |
|          |                                                            |

希望这个解释能帮助你彻底理解 `__call__` 的作用！

----

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


# [常用内建模块](https://liaoxuefeng.com/books/python/built-in-modules/index.html)

## datetime

## collections

nameedtuple

deque
```python
>>> from collections import deque
>>> q = deque(['a', 'b', 'c'])
>>> q.append('x')
>>> q.appendleft('y')
>>> q
deque(['y', 'a', 'b', 'c', 'x'])
```

defaultdict

ordereddict

```python
>>> from collections import OrderedDict
>>> d = dict([('a', 1), ('b', 2), ('c', 3)])
>>> d # dict的Key是无序的
{'a': 1, 'c': 3, 'b': 2}
>>> od = OrderedDict([('a', 1), ('b', 2), ('c', 3)])
>>> od # OrderedDict的Key是有序的
OrderedDict([('a', 1), ('b', 2), ('c', 3)])

```
chainMap

counter
```shell
>>> from collections import Counter
>>> c = Counter('programming')
>>> for ch in 'programming':
...     c[ch] = c[ch] + 1
...
>>> c
Counter({'g': 2, 'm': 2, 'r': 2, 'a': 1, 'i': 1, 'o': 1, 'n': 1, 'p': 1})
>>> c.update('hello') # 也可以一次性update
>>> c
Counter({'r': 2, 'o': 2, 'g': 2, 'm': 2, 'l': 2, 'p': 1, 'a': 1, 'i': 1, 'n': 1, 'h': 1, 'e': 1})

```
## argparse

## base64

## struct

## hashlib

# 常用第三方模块
1. pillow
2. requests
3. `chardet`
4. `psutil`


# 其他

## PyPI

**PyPI** (全称 **Python Package Index**) 就是 **Python 语言的“应用商店”或“代码仓库”**。

pip   安装工具，从 pypi 仓库中拉取工具

## python -m 用法

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
    python -m http.server 8000 # 启动一个简单的 HTTP 服务器（Python 3 内置模块）。
    ```

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
## python -c 用法

`python -c` 是 Python 解释器的一个命令行选项，用于**直接在命令行中执行一段 Python 代码字符串**，而无需创建一个 `.py` 文件。

---

### 基本语法：
```bash
python -c "Python 代码语句"
```

> 注意：整个代码必须放在**引号内**（单引号 `'` 或双引号 `"`），因为 shell 需要将整段代码作为单个参数传递给 Python。

---

### 功能说明：

- `-c` 表示 “command”。
- Python 会把引号内的内容当作一个完整的程序来执行，就像写在一个临时脚本里一样。
- 执行完后立即退出。

---

### 常见用法示例：

#### 1. 快速打印信息
```bash
python -c "print('Hello, world!')"
```

#### 2. 查看 Python 版本或路径
```bash
python -c "import sys; print(sys.version)"
python -c "import os; print(os.getcwd())"
```

#### 3. 快速计算或测试表达式
```bash
python -c "print(2**10)"
python -c "import math; print(math.sqrt(16))"
```

#### 4. 检查模块是否安装
```bash
python -c "import numpy; print(numpy.__version__)"
```
如果没安装，会报 `ModuleNotFoundError`。

#### 5. 多行代码（用分号或换行转义）
虽然 `-c` 通常用于单行，但也可以写多行（需用 `\n` 或 shell 的续行）：
```bash
python -c "
for i in range(3):
    print(f'Count: {i}')
"
```
或者用分号（适合简单逻辑）：
```bash
python -c "x=5; y=10; print(x+y)"
```

> ⚠️ 注意：在 shell 中使用多行时，引号要保持一致，且换行符会被保留。

---

### 与 `python -m` 的区别：

| 选项 | 用途 |
|------|------|
| `python -c "code"` | 直接执行一段 Python **代码字符串** |
| `python -m module` | 运行一个已存在的 **模块或包**（如 `http.server`, `pip`） |

---

### 实用场景：

- 在 shell 脚本中嵌入简单 Python 逻辑
- 快速验证某个函数/模块的行为
- 自动化任务中的轻量级处理（如生成时间戳、处理 JSON 等）

例如，用 Python 格式化当前时间（比 shell 更灵活）：
```bash
python -c "import datetime; print(datetime.datetime.now().strftime('%Y-%m-%d'))"
```

---

### 注意事项：

- 引号内如有嵌套引号，需转义：
  ```bash
  python -c "print(\"He said: 'Hi!' \")"
  ```
  或混合使用单双引号：
  ```bash
  python -c 'print("He said: \"Hi!\"")'
  ```

- 不适合复杂逻辑（建议写 `.py` 文件）

---

如果你有具体想用 `python -c` 实现的功能，我可以帮你写出对应的命令！

