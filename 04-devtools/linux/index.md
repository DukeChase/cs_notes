---
title: Linux 学习笔记
description: Linux 学习笔记索引，涵盖 Bash、常用命令、权限管理、目录配置、vim、进程管理等内容
tags:
  - linux
---

# Linux 学习笔记

参考：《鸟哥的 Linux 私房菜》

## 笔记目录

### 基础与命令

- [[bash-basics|Bash 基础]] — 变量、引号、数组、脚本参数、条件判断、循环、函数
- [[ls-command|ls 命令详解]] — 排序方式、时间类型、彩色输出
- [[find-command|find 命令详解]] — 按名称/类型/大小/时间/权限查找，执行操作
- [[ln-links|ln 链接用法]] — 硬链接与软链接的区别与使用

### 用户与权限

- [[user-group-management|用户与用户组管理]] — useradd/usermod/groupadd、sudo 配置
- [[file-permissions|文件权限管理]] — chmod/chown、SUID/SGID/Sticky、umask、ACL

### 系统配置

- [[fhs-directory-layout|FHS 目录配置]] — 根目录、/usr、/var 等目录结构规范

### 编辑器与工具

- [[vim-editor|vim 程序编辑器]] — 三种模式、光标移动、编辑操作、多窗口、配置、宏录制
- [[compression-packaging|文件压缩与打包]] — tar、gzip、bzip2 压缩与解压

### Shell 进阶

- [[shell-io-redirection|Shell IO 重定向与管线]] — stdin/stdout/stderr、grep/cut/sort/wc/uniq/tee

### 进程管理

- [[process-management|进程管理]] — ps、top、kill、nohup 后台运行

## 其他

### SSH 远程复制

```bash
scp /path/to/local/file username@remote_host:/path/to/remote/directory/
```

## 待补充章节

- 第六章：Linux 文件与目录管理（`cp`、`mv`、`rm` 等）
- 第七章：Linux 磁盘与文件系统管理
- 第十二章：Shell Script 编程
