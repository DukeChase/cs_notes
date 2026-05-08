---
title: Linux 进程管理
description: Linux 进程管理的完整指南，包括 ps、top、kill、nohup、& 后台运行等命令
tags:
  - linux
  - process
  - ps
---

# Linux 进程管理

参考：《鸟哥的 Linux 私房菜》第十六章

## 1. 程序与进程

- **程序（Program）**：存放在磁盘上的可执行文件
- **进程（Process）**：程序运行后的实例，占用系统资源（CPU、内存等）

## 2. ps - 查看进程快照

`ps` 将某个时间点的程序运行情况撷取下来。

### 2.1 常用选项组合

| 选项组合 | 说明 | 适用场景 |
| -------- | --------------------------- | ---------------- |
| `ps -ef` | 显示所有进程的完整信息（Unix 风格） | 快速查看全系统进程 |
| `ps aux` | 显示所有用户的进程（BSD 风格） | 查看详细资源占用（CPU/内存） |

```bash
ps -ef        # 列出所有进程（带父进程ID）
ps aux        # 列出所有进程（带 CPU/内存占用）

# 仅观察自己的 bash 相关程序
ps -l
```

### 2.2 查看指定用户的进程

| 选项 | 说明 |
|---|---|
| `-u <用户名>` | 显示指定用户的进程 |
| `-U <用户ID>` | 根据用户 ID 过滤 |

```bash
ps -u root      # 查看 root 用户的进程
ps aux -u www   # 查看用户 www 的进程（结合 aux）
```

### 2.3 显示进程树结构

| 选项 | 说明 |
| ----------------- | ------------- |
| `-f` / `--forest` | 显示进程树（父子层级关系） |

```bash
ps -ef --forest    # 树形显示所有进程
ps auxf            # BSD 风格树形显示
```

### 2.4 筛选特定进程

| 选项 | 说明 |
| ---------- | ----------------- |
| `-C <命令名>` | 按进程名过滤（如 `nginx`） |
| `-p <PID>` | 按进程 ID 过滤 |

```bash
ps -C nginx       # 查看所有 nginx 进程
ps -p 1234,5678  # 查看 PID 为 1234 和 5678 的进程
```

### 2.5 显示线程信息

| 选项 | 说明 |
| ---- | ------------ |
| `-L` | 显示进程的线程（LWP） |
| `-T` | 显示线程（SPID） |

```bash
ps -eLf      # 查看所有线程（含线程 ID）
ps -T -p 1234  # 查看 PID 1234 的线程
```

### 2.6 自定义输出列

| 选项 | 说明 |
|---|---|
| `-o <列名>` | 自定义显示的列（如 `pid,cmd,%cpu`） |

```bash
# 显示 PID、父 PID、命令、CPU/内存占用，按 CPU 降序
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu
```

### 2.7 常用输出列解释

| 列名 | 说明 |
|---|---|
| `PID` | 进程 ID |
| `PPID` | 父进程 ID |
| `%CPU` | CPU 占用率 |
| `%MEM` | 内存占用率 |
| `VSZ` | 虚拟内存大小（KB） |
| `RSS` | 物理内存大小（KB） |
| `TTY` | 终端设备 |
| `STAT` | 进程状态（如 S=休眠） |
| `COMMAND` | 启动命令 |

### 2.8 进程状态（STAT）详解

| 状态码 | 说明 |
|---|---|
| `R` | 运行中（Running） |
| `S` | 休眠（Sleeping） |
| `D` | 不可中断休眠（等待 I/O） |
| `Z` | 僵尸进程（Zombie） |
| `T` | 停止（Traced/Stopped） |
| `<` | 高优先级进程 |
| `N` | 低优先级进程 |

## 3. top - 动态观察进程

`top` 是动态观察程序变化的命令，默认每 3 秒刷新一次。

```bash
top                    # 动态显示进程
top -d 1               # 每秒刷新一次
top -p 1234            # 只监控指定进程
top -u root            # 只显示指定用户的进程

# top 交互命令
# h   - 显示帮助
# q   - 退出
# M   - 按内存排序
# P   - 按 CPU 排序
# k   - 杀死进程（输入 PID）
# r   - 调整进程优先级
```

## 4. kill - 终止进程

```bash
# 终止进程
kill PID               # 发送 SIGTERM（15），优雅退出
kill -9 PID            # 发送 SIGKILL（9），强制终止

# 按名称终止
killall nginx          # 终止所有 nginx 进程
killall -9 nginx       # 强制终止

pkill nginx            # 按名称匹配终止
pkill -u alice         # 终止指定用户的所有进程

# 查看 kill 信号
kill -l                # 列出所有信号
```

## 5. nohup - 后台运行

### 5.1 基本用法

```bash
# nohup 标准用法
nohup command > myout.file 2>&1 &

# 说明
# nohup      - 忽略 SIGHUP 信号，关闭终端后进程不会被杀死
# > file     - 标准输出重定向到文件
# 2>&1       - 标准错误也重定向到同一文件
# &          - 放入后台运行
```

### 5.2 常用示例

```bash
# 后台运行 Python 脚本
nohup python server.py > app.log 2>&1 &

# 后台运行 Java 程序
nohup java -jar app.jar > app.log 2>&1 &

# 查看后台进程
jobs                   # 查看当前 Shell 的后台任务
jobs -l                # 显示 PID

# 将后台进程调到前台
fg %1                  # 将第 1 个后台任务调到前台
bg %1                  # 让暂停的任务在后台继续

# 关闭终端后重新查看
ps aux | grep python    # 用 ps 查找进程
```

### 5.3 & 和 nohup 的区别

| 特性 | `&` | `nohup ... &` |
|------|-----|---------------|
| 后台运行 | 是 | 是 |
| 关闭终端后存活 | 否（被 SIGHUP 杀死） | 是 |
| 退出登录后存活 | 否 | 是 |
| 输出处理 | 仍输出到终端 | 重定向到 nohup.out 或指定文件 |

## 6. 进程管理命令速查表

| 操作 | 命令 |
|------|------|
| 查看所有进程 | `ps aux` 或 `ps -ef` |
| 按 CPU 排序 | `ps aux --sort=-%cpu` |
| 查看进程树 | `ps -ef --forest` |
| 动态监控 | `top` |
| 终止进程 | `kill PID` |
| 强制终止 | `kill -9 PID` |
| 按名称终止 | `killall name` |
| 后台运行 | `nohup cmd &` |
| 查看后台任务 | `jobs` |
| 调到前台 | `fg %N` |
