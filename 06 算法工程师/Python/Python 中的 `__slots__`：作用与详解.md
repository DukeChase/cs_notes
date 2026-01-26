# Python 中的 `__slots__`：作用与详解

`__slots__`是 Python 类中的一个特殊属性，它用于**显式声明类实例允许的属性**，从而优化内存使用和提高属性访问速度。

## 核心作用

### 1. **内存优化**
- 默认情况下，Python 类的实例使用字典 (`__dict__`) 存储属性
- `__slots__`用固定大小的数组替代字典存储属性
- **内存节省可达 30-50%**（对于创建大量实例的场景效果显著）
### 2. **属性限制**
- 限制实例只能拥有 `__slots__`中声明的属性
- 防止意外创建新属性
### 3. **性能提升**
- 属性访问速度更快（直接通过数组偏移量访问，而非字典查找）
## 基本用法
```python
class Person:
    # 声明允许的属性
    __slots__ = ('name', 'age')
    
    def __init__(self, name, age):
        self.name = name
        self.age = age

# 创建实例
p = Person("Alice", 30)

# 正常访问
print(p.name)  # Alice
print(p.age)   # 30

# 尝试添加未声明的属性
p.gender = "Female"  # AttributeError: 'Person' object has no attribute 'gender'
```

## 内存优化对比
### 未使用 `__slots__`
```
class WithoutSlots:
    def __init__(self, x, y):
        self.x = x
        self.y = y

# 实例有 __dict__ 属性
obj = WithoutSlots(1, 2)
print(obj.__dict__)  # {'x': 1, 'y': 2}
```

### 使用 `__slots__`

```
class WithSlots:
    __slots__ = ('x', 'y')
    
    def __init__(self, x, y):
        self.x = x
        self.y = y

# 实例没有 __dict__ 属性
obj = WithSlots(1, 2)
print(hasattr(obj, '__dict__'))  # False
```

### 内存占用对比

```
import sys

# 创建大量实例测试
instances = [WithoutSlots(i, i+1) for i in range(100000)]
print(sys.getsizeof(instances[0]) + sys.getsizeof(instances[0].__dict__)) 
# 典型值: 约 120-140 字节/实例

instances = [WithSlots(i, i+1) for i in range(100000)]
print(sys.getsizeof(instances[0])) 
# 典型值: 约 32-48 字节/实例
```

## 继承与 `__slots__`

### 继承时的行为

```
class Base:
    __slots__ = ('a', 'b')

class Derived(Base):
    __slots__ = ('c', 'd')  # 继承父类的 slots 并添加新的
    
    def __init__(self):
        self.a = 1
        self.b = 2
        self.c = 3
        self.d = 4

obj = Derived()
print(obj.a, obj.b, obj.c, obj.d)  # 1 2 3 4
```

### 特殊情况

```
class Base:
    __slots__ = ('a', 'b')

class Derived(Base):
    # 没有定义 __slots__，实例会有 __dict__
    pass

obj = Derived()
obj.c = 3  # 允许添加新属性
```

## 高级用法

### 1. 包含 `__dict__`

```
class Flexible:
    __slots__ = ('a', 'b', '__dict__')
    
    def __init__(self, a, b):
        self.a = a
        self.b = b

obj = Flexible(1, 2)
obj.c = 3  # 允许动态添加属性
```

### 2. 使用弱引用

```
class WeakRefEnabled:
    __slots__ = ('a', '__weakref__')

obj = WeakRefEnabled()
import weakref
ref = weakref.ref(obj)  # 需要 __weakref__ slot
```

## 注意事项

1. **不能添加未声明的属性**
    
    ```
    class Restricted:
        __slots__ = ('x',)
    
    obj = Restricted()
    obj.y = 10  # AttributeError
    ```
    
2. **类属性不受影响**
    
    ```
    class MyClass:
        __slots__ = ('x',)
        class_attr = 42  # 类属性正常使用
    ```
    
3. **描述符行为**
    
    - `__slots__`的实现依赖于描述符
        
    - 每个 slot 属性实际上是一个类级别的描述符
        
    
4. **与属性装饰器兼容**
    
    ```
    class WithProperty:
        __slots__ = ('_value',)
    
        @property
        def value(self):
            return self._value
    
        @value.setter
        def value(self, v):
            self._value = v
    ```
    

## 性能测试

```
import timeit

# 属性访问速度测试
class Regular: pass

class Slotted:
    __slots__ = ('x',)

def test_regular():
    obj = Regular()
    obj.x = 10
    return obj.x

def test_slotted():
    obj = Slotted()
    obj.x = 10
    return obj.x

# 测试结果
print("Regular:", timeit.timeit(test_regular, number=1000000))
print("Slotted:", timeit.timeit(test_slotted, number=1000000))

# 典型结果:
# Regular: 0.15-0.20 秒
# Slotted: 0.10-0.15 秒 (快 20-30%)
```

## 适用场景

1. **需要创建大量实例的类**
    
    - 游戏开发中的实体对象
        
    - 科学计算中的数据点
        
    - 网络编程中的连接对象
        
    
2. **需要严格控制属性的类**
    
    - 定义严格的接口
        
    - 防止用户意外添加属性
        
    
3. **性能敏感的应用**
    
    - 高频属性访问的场景
        
    - 内存受限的环境
        
    

## 不适用场景

1. 需要动态添加属性的类
    
2. 使用多重继承且父类已有 `__slots__`的复杂情况
    
3. 需要大量使用 `__dict__`特性的场景
    

## 总结

|特性|普通类|使用 `__slots__`的类|
|---|---|---|
|**内存占用**​|较高（每个实例有 `__dict__`）|较低（固定大小数组）|
|**属性访问速度**​|较慢（字典查找）|较快（数组索引）|
|**动态添加属性**​|支持|默认不支持|
|**内存布局**​|动态|静态|
|**特殊方法支持**​|完整|需显式声明（如 `__weakref__`）|

**最佳实践**：在以下情况考虑使用 `__slots__`

- 需要创建大量实例（数千以上）
    
- 实例属性固定且不需要动态添加
    
- 对内存使用或性能有严格要求
    
- 需要明确限制可用属性
    

通过合理使用 `__slots__`，可以在特定场景下显著提升 Python 程序的性能和内存效率。