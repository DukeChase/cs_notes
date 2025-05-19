# Linux Learning Notes

reference: 《鸟哥的linux私房菜》

## 认识和学习bash 

```bash
cat /etc/shells

echo $SHELL

#!/bin/bash

x = 1
y = "this is a string"
echo $x
echo $y

[dmtsai@study ~]$ name=VBird 
[dmtsai@study ~]$ echo $name 
VBird

[dmtsai@study ~]$ myname="$name its me"

[dmtsai@study ~]$ echo $myname 
VBird its me 

[dmtsai@study ~]$ myname='$name its me' 
[dmtsai@study ~]$ echo $myname 
$name its me

arr = (1 2 3 4)
echo ${arr[@]}
echo ${arr[0]}


files = $(ls)
echo ${files[@]}



export MY_ENV=1000
echo $MY_ENV

# 默认值  但不赋值
echo ${var1:-"hello1"}
# 默认值 且赋值
echo ${var2:="hello2"}

# 脚本名称
echo $0
# 脚本第一个参数
echo $1
echo $2
echo $3
# 脚本参数个数
echo $#

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



# 第六章 Linux文件与目录管理
# 第七章 Linux磁盘与文件系统管理


# 第八章 文件与文件系统的压缩，打包与备份

## 8.3 压缩

压缩 `tar -zcvf   test.tar.gz test`
解压 `tar -zxvf test.tar.gz`

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
1. stdin
2. stdout
3. stderr
stdout

```shell
# std out 
ll / 1> ~/rootfile  # 覆盖   1可以省略

ll / 1>> ~/rootfilr  # 追加

# std err

cat ~/files 2>   # 覆盖
cat ~/files 2>>  # append

# 标准输出和错误输出 分开输出到文件
find /home -name .bashrc > list_right 2> list_error


/dev/null


stdout 和 stderr 输出到同一个文件list
find /home -name .bashrc > list 2>&1 
find /home -name .bashrc &> list

nohup command >myout.file 2>&1 &
```

stdin

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
`|`
管线命令“ | ”仅 能处理经由前面一个指令传来的正确信息，也就是 `standard output`的信 息，对于 stdandard error 并没有直接处理的能力

- 管线命令仅会处理 `standard output`，对于 `standard error output` 会予以忽略
- 管线命令必须要能够接受来自前一个指令的数据成为 standard input 继续处理才行。

### 10.6.1 grep cut
将一段数据经过分析后，取出 我们所想要的

### 10.6.2  sort wc uniq

### 10.6.3 tee


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
[# Linux命令之`nohup`详解](https://juejin.cn/post/6844903860272660494)

[Linux nohup后台启动/ 后台启动命令中nohup 、&、重定向的使用](https://blog.csdn.net/weixin_49114503/article/details/134266408)


## Linux ps 命令用法介绍

以下是 Linux 中 `ps` 命令的常见用法及搭配选项的总结，帮助您快速掌握进程查看技巧：

---

### ​**​一、基础语法​**​

`ps [选项]`

---

### ​**​二、常用选项组合及用途​**​

#### ​**​1. 查看所有进程​**​

|选项组合|说明|适用场景|
|---|---|---|
|`ps -ef`|显示​**​所有进程​**​的完整信息（Unix风格）|快速查看全系统进程|
|`ps aux`|显示​**​所有用户​**​的进程（BSD风格）|查看详细资源占用（CPU/内存）|

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

|选项|说明|
|---|---|
|`-f` / `--forest`|显示进程树（父子层级关系）|

​**​示例​**​：

```bash
ps -ef --forest    # 树形显示所有进程   
ps auxf            # BSD风格树形显示
```

---

#### ​**​4. 筛选特定进程​**​

|选项|说明|
|---|---|
|`-C <命令名>`|按进程名过滤（如 `nginx`）|
|`-p <PID>`|按进程ID过滤|

​**​示例​**​：

```bash
ps -C nginx       # 查看所有 nginx 进程   
ps -p 1234,5678  # 查看PID为1234和5678的进程
```

---

#### ​**​5. 显示线程信息​**​

|选项|说明|
|---|---|
|`-L`|显示进程的线程（LWP）|
|`-T`|显示线程（SPID）|

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