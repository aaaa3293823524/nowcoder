# 17. |针对actor表创

## Question description


针对actor表创建视图actor_name_view，只包含first_name以及last_name两列，并对这两列重新命名，first_name为first_name_v，last_name修改为last_name_v：CREATE TABLE  IF NOT EXISTS actor  (
   actor_id  smallint(5)  NOT NULL PRIMARY KEY,
   first_name  varchar(45) NOT NULL,
   last_name  varchar(45) NOT NULL,
   last_update  timestamp NOT NULL DEFAULT (datetime('now','localtime')))


## Solution

Language: **Sql**

```Sql
CREATE VIEW actor_name_view (first_name_v, last_name_v) AS
SELECT first_name, last_name FROM actor
```


