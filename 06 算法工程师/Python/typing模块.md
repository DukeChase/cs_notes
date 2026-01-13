## typing

Python 的 `typing` 模块是 Python 3.5 引入的标准库，它为 Python 添加了**类型提示（Type Hints）**的支持。

虽然 Python 本质上仍然是一门**动态类型语言**（在运行时不会强制检查类型），但 `typing` 模块允许开发者在代码中显式地标注变量、参数和返回值的类型。这主要用于**静态分析**工具（如 IDE 和 mypy），以提高代码的可读性和健壮性。

以下是关于 `typing` 模块的作用及使用方法的详细介绍。

---

### 1. 核心作用：为什么要用 `typing`？

在没有类型提示时，IDE 很难知道 `data` 是一个列表还是字典，导致代码提示（Autocomplete）失效，重构也容易出错。使用 `typing` 的主要好处包括：

1. **静态类型检查**：使用 `mypy` 等工具可以在代码运行前发现类型错误（例如：把字符串传给了需要整数的函数）。
2. **提升开发效率**：IDE（如 PyCharm, VS Code）能根据类型提示提供精准的代码补全和错误高亮。
3. **文档化代码**：类型提示本身就是最好的文档，阅读代码时一眼就能看出函数需要什么数据。
---
### 2. 基础用法
最基本的类型提示不需要导入 `typing`，直接使用 Python 内置类型（`int`, `str`, `bool`, `float` 等）。
#### 变量注解

Python

```python
name: str = "Gemini"
age: int = 3
is_active: bool = True
```

#### 函数注解
使用 `->` 标记返回值类型：
```python
def greeting(name: str) -> str:
    return "Hello " + name
```

---
### 3. `typing` 模块的常用工具

当内置类型（如 `list` 或 `dict`）不足以描述复杂结构时，就需要 `typing` 模块。

#### A. 容器类型 (List, Dict, Tuple, Set)

_注意：从 Python 3.9 开始，可以直接使用内置的 `list[]`, `dict[]` 等，不再必须从 `typing` 导入 `List`, `Dict`。但在旧版本或为了兼容性，`typing` 版本仍很常用。_

|**类型**|**用法示例**|**说明**|
|---|---|---|
|**List**|`List[int]`|一个只包含整数的列表|
|**Dict**|`Dict[str, int]`|键是字符串，值是整数的字典|
|**Tuple**|`Tuple[str, int]`|第一个元素是 str，第二个是 int 的元组（定长）|
|**Set**|`Set[str]`|包含字符串的集合|

**代码示例：**
```Python
from typing import List, Dict

# 一个包含整数的列表
numbers: List[int] = [1, 2, 3, 4]

# 一个存储学生分数的字典
scores: Dict[str, float] = {"Alice": 95.5, "Bob": 88.0}
```

#### B. 逻辑类型 (Union, Optional, Any)

这是 `typing` 中最常用的几个工具：

1. **Union（联合类型）**：表示变量可以是几种类型中的一种。
    ```Python
    from typing import Union
    
    # x 可以是整数或字符串
    def process(x: Union[int, str]):
        pass
    
    # Python 3.10+ 写法： int | str
    ```
    
2. **Optional（可选类型）**：表示变量可以是某种类型，也可以是 `None`。它等同于 `Union[T, None]`。
    ```Python
    from typing import Optional
    
    def find_user(user_id: int) -> Optional[str]:
        if user_id == 1:
            return "Admin"
        return None
    ```
    
3. **Any（任意类型）**：当你无法确定类型，或者想动态处理时使用。**这是“逃生舱”，一旦使用 `Any`，静态检查器将不再检查该变量，应尽量少用。**
    
    ```Python
    from typing import Any
    
    def messy_function(data: Any):
        print(data) # data 可以是任何东西
    ```
    
### 4. 进阶用法

#### A. Callable（函数类型）

用于标注一个参数是“函数”或“可调用对象”。

格式：`Callable[[Arg1Type, Arg2Type], ReturnType]`

```Python
from typing import Callable

def apply_func(x: int, func: Callable[[int], int]) -> int:
    return func(x)

def double(n: int) -> int:
    return n * 2

apply_func(5, double) # 结果 10
```

#### B. TypeVar（泛型）

当你希望函数的参数类型和返回类型保持一致，但不限定具体是哪种类型时使用。

```Python
from typing import TypeVar, List

T = TypeVar('T') # 定义一个泛型变量 T

def get_first(items: List[T]) -> T:
    return items[0]

# 如果输入 List[int]，返回 int
# 如果输入 List[str]，返回 str
```

#### C. Literal（字面量）

强制变量只能是特定的几个值之一（类似于枚举）。

```Python
from typing import Literal

def open_file(mode: Literal['r', 'w', 'rb', 'wb']):
    pass

open_file('r')   # OK
open_file('x')   # Type Checker 会报错
```

#### D. TypedDict（类型字典）

用于定义结构固定的字典（例如处理 JSON 数据）。
```Python
from typing import TypedDict

class User(TypedDict):
    name: str
    id: int

user: User = {"name": "Gemini", "id": 101} # OK
# user: User = {"name": "Gemini"} # 报错，缺少 id
```

---

### 5. 常见误区与注意事项

1. 运行时不报错：
	- Python 解释器在运行时会完全忽略类型提示。如果你写 x: int = "hello"，程序依然可以运行，只是 IDE 或静态检查工具会警告。
2. Python 3.9+ 的变化：    
    - 如果你使用的是 Python 3.9 或更高版本，建议尽量直接使用内置类型（如` list[str]`）代替 `typing.List[str]`，因为前者是原生支持，性能微优且无需导入。
3. 循环引用：
    - 如果在类型提示中需要引用尚未定义的类（例如类的方法返回类本身），可以使用字符串形式：
```python
class Node:
	def add_child(self, node: 'Node'): # 使用引号包裹类名
		pass
```
或者在文件头部加上 `from __future__ import annotations` (Python 3.7+)。

---

### 总结

`typing` 模块是编写现代、高质量 Python 代码的基础设施。虽然它增加了代码编写的字符量，但极大地减少了维护成本和潜在 Bug。

**您希望我为您演示如何使用 `mypy` 工具来检查一段包含类型提示的代码吗？**
