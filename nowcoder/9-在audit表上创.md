# 9. |在audit表上创

## Question description


在audit表上创建外键约束，其emp_no对应employees_test表的主键id。
CREATE TABLE employees_test(
    ID INT PRIMARY KEY     NOT NULL,
    NAME           TEXT    NOT NULL,
    AGE            INT     NOT NULL,
    ADDRESS        CHAR(50),
    SALARY         REAL
 );

 CREATE TABLE audit(
     EMP_no INT NOT NULL,
     create_date datetime NOT NULL
 );


## Solution

Language: **Sql**

```Sql


DROP TABLE audit;
CREATE TABLE audit(
    EMP_no INT NOT NULL,
    create_date datetime NOT NULL,
    FOREIGN KEY(EMP_no) REFERENCES employees_test(ID));
```


