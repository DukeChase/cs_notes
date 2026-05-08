---
title: Linux 用户与用户组管理
description: Linux 用户账户与用户组管理的完整指南，包括 useradd、usermod、groupadd 等命令
tags:
  - linux
  - user-management
  - permissions
---

# Linux 用户与用户组管理

## 1. 用户与用户组的概念

Linux 是一个**多用户、多任务**的操作系统，每个用户都有独立的身份标识和权限范围。

### 1.1 三种身份类别

| 身别 | 说明 | 典型场景 |
|------|------|----------|
| **所有者 (Owner/User)** | 文件的创建者，拥有最高权限 | 用户自己的配置文件、脚本 |
| **所属组 (Group)** | 文件所属的用户组，组成员共享权限 | 项目组共享的开发文件 |
| **其他人 (Others)** | 既不是所有者也不在所属组 | 其他系统用户 |

### 1.2 用户类型

| 用户类型 | UID 范围 | 说明 |
|----------|----------|------|
| **超级用户 (root)** | 0 | 拥有系统最高权限，不受限制 |
| **系统用户** | 1-999（CentOS 7+）或 1-499 | 系统服务账号，如 `www`, `mysql`, `nginx` |
| **普通用户** | 1000+（CentOS 7+）或 500+ | 由管理员创建的实际使用者 |

## 2. 用户账户相关文件

### 2.1 `/etc/passwd` - 用户账户信息

每行代表一个用户，格式：`用户名:密码占位符:UID:GID:描述:主目录:默认Shell`

```bash
# 查看 passwd 文件
cat /etc/passwd

# 示例内容解析
root:x:0:0:root:/root:/bin/bash
duke:x:1000:1000:Duke Chen:/home/duke:/bin/zsh
mysql:x:27:27:MySQL Server:/var/lib/mysql:/sbin/nologin
```

| 字段 | 说明 |
|------|------|
| `root` | 用户名 |
| `x` | 密码占位符（实际密码在 `/etc/shadow`） |
| `0` | UID（用户ID） |
| `0` | GID（主组ID） |
| `root` | 用户描述/注释 |
| `/root` | 用户主目录 |
| `/bin/bash` | 默认 Shell |

### 2.2 `/etc/shadow` - 用户密码信息

存放加密后的密码和密码策略，**只有 root 可读**。

```bash
# 查看 shadow 文件（需要 root）
sudo cat /etc/shadow

# 示例内容解析
root:$6$encrypted...:18000:0:99999:7:::
duke:$6$encrypted...:18050:5:90:7:10:18000:
```

| 字段 | 说明 |
|------|------|
| 用户名 | 对应 passwd 中的用户 |
| 加密密码 | `$6$` 表示 SHA-512 加密；`*` 表示锁定；`!!` 表示无密码 |
| 最近修改日期 | 从 1970-01-01 算起的天数 |
| 最小修改间隔 | 两次修改密码的最少天数（0 表示随时可改） |
| 密码有效期 | 密码最大使用天数（99999 表示永不过期） |
| 警告天数 | 过期前多少天开始警告 |
| 宽限天数 | 过期后还能使用的天数 |
| 失效日期 | 账号失效的绝对日期 |

### 2.3 `/etc/group` - 用户组信息

每行代表一个用户组，格式：`组名:密码占位符:GID:组成员列表`

```bash
# 查看 group 文件
cat /etc/group

# 示例内容
root:x:0:
sudo:x:27:duke,admin
docker:x:996:duke
```

| 字段 | 说明 |
|------|------|
| `sudo` | 组名 |
| `x` | 组密码占位符（实际在 `/etc/gshadow`） |
| `27` | GID |
| `duke,admin` | 组成员列表（逗号分隔） |

## 3. 用户管理命令

### 3.1 useradd - 创建用户

```bash
# 基本创建
useradd username

# 常用选项
useradd -m username              # 同时创建主目录
useradd -d /data/home/user1 user1  # 指定主目录
useradd -s /bin/zsh username     # 指定默认 Shell
useradd -g developers username   # 指定主组
useradd -G sudo,docker username  # 加入附加组（多个用逗号分隔）
useradd -u 1500 username         # 指定 UID
useradd -c "描述信息" username    # 添加描述

# 完整示例
useradd -m -s /bin/bash -g developers -G sudo,docker -c "Developer John" john
```

| 选项 | 说明 |
|------|------|
| `-m` | 创建用户主目录 |
| `-d` | 指定主目录路径 |
| `-s` | 指定默认 Shell |
| `-g` | 指定主组（必须存在） |
| `-G` | 指定附加组 |
| `-u` | 指定 UID |
| `-c` | 添加描述注释 |
| `-e` | 设置账户过期日期 |
| `-f` | 设置密码过期后宽限天数 |

### 3.2 usermod - 修改用户

```bash
# 修改用户属性
usermod -l newname oldname        # 修改用户名
usermod -d /new/home username     # 修改主目录（需手动迁移）
usermod -s /bin/zsh username      # 修改 Shell
usermod -g newgroup username      # 修改主组
usermod -G group1,group2 username # 替换附加组（覆盖原有）
usermod -aG group3 username       # 添加附加组（追加，不覆盖）
usermod -L username               # 锁定用户（密码前加 `!`）
usermod -U username               # 解锁用户
usermod -e 2025-12-31 username    # 设置过期日期
```

> **注意**：`-G` 会覆盖原有附加组，`-aG` 是追加。

### 3.3 userdel - 删除用户

```bash
# 仅删除用户账户
userdel username

# 同时删除主目录
userdel -r username

# 查看删除前状态
id username
ls -la /home/username
```

> **建议**：删除前先备份用户数据，使用 `-r` 选项清理主目录。

### 3.4 passwd - 管理密码

```bash
# 设置用户密码（root 或用户自己）
passwd username

# 常用管理操作（root）
passwd -l username     # 锁定用户密码
passwd -u username     # 解锁用户密码
passwd -d username     # 删除密码（无密码登录）
passwd -e username     # 强制密码过期（下次登录必须改密码）

# 查看密码状态
passwd -S username
```

### 3.5 id - 查看用户信息

```bash
# 查看当前用户
id

# 查看指定用户
id username
id duke
# 输出：uid=1000(duke) gid=1000(duke) groups=1000(duke),27(sudo),996(docker)
```

### 3.6 who / w / whoami - 查看登录用户

```bash
# 查看当前登录用户
who
w        # 更详细，包含登录时间和正在执行的命令
whoami   # 显示当前用户名

# 查看登录历史
last     # 所有登录历史
last -n 5  # 最近 5 次
lastlog  # 各用户最近登录时间
```

## 4. 用户组管理命令

### 4.1 groupadd - 创建用户组

```bash
# 创建组
groupadd developers

# 指定 GID
groupadd -g 1001 developers
```

### 4.2 groupmod - 修改用户组

```bash
# 修改组名
groupmod -n newname oldname

# 修改 GID
groupmod -g 1002 developers
```

### 4.3 groupdel - 删除用户组

```bash
# 删除组（不能有成员使用此组作为主组）
groupdel developers

# 查看组是否有成员
grep developers /etc/passwd
```

### 4.4 gpasswd - 管理组成员

```bash
# 添加组成员
gpasswd -a username groupname

# 删除组成员
gpasswd -d username groupname

# 设置组管理员
gpasswd -A admin groupname

# 设置组密码（较少使用）
gpasswd groupname
```

### 4.5 groups - 查看用户所属组

```bash
# 查看当前用户所属组
groups

# 查看指定用户所属组
groups username
```

## 5. 主组与附加组的区别

| 类型 | 说明 | 特点 |
|------|------|------|
| **主组 (Primary Group)** | 用户创建文件时默认所属的组 | 每个用户必须有且仅有一个主组 |
| **附加组 (Supplementary Group)** | 用户额外加入的组 | 可以加入多个附加组，获取组权限 |

```bash
# 创建用户时设置主组和附加组
useradd -g developers -G sudo,docker john

# 查看用户组信息
id john
# uid=1001(john) gid=1000(developers) groups=1000(developers),27(sudo),996(docker)

# gid 是主组，groups 列表包含主组和所有附加组
```

### 实际应用场景

| 场景 | 配置方法 |
|------|----------|
| 开发团队共享代码 | 创建 `dev` 组，成员设为主组为 `dev` |
| 管理员权限控制 | 加入 `sudo` 或 `wheel` 组 |
| Docker 使用权限 | 加入 `docker` 组，无需 sudo 运行 docker |
| 数据库管理 | 创建 `mysql` 系统用户，主组为 `mysql` |

## 6. 切换用户身份

### 6.1 su - 切换用户

```bash
# 切换到 root（需要 root 密码）
su
su -      # 完整切换（加载 root 环境变量）

# 切换到指定用户
su username
su - username  # 完整切换（加载用户环境变量）

# 以指定用户执行单条命令
su - username -c "command"
```

| 选项 | 说明 |
|------|------|
| `-` 或 `-l` | 完整切换，加载目标用户环境 |
| `-c` | 执行命令后返回 |
| `-s` | 指定 Shell |

### 6.2 sudo - 以 root 权限执行

```bash
# 单次执行
sudo command

# 以指定用户执行
sudo -u username command

# 编辑文件
sudo vim /etc/hosts

# 进入 root Shell
sudo -i
sudo su -
```

### 6.3 sudo 配置 (`/etc/sudoers`)

```bash
# 安全编辑 sudoers（推荐）
sudo visudo

# 基本语法
# user    host=(runas)    commands
duke     ALL=(ALL)       ALL           # duke 可以执行所有命令
duke     ALL=(ALL)       NOPASSWD: ALL # 无需密码
%sudo    ALL=(ALL)       ALL           # sudo 组成员可执行所有命令
duke     ALL=(ALL)       /usr/bin/docker  # 仅允许执行 docker
```

| 配置项 | 说明 |
|--------|------|
| `user` | 用户名或 `%groupname` |
| `host` | 主机名，`ALL` 表示所有主机 |
| `runas` | 可以切换的目标用户 |
| `commands` | 允许执行的命令列表 |
| `NOPASSWD:` | 不需要密码 |

## 7. 用户管理完整示例

### 7.1 创建开发团队用户

```bash
# 1. 创建开发组
groupadd -g 1001 developers

# 2. 创建用户并加入组
useradd -m -g developers -G sudo,docker -s /bin/bash -c "Developer Alice" alice
useradd -m -g developers -G sudo,docker -s /bin/bash -c "Developer Bob" bob

# 3. 设置密码
passwd alice
passwd bob

# 4. 验证
id alice
groups alice

# 5. 创建团队共享目录
mkdir /srv/dev-shared
chgrp developers /srv/dev-shared
chmod 775 /srv/dev-shared      # 组成员可读写

# 或使用 SGID，新文件自动继承组
chmod 2775 /srv/dev-shared
```

### 7.2 批量添加用户到组

```bash
# 方法一：gpasswd
gpasswd -M alice,bob,charlie developers

# 方法二：usermod（逐个追加）
for user in alice bob charlie; do
    usermod -aG docker $user
done
```

### 7.3 锁定/解锁账户

```bash
# 锁定账户（禁止登录）
usermod -L alice
passwd -l alice

# 查看锁定状态
passwd -S alice
# 输出：alice L ...

# 解锁账户
usermod -U alice
passwd -u alice
```

### 7.4 删除用户

```bash
# 1. 检查用户信息
id alice
find / -user alice 2>/dev/null  # 查找用户拥有的文件

# 2. 备份数据
tar -czf /backup/alice-home.tar.gz /home/alice

# 3. 删除用户
userdel -r alice
```

## 8. 用户管理命令速查表

| 操作 | 命令 |
|------|------|
| 创建用户 | `useradd -m -s /bin/bash username` |
| 设置密码 | `passwd username` |
| 查看用户 | `id username` |
| 修改用户 | `usermod -aG group username` |
| 删除用户 | `userdel -r username` |
| 创建组 | `groupadd groupname` |
| 删除组 | `groupdel groupname` |
| 添加组成员 | `gpasswd -a user group` 或 `usermod -aG group user` |
| 删除组成员 | `gpasswd -d user group` |
| 查看所属组 | `groups username` |
| 切换用户 | `su - username` |
| root 权限执行 | `sudo command` |

相关内容：[[file-permissions|文件权限管理]]
