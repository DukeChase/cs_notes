---
title: find 命令详解
description: Linux find 命令的完整用法，按名称、类型、大小、时间、权限查找文件，以及执行操作
tags:
  - linux
  - command
  - find
---

# find 命令详解

`find` 是 Linux 中最强大的文件查找命令，支持按名称、类型、大小、时间、权限等多种条件查找，并可对结果执行操作。

## 1. 基础语法

```bash
find [路径] [选项] [操作]
```

- **路径**：查找的起始目录（默认当前目录）
- **选项**：查找条件（名称、类型、大小、时间等）
- **操作**：对查找结果执行的动作（默认打印）

### 基础用法

```bash
find                    # 列出当前目录所有文件（递归）
find /home              # 列出 /home 下所有文件
find . -name "*.txt"    # 查找当前目录下所有 .txt 文件
find / -name "nginx"    # 从根目录查找名为 nginx 的文件（慎用，慢）
```

## 2. 按名称查找

```bash
find . -name "*.log"              # 查找所有 .log 文件
find . -name "file.txt"           # 查找名为 file.txt 的文件
find . -iname "*.txt"             # 忽略大小写查找 .txt 文件
find . -name "[abc]*"             # 查找以 a、b、c 开头的文件

# 使用通配符
find . -name "file?.txt"          # ? 匹配单个字符
find . -name "file[1-9].txt"      # [1-9] 匹配数字范围
find . -name "*.txt" -o -name "*.log"  # 查找 .txt 或 .log 文件（或条件）
```

| 选项 | 说明 |
|------|------|
| `-name` | 按文件名匹配（区分大小写） |
| `-iname` | 按文件名匹配（忽略大小写） |
| `-path` | 按完整路径匹配 |
| `-ipath` | 按完整路径匹配（忽略大小写） |

## 3. 按类型查找

```bash
find . -type f             # 查找普通文件
find . -type d             # 查找目录
find . -type l             # 查找符号链接
find . -type b             # 查找块设备（硬盘等）
find . -type c             # 查找字符设备（终端等）
find . -type s             # 查找套接字文件
find . -type p             # 查找管道文件

# 常用组合
find . -type f -name "*.log"     # 查找所有 .log 文件（不含目录）
find . -type d -name "test*"     # 查找以 test 开头的目录
```

| 类型符 | 说明 |
|--------|------|
| `f` | 普通文件 |
| `d` | 目录 |
| `l` | 符号链接 |
| `b` | 块设备 |
| `c` | 字符设备 |
| `s` | 套接字 |
| `p` | 管道 |

## 4. 按大小查找

```bash
find . -size 0             # 查找大小为 0 的文件（空文件）
find . -size +100M         # 查找大于 100MB 的文件
find . -size -10k          # 查找小于 10KB 的文件
find . -size +1G -size -5G # 查找大于 1GB 且小于 5GB 的文件

# 单位说明
# b  - 512 字节块（默认）
# c   - 字节
# w   - 双字节（字）
# k   - KB
# M   - MB
# G   - GB

# 常用示例
find /var/log -type f -size +100M     # 查找大于 100MB 的日志文件
find /tmp -type f -size 0             # 查找空文件
find . -type f -size +10M -exec ls -lh {} \;  # 找大文件并显示详细信息
```

| 符号 | 说明 |
|------|------|
| `+` | 大于指定大小 |
| `-` | 小于指定大小 |
| 无符号 | 等于指定大小 |

## 5. 按时间查找

```bash
# 按修改时间（mtime：内容修改时间）
find . -mtime 0            # 查找今天修改的文件（24小时内）
find . -mtime -7           # 查找最近 7 天内修改的文件
find . -mtime +30          # 查找超过 30 天前修改的文件
find . -mtime 1            # 查找 24-48 小时前修改的文件

# 按访问时间（atime：访问时间）
find . -atime -1           # 查找最近 1 天内访问的文件
find . -atime +30          # 查找超过 30 天前访问的文件

# 按状态改变时间（ctime：元数据修改时间）
find . -ctime -1           # 查找最近 1 天内状态改变的文件（权限、所有者等）

# 按分钟查找（更精确）
find . -mmin -10           # 查找最近 10 分钟内修改的文件
find . -amin -60           # 查找最近 60 分钟内访问的文件
find . -cmin -30           # 查找最近 30 分钟内状态改变的文件

# 按新文件查找
find . -newer file.txt     # 查找比 file.txt 更新的文件
find . -newermt "2024-01-01"  # 查找比指定时间更新的文件
find . -anewer file.txt    # 查找比 file.txt 更晚访问的文件
```

| 选项 | 说明 | 单位 |
|------|------|------|
| `-mtime` | 内容修改时间 | 天 |
| `-atime` | 访问时间 | 天 |
| `-ctime` | 状态改变时间 | 天 |
| `-mmin` | 内容修改时间 | 分钟 |
| `-amin` | 访问时间 | 分钟 |
| `-cmin` | 状态改变时间 | 分钟 |
| `-newer` | 比指定文件更新 | - |

> **注意**：时间计算方式：`-mtime 0` 表示 24 小时内，`-mtime 1` 表示 24-48 小时，`-mtime -1` 表示最近 1 天（24小时内）。

## 6. 按权限查找

```bash
find . -perm 755           # 查找权限为 755 的文件
find . -perm -755          # 查找权限包含 755 的文件（至少有这些权限）
find . -perm /755          # 查找权限匹配 755 任一位的文件（u/g/o 任一位有权限）
find . -perm 777           # 查找权限为 777 的文件（危险）
find . -perm -4000         # 查找具有 SUID 的文件
find . -perm -2000         # 查找具有 SGID 的文件
find . -perm -1000         # 查找具有 Sticky Bit 的文件

# 查找可执行文件
find . -type f -perm /111  # 查找任一位有执行权限的文件
find . -type f -perm -111  # 查找所有位都有执行权限的文件

# 查找可写文件（危险检查）
find . -type f -perm -002  # 查找所有人可写的文件
find / -perm -4000 2>/dev/null  # 查找 SUID 文件（忽略错误）
```

| 权限格式 | 说明 |
|----------|------|
| `-perm mode` | 精确匹配权限 |
| `-perm -mode` | 包含所有指定权限 |
| `-perm /mode` | 匹配任一指定权限 |

## 7. 按用户和组查找

```bash
find . -user root          # 查找属于 root 用户的文件
find . -user alice         # 查找属于 alice 用户的文件
find . -group developers   # 查找属于 developers 组的文件
find . -group docker       # 查找属于 docker 组的文件

find . -nouser             # 查找无所有者的文件（用户已被删除）
find . -nogroup            # 查找无所属组的文件（组已被删除）

find . -uid 1000           # 查找 UID 为 1000 的文件
find . -gid 1000           # 查找 GID 为 1000 的文件

# 查找用户的所有文件并修改权限
find . -user alice -type f -exec chmod 644 {} \;
```

## 8. 按深度查找

```bash
find . -maxdepth 1         # 最多查找 1 层（当前目录）
find . -maxdepth 2         # 最多查找 2 层（当前目录 + 子目录）
find . -mindepth 2         # 最少查找 2 层（跳过当前目录）
find . -maxdepth 1 -mindepth 1  # 只查找子目录，不包含当前目录

# 只查找当前目录的文件（不递归）
find . -maxdepth 1 -type f
find . -maxdepth 1 -name "*.log"
```

## 9. 组合条件

```bash
# AND 条件（默认，多个条件同时满足）
find . -name "*.txt" -type f          # 文件名 .txt 且是普通文件
find . -name "*.log" -size +100M      # 文件名 .log 且大于 100MB

# OR 条件（任一条件满足）
find . -name "*.txt" -o -name "*.log" # 文件名 .txt 或 .log
find . -type f -o -type d             # 普通文件或目录

# NOT 条件（排除）
find . ! -name "*.log"                # 文件名不是 .log
find . ! -type d                      # 不是目录
find . -type f ! -name "*.txt"        # 普通文件但不是 .txt

# 组合括号（需要转义）
find . \( -name "*.txt" -o -name "*.log" \) -size +10k
# 查找 .txt 或 .log 文件，且大于 10KB

find . \( -type f -name "*.log" \) -mtime -7
# 查找最近 7 天修改的 .log 文件
```

| 操作符 | 说明 |
|--------|------|
| `-a` 或空格 | AND（默认） |
| `-o` | OR（或） |
| `!` | NOT（非） |
| `()` | 组合（需要转义 `\(` `\)`） |

## 10. 执行操作

```bash
# -exec：对每个文件执行命令
find . -name "*.log" -exec rm {} \;            # 删除所有 .log 文件
find . -type f -exec chmod 644 {} \;           # 修改所有文件权限
find . -name "*.txt" -exec mv {} /tmp/ \;      # 移动所有 .txt 文件到 /tmp

# -execdir：在文件所在目录执行命令（更安全）
find . -name "*.log" -execdir rm {} \;         # 在文件所在目录删除

# -ok：执行命令前询问确认
find . -name "*.log" -ok rm {} \;              # 询问是否删除每个 .log 文件

# -delete：直接删除文件
find . -name "*.log" -delete                   # 删除所有 .log 文件

# -print：打印文件路径（默认）
find . -name "*.txt" -print                    # 打印文件路径

# -print0：用 null 分隔（处理含空格文件名）
find . -name "*.txt" -print0 | xargs -0 rm     # 安全删除含空格的文件名

# 常用 -exec 示例
find . -type f -exec ls -lh {} \;              # 显示每个文件的详细信息
find . -name "*.jpg" -exec tar -czf images.tar.gz {} +  # 批量打包（+号）
find . -size 0 -exec cat {} \;                 # 查看空文件内容
find . -type f -exec file {} \;                # 查看每个文件类型
```

| 操作 | 说明 |
|------|------|
| `-exec command {} \;` | 对每个文件执行命令 |
| `-exec command {} +` | 批量执行命令（更高效） |
| `-execdir command {} \;` | 在文件目录执行 |
| `-ok command {} \;` | 执行前询问确认 |
| `-delete` | 删除文件 |
| `-print` | 打印路径（默认） |
| `-print0` | 用 null 分隔路径 |

> **注意**：`{}` 代表找到的文件，`\;` 结尾表示逐个执行，`+` 结尾表示批量执行。

## 11. 排除目录

```bash
find . -path ./tmp -prune -o -name "*.log" -print
# 排除 ./tmp 目录，查找其他目录的 .log 文件

find . -path "./.git" -prune -o -type f -print
# 排除 .git 目录，查找所有文件

find . \( -path ./tmp -o -path ./cache \) -prune -o -type f -print
# 排除 tmp 和 cache 目录
```

## 12. 常用实战示例

### 查找大文件

```bash
# 查找大于 100MB 的文件
find / -type f -size +100M -exec ls -lh {} \; 2>/dev/null

# 查找最大的 10 个文件
find . -type f -exec du -h {} + | sort -rh | head -n 10

# 查找大于 1GB 的文件并排序
find . -type f -size +1G -exec ls -lh {} \; | sort -k5 -hr
```

### 查找并删除文件

```bash
# 删除 7 天前的日志文件
find /var/log -name "*.log" -mtime +7 -delete

# 删除空文件
find . -type f -size 0 -delete

# 删除临时文件（询问确认）
find /tmp -name "*.tmp" -ok rm {} \;

# 安全删除含空格的文件名
find . -name "*.tmp" -print0 | xargs -0 rm
```

### 查找最近修改的文件

```bash
# 查找最近 1 小时修改的文件
find . -type f -mmin -60

# 查找今天创建的文件
find . -type f -mtime 0

# 查找最近 7 天修改的文件
find . -type f -mtime -7 -ls

# 查找比某个文件更新的文件
find . -newer config.yaml -type f
```

### 查找权限问题

```bash
# 查找所有人可写的文件（安全隐患）
find / -perm -002 -type f 2>/dev/null

# 查找 SUID 文件（安全检查）
find / -perm -4000 -type f -ls 2>/dev/null

# 查找无所有者的文件
find / -nouser -o -nogroup 2>/dev/null

# 查找权限为 777 的文件
find . -perm 777 -type f
```

### 批量修改权限

```bash
# 修改所有目录权限为 755
find . -type d -exec chmod 755 {} \;

# 修改所有文件权限为 644
find . -type f -exec chmod 644 {} \;

# 修改所有 .sh 文件为可执行
find . -name "*.sh" -type f -exec chmod +x {} \;

# 修改特定用户的所有文件权限
find . -user alice -type f -exec chmod 644 {} \;
```

### 备份和归档

```bash
# 备份最近修改的文件
find . -mtime -1 -type f -exec tar -czf backup.tar.gz {} +

# 备份所有 .txt 文件
find . -name "*.txt" -exec tar -czf txt_files.tar.gz {} +

# 复制文件到备份目录
find . -name "*.jpg" -exec cp {} /backup/images/ \;
```

## 13. find 与其他命令组合

```bash
# find + xargs：批量处理
find . -name "*.log" -print0 | xargs -0 grep "ERROR"

# find + grep：查找文件内容
find . -name "*.py" -exec grep -l "import sys" {} \;

# find + tar：打包文件
find . -name "*.jpg" -print0 | xargs -0 tar -czf images.tar.gz

# find + rm：删除文件
find . -name "*.tmp" -print0 | xargs -0 rm -f

# find + chmod：批量修改权限
find . -type f -print0 | xargs -0 chmod 644

# find + wc：统计文件数量
find . -name "*.txt" | wc -l

# find + du：计算文件大小
find . -name "*.log" -exec du -ch {} + | grep total
```

## 14. find 命令速查表

| 查找条件 | 命令示例 |
|----------|----------|
| 按名称 | `find . -name "*.txt"` |
| 按类型 | `find . -type f` |
| 按大小 | `find . -size +100M` |
| 按修改时间 | `find . -mtime -7` |
| 按访问时间 | `find . -atime +30` |
| 按权限 | `find . -perm 755` |
| 按用户 | `find . -user alice` |
| 按组 | `find . -group developers` |
| 排除目录 | `find . -path ./tmp -prune -o -name "*.log" -print` |
| 限制深度 | `find . -maxdepth 2` |
| 执行命令 | `find . -name "*.log" -exec rm {} \;` |
| 删除文件 | `find . -name "*.tmp" -delete` |

## 15. 性能优化

```bash
# 限制查找深度（减少搜索范围）
find . -maxdepth 3 -name "*.txt"

# 排除不必要目录
find . \( -path ./node_modules -o -path ./.git \) -prune -o -type f -print

# 使用 xargs 批量处理（比 -exec 更高效）
find . -name "*.log" -print0 | xargs -0 grep "ERROR"

# 忽略错误输出（查找根目录时推荐）
find / -name "*.conf" 2>/dev/null

# 使用 -exec + 批量执行（比 -exec \; 更高效）
find . -name "*.txt" -exec chmod 644 {} +
```
