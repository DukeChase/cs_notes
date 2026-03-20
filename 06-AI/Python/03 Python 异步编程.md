# Python 异步编程

Python 的 `async` 和 `await` 是用于编写**异步代码**的关键字，构成 Python 的异步编程模型（基于协程）。特别适合处理 I/O 密集型任务，如网络请求、文件操作等。

---

## 1. 核心概念

### 协程（Coroutine）

- 使用 `async def` 定义的函数
- 调用时不会立即执行，而是返回一个协程对象
- 需要事件循环来驱动执行

```python
async def my_coroutine():
    return "Hello from coroutine"
```

### 事件循环（Event Loop）

- 异步程序的运行核心
- 负责调度和执行协程
- Python 3.7+ 使用 `asyncio.run()` 简化

```python
import asyncio

result = asyncio.run(my_coroutine())
print(result)  # 输出: Hello from coroutine
```

### await 表达式

- 用于挂起协程的执行，等待其他协程完成
- 只能用在 `async def` 函数内部

```python
async def main():
    result = await my_coroutine()
    print(result)
```

---

## 2. 基本用法

### 创建和运行协程

```python
import asyncio

async def say_hello():
    print("Hello")
    await asyncio.sleep(1)  # 模拟 I/O 操作
    print("World")

asyncio.run(say_hello())
```

### 并发执行多个协程

```python
import asyncio

async def task(name, seconds):
    print(f"Task {name} started")
    await asyncio.sleep(seconds)
    print(f"Task {name} completed after {seconds} seconds")

async def main():
    await asyncio.gather(
        task("A", 2),
        task("B", 1),
        task("C", 3)
    )

asyncio.run(main())
```

### 创建任务（Task）

```python
async def main():
    task1 = asyncio.create_task(task("Task1", 2))
    task2 = asyncio.create_task(task("Task2", 1))
    
    await task1
    await task2
```

---

## 3. 核心 API

| API | 作用 | 使用场景 |
|-----|------|----------|
| `asyncio.create_task(coro)` | 创建协程任务，立即加入事件循环 | 并发执行多个协程 |
| `asyncio.gather(*coros)` | 等待多个协程完成，按顺序返回结果 | 批量执行协程并收集结果 |
| `asyncio.wait(coros, timeout)` | 等待协程完成，返回（已完成，未完成）元组 | 灵活处理部分完成的任务、超时控制 |
| `loop.run_in_executor()` | 将阻塞性代码放到线程池/进程池执行 | 协程中处理非异步代码，避免阻塞事件循环 |

---

## 4. 高级用法

### 异步上下文管理器

```python
class AsyncResource:
    async def __aenter__(self):
        print("Acquiring resource")
        await asyncio.sleep(0.5)
        return self
    
    async def __aexit__(self, exc_type, exc, tb):
        print("Releasing resource")
        await asyncio.sleep(0.5)

async def use_resource():
    async with AsyncResource() as resource:
        print("Using resource")
        await asyncio.sleep(1)
```

### 异步迭代器

```python
class AsyncCounter:
    def __init__(self, stop):
        self.current = 0
        self.stop = stop
    
    def __aiter__(self):
        return self
    
    async def __anext__(self):
        if self.current < self.stop:
            await asyncio.sleep(0.5)
            self.current += 1
            return self.current
        else:
            raise StopAsyncIteration

async def main():
    async for i in AsyncCounter(5):
        print(i)
```

### 异步生成器

```python
async def async_generator(n):
    for i in range(n):
        await asyncio.sleep(0.5)
        yield i

async def main():
    async for item in async_generator(5):
        print(item)
```

---

## 5. 实际应用

### 异步 HTTP 请求（aiohttp）

```python
import aiohttp
import asyncio

async def fetch(url):
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            return await response.text()

async def main():
    urls = ["https://example.com", "https://python.org"]
    results = await asyncio.gather(*(fetch(url) for url in urls))
    for url, content in zip(urls, results):
        print(f"{url}: {len(content)} bytes")

asyncio.run(main())
```

### 异步文件操作（aiofiles）

```python
import aiofiles
import asyncio

async def write_file(filename, content):
    async with aiofiles.open(filename, 'w') as f:
        await f.write(content)

async def read_file(filename):
    async with aiofiles.open(filename, 'r') as f:
        return await f.read()
```

### 包装同步代码

当需要在协程中调用同步 API 时，使用 `run_in_executor`：

```python
import asyncio
import time

def sync_task(seconds):
    time.sleep(seconds)
    return f"Slept for {seconds} seconds"

async def main():
    loop = asyncio.get_running_loop()
    result = await loop.run_in_executor(None, sync_task, 2)
    print(result)

asyncio.run(main())
```

---

## 6. 注意事项

1. **避免阻塞操作**：不要在协程中使用 `time.sleep()`，应使用 `asyncio.sleep()`
2. **事件循环**：每个线程只有一个事件循环
3. **错误处理**：使用 `try/except` 捕获协程中的异常
4. **性能**：异步编程适合 I/O 密集型任务，对 CPU 密集型任务效果有限
5. **兼容性**：Python 3.5+ 支持 async/await 语法

---

## 7. 最佳实践

1. 使用 `asyncio.run()` 作为主入口点
2. 优先使用 `asyncio.gather()` 并发执行任务
3. 使用 `async with` 管理异步资源
4. 使用信号量控制并发数：

```python
import asyncio
from asyncio import Semaphore

async def limited_task(semaphore, task_id):
    async with semaphore:
        print(f"Task {task_id} started")
        await asyncio.sleep(1)
        print(f"Task {task_id} completed")

async def main():
    semaphore = Semaphore(3)  # 最多同时运行3个任务
    tasks = [limited_task(semaphore, i) for i in range(10)]
    await asyncio.gather(*tasks)

asyncio.run(main())
```

5. 使用 `uvloop` 替代默认事件循环以获得更好性能

---

## 8. 协程与线程的对比

| 特性 | 协程 | 线程 |
|------|------|------|
| 调度方式 | 用户态协作式调度 | 内核态抢占式调度 |
| 切换开销 | 极小（无上下文切换） | 较大（需要内核参与） |
| 内存占用 | 小（KB级别） | 大（MB级别） |
| 适用场景 | I/O 密集型 | I/O 密集型 + CPU 密集型 |
| 编程复杂度 | 需要异步思维 | 需要处理同步问题 |