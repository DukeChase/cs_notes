 
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

