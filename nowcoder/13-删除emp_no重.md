# 13. |删除emp_no重

## Question description


删除emp_no重复的记录，只保留最小的id对应的记录。
CREATE TABLE IF NOT EXISTS titles_test (
    id int(11) not null primary key,
    emp_no  int(11) NOT NULL,
    title  varchar(50) NOT NULL,
    from_date  date NOT NULL,
    to_date  date DEFAULT NULL);

 insert into titles_test values ('1', '10001', 'Senior Engineer',
'1986-06-26', '9999-01-01'),
 ('2', '10002', 'Staff', '1996-08-03', '9999-01-01'),
 ('3', '10003', 'Senior Engineer', '1995-12-03', '9999-01-01'),
 ('4', '10004', 'Senior Engineer', '1995-12-03', '9999-01-01'),
 ('5', '10001', 'Senior Engineer', '1986-06-26', '9999-01-01'),
 ('6', '10002', 'Staff', '1996-08-03', '9999-01-01'),
 ('7', '10003', 'Senior Engineer', '1995-12-03', '9999-01-01');


## Solution

Language: **Sql**

```Sql
DELETE FROM titles_test WHERE id NOT IN 
(SELECT MIN(id) FROM titles_test GROUP BY emp_no)
```


