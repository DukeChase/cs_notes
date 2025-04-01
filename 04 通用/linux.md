reference: 《鸟哥的linux私房菜》

# shell 

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
# 权限
```
-rw-r--r--. 1 root root  376 7月  20 10:44 web.xml
```
文件所有者、群组和其他人所属   


## 5.3 linux目录配置

# 压缩
压缩 `tar -zcvf   test.tar.gz test`
解压 `tar -zxvf test.tar.gz`

10 认识与学习BASH

10.2 shell的变量功能
```sh
echo $PATH

echo ${PATH}

"myname=Vbird"
unset


export 
```

10.3 命令别名与历史命名
```sh
alias ll='ls -l'

umalias ll
```
# shell
数据流重定向
stdout

```sh
std out 
ll / 1> ~/rootfile  覆盖   1可以省略

ll / 1>> ~/rootfilr  追加

std err

cat ~/files 2>   覆盖
cat ~/files 2>>  append

标准输出和错误输出 分开输出到文件
find /home -name .bashrc > list_right 2> list_error


/dev/null


stdout 和 stderr 输出到同一个文件list
find /home -name .bashrc > list 2>&1 
find /home -name .bashrc &> list

nohup command >myout.file 2>&1 &
```

stdin

命令行的执行的判断依据

```
;,
sync; sync; shutdown -h now
```

`$?`  表示上一条指令的输出，执行成功则为0

 指令下达情况
`cmd1 && cmd2` 
1. 若 cmd1 执行完毕且正确执行（`$?=0`），则开始执 行 cmd2。
2. 若 cmd1 执行完毕且为错误 （`$?≠0`），则 cmd2 不 执行。    


`cmd1|| cmd2 ` 
1. 若 cmd1 执行完毕且正确执行（`$?=0`），则 cmd2 不执行。

2. 若 cmd1 执行完毕且为错误 （`$?≠0`），则开始执行 cmd2。



```shell
$?   指令回传值
&&
,
||
```

管线命令
`|`
管线命令“ | ”仅 能处理经由前面一个指令传来的正确信息，也就是 `standard output`的信 息，对于 stdandard error 并没有直接处理的能力
- 管线命令仅会处理 standard output，对于 standard error output 会予 以忽略 
- 管线命令必须要能够接受来自前一个指令的数据成为 standard input 继续处理才行。

grep cut
将一段数据经过分析后，取出 我们所想要的

[# Linux命令之nohup详解](https://juejin.cn/post/6844903860272660494)

[Linux nohup后台启动/ 后台启动命令中nohup 、&、重定向的使用](https://blog.csdn.net/weixin_49114503/article/details/134266408)