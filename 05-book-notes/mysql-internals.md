
# 第3章 字符集和比较规则
## 3.1 字符集和比较规则

字符集

编码

### 3.1.2 比较规则

### 3.1.3 一些重要的字符集
- ASCII
- ISO
- GB2312
- GBK
- UTF-8
变长编码方式


## 3.2 MySql中支持的字符集和比较规则

## 3.3 字符集和比较规则的应用

```sql
# 查看比较规则
show collation ;  
# 字符集 查看
show character set ;  


# 服务器级别 字符集 和 比较规则  
show variables like 'character_set_server';  
show variables like 'collation_server';  
  
# 数据库级别  
CREATE DATABASE 数据库名  
DEFAULT CHARACTER SET 宇符集名称  
DEFAULT COLLATE 比较规则名称;

# 表级别
CREATE TABLE 表名  列信息  
DEFAULT CHARACTER SET 宇符集名称  
COLLATE 比校规则名;

# 列级别
create table table_name(column_name varchar [CHARACTER SET 字符集名称] [COLLATE 比较规则名称],)
```

# 第4章 从一条记录说起--innodb记录存储结构

存储引擎

## 4.2 Innodb 页简介    
`show variables like 'innodb_page_size';`
磁盘和内存交互的基本单位 大小 `16kb`    系统变量 `innodb_page_size`

## 4.3 Innodb行格式

4种行格式  
 COMPACT、 REDUNDANT、 DYNAMIC 和 COMPRESSED.

### 4.3.1 指定行格式的语法

```sql
CREATE TABLE 表名 (列的信息) ROW_FORMAT 行格式名称;
ALTRE TABEL tabel_name ROW_FORMAT= 行格式名称;
```

### 4.3.2 COMPACT 行格式

| 记录的额外信息 |         |       | 记录的真实数据 |      |     |      |
| ------- | ------- | ----- | ------- | ---- | --- | ---- |
| 变长字段列表  | null值列表 | 记录头信息 | 列1的值    | 列2的值 | ……  | 列n的值 |

一条完整的记录其实可以被分为记录的额外信息和记录的真实数据两大部分
1. 记录的额外信息
	1. 变长字段长度列表
	2. null值列表
	3. **记录头信息**  固定5字节（40位） 用于描述记录的一些属性，
2. 记录的真实信息
	1. `row_id`   行id，唯一标识一条记录
	2. `trx_id`   事务id
	3. `roll_pointer`  回滚指针
3. char(M) 列的存储格式


记录头信息

| 名称           | 大小  | 描述                                                                                                     |
| ------------ | --- | ------------------------------------------------------------------------------------------------------ |
| 预留位          | 1   | 预留位                                                                                                    |
| 预留位          | 1   | 预留位                                                                                                    |
| deleted_flag | 1   | 标记该记录是否被删除                                                                                             |
| min_rec_flag | 1   | B+ 树的每层非叶子节点 中最小的目 录项记录都会添加该标记                                                                         |
| n_owned      | 4   | 一个页面中的记录会被分成若干个组，每个组中有一个记录是 " 带头大 哥其余的记录都是"小弟"带头大哥"记录的 `n_owncd `值代表该 组中所有的记录条数"小弟"记录的 `n_owned` 值都为 0 |
| heap_no      | 13  | 表示当前记录在页面堆中的相对位置                                                                                       |
| record_type  | 3   | 表示当前记录的类型， 。 0标识普通记录 . 1 标识 B+ 树非叶子节点的目 录项记录。2 表示 lnfimum 记录 . 3 表示 Supremum 记录                        |
| next_record  | 16  | 表示下一条记录的相对位置                                                                                           |


### 4.3.3 REDUNDANT行格式



### 4.3.4 溢出列

### 4.3.5 DYNAMIC 行格式和 COMPRESSED 行格式

# 第5章 盛放记录的大盒子-InnoDB数据页结构
## 5.1 不同类型的页简介

index 页 （数据页）

## 5.2 数据页结构快览

| 名称               | 中文名           | 占用空间大小 | 简单描述        |
| ---------------- | ------------- | ------ | ----------- |
| File Header      | 文件头部          | 38字节   | 页的一些通用信息    |
| Page Header      | 页面头部          | 56字节   | 数据页专有的一些信息  |
| Infimum+Supremum | 页面中的最小记录和最大记录 | 26字节   | 两个虚拟的记录     |
| User Records     | 用户记录          | 不确定    | 用户存储的记录内容   |
| Free Space       | 空闲空间          | 不确定    | 页中尚未使用的空间   |
| Page Directory   | 页目录           | 不确定    | 页中某些记录的相对位置 |
| File Trailer     | 文件尾部          | 8字节    | 检验页         |

## 5.3 记录在页中的存储
我们自己存储的记录会按照指定的行格式存储到User Records部分。

### 5.3.1 记录头信息的秘密


## 5.4 Page Directory （页目录）



## 5.5 Page Header （页面头部）
表示数据页专有的 一些信息 ， 占固定 的 56 字节 .

## 5.6 File Header （文件头部）
页的通用信息，占用38字节。

## 5.7 File Trailer （文件尾部）
用于检验页是否完整，占用固定8字节。

# 第6章 快速查询的秘籍-B+树索引

# 第7章 B+树索引的使用
```sql
CREATE TABLE single_table (
	id INT NOT NULL AUTO_INCREMENT , 
	key1 VARCHAR(lOO) , 
	key2 INT , 
	key3 VARCHAR(100) , 
	key_partl VARCHAR(100) , 
	key_part2 VARCHAR(10Q) , 
	key_part3 VARCHAR(100) , 
	common_field VλRCHAR(lOO) , 
	PRIMARY KEY (id) , 
	KEY idx_key1 (key1) ,
	UNlQUE KEY uk_key2 (key2) ,
	KEY idx_key3 (key3),
	KEY idx_key_part (key_part1. key_part2 , key_part3)
)Engine=InnoDB CHARSET=utf8;
```


## 7.2 索引的代价

