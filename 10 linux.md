# 权限
```
-rw-r--r--. 1 root root  376 7月  20 10:44 web.xml
```
文件所有者、群组和其他人所属   

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
```

stdin