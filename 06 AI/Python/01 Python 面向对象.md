# Python 面向对象

## 1. 类的定义

```python
class Student(object):
    def __init__(self, name, score):
        self.name = name
        self.score = score
    
    def print_score(self):
        print('%s: %s' % (self.name, self.score))
```

### 访问限制

- `__foo__` - 特殊方法，系统定义名字，类似 `__init__()`
- `_foo` - 保护类型（protected），只能允许其本身与子类进行访问
- `__foo` - 私有类型（private），只能允许这个类本身进行访问

---

## 2. 特殊方法（Dunder Methods）

Python 中以双下划线开头和结尾的特殊方法（称为 "dunder" 方法）为 Python 提供了强大的元编程能力。

### 2.1 对象生命周期

| 方法 | 说明 |
|------|------|
| `__new__(cls[, ...])` | 创建实例时调用（构造函数） |
| `__init__(self[, ...])` | 初始化实例 |
| `__del__(self)` | 对象销毁时调用 |

### 2.2 字符串表示

| 方法 | 说明 |
|------|------|
| `__str__(self)` | `str(obj)` 和 `print(obj)` 时调用 |
| `__repr__(self)` | `repr(obj)` 和交互式环境显示时调用 |
| `__format__(self, format_spec)` | 格式化输出 |

### 2.3 比较运算符

```python
__eq__(self, other)   # ==
__ne__(self, other)   # !=
__lt__(self, other)   # <
__le__(self, other)   # <=
__gt__(self, other)   # >
__ge__(self, other)   # >=
```

### 2.4 算术运算

```python
__add__(self, other)      # +
__sub__(self, other)      # -
__mul__(self, other)      # *
__truediv__(self, other)  # /
__floordiv__(self, other) # //
__mod__(self, other)      # %
__pow__(self, other)      # **
```

### 2.5 容器类型行为

| 方法 | 说明 |
|------|------|
| `__len__(self)` | `len(obj)` 时调用 |
| `__getitem__(self, key)` | `obj[key]` 获取元素 |
| `__setitem__(self, key, value)` | `obj[key] = value` 设置元素 |
| `__delitem__(self, key)` | `del obj[key]` 删除元素 |
| `__contains__(self, item)` | `item in obj` 时调用 |

### 2.6 可调用对象

`__call__` 方法让对象可以像函数一样被调用。

```python
class Adder:
    def __call__(self, a, b):
        return a + b

add = Adder()
print(add(3, 5))  # 输出: 8
```

**核心概念：**
- **函数**：像遥控器，调用时执行特定动作
- **普通对象**：像电视机，有属性和方法，但不能直接"按"
- **`__call__`**：让"电视机"也变成"遥控器"

**主要用途：**

1. **状态保持** - 在多次调用之间保留内部状态

```python
class Counter:
    def __init__(self):
        self.count = 0

    def __call__(self):
        self.count += 1
        return self.count

counter = Counter()
print(counter())  # 1
print(counter())  # 2
```

2. **实现装饰器**

```python
import time

class TimerDecorator:
    def __init__(self, func):
        self.func = func

    def __call__(self, *args, **kwargs):
        start_time = time.time()
        result = self.func(*args, **kwargs)
        print(f"耗时: {time.time() - start_time:.4f}秒")
        return result

@TimerDecorator
def my_task(duration):
    time.sleep(duration)
    return "完成"

my_task(1)
```

### 2.7 属性访问

```python
__getattr__(self, name)      # 访问不存在的属性时
__getattribute__(self, name) # 访问任何属性时
__setattr__(self, name, value) # 设置属性时
__delattr__(self, name)      # 删除属性时
```

### 2.8 上下文管理器

| 方法 | 说明 |
|------|------|
| `__enter__(self)` | 进入 `with` 代码块时调用 |
| `__exit__(self, exc_type, exc_val, exc_tb)` | 退出 `with` 代码块时调用 |

### 2.9 类的内置属性

```python
hasattr(emp1, 'age')    # 如果存在 'age' 属性返回 True
getattr(emp1, 'age')    # 返回 'age' 属性的值
setattr(emp1, 'age', 8) # 添加属性 'age' 值为 8
delattr(emp1, 'age')    # 删除属性 'age'
```

常用内置属性：
- `__dict__` - 类的属性（包含一个字典）
- `__doc__` - 类的文档字符串
- `__name__` - 类名
- `__module__` - 类定义所在的模块
- `__bases__` - 类的所有父类构成元素

---

## 3. `__slots__`

`__slots__` 用于**显式声明类实例允许的属性**，从而优化内存使用和提高属性访问速度。

### 核心作用

1. **内存优化** - 用固定大小的数组替代字典存储属性，内存节省可达 30-50%
2. **属性限制** - 限制实例只能拥有 `__slots__` 中声明的属性
3. **性能提升** - 属性访问速度更快

### 基本用法

```python
class Person:
    __slots__ = ('name', 'age')
    
    def __init__(self, name, age):
        self.name = name
        self.age = age

p = Person("Alice", 30)
p.gender = "Female"  # AttributeError
```

### 内存对比

```python
import sys

class WithoutSlots:
    def __init__(self, x, y):
        self.x = x
        self.y = y

class WithSlots:
    __slots__ = ('x', 'y')
    def __init__(self, x, y):
        self.x = x
        self.y = y

# 未使用 __slots__: 约 120-140 字节/实例
# 使用 __slots__: 约 32-48 字节/实例
```

### 继承行为

```python
class Base:
    __slots__ = ('a', 'b')

class Derived(Base):
    __slots__ = ('c', 'd')  # 继承父类的 slots 并添加新的
```

### 适用场景

- 需要创建大量实例的类（游戏实体、数据点、连接对象）
- 需要严格控制属性的类
- 性能敏感的应用

---

## 4. 特殊变量

| 变量 | 说明 | 示例 |
|------|------|------|
| `__name__` | 模块的名称，直接运行时为 `'__main__'` | `if __name__ == '__main__':` |
| `__file__` | 当前模块的文件路径 | `print(__file__)` |
| `__doc__` | 文档字符串 | `func.__doc__` |
| `__package__` | 当前模块所属的包名 | - |
| `__annotations__` | 类型注解字典 | `{'a': int, 'return': str}` |
| `__all__` | 控制 `from module import *` 导入的内容 | `__all__ = ['func1']` |
| `__mro__` | 方法解析顺序 | `ClassA.__mro__` |
| `__bases__` | 类的基类元组 | `Child.__bases__` |
| `__subclasses__()` | 获取类的直接子类列表 | `Parent.__subclasses__()` |

---

## 5. 总结表格

| 类别 | 特殊成员 | 主要用途 |
|------|----------|----------|
| 对象生命周期 | `__new__`, `__init__`, `__del__` | 创建/初始化/销毁对象 |
| 字符串表示 | `__str__`, `__repr__`, `__format__` | 自定义对象显示 |
| 运算符重载 | `__add__`, `__eq__`, `__lt__` 等 | 重载运算符行为 |
| 容器行为 | `__len__`, `__getitem__`, `__setitem__` | 使对象像容器 |
| 属性控制 | `__slots__`, `__getattr__`, `__setattr__` | 控制属性访问 |
| 可调用对象 | `__call__` | 使实例可像函数调用 |
| 上下文管理 | `__enter__`, `__exit__` | 实现 `with` 语句 |
| 类关系 | `__bases__`, `__mro__`, `__subclasses__` | 类继承关系 |