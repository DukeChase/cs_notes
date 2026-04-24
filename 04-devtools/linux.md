# Linux Learning Notes

reference: 《鸟哥的linux私房菜》

ssh 复制文件

`scp /path/to/local/file username@remote_host:/path/to/remote/directory/`
## 认识和学习bash 

```bash
cat /etc/shells

echo $SHELL

#!/bin/bash

x = 1
y = "this is a string"
echo $x
echo $y

```

```sh
[dmtsai@study ~]$ name=VBird 
[dmtsai@study ~]$ echo $name 
VBird
```

```sh
# **双引号会“解析”变量，而单引号会把所有内容当作“纯文本”**
# 双引号
[dmtsai@study ~]$ myname="$name its me"

[dmtsai@study ~]$ echo $myname 
VBird its me 

# 单引号
[dmtsai@study ~]$ myname='$name its me' 
[dmtsai@study ~]$ echo $myname 
$name its me
```


```sh
arr = (1 2 3 4)
echo ${arr[@]}
echo ${arr[0]}

files = $(ls)
echo ${files[@]}

export MY_ENV=1000
echo $MY_ENV
```

```bash
# 默认值  但不赋值
echo ${var1:-"hello1"}
# 默认值 且赋值
echo ${var2:="hello2"}
```


```bash
# 脚本名称
echo $0
# 脚本第一个参数
echo $1
echo $2
echo $3
# 脚本参数个数
echo $#
```

```bash
a=1
b=2
if [ $a -gt $b]; then
 echo "a 更大"
else
 echo "a 更小"
fi


for num in 1 2 3 4 5; do
 echo "this is : $num"
done

for file in $(ls); do
 echo $file
done

num=1
while (($num<5)); do
 echo $num
 let "num++"
done

function bidaxiao(){
 if [ $1 -gt $2 ]; then
  echo "big"
 else
  echo "small"
 fi
}

bidaxiao 1 3 
```

# 第五章 Linux 的文件权限与目录配置

```shell
-rw-r--r--. 1 root root  376 7月  20 10:44 web.xml
```

文件所有者、群组和其他人所属

## 5.3 linux目录配置

### 5.3. 1 Linux目录配置的依据 FHS

FHS（Filesystem Hierarchy Standard，文件系统层次结构标准）是 Linux 文件系统目录配置的标准规范，由 Linux 基金会维护，定义了各个目录的用途、存放的内容以及目录结构。

#### FHS 的作用

1. **统一标准**：让用户和开发者能够预测文件和目录的位置
2. **软件兼容**：不同 Linux 发行版遵循相同标准，软件安装更统一
3. **系统管理**：管理员能够快速找到配置文件、日志文件等
4. **文档规范**：便于编写文档和培训材料

#### 目录树结构

Linux 文件系统采用树状结构，根目录（`/`）是所有目录的起点：

```
/
├── bin/       # 用户基本命令
├── boot/      # 启动加载程序文件
├── dev/       # 设备文件
├── etc/       # 系统配置文件
├── home/      # 用户主目录
├── lib/       # 共享库和内核模块
├── lib64/     # 64位共享库
├── media/     # 可移动设备挂载点
├── mnt/       # 临时挂载点
├── opt/       # 可选应用软件包
├── proc/      # 进程和内核信息
├── root/      # root 用户主目录
├── run/       # 运行时变量数据
├── sbin/      # 系统管理命令
├── srv/       # 服务数据
├── sys/       # 系统设备信息
├── tmp/       # 临时文件
├── usr/       # 用户程序和数据
└── var/       # 可变数据文件
```

#### 根目录（/）下的主要目录

##### 1. `/bin` - 用户基本命令

存放所有用户都能使用的基本命令（二进制文件）。

**特点**：
- 单用户模式下也能使用
- 不依赖其他分区
- 系统启动必需的命令

**常见内容**：
```bash
ls, cp, mv, cat, rm, mkdir, rmdir
bash, sh, csh, zsh
echo, pwd, date, uname
```

**示例**：
```bash
# 查看 /bin 目录内容
ls /bin

# 查看命令位置
which ls
# 输出: /bin/ls
```

##### 2. `/boot` - 启动加载程序文件

存放系统启动所需的文件，包括内核、引导加载程序等。

**常见内容**：
- `vmlinuz`：Linux 内核文件
- `initrd` 或 `initramfs`：初始化 RAM 磁盘
- `grub/`：GRUB 引导加载程序配置
- `System.map`：内核符号映射表
- `config-`：内核配置文件

**示例**：
```bash
# 查看内核版本
ls /boot/vmlinuz-*

# 查看 GRUB 配置
ls /boot/grub/
```

##### 3. `/dev` - 设备文件

存放设备文件（设备驱动程序的接口），包括硬件设备和虚拟设备。

**常见设备文件**：
- `/dev/null`：空设备（丢弃所有输入）
- `/dev/zero`：零设备（提供无限零字节）
- `/dev/random`：随机数设备
- `/dev/tty`：终端设备
- `/dev/sda`：SCSI/SATA 硬盘
- `/dev/null`：块设备（硬盘、U盘）
- `/dev/pts/`：伪终端设备

**示例**：
```bash
# 查看设备文件
ls -l /dev

# 使用设备文件
cat /dev/null  # 丢弃输出
dd if=/dev/zero of=testfile bs=1M count=10  # 创建10MB文件

# 查看硬盘设备
lsblk
fdisk -l
```

##### 4. `/etc` - 系统配置文件

存放系统配置文件，大部分是文本文件，系统管理员经常编辑此目录。

**常见配置文件**：
- `/etc/passwd`：用户账户信息
- `/etc/shadow`：用户密码信息
- `/etc/group`：用户组信息
- `/etc/fstab`：文件系统挂载配置
- `/etc/hosts`：主机名解析
- `/etc/resolv.conf`：DNS 配置
- `/etc/network/interfaces`：网络配置（Debian/Ubuntu）
- `/etc/sysconfig/network-scripts/`：网络配置（CentOS/RHEL）
- `/etc/ssh/`：SSH 配置
- `/etc/crontab`：系统定时任务
- `/etc/services`：网络服务端口定义
- `/etc/protocols`：网络协议定义

**示例**：
```bash
# 查看 passwd 文件
cat /etc/passwd

# 编辑 fstab 配置
sudo vim /etc/fstab

# 查看网络配置
cat /etc/network/interfaces
```

##### 5. `/home` - 用户主目录

存放普通用户的主目录，每个用户都有一个子目录。

**特点**：
- 用户个人文件存放位置
- 用户配置文件（`.bashrc`, `.profile` 等）
- 用户数据文件
- 用户权限控制

**目录结构**：
```
/home/
├── user1/
│   ├── .bashrc
│   ├── .bash_profile
│   ├── .profile
│   ├── Documents/
│   ├── Downloads/
│   └── Desktop/
├── user2/
└── user3/
```

**示例**：
```bash
# 查看用户主目录
ls /home

# 进入用户主目录
cd ~
cd $HOME

# 查看用户配置文件
ls -la ~/.bashrc
```

##### 6. `/lib` - 共享库和内核模块

存放系统启动和运行 `/bin`、`/sbin` 中命令所需的共享库（动态链接库）。

**常见内容**：
- `/lib/modules/`：内核模块
- `/lib/systemd/`：systemd 相关库
- `*.so`：共享对象文件（动态链接库）
- `*.a`：静态库文件

**示例**：
```bash
# 查看共享库
ls /lib/*.so*

# 查看内核模块
ls /lib/modules/$(uname -r)/

# 查看库依赖
ldd /bin/ls
```

##### 7. `/lib64` - 64位共享库

存放 64 位系统所需的共享库（仅在 64 位系统中存在）。

**示例**：
```bash
# 查看 64 位库
ls /lib64

# 查看命令依赖的库
ldd /bin/ls
```

##### 8. `/media` - 可移动设备挂载点

用于挂载可移动设备（U盘、光盘、移动硬盘等）。

**特点**：
- 系统自动挂载设备到此目录
- 设备名称作为子目录名

**示例**：
```bash
# 查看挂载的设备
ls /media

# 挂载 U 盘（系统自动挂载）
# U 盘通常显示为 /media/user/USB_NAME

# 手动挂载
sudo mount /dev/sdb1 /media/usb
```

##### 9. `/mnt` - 临时挂载点

用于临时挂载文件系统（管理员手动挂载）。

**特点**：
- 临时挂载点
- 管理员手动挂载网络文件系统、临时分区等

**示例**：
```bash
# 挂载 NFS 文件系统
sudo mount 192.168.1.100:/share /mnt/nfs

# 挂载临时分区
sudo mount /dev/sdb1 /mnt/temp

# 查看挂载信息
mount | grep mnt
```

##### 10. `/opt` - 可选应用软件包

存放可选的第三方应用软件包（大型独立软件）。

**特点**：
- 第三方软件安装位置
- 软件包独立存放
- 不影响系统其他部分

**常见内容**：
- `/opt/google/chrome/`：Google Chrome
- `/opt/vscode/`：Visual Studio Code
- `/opt/java/`：Java JDK
- `/opt/oracle/`：Oracle 软件

**示例**：
```bash
# 查看 opt 目录
ls /opt

# 安装软件到 opt
sudo tar -xzf app.tar.gz -C /opt/
```

##### 11. `/proc` - 进程和内核信息

虚拟文件系统，存放进程信息和内核参数（不占用磁盘空间）。

**特点**：
- 虚拟文件系统（内存中）
- 动态生成，反映系统状态
- 可读取内核参数和进程信息

**常见内容**：
- `/proc/cpuinfo`：CPU 信息
- `/proc/meminfo`：内存信息
- `/proc/version`：内核版本
- `/proc/loadavg`：系统负载
- `/proc/uptime`：系统运行时间
- `/proc/[pid]/`：进程信息目录
- `/proc/sys/`：内核参数（可修改）

**示例**：
```bash
# 查看 CPU 信息
cat /proc/cpuinfo

# 查看内存信息
cat /proc/meminfo

# 查看内核版本
cat /proc/version

# 查看系统负载
cat /proc/loadavg

# 查看进程信息
ls /proc/[pid]/

# 修改内核参数
echo 1 > /proc/sys/net/ipv4/ip_forward
```

##### 12. `/root` - root 用户主目录

root 用户（超级管理员）的主目录。

**特点**：
- root 用户专用
- 存放 root 的配置文件和个人文件
- 普通用户无权访问

**示例**：
```bash
# 进入 root 主目录（需要 root 权限）
sudo -i
cd ~

# 查看 root 主目录
sudo ls /root
```

##### 13. `/run` - 运行时变量数据

存放系统运行时的临时文件（重启后清空）。

**特点**：
- 运行时数据（进程 PID、锁文件等）
- 临时文件系统（内存中）
- 系统重启后清空

**常见内容**：
- `/run/[service].pid`：服务进程 PID 文件
- `/run/lock/`：锁文件
- `/run/user/[uid]/`：用户运行时文件

**示例**：
```bash
# 查看 run 目录
ls /run

# 查看 systemd 运行时文件
ls /run/systemd/

# 查看服务 PID 文件
cat /run/sshd.pid
```

##### 14. `/sbin` - 系统管理命令

存放系统管理命令（只有 root 用户能使用）。

**特点**：
- 系统管理命令
- 启动、修复、恢复系统所需
- root 用户专用

**常见内容**：
- `init`, `shutdown`, `reboot`
- `fdisk`, `mkfs`, `fsck`
- `ifconfig`, `ip`, `route`
- `iptables`, `systemctl`
- `mount`, `umount`

**示例**：
```bash
# 查看 sbin 目录
ls /sbin

# 使用系统管理命令
sudo shutdown -h now
sudo fdisk -l
sudo systemctl start nginx
```

##### 15. `/srv` - 服务数据

存放服务提供的数据（Web、FTP 等服务的数据）。

**特点**：
- 服务数据存放位置
- 服务特定的数据文件
- 不常用，多数发行版未使用

**示例**：
```bash
# 查看 srv 目录
ls /srv

# Web 服务数据
ls /srv/www/
```

##### 16. `/sys` - 系统设备信息

虚拟文件系统，存放设备和驱动程序信息（类似 `/proc`）。

**特点**：
- 虚拟文件系统（内存中）
- 反映设备和驱动状态
- 可修改设备参数

**常见内容**：
- `/sys/block/`：块设备信息
- `/sys/class/`：设备类别
- `/sys/devices/`：设备信息
- `/sys/kernel/`：内核参数

**示例**：
```bash
# 查看 sys 目录
ls /sys

# 查看块设备信息
ls /sys/block/

# 查看设备类别
ls /sys/class/net/
```

##### 17. `/tmp` - 临时文件

存放临时文件，所有用户可访问，系统重启后清空。

**特点**：
- 临时文件存放位置
- 所有用户可读写
- 定期清理（通常 10 天）
- 系统重启后清空

**示例**：
```bash
# 创建临时文件
touch /tmp/testfile

# 查看临时文件
ls /tmp

# 清理临时文件
sudo rm -rf /tmp/*
```

#### `/usr` 目录结构

`/usr`（Unix System Resource）是用户程序和数据的存放位置，包含大部分用户应用软件。

##### `/usr` 的子目录

```
/usr/
├── bin/       # 用户命令（非必需）
├── sbin/      # 系统管理命令（非必需）
├── lib/       # 共享库
├── lib64/     # 64位共享库
├── include/   # 头文件（开发用）
├── share/     # 共享数据（文档、图标等）
├── local/     # 本地安装的软件
├── src/       # 源代码
└── games/     # 游戏程序
```

##### 常见子目录详解

**1. `/usr/bin/`**：用户命令（非启动必需）

存放大量用户命令，比 `/bin` 更多。

```bash
ls /usr/bin  # 查看
which python  # 通常在 /usr/bin/python
which gcc     # 通常在 /usr/bin/gcc
```

**2. `/usr/sbin/`**：系统管理命令（非启动必需）

存放非启动必需的系统管理命令。

```bash
ls /usr/sbin
which httpd   # Apache 服务器
which nginx   # Nginx 服务器
```

**3. `/usr/lib/`**：共享库

存放 `/usr/bin` 和 `/usr/sbin` 命令所需的库文件。

```bash
ls /usr/lib
ldd /usr/bin/python  # 查看 Python 依赖库
```

**4. `/usr/include/`**：头文件

存放 C/C++ 等编程语言的头文件（开发用）。

```bash
ls /usr/include
ls /usr/include/stdio.h  # C 标准库头文件
```

**5. `/usr/share/`**：共享数据

存放共享数据文件（文档、图标、配置模板等）。

```bash
ls /usr/share
ls /usr/share/doc/       # 文档
ls /usr/share/man/       # man 手册
ls /usr/share/icons/     # 图标
ls /usr/share/applications/  # 应用程序快捷方式
```

**6. `/usr/local/`**：本地安装的软件

存放用户本地安装的软件（手动安装的软件）。

```bash
ls /usr/local
ls /usr/local/bin/    # 本地安装的命令
ls /usr/local/lib/    # 本地安装的库
ls /usr/local/etc/    # 本地软件配置
```

**示例**：手动安装软件到 `/usr/local`

```bash
# 编译安装软件
./configure --prefix=/usr/local
make
sudo make install

# 安装后命令位置
ls /usr/local/bin/
```

#### `/var` 目录结构

`/var`（Variable）存放可变数据文件，包括日志、缓存、临时文件等。

##### `/var` 的子目录

```
/var/
├── log/       # 系统日志文件
├── cache/     # 应用缓存数据
├── lib/       # 应用状态数据
├── spool/     # 队列数据（邮件、打印等）
├── tmp/       # 临时文件（重启不清空）
├── mail/      # 用户邮件
├── www/       # Web 服务数据
├── ftp/       # FTP 服务数据
└── run/       # 运行时数据（已移至 /run）
```

##### 常见子目录详解

**1. `/var/log/`**：系统日志文件

存放系统和服务日志文件（最重要的目录之一）。

```bash
ls /var/log
cat /var/log/syslog        # 系统日志（Debian/Ubuntu）
cat /var/log/messages      # 系统日志（CentOS/RHEL）
cat /var/log/auth.log      # 认证日志
cat /var/log/kern.log      # 内核日志
cat /var/log/nginx/        # Nginx 日志
cat /var/log/apache2/      # Apache 日志
cat /var/log/mysql/        # MySQL 日志
```

**2. `/var/cache/`**：应用缓存数据

存放应用缓存数据（可删除，应用会重新生成）。

```bash
ls /var/cache
ls /var/cache/apt/     # apt 缓存（Debian/Ubuntu）
ls /var/cache/yum/     # yum 缓存（CentOS/RHEL）
ls /var/cache/man/     # man 手册缓存
```

**3. `/var/lib/`**：应用状态数据

存放应用的状态数据（数据库、配置等）。

```bash
ls /var/lib
ls /var/lib/mysql/     # MySQL 数据库
ls /var/lib/docker/    # Docker 数据
ls /var/lib/systemd/   # systemd 状态
ls /var/lib/dpkg/      # dpkg 状态（Debian/Ubuntu）
ls /var/lib/rpm/       # rpm 状态（CentOS/RHEL）
```

**4. `/var/spool/`**：队列数据

存放队列数据（邮件、打印任务等）。

```bash
ls /var/spool
ls /var/spool/mail/    # 用户邮件队列
ls /var/spool/cron/    # cron 任务队列
ls /var/spool/postfix/ # Postfix 队列
```

**5. `/var/mail/`**：用户邮件

存放用户邮件文件。

```bash
ls /var/mail
cat /var/mail/user1    # 用户邮件
```

**6. `/var/www/`**：Web 服务数据

存放 Web 服务数据（网站文件）。

```bash
ls /var/www
ls /var/www/html/      # Apache 默认网站目录
ls /var/www/nginx/     # Nginx 网站目录
```

#### FHS 分类标准

##### 1. 可分享与不可分享

| 类型 | 定义 | 示例 |
|------|------|------|
| **可分享（Shareable）** | 可在多个主机间共享的目录 | `/usr`, `/opt`, `/home` |
| **不可分享（Unshareable）** | 仅本机使用的目录 | `/etc`, `/boot`, `/var` |

##### 2. 静态与可变

| 类型 | 定义 | 示例 |
|------|------|------|
| **静态（Static）** | 不经常变化的目录（除非管理员干预） | `/usr`, `/opt`, `/boot` |
| **可变（Variable）** | 经常变化的目录 | `/var`, `/tmp`, `/home` |

##### 3. 四种组合

| 组合 | 目录示例 | 说明 |
|------|----------|------|
| **可分享 + 静态** | `/usr`, `/opt` | 可共享的应用程序 |
| **可分享 + 可变** | `/home`, `/var/mail` | 可共享的用户数据 |
| **不可分享 + 静态** | `/etc`, `/boot` | 本机配置和启动文件 |
| **不可分享 + 可变** | `/var/run`, `/var/log` | 本机运行时数据 |

#### 目录权限与安全

##### 目录权限原则

1. **系统目录权限**：
   - `/bin`, `/sbin`, `/lib`：755（所有用户可读可执行）
   - `/etc`：755（所有用户可读，root 可写）
   - `/var/log`：755（所有用户可读，root 可写）
   - `/tmp`：1777（所有用户可读写，sticky bit）

2. **用户目录权限**：
   - `/home/user`：700（仅用户可访问）
   - `/root`：700（仅 root 可访问）

##### 安全注意事项

```bash
# 查看目录权限
ls -ld /etc
ls -ld /var/log
ls -ld /tmp

# 修改目录权限（谨慎操作）
sudo chmod 755 /etc
sudo chmod 700 /root

# 查看敏感文件权限
ls -l /etc/shadow  # 应为 600 或 640
ls -l /etc/passwd  # 应为 644
```

#### 实际应用示例

##### 1. 查找配置文件

```bash
# 查找 SSH 配置
ls /etc/ssh/

# 查找网络配置
ls /etc/network/
ls /etc/sysconfig/network-scripts/

# 查找服务配置
ls /etc/nginx/
ls /etc/apache2/
ls /etc/mysql/
```

##### 2. 查找日志文件

```bash
# 查看系统日志
tail -f /var/log/syslog
tail -f /var/log/messages

# 查看服务日志
tail -f /var/log/nginx/error.log
tail -f /var/log/mysql/error.log

# 查看认证日志（登录记录）
tail -f /var/log/auth.log
```

##### 3. 查找用户文件

```bash
# 查看用户主目录
ls /home/

# 查看用户配置文件
cat ~/.bashrc
cat ~/.bash_profile

# 查看用户邮件
ls /var/mail/
```

##### 4. 查找程序文件

```bash
# 查看命令位置
which ls        # /bin/ls
which python    # /usr/bin/python
which nginx     # /usr/sbin/nginx

# 查看库文件位置
ldd /bin/ls

# 查看程序文档
ls /usr/share/doc/
man ls
```

##### 5. 系统维护操作

```bash
# 清理临时文件
sudo rm -rf /tmp/*

# 清理缓存
sudo rm -rf /var/cache/apt/archives/*.deb

# 查看磁盘使用情况
du -sh /var/log
du -sh /usr/share
du -sh /home

# 查看文件系统挂载情况
mount | grep -E '/|usr|var|home'
```

#### FHS 版本与差异

##### FHS 版本

- **FHS 2.3**（2004）：经典版本，多数发行版遵循
- **FHS 3.0**（2015）：最新版本，新增 `/run` 目录

##### 不同发行版的差异

| 目录 | Debian/Ubuntu | CentOS/RHEL | 说明 |
|------|---------------|-------------|------|
| 网络配置 | `/etc/network/` | `/etc/sysconfig/network-scripts/` | 配置位置不同 |
| Web 数据 | `/var/www/html/` | `/var/www/html/` | 基本一致 |
| 日志文件 | `/var/log/syslog` | `/var/log/messages` | 主日志文件名称不同 |
| 包管理缓存 | `/var/cache/apt/` | `/var/cache/yum/` | 包管理器不同 |

#### 总结

**FHS 核心要点**：

1. **根目录（/）**：系统启动必需的目录
2. **/usr**：用户程序和数据
3. **/var**：可变数据（日志、缓存等）
4. **/home**：用户主目录
5. **/etc**：系统配置文件
6. **/tmp**：临时文件

**常用目录速查**：

| 目录 | 用途 | 常见内容 |
|------|------|----------|
| `/bin` | 基本命令 | `ls, cp, mv, cat` |
| `/etc` | 配置文件 | `passwd, fstab, hosts` |
| `/home` | 用户目录 | 用户个人文件 |
| `/var/log` | 日志文件 | 系统和服务日志 |
| `/usr/bin` | 用户命令 | `python, gcc, vim` |
| `/usr/local` | 本地软件 | 手动安装的软件 |
| `/tmp` | 临时文件 | 临时数据 |
| `/proc` | 进程信息 | CPU、内存、进程信息 |

**最佳实践**：

1. 遵循 FHS 标准，将文件放在正确位置
2. 不要随意修改系统目录权限
3. 定期清理 `/tmp` 和 `/var/cache`
4. 重要数据备份 `/home` 和 `/var/lib`
5. 监控 `/var/log` 日志文件大小


# 第六章 Linux文件与目录管理

# 第七章 Linux磁盘与文件系统管理


# 第八章 文件与文件系统的压缩，打包与备份

## 8.3 压缩

压缩 `tar -zcvf   test.tar.gz test`
解压 `tar -zxvf test.tar.gz`
```sh
# 压缩
tar jcv -f filename.tar.bz2 要被压缩的文件或文件夹

# 解压
tar -jxv -f filename.tar.bz2 -C 欲解压缩的目录
```

# 第九章 vim程序编辑器


# 第十章 认识与学习BASH

## 10.2 shell的变量功能

```sh
echo $PATH

echo ${PATH}

"myname=Vbird"
unset


export 
```

## 10.3 命令别名与历史命名

```sh
alias ll='ls -l'

umalias ll
```

## 10.4 Bash Shell 的操作环境

## 10.5 数据流重定向

### 10.5.1 什么是数据流重定向
1. `stdin`
2. `stdout`
3. `stderr`
#### stdout

```shell
# std out 
ll / 1> ~/rootfile  # 覆盖   1可以省略

ll / 1>> ~/rootfile  # 追加

# std err

cat ~/files 2>   # 覆盖
cat ~/files 2>>  # append

# 标准输出和错误输出 分开输出到文件
find /home -name .bashrc > list_right 2> list_error


/dev/null


# stdout 和 stderr 输出到同一个文件list
find /home -name .bashrc > list 2>&1 
find /home -name .bashrc &> list

nohup command >myout.file 2>&1 &
```

#### stdin
`< `
`<<`
```sh
cat > catfile  < ~/.bashrc


cat > catfile <<  "eof"
```

### 10.5.2 命令行的执行的判断依据

## 命令行
```shell
sync; sync; shutdown -h now
```

`$?`  表示上一条指令的输出，执行成功则为0

 指令下达情况
`cmd1 && cmd2`

1. 若 cmd1 执行完毕且正确执行（`$?=0`），则开始执 行 cmd2。
2. 若 cmd1 执行完毕且为错误 （`$?≠0`），则 cmd2 不 执行。

`cmd1|| cmd2`

1. 若 cmd1 执行完毕且正确执行（`$?=0`），则 cmd2 不执行。

2. 若 cmd1 执行完毕且为错误 （`$?≠0`），则开始执行 cmd2。

```shell
$?   指令回传值
&&
,
||
```

## 10.6 管线命令
- 管线命令“ `|` ”仅 能处理经由前面一个指令传来的正确信息，也就是 `standard output`的信 息，对于 `stdandard error` 并没有直接处理的能力

- 管线命令仅会处理 `standard output`，对于 `standard error output` 会予以忽略
- 管线命令必须要能够接受来自前一个指令的数据成为 standard input 继续处理才行。

### 10.6.1 grep cut
将一段数据经过分析后，取出 我们所想要的

grep   
- -i   忽略大小写
- -v  反向匹配
- -C   --context 除了显示符合样式的那一行之外，并显示该行之前后的内容

### 10.6.2  sort wc uniq

### 10.6.3 tee


# 第十二章 学习Shell Script

```shell
#!/bin/bash
```
# 第十六章 程序管理和Selinux初探


## 16.3 程序管理

### 16.3.1 程序的观察

ps ：将某个时间点的程序运行情况撷取下来

```bash
# 仅观察自己的 bash 相关程序： ps -l
ps -l

# 观察系统所有程序： ps aux
ps aux
```

top：动态观察程序的变化


### 16.3.2 程序的管理



# other

## nohup

[# Linux命令之`nohup`详解](https://juejin.cn/post/6844903860272660494)

`nohup command > myout.file 2>&1 &`

[Linux nohup后台启动/ 后台启动命令中nohup 、&、重定向的使用](https://blog.csdn.net/weixin_49114503/article/details/134266408)


## Linux ps 命令用法介绍

以下是 Linux 中 `ps` 命令的常见用法及搭配选项的总结，帮助您快速掌握进程查看技巧：

---
### ​**​一、基础语法​**​

`ps [选项]`

---
### ​**​二、常用选项组合及用途​**​
#### ​**​1. 查看所有进程​**​

| 选项组合     | 说明                          | 适用场景             |
| -------- | --------------------------- | ---------------- |
| `ps -ef` | 显示​**​所有进程​**​的完整信息（Unix风格） | 快速查看全系统进程        |
| `ps aux` | 显示​**​所有用户​**​的进程（BSD风格）    | 查看详细资源占用（CPU/内存） |

​**​示例​**​：
```bash
ps -ef        # 列出所有进程（带父进程ID）   
ps aux        # 列出所有进程（带CPU/内存占用）
```

---
#### ​**​2. 查看指定用户的进程​**​

|选项|说明|
|---|---|
|`-u <用户名>`|显示指定用户的进程|
|`-U <用户ID>`|根据用户ID过滤|

​**​示例​**​：

```bash
ps -u root      # 查看 root 用户的进程   
ps aux -u www   # 查看用户 www 的进程（结合aux）
```

---
#### ​**​3. 显示进程树结构​**​

| 选项                | 说明            |
| ----------------- | ------------- |
| `-f` / `--forest` | 显示进程树（父子层级关系） |

​**​示例​**​：

```bash
ps -ef --forest    # 树形显示所有进程   
ps auxf            # BSD风格树形显示
```

---

#### ​**​4. 筛选特定进程​**​

| 选项         | 说明                |
| ---------- | ----------------- |
| `-C <命令名>` | 按进程名过滤（如 `nginx`） |
| `-p <PID>` | 按进程ID过滤           |

​**​示例​**​：

```bash
ps -C nginx       # 查看所有 nginx 进程   
ps -p 1234,5678  # 查看PID为1234和5678的进程
```

---

#### ​**​5. 显示线程信息​**​

| 选项   | 说明           |
| ---- | ------------ |
| `-L` | 显示进程的线程（LWP） |
| `-T` | 显示线程（SPID）   |

​**​示例​**​：

```bash
ps -eLf      # 查看所有线程（含线程ID）   
ps -T -p 1234  # 查看PID 1234的线程
```

---

#### ​**​6. 自定义输出列​**​

|选项|说明|
|---|---|
|`-o <列名>`|自定义显示的列（如 `pid,cmd,%cpu`）|

​**​示例​**​：

```bash
# 显示PID、父PID、命令、CPU/内存占用，按CPU降序
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu
```

---

### ​**​三、实用技巧​**​

#### ​**​1. 结合 `grep` 过滤进程​**​

```bash
ps aux | grep nginx          # 查找所有 nginx 进程   
ps -ef | grep -v grep        # 排除 grep 自身进程
```

#### ​**​2. 按资源占用排序​**​

```bash
ps aux --sort=-%cpu          # 按 CPU 使用率降序   
ps aux --sort=-%mem          # 按内存使用率降序
```

#### ​**​3. 查看进程环境变量​**​

```bash
ps e -p <PID>    # 显示指定进程的环境变量
```

---

### ​**​四、选项风格说明​**​

|风格|示例|特点|
|---|---|---|
|​**​Unix​**​|`-ef`、`-aux`|选项前带短横线（兼容性强）|
|​**​BSD​**​|`aux`、`auxf`|选项前无短横线（更简洁）|

---

### ​**​五、常用输出列解释​**​

|列名|说明|
|---|---|
|`PID`|进程ID|
|`PPID`|父进程ID|
|`%CPU`|CPU 占用率|
|`%MEM`|内存占用率|
|`VSZ`|虚拟内存大小（KB）|
|`RSS`|物理内存大小（KB）|
|`TTY`|终端设备|
|`STAT`|进程状态（如 S=休眠）|
|`COMMAND`|启动命令|

---

### ​**​六、进程状态（STAT）详解​**​

|状态码|说明|
|---|---|
|`R`|运行中（Running）|
|`S`|休眠（Sleeping）|
|`D`|不可中断休眠（等待I/O）|
|`Z`|僵尸进程（Zombie）|
|`T`|停止（Traced/Stopped）|
|`<`|高优先级进程|
|`N`|低优先级进程|

---

### ​**​总结​**​

- ​**​快速查看所有进程​**​：`ps aux` 或 `ps -ef`
- ​**​资源占用分析​**​：`ps aux --sort=-%cpu`
- ​**​进程树结构​**​：`ps -ef --forest`
- ​**​精准筛选​**​：结合 `-C`、`-p` 或 `grep`

掌握这些组合，您可以高效诊断系统性能问题或管理服务进程！

## ln 链接用法指南

`ln` 是 Linux 和 macOS 系统中用于创建**链接（Link）**的命令。链接可以理解为文件的“别名”或“快捷方式”，但它比操作系统的快捷方式更强大、更底层。

`ln` 主要有两种模式：**硬链接（Hard Link）**和**软链接/符号链接（Symbolic Link / Soft Link）**。

---

### 1. 核心语法

```bash
ln [选项] <源文件> <目标链接>
```

- **源文件**：已经存在的真实文件或目录。
- **目标链接**：你想要创建的链接文件名（如果省略，默认在当前目录下创建一个与源文件同名的链接）。

---

### 2. 两种链接模式的区别（非常重要）

|特性|**软链接 (Symbolic Link)**  <br>`ln -s`|**硬链接 (Hard Link)**  <br>`ln` (默认)|
|:--|:--|:--|
|**命令参数**|必须加 `-s`|不加 `-s`|
|**本质**|一个特殊的文件，里面存着**源文件的路径字符串**。类似 Windows 的快捷方式。|直接指向文件在磁盘上的**数据块（inode）**。多个文件名指向同一份数据。|
|**跨文件系统**|**支持** (可以跨硬盘、跨分区)|**不支持** (必须在同一分区内)|
|**链接目录**|**支持** (可以链接到文件夹)|**不支持** (通常禁止链接到目录，以防循环引用)|
|**源文件删除后**|**失效** (变成“死链接”，打不开)|**依然有效** (只要还有一个硬链接存在，数据就不会丢失)|
|**文件大小**|很小 (只存路径字符串)|与源文件一样大 (因为就是同一个文件)|
|**权限显示**|`ls -l` 显示为 `l` 开头|`ls -l` 显示为 `-` 开头 (和普通文件一样)|

> **结论**：在 95% 的日常场景（如配置环境变量、快捷启动程序）中，你都应该使用 **软链接 (`ln -s`)**。

---

### 3. 常用用法示例

#### A. 创建软链接 (最常用)

创建一个名为 `myapp` 的链接，指向 `/opt/app/bin/start.sh`：

```bash
ln -s /opt/app/bin/start.sh myapp
```

- 现在运行 `./myapp` 就等于运行 `/opt/app/bin/start.sh`。
- 如果源文件移动了，链接会失效。

#### B. 创建硬链接

创建一个名为 `backup.txt` 的硬链接，指向 `original.txt`：

```bash
ln original.txt backup.txt
```

- 修改 `backup.txt` 的内容，`original.txt` 也会同步变化（因为它们是完全同一个文件）。
- 删除 `original.txt`，`backup.txt` 里的内容依然存在。

#### C. 批量创建链接 (链接整个目录)

如果你想让一个文件夹可以通过另一个路径访问（只能使用软链接）：

```bash
ln -s /var/www/html/myproject ~/Desktop/project-link
```

- 现在桌面上的 `project-link` 文件夹直接映射到 `/var/www/html/myproject`。

#### D. 强制覆盖已存在的链接

如果目标位置已经有一个同名文件，`ln` 会报错。使用 `-f` (force) 强制覆盖：

```bash
ln -sf /new/path/to/file /usr/local/bin/existing-link
```

- `-s`: 创建软链接
- `-f`: 如果目标存在，先删除它再创建新链接。

#### E. 相对路径 vs 绝对路径

- **绝对路径**（推荐）：写死完整路径，无论你在哪执行命令都有效。
    
    ```bash
    ln -s /usr/local/opt/python/bin/python3 ~/bin/python
    ```
    
- **相对路径**：基于当前目录计算。如果移动了链接文件本身，可能会失效。
    
    ```bash
    # 假设当前在 /usr/local/bin
    ln -s ../Cellar/python/3.9/bin/python3 python
    ```
    

---

### 4. 如何管理链接

#### 查看链接指向哪里

使用 `ls -l` 可以看到箭头指向：

```bash
ls -l mylink
# 输出: lrwxr-xr-x ... mylink -> /path/to/target
```

或者使用 `readlink` 命令直接获取目标路径：

```bash
readlink mylink
# 输出: /path/to/target
```

如果要解析多级嵌套链接的最终真实路径：

```bash
readlink -f mylink
```

#### 删除链接

**重要提示**：删除链接**不会**删除源文件！

```bash
rm mylink
```

- 如果是软链接，只是删掉了那个“快捷方式”。
- 如果是硬链接，只是减少了该文件的引用计数，只有当所有硬链接都被删除，文件数据才会被真正清除。

---

### 5. 常见坑点与注意事项

1. **参数顺序别搞反**：
    
    - 正确：`ln -s <源> <目标>` (类似 `cp` 命令的顺序)。
    - 错误：`ln -s <目标> <源>` (这会导致创建一个名字很奇怪且无效的链接)。
2. **空格处理**： 如果路径中有空格（如 `/Applications/Trae CN.app`），务必用引号括起来：
    
    ```bash
    ln -s "/Applications/Trae CN.app/..." target_name
    ```
    
3. **权限问题**： 如果目标目录（如 `/usr/local/bin`）需要管理员权限，记得加 `sudo`：
    
    ```bash
    sudo ln -s ...
    ```
    
4. **Docker 或容器环境**： 在容器中，软链接如果指向的是宿主机路径（绝对路径），可能会因为容器内文件系统不同而失效。
    

### 总结速查表

|需求|命令|
|:--|:--|
|**创建快捷方式 (推荐)**|`ln -s <源文件> <链接名>`|
|**创建数据镜像 (硬链接)**|`ln <源文件> <链接名>`|
|**强制覆盖旧链接**|`ln -sf <源文件> <链接名>`|
|**查看链接指向**|`ls -l <链接名>` 或 `readlink <链接名>`|
|**删除链接**|`rm <链接名>`|