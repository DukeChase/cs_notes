# clickhouse

* OLAP 联机分析处理

* OLTP  联机事务处理

## click house系统架构

1. clickhouse概述

2. 系统架构

* 一些特征 ：列式数据库管理系统、完备的DBMS系统、数据压缩 等

* 优缺点：

* 基本概念：

* 安装部署

1. 安装部署

2. 基础入门

* 数据类型：

* 数值类型:

* 字符串类型:

* 时间类型:

* 复合类型:

* 特殊类型:

* 语法入门：

[浅谈 DML、DDL、DCL的区别](https://www.cnblogs.com/dato/p/7049343.html)

* 数据表

``` sql

show databases；

use database_name;

-- 三种建表方式

CREATE TABLE [IF NOT EXISTS] [db_name.]table_name (

name1 [type] [DEFAULT|MATERIALIZED|ALIAS expr],

name2 [type] [DEFAULT|MATERIALIZED|ALIAS expr],

省略…) ENGINE = engine

create  table if not exists tb_test1_copy as default.tb_test1 engine=Memory ; --将复制default数据库中的tb_test1表的表结构

CREATE TABLE [IF NOT EXISTS] [db_name.]table_name ENGINE = engine AS SELECT … ;

DROP TABLE [IF EXISTS] [db_name.]table_name ;

```

* 临时表

```sql

create temporary table [if not exists] tabel_name(

name1 [type] [DEFAULT|MATERIALIZED|ALIAS expr],

name2 [type] [DEFAULT|MATERIALIZED|ALIAS expr],

)

```

* 分区表

```sql

```

* 视图

```sql

```

* DDL 修改数据库数据表 select update insert delete

* 数据表DDL

```sql

alter table test_alter add columns age Uint8;

alter table tb_name MODIFY COLUMN [IF EXISTS] name [type] [default_expr];

alter table tb_name drop column column_name;

```

* 分区表DDL

* DML 操作数据表数据

* 插入数据

```sql

insert into tb_name values(v1, v2,.....v3),(v1, v2,.....v3)

INSERT INTO [db.]table [(c1, c2, c3…)] FORMAT format_name data_set

INSERT INTO [db.]table [(c1, c2, c3…)] SELECT ...

```

* 数据删除修改

    1. 引擎详解
