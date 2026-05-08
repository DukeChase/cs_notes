---
title: 文件压缩与打包
description: Linux tar、gzip、bzip2 等压缩与打包命令的用法
tags:
  - linux
  - tar
  - compression
---

# 文件压缩与打包

参考：《鸟哥的 Linux 私房菜》第八章

## 1. tar 命令

`tar` 是 Linux 中最常用的打包和压缩工具，支持多种压缩格式。

### 1.1 gzip 格式 (.tar.gz)

```bash
# 压缩
tar -zcvf test.tar.gz test

# 解压
tar -zxvf test.tar.gz

# 解压到指定目录
tar -zxvf test.tar.gz -C /path/to/directory/
```

### 1.2 bzip2 格式 (.tar.bz2)

```bash
# 压缩
tar -jcvf filename.tar.bz2 要被压缩的文件或文件夹

# 解压
tar -jxvf filename.tar.bz2

# 解压到指定目录
tar -jxvf filename.tar.bz2 -C 欲解压缩的目录
```

### 1.3 tar 参数说明

| 参数 | 说明 |
|------|------|
| `-c` | 创建新的归档文件（create） |
| `-x` | 解包归档文件（extract） |
| `-t` | 查看归档文件内容（list） |
| `-v` | 显示详细过程（verbose） |
| `-f` | 指定归档文件名（file） |
| `-z` | 使用 gzip 压缩/解压 |
| `-j` | 使用 bzip2 压缩/解压 |
| `-C` | 解压到指定目录 |
| `-p` | 保留原始权限 |

### 1.4 常用组合

```bash
# 查看压缩包内容
tar -ztvf test.tar.gz
tar -jtvf test.tar.bz2

# 排除某些文件
tar -zcvf backup.tar.gz --exclude='*.log' /path/to/dir

# 只打包不压缩
tar -cvf archive.tar file1 file2 dir/
```
