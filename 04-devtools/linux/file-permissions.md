---
title: Linux 文件权限管理
description: Linux 文件权限的完整指南，包括权限位、chmod、chown、特殊权限（SUID/SGID/Sticky）、umask 和 ACL
tags:
  - linux
  - permissions
  - chmod
---
# Linux 文件权限管理

## 1. 权限位与文件类型

```shell
-rw-r--r--. 1 root root  376 7月  20 10:44 web.xml
drwx--x---. 1 root root 4096 4月27日 13:59 docker
```

由 11 个字符组成：

- **第 1 位 (`d`/`-`)**：**文件类型**
    - `d` 代表目录 (Directory)，`-` 代表普通文件
    - `l` 代表符号链接，`b` 代表块设备，`c` 代表字符设备
- **第 2-4 位 (`rwx`)**：**所有者 (Owner/User)** 的权限
- **第 5-7 位 (`--x`)**：**所属组 (Group)** 的权限
- **第 8-10 位 (`---`)**：**其他人 (Others)** 的权限
- **第 11 位 (`.`)**：代表启用了 **SELinux 安全标签**

### 其他元数据

| 字段 | 内容 | 含义 |
|------|------|------|
| **链接数** | `13` | 该目录下的子目录数量（包含隐藏的 `.` 和 `..`） |
| **所有者** | `root` | 该文件属于 root 用户 |
| **所属组** | `root` | 该文件属于 root 用户组 |
| **大小** | `4096` | 目录元数据占用的空间大小（不是目录下所有文件的总大小） |
| **最后修改时间** | `4月27日 13:59` | 该文件最后一次被修改的时间 |
| **文件名** | `docker` | 文件的名称 |

## 2. 权限的数字表示法（八进制）

每个权限位对应一个数字值，三位权限组合成一个八进制数（0-7）：

| 权限 | 数字值 | 说明 |
|------|--------|------|
| `r` (read) | 4 | 可读 |
| `w` (write) | 2 | 可写 |
| `x` (execute) | 1 | 可执行（文件）/ 可进入（目录） |
| `-` | 0 | 无权限 |

### 权限组合表

| 组合 | 数字 | 权限含义 |
|------|------|----------|
| `---` | 0 | 无任何权限 |
| `--x` | 1 | 仅可执行 |
| `-w-` | 2 | 仅可写 |
| `-wx` | 3 | 可写+可执行 |
| `r--` | 4 | 仅可读 |
| `r-x` | 5 | 可读+可执行 |
| `rw-` | 6 | 可读+可写 |
| `rwx` | 7 | 可读+可写+可执行 |

### 三组权限组合示例

```bash
# chmod 755 = rwxr-xr-x
# 所有者：7 (rwx) = 4+2+1
# 所属组：5 (r-x) = 4+0+1
# 其他人：5 (r-x) = 4+0+1

# chmod 644 = rw-r--r--
# 所有者：6 (rw-) = 4+2+0
# 所属组：4 (r--) = 4+0+0
# 其他人：4 (r--) = 4+0+0

# chmod 700 = rwx------
# 所有者：7 (rwx)
# 所属组：0 (---)
# 其他人：0 (---)
```

## 3. 特殊权限位

除了基本的 rwx 权限，Linux 还有三个特殊权限：

| 特殊权限 | 符号 | 数字 | 作用 |
|----------|------|------|------|
| **SUID** | `s` (替代 x) | 4 | 执行时获得文件所有者的权限 |
| **SGID** | `s` (替代 x) | 2 | 执行时获得文件所属组的权限；目录中新文件继承组 |
| **SBIT (Sticky Bit)** | `t` (替代 x) | 1 | 目录中文件仅所有者可删除 |

### SUID（Set User ID）

```bash
# 示例：/usr/bin/passwd 具有 SUID
ls -l /usr/bin/passwd
# -rwsr-xr-x 1 root root ... /usr/bin/passwd

# 普通用户执行 passwd 时，临时获得 root 权限，才能修改 /etc/shadow

# 设置 SUID
chmod 4755 filename
chmod u+s filename

# 移除 SUID
chmod 755 filename
chmod u-s filename
```

> **注意**：SUID 对目录无效，仅对可执行文件有效。慎用，可能导致安全风险。

### SGID（Set Group ID）

```bash
# 对文件：执行时获得文件所属组的权限
chmod 2755 script.sh
chmod g+s script.sh

# 对目录：新创建的文件自动继承目录的所属组
mkdir /srv/shared
chgrp developers /srv/shared
chmod 2775 /srv/shared    # SGID + rwxrwxr-x
# 现在在 /srv/shared 中创建的文件，组自动为 developers
```

> **应用场景**：团队共享目录，确保所有文件都属于同一组。

### Sticky Bit（粘滞位）

```bash
# 示例：/tmp 目录具有 Sticky Bit
ls -ld /tmp
# drwxrwxrwt 10 root root ... /tmp

# 只有文件所有者才能删除自己的文件
chmod 1777 /tmp
chmod o+t /tmp

# 移除
chmod 777 /tmp
chmod o-t /tmp
```

> **应用场景**：公共临时目录，防止用户删除他人的文件。

### 特殊权限数字表示

特殊权限放在三位数字前，组成四位数字：

```bash
chmod 4755 file    # SUID + rwxr-xr-x
chmod 2755 dir     # SGID + rwxr-xr-x
chmod 1777 dir     # SBIT + rwxrwxrwx
chmod 6755 file    # SUID + SGID + rwxr-xr-x
```

## 4. 权限管理命令

### 4.1 chmod - 修改权限

```bash
# 数字法
chmod 755 filename      # rwxr-xr-x
chmod 644 filename      # rw-r--r--
chmod 700 filename      # rwx------
chmod 777 filename      # rwxrwxrwx（不推荐）

# 符号法
chmod u+x filename      # 所有者添加执行权限
chmod u-x filename      # 所有者移除执行权限
chmod g+w filename      # 所属组添加写权限
chmod o-r filename      # 其他移除读权限
chmod a+r filename      # 所有添加读权限（a = all）

# 组合操作
chmod u=rwx,g=rx,o=r filename  # 设置全部权限
chmod ug+x,o-r filename        # 所有者和组添加执行，其他人移除读

# 递归修改目录
chmod -R 755 directory/

# 同时设置特殊权限
chmod u+s filename     # SUID
chmod g+s directory    # SGID
chmod o+t directory    # Sticky Bit
```

#### chmod 符号法详解

| 符号 | 说明 |
|------|------|
| `u` | 所有者 (user) |
| `g` | 所属组 (group) |
| `o` | 其他 (others) |
| `a` | 所有 (all = u+g+o) |
| `+` | 添加权限 |
| `-` | 移除权限 |
| `=` | 设置权限（覆盖原有） |

### 4.2 chown - 修改所有者

```bash
# 修改所有者
chown user filename
chown root:root filename   # 同时修改所有者和所属组

# 仅修改所属组（等价于 chgrp）
chown :group filename

# 递归修改
chown -R user:group directory/

# 常用示例
chown alice:alice /home/alice/
chown -R www-data:www-data /var/www/html/
chown mysql:mysql /var/lib/mysql/
```

### 4.3 chgrp - 修改所属组

```bash
# 修改所属组
chgrp group filename

# 递归修改
chgrp -R group directory/

# 示例
chgrp developers /srv/shared
chgrp -R docker /var/lib/docker
```

## 5. 文件与目录权限的区别

| 权限 | 文件含义 | 目录含义 |
|------|----------|----------|
| `r` (read) | 可读取文件内容 | 可列出目录内容（`ls`） |
| `w` (write) | 可修改文件内容 | 可在目录中创建/删除/重命名文件 |
| `x` (execute) | 可执行文件（脚本/程序） | 可进入目录（`cd`） |
| `-` | 无权限 | 无权限 |

> **关键理解**：
> - 目录的 `w` 权限不仅影响创建文件，还影响**删除**目录中的文件（与文件本身的权限无关）
> - 目录的 `r` 权限仅影响 `ls` 列表，要进入目录必须有 `x`
> - 要完整访问目录，通常需要 `r+x`

### 权限组合效果

| 目录权限 | 可执行操作 |
|----------|------------|
| `--x` | 仅可 `cd` 进入，不可 `ls` |
| `r--` | 仅可 `ls` 文件名，不可 `cd`，不可读取文件内容 |
| `r-x` | 可 `cd` + `ls`，可读取目录中文件（需文件有 `r`） |
| `rwx` | 完全控制：进入、列表、创建、删除 |

## 6. 默认权限与 umask

### umask 作用

`umask` 决定新建文件和目录的默认权限，通过"遮蔽"某些权限位来设置。

```bash
# 查看 umask
umask
# 输出：0022（通常）

# 解释
# 文件默认权限：666 - umask = 666 - 022 = 644 (rw-r--r--)
# 目录默认权限：777 - umask = 777 - 022 = 755 (rwxr-xr-x)
```

### 设置 umask

```bash
# 临时设置（当前 Shell）
umask 022
umask 077   # 新文件：600，新目录：700

# 永久设置（写入 ~/.bashrc 或 ~/.zshrc）
echo "umask 022" >> ~/.bashrc

# 系统级设置（/etc/profile）
sudo vim /etc/profile
```

### umask 常用值

| umask | 新文件权限 | 新目录权限 | 适用场景 |
|-------|------------|------------|----------|
| `022` | 644 (rw-r--r--) | 755 (rwxr-xr-x) | 默认值，开放 |
| `027` | 640 (rw-r-----) | 750 (rwxr-x---) | 组内开放，其他封闭 |
| `077` | 600 (rw-------) | 700 (rwx------) | 完全私有 |
| `002` | 664 (rw-rw-r--) | 775 (rwxrwxr-x) | 组协作 |

## 7. ACL（访问控制列表）

当传统权限不够灵活时，可使用 ACL：

```bash
# 查看 ACL
getfacl filename

# 设置 ACL：给用户 alice 读权限
setfacl -m u:alice:r filename

# 设置 ACL：给组 developers 读写
setfacl -m g:developers:rw filename

# 移除 ACL
setfacl -x u:alice filename

# 清除所有 ACL
setfacl -b filename

# 递归设置
setfacl -R -m u:alice:rx directory/
```

> **启用 ACL**：需要文件系统支持，挂载时添加 `acl` 选项。

## 8. 权限管理实战示例

### Web 服务器目录权限

```bash
# 设置 Web 目录所有者
chown -R www-data:www-data /var/www/html/

# 目录权限：755（可读可进入）
find /var/www/html -type d -exec chmod 755 {} \;

# 文件权限：644（可读不可执行）
find /var/www/html -type f -exec chmod 644 {} \;

# 上传目录：允许写入
chmod 775 /var/www/html/uploads/
chgrp www-data /var/www/html/uploads/
```

### 共享开发目录

```bash
# 创建共享目录
mkdir /srv/dev-shared

# 设置组
chgrp developers /srv/dev-shared

# 设置权限：SGID + 组可写
chmod 2775 /srv/dev-shared
# 2 = SGID，新文件自动继承 developers 组
# 775 = rwxrwxr-x，组成员完全控制

# 设置 umask（成员配置）
# ~/.bashrc
umask 002   # 新文件：664，新目录：775
```

### 私密配置文件

```bash
# SSH 私钥：仅所有者可读
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
chmod 700 ~/.ssh/

# 密码文件、证书
chmod 600 /etc/shadow
chmod 600 /etc/ssl/private/server.key
```

## 9. 权限问题排查

```bash
# 查看文件权限
ls -l filename
ls -ld directory/

# 查看用户权限
namei -om /path/to/file  # 显示路径各层权限

# 查看所有者
stat filename

# 查看权限不足时的诊断
cat /etc/shadow
# cat: /etc/shadow: Permission denied

whoami
id
ls -l /etc/shadow
# -rw-r----- 1 root shadow ...

# 解决方案
sudo cat /etc/shadow
# 或加入 shadow 组
sudo usermod -aG shadow username
```

## 10. 权限管理命令速查表

| 操作        | 命令                                   |
| --------- | ------------------------------------ |
| 查看权限      | `ls -l file` 或 `stat file`           |
| 修改权限      | `chmod 755 file` 或 `chmod u+x file`  |
| 修改所有者     | `chown user:group file`              |
| 修改所属组     | `chgrp group file`                   |
| 递归修改      | `chmod -R` / `chown -R` / `chgrp -R` |
| 设置 SUID   | `chmod 4755 file` 或 `chmod u+s file` |
| 设置 SGID   | `chmod 2755 dir` 或 `chmod g+s dir`   |
| 设置 Sticky | `chmod 1777 dir` 或 `chmod o+t dir`   |
| 查看默认权限    | `umask`                              |
| 设置默认权限    | `umask 022`                          |
| 查看 ACL    | `getfacl file`                       |
| 设置 ACL    | `setfacl -m u:user:r file`           |

## 11. 权限最佳实践

1. **最小权限原则**：只授予必要的权限
2. **避免 777**：不要给所有人完全权限
3. **目录用 755，文件用 644**：常用安全配置
4. **私密文件用 600/700**：密钥、密码等
5. **使用组协作**：用 SGID 共享目录，而非 777
6. **定期检查**：`find / -perm -4000` 查找 SUID 文件
7. **使用 ACL**：复杂权限场景用 ACL 替代修改所有者

相关内容：[[user-group-management|用户与用户组管理]]
