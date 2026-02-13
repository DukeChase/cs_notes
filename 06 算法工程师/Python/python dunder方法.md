在 Python 中，除了 `__init__.py`文件外，还有许多以双下划线开头和结尾的特殊变量和特殊方法（称为 "dunder" 方法）。  
它们为 Python 提供了强大的元编程能力，允许自定义类的行为。以下是一些重要的特殊成员：

---
### **一、特殊变量**

1. **`__name__`**
    - 模块的名称
    - 当模块直接运行时值为 `'__main__'`
```python
if __name__ == '__main__':
	print("直接运行")
```
    
2. **`__file__`**
    - 当前模块的文件路径
```python
print(__file__)  # 输出: /path/to/your/script.py
```
    
3. **`__doc__`**
    - 获取文档字符串
```python
def func():
	"""函数文档"""
	pass
print(func.__doc__)  # 输出: 函数文档
```
    
4. **`__package__`**
    - 当前模块所属的包名
5. **`__annotations__`**
    - 获取类型注解字典
	```python
	def func(a: int) -> str: pass
	print(func.__annotations__)  
	# 输出: {'a': <class 'int'>, 'return': <class 'str'>}
    ```
---

### **二、类相关的特殊方法**

#### 1. **对象生命周期**
- `__new__(cls[, ...])`: 创建实例时调用（构造函数）
- `__init__(self[, ...])`: 初始化实例
- `__del__(self)`: 对象销毁时调用

#### 2. **字符串表示**
- `__str__(self)`: `str(obj)`和 `print(obj)`时调用
- `__repr__(self)`: `repr(obj)`和交互式环境显示时调用
- `__format__(self, format_spec)`: 格式化输出

#### 3. **比较运算符**

```python
__eq__(self, other)  # ==
__ne__(self, other)  # !=
__lt__(self, other)  # <
__le__(self, other)  # <=
__gt__(self, other)  # >
__ge__(self, other)  # >=
```

#### 4. **算术运算**

```python
__add__(self, other)      # +
__sub__(self, other)      # -
__mul__(self, other)      # *
__truediv__(self, other)  # /
__floordiv__(self, other) # //
__mod__(self, other)      # %
__pow__(self, other)      # **
```

#### 5. **容器类型行为**

- `__len__(self)`: `len(obj)`时调用
    
- `__getitem__(self, key)`: `obj[key]`获取元素
    
- `__setitem__(self, key, value)`: `obj[key] = value`设置元素
    
- `__delitem__(self, key)`: `del obj[key]`删除元素
    
- `__contains__(self, item)`: `item in obj`时调用
    

#### 6. **可调用对象**

- `__call__(self[, ...])`: 使实例可像函数一样调用

```python
class Adder:
    def __call__(self, a, b):
        return a + b

add = Adder()
print(add(3, 5))  # 输出: 8
```

#### 7. **属性访问**

```
__getattr__(self, name)    # 访问不存在的属性时
__getattribute__(self, name) # 访问任何属性时
__setattr__(self, name, value) # 设置属性时
__delattr__(self, name)    # 删除属性时
```
#### 8. **上下文管理器**
- `__enter__(self)`: 进入 `with`代码块时调用
- `__exit__(self, exc_type, exc_val, exc_tb)`: 退出 `with`代码块时调用
---
### **三、其他重要特殊成员**

1. **`__slots__`**
    - 限制类实例的属性
```python
class Point:
	__slots__ = ('x', 'y')  # 只能有 x 和 y 属性
```
    
2. **`__all__`**
    - 控制 `from module import *`导入的内容
```python
# module.py
__all__ = ['func1', 'CONST']  # 只导出 func1 和 CONST
```
    
3. **`__mro__`**    
    - 方法解析顺序（Method Resolution Order）
```python
print(ClassA.__mro__)  # 显示继承顺序
```
    
4. **`__bases__`**
    - 类的基类元组
```
class Child(Parent1, Parent2): pass
print(Child.__bases__)  # 输出: (<class '__main__.Parent1'>, <class '__main__.Parent2'>)
```
5. **`__subclasses__()`**
    - 获取类的直接子类列表
---
### **四、元类相关**
1. **`__metaclass__`**
    - 定义类的元类（Python 3 中使用 `metaclass=`参数）
2. **`__prepare__(metacls, name, bases)`**
    - 创建类命名空间前调用
3. **`__new__(metacls, name, bases, namespace)`**
    - 元类创建类时调用
4. **`__init__(cls, name, bases, namespace)`**
    - 元类初始化类时调用
---

### **五、协程相关**
1. **`__await__`**
    - 定义可等待对象
2. **`__aiter__`, `__anext__`**
    - 异步迭代器协议
3. **`__aenter__`, `__aexit__`**
    - 异步上下文管理器

---

### **六、模式匹配（Python 3.10+）**
- `__match_args__`: 定义类在模式匹配中的位置参数
- `__class_getitem__`: 支持泛型类型提示
---
### **总结表格**

|类别|特殊成员|主要用途|
|---|---|---|
|**对象生命周期**​|`__new__`, `__init__`, `__del__`|创建/初始化/销毁对象|
|**字符串表示**​|`__str__`, `__repr__`, `__format__`|自定义对象显示|
|**运算符重载**​|`__add__`, `__eq__`, `__lt__`等|重载运算符行为|
|**容器行为**​|`__len__`, `__getitem__`, `__setitem__`|使对象像容器|
|**属性控制**​|`__slots__`, `__getattr__`, `__setattr__`|控制属性访问|
|**可调用对象**​|`__call__`|使实例可像函数调用|
|**上下文管理**​|`__enter__`, `__exit__`|实现 `with`语句|
|**模块控制**​|`__all__`, `__name__`, `__file__`|模块元信息控制|
|**类关系**​|`__bases__`, `__mro__`, `__subclasses__`|类继承关系|
|**元编程**​|`__metaclass__`, `__prepare__`|自定义类创建过程|

这些特殊成员构成了 Python 的"魔法方法"体系，掌握它们可以让你编写更灵活、更强大的 Python 代码。