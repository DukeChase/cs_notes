

在 Python 中，`async`和 `await`是用于编写**异步代码**的关键字，它们构成了 Python 的异步编程模型（基于协程）。这种模型特别适合处理 I/O 密集型任务，如网络请求、文件操作等。

## 核心概念

### 1. 协程 (Coroutine)

- 使用 `async def`定义的函数
- 调用时不会立即执行，而是返回一个协程对象
- 需要事件循环来驱动执行

```
async def my_coroutine():
    return "Hello from coroutine"
```

### 2. 事件循环 (Event Loop)

- 异步程序的运行核心
    
- 负责调度和执行协程
    
- 在 Python 3.7+ 中，可以使用 `asyncio.run()`简化
    

```
import asyncio

result = asyncio.run(my_coroutine())
print(result)  # 输出: Hello from coroutine
```

### 3. await 表达式

- 用于挂起协程的执行，等待其他协程完成
    
- 只能用在 `async def`函数内部
    

```
async def main():
    result = await my_coroutine()
    print(result)
```

## 基本用法

### 1. 创建和运行协程

```
import asyncio

async def say_hello():
    print("Hello")
    await asyncio.sleep(1)  # 模拟 I/O 操作
    print("World")

# 运行协程
asyncio.run(say_hello())
```

### 2. 并发执行多个协程

```
import asyncio

async def task(name, seconds):
    print(f"Task {name} started")
    await asyncio.sleep(seconds)
    print(f"Task {name} completed after {seconds} seconds")

async def main():
    # 同时启动多个任务
    await asyncio.gather(
        task("A", 2),
        task("B", 1),
        task("C", 3)
    )

asyncio.run(main())
```

### 3. 创建任务 (Task)

```
async def main():
    # 创建任务但不立即等待
    task1 = asyncio.create_task(task("Task1", 2))
    task2 = asyncio.create_task(task("Task2", 1))
    
    # 等待所有任务完成
    await task1
    await task2
```

## 高级用法

### 1. 异步上下文管理器 (async with)

```
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

### 2. 异步迭代器 (async for)

```
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

### 3. 异步生成器

```
async def async_generator(n):
    for i in range(n):
        await asyncio.sleep(0.5)
        yield i

async def main():
    async for item in async_generator(5):
        print(item)
```

## 实际应用示例

### 1. 异步 HTTP 请求 (使用 aiohttp)

```
import aiohttp
import asyncio

async def fetch(url):
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            return await response.text()

async def main():
    urls = [
        "https://example.com",
        "https://python.org",
        "https://github.com"
    ]
    
    # 并发获取所有URL的内容
    results = await asyncio.gather(*(fetch(url) for url in urls))
    
    for url, content in zip(urls, results):
        print(f"{url}: {len(content)} bytes")

asyncio.run(main())
```

### 2. 异步文件操作 (使用 aiofiles)

```
import aiofiles
import asyncio

async def write_file(filename, content):
    async with aiofiles.open(filename, 'w') as f:
        await f.write(content)

async def read_file(filename):
    async with aiofiles.open(filename, 'r') as f:
        return await f.read()

async def main():
    await write_file("test.txt", "Hello, async world!")
    content = await read_file("test.txt")
    print(content)  # 输出: Hello, async world!

asyncio.run(main())
```

## 注意事项

1. **避免阻塞操作**：不要在协程中使用同步阻塞操作（如 `time.sleep()`），应使用异步替代（`asyncio.sleep()`）
    
2. **事件循环**：每个线程只有一个事件循环
    
3. **错误处理**：使用 `try/except`捕获协程中的异常
    
4. **性能**：异步编程适合 I/O 密集型任务，对 CPU 密集型任务效果有限
    
5. **兼容性**：Python 3.5+ 支持 async/await 语法
    

## 最佳实践

1. 使用 `asyncio.run()`作为主入口点
    
2. 优先使用 `asyncio.gather()`并发执行任务
    
3. 使用 `async with`管理异步资源
    
4. 避免在协程中创建大量任务，使用信号量控制并发数
    
5. 使用 `uvloop`替代默认事件循环以获得更好性能
    

```
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

异步编程是 Python 处理高并发场景的强大工具，合理使用可以显著提高程序的性能和响应能力。