> 参考：[廖雪峰 Python 教程](https://liaoxuefeng.com/books/python/introduction/index.html)

# Python 基础语法

## 1. 数据类型和变量

### 基本数据类型

- 整数 (`int`)
- 浮点数 (`float`)
- 字符串 (`str`)
- 布尔值 (`bool`)

### 布尔运算

```python
and  # 与
or   # 或
not  # 非
```

### 空值

```python
None
```

### 字符编码

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
```

---

## 2. 数据结构

### list（列表）

```python
>>> classmates = ['Michael', 'Bob', 'Tracy']
>>> classmates
['Michael', 'Bob', 'Tracy']
>>> len(classmates)
3
>>> classmates[0]
'Michael'
>>> classmates.append('Adam')
>>> classmates.insert(1, 'Jack')
>>> classmates.pop()
'Adam'
```

### tuple（元组）

一旦初始化就不能修改：

```python
>>> classmates = ('Michael', 'Bob', 'Tracy')
```

### dict（字典）

```python
>>> d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
>>> d['Michael']
95
>>> 'Thomas' in d
False
>>> d.get('Thomas', -1)
-1
>>> d.pop('Bob')
75
```

### set（集合）

```python
>>> s = {1, 2, 3}
>>> s.add(4)
>>> s.remove(4)
>>> s1 = {1, 2, 3}
>>> s2 = {2, 3, 4}
>>> s1 & s2
{2, 3}
>>> s1 | s2
{1, 2, 3, 4}
```

---

## 3. 函数

### 参数类型

在 Python 中定义函数，可以用**必选参数、默认参数、可变参数、关键字参数和命名关键字参数**，这5种参数都可以组合使用。

参数定义的顺序必须是：**必选参数 → 默认参数 → 可变参数 → 命名关键字参数 → 关键字参数**

```python
def func(a, b, c=0, *args, **kw):
    print('a =', a, 'b =', b, 'c =', c, 'args =', args, 'kw =', kw)
```

### Lambda 函数

> 参考：[How to Use Python Lambda Functions](https://realpython.com/python-lambda/)

```python
>>> f = lambda x: x * x
>>> f(5)
25
```

---

## 4. 控制流

### 条件判断

```python
if x > 0:
    print('positive')
elif x == 0:
    print('zero')
else:
    print('negative')
```

### 循环

```python
for i in range(5):
    print(i)

while n > 0:
    n -= 1
```

### 列表生成式

```python
>>> [x * x for x in range(1, 11)]
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

>>> [x * x for x in range(1, 11) if x % 2 == 0]
[4, 16, 36, 64, 100]
```