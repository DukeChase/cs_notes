# MySQL

## 基础

SQL分类
- `DDL(Data Definition Language)`数据定义语言
	用来定义数据库对象：数据库，表，列等。关键字：`create`, `drop`,`alter` 等
- `DML(Data Manipulation Language)`数据操作语言
	用来对数据库中表的数据进行增删改。关键字：`insert`, `delete`, `update` 等
- `DQL(Data Query Language)`数据查询语言
	用来查询数据库中表的记录(数据)。关键字：`select`, `where` 等
- `DCL(Data Control Language)`数据控制语言(了解)
## 查询 约束 设计
### 查询

### 约束
- 概念： 对表中的数据进行限定，保证数据的正确性、有效性和完整性。
- 分类： 
	1. 主键约束：`primary key`
	2. 非空约束：`not null`
	3. 唯一约束：`unique`,值不能重复
	4. 外键约束：`foreign key`

- 非空约束：`not null`，值不能为null
1.  创建表时添加约束 
```sql
CREATE TABLE stu(
	 id INT,
	 NAME VARCHAR(20) NOT NULL -- name为非空
	);
```

2.  创建表完后，添加非空约束 
```sql
ALTER TABLE stu MODIFY NAME VARCHAR(20) NOT NULL;
```

3.  删除name的非空约束 
```sql
ALTER TABLE stu MODIFY NAME VARCHAR(20);
```

- 唯一约束：`unique`，值不能重复     
1. 创建表时，添加唯一约束 
 ```sql
CREATE TABLE stu(  id INT,  phone_number VARCHAR(20) UNIQUE -- 添加了唯一约束  );
    * 注意mysql中，**唯一约束限定的列的值可以有多个null**
    ```
2.  删除唯一约束     
```sql
ALTER TABLE stu DROP INDEX phone_number; 
```
3. 在创建表后，添加唯一约束     
```sql
ALTER TABLE stu MODIFY phone_number VARCHAR(20) UNIQUE;
```

- 主键约束：`primary key `
1. 注意
	1. 含义：非空且唯一 
	2. 一张表只能有一个字段为主键 
	3. 主键就是表中记录的唯一标识 
2. 在创建表时，添加主键约束 
```sql
create table stu( id int primary key, name varchar(20)  );-- 给id添加主键约束
```
3. 删除主键  
```sql
-- 错误 alter table stu modify id int ;  
ALTER TABLE stu DROP PRIMARY KEY;   
```
4. 创建完表后，添加主键  
```sql
ALTER TABLE stu MODIFY id INT PRIMARY KEY;
```

* 自动增长：  
1.  概念：如果某一列是数值类型的，使用 `auto_increment` 可以来完成值得自动增长
2. 在创建表时，添加主键约束，并且完成主键自增长
```sql
create table stu(
 id int primary key auto_increment,-- 给id添加主键约束
 name varchar(20)
);
```   
3. 删除自动增长          
```sql
ALTER TABLE stu MODIFY id INT;         
```
5. 添加自动增长          
```sql
ALTER TABLE stu MODIFY id INT AUTO_INCREMENT;
```

* 外键约束 `foreign key` 让表于表产生关系，从而保证数据的正确性。
1. 在创建表时，可以添加外键
```sql
create table 表名( .... 外键列 constraint 外键名称 foreign key (外键列名称) references 主表名称(主表列名称) );
```
2. 删除外键
```sql
ALTER TABLE 表名 DROP FOREIGN KEY 外键名称;
```
4. 创建表之后，添加外键
```sql
ALTER TABLE 表名 ADD CONSTRAINT 外键名称 FOREIGN KEY (外键字段名称) REFERENCES 主表名称(主表列名称);
```

- 级联操作
1. 添加级联操作  
	语法：
	```sql
	ALTER TABLE 表名 ADD CONSTRAINT 外键名称  
	FOREIGN KEY (外键字段名称) REFERENCES 主表名称(主表列名称) ON UPDATE CASCADE ON DELETE CASCADE ;
	```
2. 分类：  
	1. 级联更新：`ON UPDATE CASCADE`  
	2. 级联删除：`ON DELETE CASCADE`
### 数据库设计
多表之间的关系
1. 分类
	1. 一对一   人和身份证，一个人只有一个身份证，一个身份证只能对应一个人
	2. 一对多（多对一） 部门和员工 一个部门有多个员工，一个员工只能对应一个部门
	3. 多对多  一个学生可以选择很多门课程，一个课程也可以被很多学生选择

实现关系
- 一对多(多对一)：
    - 如：部门和员工
    - 实现方式：在多的一方建立外键，指向一的一方的主键。
- 多对多：
    - 如：学生和课程
    - 实现方式：多对多关系实现需要借助第三张中间表。中间表至少包含两个字段，这两个字段作为第三张表的外键，分别指向两张表的主键 使用联合主键
- 一对一(了解)：
    - 如：人和身份证
        - 实现方式：一对一关系实现，可以在任意一方添加唯一外键指向另一方的主键。


### 数据库设计的范式
  -   概念：设计数据库时，需要遵循的一些规范。要遵循后边的范式要求，必须先遵循前边的所有范式要求  
	设计关系数据库时，遵从不同的规范要求，设计出合理的关系型数据库，这些不同的规范要求被称为不同的范式，各种范式呈递次规范，越高的范式数据库冗余越小。  
	目前关系数据库有六种范式：第一范式（1NF）、第二范式（2NF）、第三范式（3NF）、巴斯-科德范式（BCNF）、第四范式(4NF）和第五范式（5NF，又称完美范式）。
* 分类： 
    1. 第一范式（1NF）：每一列都是不可分割的原子数据项  
    2. 第二范式（2NF）：在1NF的基础上，非码属性必须完全依赖于码（在1NF基础上消除非主属性对主码的部分函数依赖）  
	    - 几个概念：  
	    1. 函数依赖：A-->B,如果通过A属性(属性组)的值，可以确定唯一B属性的值。则称B依赖于A  
			    例如：学号-->姓名。 （学号，课程名称） --> 分数 
	    2. 完全函数依赖：A-->B， 如果A是一个属性组，则B属性值得确定需要依赖于A属性组中所有的属性值。  
			    例如：（学号，课程名称） --> 分数 
	    3. 部分函数依赖：A-->B， 如果A是一个属性组，则B属性值得确定只需要依赖于A属性组中某一些值即可。  
			    例如：（学号，课程名称） -- > 姓名 
	    4. 传递函数依赖：A-->B, B -- >C . 如果通过A属性(属性组)的值，可以确定唯一B属性的值，在通过B属性（属性组）的值可以确定唯一C属性的值，则称 C 传递函数依赖于A  
			    例如：学号-->系名，系名-->系主任  
	    5. 码：如果在一张表中，一个属性或属性组，被其他所有属性所完全依赖，则称这个属性(属性组)为该表的码  
			例如：该表中码为：（学号，课程名称）  
			* 主属性：码属性组中的所有属性  
			* 非主属性：除过码属性组的属性   
    3. 第三范式（3NF）：在2NF基础上，任何非主属性不依赖于其它非主属性（在2NF基础上消除传递依赖）

## 多表 事务

### 多表查询
笛卡尔积：
1. 内连接查询
	1. 隐式内连接
	2. 显式内连接
2. 外连接查询
		1. 左外连接
		2. 右外连接
3. 子查询

### 事务

#### 事务基本介绍
1. 概念
	- 如果一个包含多个步骤的业务操作，被事务管理，那么这些操作要么同时成功，要么同时失败。
2. 操作：
	1. 开启事务： `start transaction`;
	2. 回滚：`rollback`;
	3. 提交：`commit`;
3. 例子：
	```sql
	CREATE TABLE account (
		id INT PRIMARY KEY AUTO_INCREMENT,
		NAME VARCHAR(10),
		balance DOUBLE
	);
	
	-- 添加数据
	INSERT INTO account (NAME, balance) VALUES ('zhangsan', 1000), ('lisi', 1000);
	SELECT * FROM account;
	UPDATE account SET balance = 1000;
	
	-- 张三给李四转账 500 元
	-- 0. 开启事务
	START TRANSACTION;
	-- 1. 张三账户 -500
	UPDATE account SET balance = balance - 500 WHERE NAME = 'zhangsan';
	-- 2. 李四账户 +500
	-- 出错了...
	UPDATE account SET balance = balance + 500 WHERE NAME = 'lisi';

	-- 发现执行没有问题，提交事务
	COMMIT;

	-- 发现出问题了，回滚事务
	ROLLBACK;
	```
4. MySQL数据库中事务默认自动提交
	* 事务提交的两种方式：
		* 自动提交：
			* `mysql`就是自动提交的
			* 一条DML(增删改)语句会自动提交一次事务。
		* 手动提交：
			* Oracle 数据库默认是手动提交事务
			* 需要先开启事务，再提交
	* 修改事务的默认提交方式：
		* 查看事务的默认提交方式：`SELECT @@autocommit; -- 1 代表自动提交  0 代表手动提交`
		* 修改默认提交方式： `set @@autocommit = 0;`

#### 事务的四大特征
**ACID**，是指数据库管理系统（DBMS）在写入或更新资料的过程中，为保证**事务**（transaction）是正确可靠的，所必须具备的四个特性：
- 原子性（atomicity，或称不可分割性）、
- 一致性（consistency）、
- 隔离性（isolation，又称独立性）、
- 持久性（durability）。

3. 事务的隔离级别（了解）

**索引**
