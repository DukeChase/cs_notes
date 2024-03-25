# MySQL必知必会

DBMS 数据库管理系统

* relation database  关系型数据库
* NoSQL

installation

## SQL分类

1. `DDL(Data Definition Language)`数据定义语言
   * 用来定义数据库对象：数据库，表，列等。关键字：`CREATE`, `DROP`,`ALTER` 等
2. `DML(Data Manipulation Language)`数据操作语言
   * 用来对数据库中表的数据进行增删改。关键字：`INSERT`, `DELETE`, `UPDATE` 等
3. `DQL(Data Query Language)`数据查询语言
   * 用来查询数据库中表的记录(数据)。关键字：`SELECT`, `WHERE` 等
4. `DCL(Data Control Language)`数据控制语言(了解)
   * 用来定义数据库的访问权限和安全级别，及创建用户。关键字：`GRANT`， `REVOKE` 等


[MySQL 数据类型](https://www.runoob.com/mysql/mysql-data-types.html)
## chapter4 检索数据

```sql
select * from table_name;
select distinct columns_name from table_name limit 5,5;
-- 第一个数为开始的位置，第二个数为要检索的行数
```

## chapter 5 排序检索数据

```sql
select * from table_name ORDER BY column_name desc; 
```

## chapter 6 过滤数据

```sql
select column_name
from table_name
where condition;
```

| 操作符          | 说明        |
| ------------ | --------- |
| =            | equal     |
| <>           | not equal |
| !=           | not equal |
| <            |           |
| <=           |           |
| >            |           |
| >=           |           |
| between  and |           |
| is null      |           |

## chapter7 数据过滤

```sql
and or in not

SELECT column1, column2, ...
FROM table_name
WHERE column IN (value1, value2, ...);
```

## chapter8 用通配符进行过滤

`like`  操作符 

`% ` 匹配任何字符 任何出现次数

`_` 匹配单个字符

```sql
select * from table_name where columns  like '% love china';
```

通配符处理需要更长时间    不要过度使用

## chapter9 正则表达式

```sql
select * from table_name where regexp 'regexp_string';
```

`LIKE `和 `regexp` 的重要区别  `LIKE` 匹配整个列，
`regexp`在列值内进行匹配  `regexp`可以使用`^`和`$` 匹配整个列值

regexp 默认不区分大小写 ，为区分大小写，可以使用`BINARY`关键字   

```sql
select * from table_name where regexp BINARY 'regexp_string';
```

### 进行or匹配

`|`为正则表达式的OR操作符，表示匹配其中之一。 `  'string_A|string_B|string|C'`

### 匹配几个字符之一

`[]` 是另一种形式的OR语句      `'[123] Ton'`    等价于 `‘1|2|3 Ton’`

### 匹配范围

`[0123456]      [0-9]      [a-z]    `

### 匹配特殊字符

双斜杠  `'\\\\'`  转义

| 元字符   | 说明   |
| ----- | ---- |
| \\\\f | 换页   |
| \\\\n | 换行   |
| \\\\r | 回车   |
| \\\\t | 制表   |
| \\\\v | 纵向制表 |

### 匹配多个实例

| 元字符   | 说明         |
| ----- | ---------- |
| *     | 0个或多个匹配    |
| +     | 1个或多个匹配    |
| ？     | 0个或1个匹配    |
| {n}   | 指定数目的匹配    |
| {n,}  | 不少于指定数目的匹配 |
| {n,m} | 匹配数目的范围    |

### 定位符

| 元字符 | 说明    |
| --- | ----- |
| ^   | 文本的开始 |
| $   | 文本的结束 |

## chapter10 创建计算字段

### 拼接

```sql
SELECT Concat(vend_name,'(',vend_country,')') as vend_tiel
FROM vendors
ORDER BY vend_name;
```

### 执行算数计算

## chapter11 使用数据处理函数

### 文本处理函数

|函数|说明|
|----|----| 
| Left()|返回串左边的字符 |
|Length|返回串的长度|
|Locate|找出串的子串|
|Lower| 将串转换为小写|
|LTrim|去掉串左边的空格|
|Right|返回串右边的字符|
|Rtrim|去掉右边的空哥|
|Soundex()|返回串的SOUNDEX值|
|SubString|返回子串的字符|
|Upper()|将串转换为大写|

### 日期和时间处理函数
|函数   |说明  |
|----|---|
|AddDate|  |
|AddTime|  |
|CurTime|  |
|Date()|  |
|DateDiff||
|Date_Add()||
|Date_Formate()||
|Day()||
|DayOfWeek()||
|Hour()||
|Minute()||
|Month()||
|Now()||
|Second()||
|Time()||
|Year()||

MySQL  使用`yyyy-mm-dd`

### 数值处理函数
|函数|说明 |
|--|--|
|Abs()||
|Cos()||
|Exp()||
|Mod()||
|Pi()||
|Rand()||
|Sin()||
|Sqrt()||
|Tan()||

## chapter12 汇总数据

* `AVG()`  忽略值为null的行
* `COUNT()`
  * `COUNT(*)`  包括Null值
  * `COUNT(coulumn)`   忽略NULL
* `MAX()`   忽略值为null的行
* `MIN()`   忽略值为null的行
* `SUM()`   忽略值为null的行

## chapter13 分组数据

### 创建分组GROUPBY

### 过滤分组HAVING

### SELECT子句顺序

| 子句        | 说明  | 是否必须使用 |
| --------- | --- | ------ |
| `SELECT`  |     |        |
| `FROM`    |     |        |
| `WHERE`   |     |        |
| `GROUPBY` |     |        |
| `HAVING`  |     |        |
| `ORDERBY` |     |        |
| `LIMIT`   |     |        |

## chapter14 子查询


## chapter15 联结表

```sql
SELECT * 
FROM vendors 
INNER JOIN products 
ON vendors.`vend_id` = products.`vend_id`;  -- chapter16 创建高级联结
```

## chapter16 创建高级联结

```sql
SELECT customers.`cust_id`, orders.`order_num` 
FROM customers RIGHT OUTER JOIN orders
ON orders.`cust_id` = customers.`cust_id`;
```

## chapter17 组合查询

`union`

## chapter18 全文本搜索


## chapter19 插入数据

### 插入完整的行

```sql
INSERT INTO customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES(10001, 'Coyote Inc.', '200 Maple Lane', 'Detroit', 'MI', '44444', 'USA', 'Y Lee', 'ylee@coyote.com');
```

### 插入多个行

```sql
INSERT INTO customers(字段列表)
VALUES(数据列表),
(数据列表),
(数据列表);

INSERT INTO customers 
VALUES(10006,'duke chase','xueyuan street','fuzou','fz','3501','chn','duke','abc@qq.com'),
(10007,'xiao min','xueyuan street','fuzou','fz','3501','chn','duke','xyz@qq.com');
```

### 插入检索出的数据

## chapter20 更新和删除数据

### 更新数据

```sql
UPDATE customers
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 1005;

-- 更新多个列
UPDATE customes
SET cust_email = 'elmer@fudd.com',
    cust_name = 'The Fudds'
WHERE cust_id = 1005;
```

### 删除数据

```sql
-- 删除行
DELETE FROM customers
WHERE cust_id = 1005;
```

## chapter21 创建和操纵表

### 约束

- 概念： 对表中的数据进行限定，保证数据的正确性、有效性和完整性。
```sql
CREATE TABLE IF NOT EXISTS test(
id INT,
NAME VARCHAR(29));

DROP TABLE IF EXISTS test;
```
- 分类：
  
  1. 主键约束：`primary key`
  2. 非空约束：`not null`
  3. 唯一约束：`unique`
  4. 外键约束：`foreign key`

- 非空约束：not null，值不能为null
1. 创建表时添加约束
   
   ```sql
   CREATE TABLE stu(
   id INT,
   NAME VARCHAR(20) NOT NULL -- name为非空
   );
   ```

2. 创建表完后，添加非空约束    
   
   ```sql
   ALTER TABLE stu MODIFY NAME VARCHAR(20) NOT NULL;
   ```

3. 删除name的非空约束
   
   ```sql
   ALTER TABLE stu MODIFY NAME VARCHAR(20)
   ```
- 唯一约束：`UNIQUE`，值不能重复，自增长

select last_insert_id()
### 创建表
```sql
CREATE TABLE customers
(
  cust_id      INT       UNIQUE NOT NULL AUTO_INCREMENT,
  cust_name    CHAR(50)  NOT NULL ,
  cust_address CHAR(50)  NULL ,
  cust_city    CHAR(50)  NULL ,
  cust_state   CHAR(5)   NULL ,
  cust_zip     CHAR(10)  NULL ,
  cust_country CHAR(50)  NULL ,
  cust_contact CHAR(50)  NULL ,
  cust_email   CHAR(255) NULL ,
  PRIMARY KEY (cust_id)
) ENGINE=INNODB;
```

### 引擎类型

* `InnoDB`是一个可靠的事务处理引擎，它不支持全文本搜索
* `MEMORY`在功能上等同与MyISAM，但由于数据存储在内存（不是磁盘）中，速度很快（特别适合临时表）
* `MyISAM`是一个性能极高的引擎，它支持全文本搜索（参见18章），但不支持事务。

```mysql
show create table tablename;  -- 显示建表语句

show engines；

select database ();  -- 显示当前使用的数据库
```
### 更新表
- 更新表定义使用ALTER TABLE
```sql
-- 增加列
ALTER TABLE vendors
ADD vend_phone CHAR(20);

-- 删除列
ALTER TABLE vendors
DROP COLUMNS vend_phone;
```

### 删除表

- 删除整个表

```sql
DROP TABLE customers2;

DROP TABLE IF EXISTS customes2;
```

### 重命名表

```sql
RENAME TABLE customers2 TO customers;
```

## chapter22 使用视图
### 视图

为什么使用视图
- 重用SQL语句
- 简化复杂的SQL操作
- 使用表的组成部分而不是整个表
- 保护数据
- 更改数据格式和表示

### 使用视图
```sql
CREATE VIEW viewname;

SHOW CREATE VIEW viewname;

DROP VIEW viewname;

-- forehead

SELECT cust_name, cust_contact
  FROM customers, orders, orderitems
  WHERE customers.cust_id = orders.cust_id
    AND orders.order_num = orderitems.order_num
    AND prod_id = 'TNT2';

-- create view

CREATE VIEW prodcust AS
  SELECT cust_name, cust_contact, prod_id
  FROM customers, orders, orderitems
  WHERE customers.cust_id = orders.cust_id
    AND orders.order_num = orderitems.order_num;

SELECT cust_name, cust_contact
  FROM prodcust
  WHERE prod_id = 'TNT2';

-- formatting field using views

CREATE VIEW vendorlocations AS
  SELECT Concat(RTrim(vend_name), ' (', Trim(vend_country) ,')') AS vend_title
    FROM vendors
    ORDER BY vend_name;
SELECT * FROM vendorlocations;

-- filtering data
CREATE VIEW custemaillist AS
  SELECT cust_id, cust_email
    FROM customers
    WHERE cust_email IS NOT NULL;

-- calculate field
CREATE VIEW orderitemsexpanded AS
  SELECT order_num
         prod_id,
         quantity,
         item_price,
         quantity*item_price AS expanded_price

    FROM orderitems;
```

一般来说，视图应用于检索(SELECT)，而不用于更新(INSERT,UPDATE,DELETE)

## chapter23存储过程

## chapter24 游标

## chapter25 触发器

触发器是MySQL响应以下任意语句而自动执行的一条MySQL语句
- `DELETE`
- `INSTERT`
- `UPDATE`

### 创建触发器
- 唯一的触发器名
- 触发器关联的表
- 触发器应该响应的活动
- 触发器何时执行
```sql
-- NOTES: trigger only for table, not views

CREATE TRIGGER neworder AFTER INSERT ON orders
  FOR EACH ROW SET @msg = (SELECT NEW.order_num);


INSERT INTO orders(order_date, cust_id)
  VALUES(Now(), 10001);
SELECT @msg;

CREATE TRIGGER updatevendor BEFORE UPDATE ON vendors
  FOR EACH ROW SET NEW.vend_state = Upper(NEW.vend_state);
```

### 删除触发器
```sql
DROP TRIGGER triggername;
```
## chaper26 管理事务处理

* 事务的四大特征：
  1. 原子性：是不可分割的最小操作单位，要么同时成功，要么同时失败。
  2. 持久性：当事务提交或回滚后，数据库会持久化的保存数据。
  3. 隔离性：多个事务之间。相互独立。
  4. 一致性：事务操作前后，数据总量不变