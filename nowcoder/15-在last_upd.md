# 15. |在last_upd

## Question description


存在actor表，包含如下列信息：
CREATE TABLE  IF NOT EXISTS actor  (
    actor_id  smallint(5)  NOT NULL PRIMARY KEY,
    first_name  varchar(45) NOT NULL,
    last_name  varchar(45) NOT NULL,
    last_update  timestamp NOT NULL DEFAULT (datetime('now','localtime')));
现在在last_update后面新增加一列名字为create_date, 类型为datetime, NOT NULL，默认值为'0000 00:00:00'


## Solution

Language: **Sql**

```Sql

alter table actor
add `create_date` datetime not null default '0000-00-00 00:00:00'
```


