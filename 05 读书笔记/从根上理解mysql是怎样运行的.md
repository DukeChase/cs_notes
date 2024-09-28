
# 第3章 字符集和比较规则

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

```

# 第4章 从一条记录说起--innodb记录存储结构

存储引擎

## 4.2 Innodb 页简介    
`show variables like 'innodb_page_size';`
磁盘和内存交互的基本单位 大小 16kb  

4种行格式  
COMPACT、 REDUNDANT、 DYNAMIC 和 COMPRESSED.

```sql
CREATE TABLE 表名 (列的信息) ROW_FORMAT 行格式名称;
ALTRE TABEL tabel_name ROW_FORMAT= 行格式名称;
```

### COMPACT 行格式

1. 记录的额外信息
	1. 变长字段长度列表
	2. null值列表
	3. 记录头信息  固定5字节
2. 记录的真实信息
3. char(M) 列的存储格式

### 4.3.3 REDUNDANT


### 4.3.4 溢出列

### 4.3.5 DYNAMIC 行格式和 COMPRESSED 行格式

# 第5章 盛放记录的大盒子-InnoDB数据页结构
## 5.1 不同类型的页简介

## 5.2 数据页结构快揽
| 名称               | 中文名           | 占用空间大小 | 简单描述       |
| ---------------- | ------------- | ------ | ---------- |
| File Header      | 文件头部          | 38字节   | 页的一些通用信息   |
| Page Header      | 页面头部          | 56字节   | 数据页专有的一些信息 |
| Infimum+Supremum | 页面中的最小记录和最大记录 | 26字节   | 两个虚拟的记录    |
| User Records     |               |        |            |
| Free Space       |               |        |            |
| Page Directory   |               |        |            |
| File Trailer     |               |        |            |
|                  |               |        |            |
## 5.3 记录在页中的存储

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

