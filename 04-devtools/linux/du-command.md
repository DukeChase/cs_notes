---
title: du 命令详解
description: Linux du 命令的完整用法，包括目录大小统计、深度控制、排除规则及实战场景
tags:
  - linux
  - command
  - du
---
# du 命令详解

`du`（disk usage）是 Linux 中用于统计目录和文件磁盘占用空间的命令，常用于排查磁盘空间问题、定位大文件/大目录。

## 1. 基础用法

```bash
du                  # 统计当前目录及子目录的磁盘占用
du /home            # 统计 /home 目录的磁盘占用
du -h               # 人类可读格式（K、M、G）
du -sh              # 仅显示总计，人类可读格式
du -ah              # 显示所有文件（含普通文件）的磁盘占用
```

## 2. 常用选项

| 选项 | 说明 | 典型场景 |
|------|------|----------|
| `-h` | 人类可读格式（K、M、G） | 日常查看目录大小 |
| `-s` | 仅显示总计（不列出子目录） | 快速查看目录总大小 |
| `-a` | 显示所有文件（含普通文件） | 逐文件排查空间占用 |
| `-c` | 最后显示所有项目总和 | 多个目录合计占用 |
| `-S` | 不包含子目录的大小 | 仅看当前层级目录自身大小 |
| `--apparent-size` | 显示表观大小（非磁盘块占用） | 对比文件实际大小与磁盘占用 |
| `-b` | 等价于 `--apparent-size --block-size=1` | 以字节显示表观大小 |

## 3. 深度控制

```bash
du -h --max-depth=0   # 仅显示当前目录总计（等价于 -sh）
du -h --max-depth=1   # 显示当前目录及一级子目录
du -h --max-depth=2   # 显示到二级子目录
du -h -d 1            # -d 是 --max-depth 的简写
```

| 命令                | 说明               |
| ----------------- | ---------------- |
| `du -sh *`        | 查看当前目录下各子项大小     |
| `du -h -d 1 /`    | 查看根目录一级子目录大小     |
| `du -h -d 1 /var` | 查看 /var 下一级子目录大小 |

> **注意**：`--max-depth=0` 等价于 `-s`，`--max-depth=1` 是最常用的排查方式。

## 4. 排序与筛选

```bash
# 按大小排序（降序）
du -sh * | sort -hr

# 按大小排序（升序）
du -sh * | sort -h

# 显示最大的 10 个目录
du -h -d 1 / | sort -hr | head -n 10

# 显示当前目录下最大的 5 个子项
du -sh * | sort -hr | head -n 5
```

### 按大小阈值筛选

```bash
# 只显示大于 100MB 的目录
du -h -d 1 / | awk '$1 ~ /[0-9]+G/ || $1 ~ /[0-9]{3,}M/'

# 使用 threshold 参数（GNU coreutils）
du -h -d 1 --threshold=100M /var
```

## 5. 排除目录

```bash
# 排除单个目录
du -sh --exclude=node_modules .

# 排除多个目录
du -sh --exclude=node_modules --exclude=.git .

# 使用通配符排除
du -sh --exclude='*.log' .

# 使用排除文件
du -sh --exclude-from=exclude.txt .
```

```bash
# exclude.txt 示例内容
node_modules
.git
dist
*.log
```

> **实用技巧**：排查项目目录时，排除 `node_modules`、`.git` 等大目录可以更聚焦实际代码占用。

## 6. 多目录对比

```bash
# 对比多个目录大小
du -sh /var/log /var/lib /var/cache

# 显示合计
du -sch /var/log /var/lib /var/cache

# 对比并排序
du -sh /var/log /var/lib /var/cache | sort -hr
```

| 选项 | 说明 |
|------|------|
| `-c` | 最后一行显示总和 |
| 无 `-c` | 仅分别显示各目录大小 |

## 7. 表观大小 vs 磁盘占用

```bash
# 磁盘块占用（默认）—— 文件实际占用的磁盘空间
du file.txt

# 表观大小 —— 文件内容逻辑大小
du --apparent-size file.txt

# 对比
du file.txt --apparent-size
```

| 概念 | 说明 | 何时不同 |
|------|------|----------|
| 磁盘占用（默认） | 按 4KB 块向上取整 | 空文件、小文件占用整数个块 |
| 表观大小（`--apparent-size`） | 文件逻辑字节数 | 稀疏文件、含洞的文件 |

> **典型差异**：一个 1 字节的文件，磁盘占用 4KB（一个块），表观大小 1B。

## 8. 实战场景

### 排查磁盘空间不足

```bash
# 1. 从根目录开始，逐层定位大目录
du -h -d 1 / | sort -hr | head -n 10

# 2. 进入最大目录，继续深入
du -h -d 1 /var | sort -hr | head -n 10

# 3. 定位到具体大文件
du -ah /var/log | sort -hr | head -n 20
```

### 项目目录空间分析

```bash
# 查看项目各一级目录占用（排除依赖和缓存）
du -sh --exclude=node_modules --exclude=.next --exclude=dist .

# 查看项目源码 vs 依赖大小
du -sh node_modules/
du -sh src/
du -sh --exclude=node_modules .

# 查看各语言文件的占用
find . -name "*.js" -exec du -ch {} + | grep total
find . -name "*.py" -exec du -ch {} + | grep total
```

### Docker 磁盘占用

```bash
# 查看 Docker 根目录占用
du -sh /var/lib/docker

# 查看 Docker 各子目录占用
du -h -d 1 /var/lib/docker | sort -hr

# 查看容器日志占用
du -sh /var/lib/docker/containers/*/*-json.log
```

### 定期监控脚本

```bash
# 记录目录大小变化
echo "$(date +%Y-%m-%d) $(du -sh /var/log | cut -f1)" >> /var/log/size-history.log

# 监控多个关键目录
for dir in /var/log /var/lib /tmp /home; do
  echo "$dir: $(du -sh "$dir" | cut -f1)"
done
```

## 9. du 与其他命令组合

### du + find

```bash
# 查找大于 100MB 的文件并按大小排序
find / -type f -size +100M -exec du -h {} + | sort -hr

# 统计某类文件的总占用
find . -name "*.log" -exec du -ch {} + | grep total

# 查找最近 7 天修改的大文件
find . -mtime -7 -type f -exec du -h {} + | sort -hr | head -n 10
```

### du + xargs

```bash
# 批量查看多个目录大小
echo -e "/var/log\n/var/lib\n/tmp" | xargs du -sh

# 查看所有用户 home 目录占用
ls /home | xargs -I{} du -sh /home/{}
```

### du + watch

```bash
# 实时监控目录大小变化
watch -n 5 'du -sh /var/log'

# 每隔 5 秒刷新，对比两个目录
watch -n 5 'du -sh /var/log /var/lib'
```

## 10. du vs ls -l

| 对比项 | `du -sh` | `ls -lh` |
|--------|----------|----------|
| 目录支持 | 显示目录总大小 | 仅显示目录元数据大小（通常 4KB） |
| 文件支持 | 显示文件磁盘占用 | 显示文件逻辑大小 |
| 递归 | 默认递归统计子目录 | 不递归 |
| 用途 | 排查磁盘空间 | 查看文件属性 |

```bash
# 典型差异：目录本身
ls -ld /var/log    # 显示 4KB（目录项本身大小）
du -sh /var/log    # 显示 200MB（目录下所有文件总大小）
```

## 11. du 命令速查表

| 场景 | 命令 |
|------|------|
| 查看目录总大小 | `du -sh /path` |
| 查看一级子目录大小 | `du -h -d 1 /path` |
| 按大小排序 | `du -sh * \| sort -hr` |
| 找最大的 10 个目录 | `du -h -d 1 / \| sort -hr \| head -n 10` |
| 排除目录 | `du -sh --exclude=node_modules .` |
| 多目录合计 | `du -sch dir1 dir2 dir3` |
| 查看文件实际大小 | `du --apparent-size file` |
| 查找大文件 | `find / -type f -size +100M -exec du -h {} + \| sort -hr` |
