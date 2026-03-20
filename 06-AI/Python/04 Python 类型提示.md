# Python 类型提示

Python 的 `typing` 模块是 Python 3.5 引入的标准库，为 Python 添加了**类型提示（Type Hints）**的支持。

虽然 Python 本质上仍然是一门**动态类型语言**（在运行时不会强制检查类型），但类型提示主要用于**静态分析**工具（如 mypy、IDE），以提高代码的可读性和健壮性。

---

## 1. 核心作用

1. **静态类型检查**：使用 `mypy` 等工具可以在代码运行前发现类型错误
2. **提升开发效率**：IDE 能根据类型提示提供精准的代码补全和错误高亮
3. **文档化代码**：类型提示本身就是最好的文档

---

## 2. 基础用法

### 变量注解

```python
name: str = "Alice"
age: int = 30
is_active: bool = True
```

### 函数注解

使用 `->` 标记返回值类型：

```python
def greeting(name: str) -> str:
    return "Hello " + name
```

---

## 3. 容器类型

从 Python 3.9 开始，可以直接使用内置的 `list[]`、`dict[]` 等。

| 类型 | 用法示例 | 说明 |
|------|----------|------|
| `list[int]` | `List[int]` | 一个只包含整数的列表 |
| `dict[str, int]` | `Dict[str, int]` | 键是字符串，值是整数的字典 |
| `tuple[str, int]` | `Tuple[str, int]` | 定长元组 |
| `set[str]` | `Set[str]` | 包含字符串的集合 |

```python
from typing import List, Dict

numbers: List[int] = [1, 2, 3, 4]
scores: Dict[str, float] = {"Alice": 95.5, "Bob": 88.0}
```

---

## 4. 逻辑类型

### Union（联合类型）

表示变量可以是几种类型中的一种：

```python
from typing import Union

def process(x: Union[int, str]):
    pass

# Python 3.10+ 写法
def process(x: int | str):
    pass
```

### Optional（可选类型）

表示变量可以是某种类型，也可以是 `None`：

```python
from typing import Optional

def find_user(user_id: int) -> Optional[str]:
    if user_id == 1:
        return "Admin"
    return None

# 等价于 Union[str, None]
```

### Any（任意类型）

当无法确定类型时使用，静态检查器将不再检查该变量：

```python
from typing import Any

def messy_function(data: Any):
    print(data)
```

---

## 5. 进阶用法

### Callable（函数类型）

用于标注一个参数是"函数"或"可调用对象"。

格式：`Callable[[Arg1Type, Arg2Type], ReturnType]`

```python
from collections.abc import Callable

def apply_func(x: int, func: Callable[[int], int]) -> int:
    return func(x)

def double(n: int) -> int:
    return n * 2

apply_func(5, double)  # 结果 10
```

### TypeVar（泛型）

当函数的参数类型和返回类型保持一致，但不限定具体类型时使用：

```python
from typing import TypeVar, List

T = TypeVar('T')

def get_first(items: List[T]) -> T:
    return items[0]
```

### Literal（字面量）

强制变量只能是特定的几个值之一：

```python
from typing import Literal

def open_file(mode: Literal['r', 'w', 'rb', 'wb']):
    pass

open_file('r')   # OK
open_file('x')   # Type Checker 会报错
```

### TypedDict

用于定义结构固定的字典：

```python
from typing import TypedDict, NotRequired

class User(TypedDict):
    name: str
    id: int
    email: NotRequired[str]  # Python 3.11+ 可选键

user: User = {"name": "Alice", "id": 101}
```

**核心优势：**
- 提升可读性：字典结构一目了然
- 增强健壮性：静态检查工具可发现错误
- 改善 IDE 支持：提供精确的代码补全

---

## 6. 协程相关类型

```python
from collections.abc import Awaitable, Coroutine, AsyncGenerator

async def fetch(url: str) -> str:
    ...

# 类型标注
result: Awaitable[str] = fetch("https://example.com")
coro: Coroutine[None, None, str] = fetch("https://example.com")
```

---

## 7. 注意事项

### 运行时不报错

Python 解释器在运行时会完全忽略类型提示：

```python
x: int = "hello"  # 运行时不会报错，IDE 会警告
```

### Python 3.9+ 的变化

建议直接使用内置类型（如 `list[str]`）代替 `typing.List[str]`。

### 循环引用

在类型提示中引用尚未定义的类：

```python
class Node:
    def add_child(self, node: 'Node'):  # 使用引号包裹类名
        pass
```

或者在文件头部加上 `from __future__ import annotations`（Python 3.7+）。

---

## 8. 总结

| 类型 | 用途 | 示例 |
|------|------|------|
| `list[int]` | 列表类型 | `def f(items: list[int])` |
| `dict[str, int]` | 字典类型 | `scores: dict[str, int]` |
| `Union[A, B]` | 联合类型 | `Union[int, str]` 或 `int \| str` |
| `Optional[T]` | 可选类型 | `Optional[str]` |
| `Callable[[Args], Return]` | 函数类型 | `Callable[[int], str]` |
| `TypedDict` | 结构化字典 | 定义固定键值类型的字典 |
| `TypeVar` | 泛型 | `T = TypeVar('T')` |
| `Literal` | 字面量 | `Literal['a', 'b']` |