
# 第4章 从一条记录说起--innodb记录存储结构

存储引擎

innodb 页简介     磁盘和内存交互的基本单位 大小 16kb  

行格式    4种行格式  COMPACT、 REDUNDANT、 DYNAMIC 和 COMPRESSED.



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

