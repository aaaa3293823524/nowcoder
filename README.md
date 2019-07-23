====================#获取所有员工的emp_no

获取所有员工的emp_no、部门编号dept_no以及对应的bonus类型btype和recevied，没有分配具体的员工不显示CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL,
`emp_no` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));输出格式:



				e.emp_no
			

				dept_no
			

				btype
			

				recevied
			





				10001
			

				d001
			

				1
			

				2010-01-01
			



				10002
			

				d001
			

				2
			

				2010-10-01
			



				10003
			

				d004
			

				3
			

				2011-12-03
			



				10004
			

				d004
			

				1
			

				2010-01-01
			



				10005
			

				d003
			





				10006
			

				d002
			





				10007
			

				d005
			





				10008
			

				d005
			





				10009
			

				d006
			





				10010
			

				d005
			





				10010
			

				d006
			





>Sql
```


select e.emp_no,de.dept_no,eb.btype,eb.recevied
from employees e 
inner join dept_emp de on e.emp_no=de.emp_no
left join  emp_bonus eb on e.emp_no=eb.emp_no
```
====================#获取有奖金的员工相关信息。

获取有奖金的员工相关信息。CREATE TABLE `employees` (
  `emp_no` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` char(1) NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`));
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
create table emp_bonus(
emp_no int not null,
recevied datetime not null,
btype smallint not null);
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));给出emp_no、first_name、last_name、奖金类型btype、对应的当前薪水情况salary以及奖金金额bonus。 bonus类型btype为1其奖金为薪水salary的10%，btype为2其奖金为薪水的20%，其他类型均为薪水的30%。 当前薪水表示to_date='9999-01-01'输出格式:



				emp_no
			

				first_name
			

				last_name
			

				btype
			

				salary
			

				bonus
			





				10001
			

				Georgi
			

				Facello
			

				1
			

				88958
			

				8895.8
			



				10002
			

				Bezalel
			

				Simmel
			

				2
			

				72527
			

				14505.4
			



				10003
			

				Parto
			

				Bamford
			

				3
			

				43311
			

				12993.3
			



				10004
			

				Chirstian
			

				Koblick
			

				1
			

				74057
			

				7405.7
			



>Sql
```


SELECT e.emp_no, e.first_name, e.last_name, b.btype, s.salary, 
(s.salary * b.btype / 10.0) AS bonus
FROM employees AS e INNER JOIN emp_bonus AS b ON e.emp_no = b.emp_no
INNER JOIN salaries AS s ON e.emp_no = s.emp_no AND s.to_date = '9999-01-01'
```
====================#对于employees表中，给出奇数行的first_name

对于employees表中，给出奇数行的first_nameCREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));输出格式:



				first_name
			





				Georgi
			



				Chirstian
			



				Anneke
			



				Tzvetan
			



				Saniya
			



				Mary
			



>Sql
```


SELECT e1.first_name FROM 
  (SELECT e2.first_name, 
    (SELECT COUNT(*) FROM employees AS e3 
     WHERE e3.first_name <= e2.first_name) 
   AS rowid FROM employees AS e2) AS e1
WHERE e1.rowid % 2 = 1
```
====================#统计salary的累计和running_total

按照salary的累计和running_total，其中running_total为前两个员工的salary累计和，其他以此类推。 具体结果如下Demo展示。。CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));输出格式:



				emp_no
			

				salary
			

				running_total
			





				10001
			

				88958
			

				88958
			



				10002
			

				72527
			

				161485
			



				10003
			

				43311
			

				204796
			



				10004
			

				74057
			

				278853
			



				10005
			

				94692
			

				373545
			



				10006
			

				43311
			

				416856
			



				10007
			

				88070
			

				504926
			



				10009
			

				95409
			

				600335
			



				10010
			

				94409
			

				694744
			



				10011
			

				25828
			

				720572
			



>Sql
```


SELECT s1.emp_no, s1.salary, 
(SELECT SUM(s2.salary) FROM salaries AS s2 
 WHERE s2.emp_no <= s1.emp_no AND s2.to_date = '9999-01-01') AS running_total 
FROM salaries AS s1 WHERE s1.to_date = '9999-01-01' ORDER BY s1.emp_no
```
====================#查找字符串'10,A,B' 中逗号','出现的次数cnt

查找字符串'10,A,B' 中逗号','出现的次数cnt。
>Sql
```
select length('10,A,B') -length(replace('10,A,B',",",""))
```
====================#针对库中的所有表生成select count(*)对应的SQL语句

针对库中的所有表生成select count(*)对应的SQL语句CREATE TABLE `employees` (
  `emp_no` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` char(1) NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`));
create table emp_bonus(
emp_no int not null,
recevied datetime not null,
btype smallint not null);
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL,
`emp_no` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));输出格式:




				cnts
			





				select count(*) from employees;
			



				select count(*) from departments;
			



				select count(*) from dept_emp;
			



				select count(*) from dept_manager;
			



				select count(*) from salaries;
			



				select count(*) from titles;
			



				select count(*) from emp_bonus;
			



>Sql
```
SELECT "select count(*) from " || name || ";" AS cnts
FROM sqlite_master WHERE type = 'table'
```
====================#将所有获取奖金的员工当前的薪水增加10%

将所有获取奖金的员工当前的薪水增加10%。
 create table emp_bonus(
 emp_no int not null,
 recevied datetime not null,
 btype smallint not null);
 CREATE TABLE `salaries` (
 `emp_no` int(11) NOT NULL,
 `salary` int(11) NOT NULL,
 `from_date` date NOT NULL,
 `to_date` date NOT NULL, PRIMARY KEY (`emp_no`,`from_date`));
>Sql
```
update salaries
set salary=salary*1.1
where emp_no in(
select emp_no from emp_bonus
)
```
====================#如何获取emp_v和employees有相同的数据no

存在如下的视图：create view emp_v as
select * from employees where emp_no >10005;如何获取emp_v和employees有相同的数据？CREATE TABLE `employees` (
  `emp_no` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` char(1) NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`));输出格式:




				emp_no
			

				birth_date
			

				first_name
			

				last_name
			

				gender
			

				hire_date
			





				10006
			

				1953-04-20
			

				Anneke
			

				Preusig
			

				F
			

				1989-06-02
			



				10007
			

				1957-05-23
			

				Tzvetan
			

				Zielinski
			

				F
			

				1989-02-10
			



				10008
			

				1958-02-19
			

				Saniya
			

				Kalloufi
			

				M
			

				1994-09-15
			



				10009
			

				1952-04-19
			

				Sumant
			

				Peac
			

				F
			

				1985-02-18
			



				10010
			

				1963-06-01
			

				Duangkaew
			

				Piveteau
			

				F
			

				1989-08-24
			



				10011
			

				1953-11-07
			

				Mary
			

				Sluis
			

				F
			

				1990-01-22
			



>Sql
```
SELECT * FROM employees INTERSECT SELECT * FROM emp_v
```
====================#在audit表上创建外键约束，其emp_no对应employees_test表的主键id

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
>Sql
```


DROP TABLE audit;
CREATE TABLE audit(
    EMP_no INT NOT NULL,
    create_date datetime NOT NULL,
    FOREIGN KEY(EMP_no) REFERENCES employees_test(ID));
```
====================#将titles_test表名修改为titles_2017

将titles_test表名修改为titles_2017。
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
>Sql
```
ALTER TABLE titles_test RENAME TO titles_2017
```
====================#将id=5以及emp_no=10001的行数据替换成id=5以及emp_no=10005

将id=5以及emp_no=10001的行数据替换成id=5以及emp_no=10005,其他数据保持不变，使用replace实现。
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
>Sql
```
update titles_test set emp_no=10005
where id=5 and emp_no=10001
```
====================#将所有to_date为9999-01-01的全部更新为NULL

将所有to_date为9999-01-01的全部更新为NULL,且 from_date更新为2001-01-01。
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
>Sql
```
UPDATE titles_test SET to_date = NULL, from_date = '2001-01-01'
WHERE to_date = '9999-01-01'; 
```
====================#删除emp_no重复的记录，只保留最小的id对应的记录。

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
>Sql
```
DELETE FROM titles_test WHERE id NOT IN 
(SELECT MIN(id) FROM titles_test GROUP BY emp_no)
```
====================#构造一个触发器audit_log

构造一个触发器audit_log，在向employees_test表中插入一条数据的时候，触发插入相关的数据到audit中。 CREATE TABLE employees_test( ID INT PRIMARY KEY     NOT NULL, NAME           TEXT    NOT NULL, AGE            INT     NOT NULL, ADDRESS        CHAR(50), SALARY         REAL ); CREATE TABLE audit( EMP_no INT NOT NULL, NAME   TEXT    NOT NULL );
>Sql
```


CREATE TRIGGER audit_log AFTER INSERT ON employees_test
BEGIN
    INSERT INTO audit VALUES (NEW.ID, NEW.NAME);
END;
```
====================#在last_update后面新增加一列名字为create_date

存在actor表，包含如下列信息：
CREATE TABLE  IF NOT EXISTS actor  (
    actor_id  smallint(5)  NOT NULL PRIMARY KEY,
    first_name  varchar(45) NOT NULL,
    last_name  varchar(45) NOT NULL,
    last_update  timestamp NOT NULL DEFAULT (datetime('now','localtime')));
现在在last_update后面新增加一列名字为create_date, 类型为datetime, NOT NULL，默认值为'0000 00:00:00'
>Sql
```

alter table actor
add `create_date` datetime not null default '0000-00-00 00:00:00'
```
====================#针对上面的salaries表emp_no字段创建索引idx_emp_no

针对salaries表emp_no字段创建索引idx_emp_no，查询emp_no为10005, 使用强制索引。
CREATE TABLE `salaries` (
   `emp_no` int(11) NOT NULL,
   `salary` int(11) NOT NULL,
   `from_date` date NOT NULL,
   `to_date` date NOT NULL,
   PRIMARY KEY (`emp_no`,`from_date`));
 create index idx_emp_no on salaries(emp_no);
>Sql
```
SELECT * FROM salaries INDEXED BY idx_emp_no WHERE emp_no = 10005
```
====================#针对actor表创建视图actor_name_view

针对actor表创建视图actor_name_view，只包含first_name以及last_name两列，并对这两列重新命名，first_name为first_name_v，last_name修改为last_name_v：CREATE TABLE  IF NOT EXISTS actor  (
   actor_id  smallint(5)  NOT NULL PRIMARY KEY,
   first_name  varchar(45) NOT NULL,
   last_name  varchar(45) NOT NULL,
   last_update  timestamp NOT NULL DEFAULT (datetime('now','localtime')))
>Sql
```
CREATE VIEW actor_name_view (first_name_v, last_name_v) AS
SELECT first_name, last_name FROM actor
```
====================#对first_name创建唯一索引uniq_idx_firstname

针对如下表actor结构创建索引：
CREATE TABLE  IF NOT EXISTS actor  (
    actor_id  smallint(5)  NOT NULL PRIMARY KEY,
    first_name  varchar(45) NOT NULL,
    last_name  varchar(45) NOT NULL,
    last_update  timestamp NOT NULL DEFAULT (datetime('now','localtime')))
对first_name创建唯一索引uniq_idx_firstname，对last_name创建普通索引idx_lastname
>Sql
```


CREATE UNIQUE INDEX uniq_idx_firstname ON actor(first_name);
CREATE INDEX idx_lastname ON actor(last_name);
```
====================#创建一个actor_name表

对于如下表actor，其对应的数据为:



     actor_id    
     first_name    
     last_name    
     last_update    




     1         PENELOPE         GUINESS
             2006-02-15 12:34:33    

     2         NICK         WAHLBERG
             2006-02-15 12:34:33    



创建一个actor_name表，将actor表中的所有first_name以及last_name导入改表。 actor_name表结构如下：



     列表    
     类型    
     是否为NULL    
     含义    




     first_name         varchar(45)    
        not null         名字    

     last_name         varchar(45)    
        not null         姓氏    


>Sql
```


CREATE TABLE actor_name
(
first_name varchar(45) NOT NULL,
last_name varchar(45) NOT NULL
);
INSERT INTO actor_name SELECT first_name, last_name FROM actor;
```
====================#批量插入数据，不使用replace操作

对于表actor批量插入如下数据,如果数据已经存在，请忽略，不使用replace操作
CREATE TABLE  IF NOT EXISTS actor  (
    actor_id  smallint(5)  NOT NULL PRIMARY KEY,
    first_name  varchar(45) NOT NULL,
    last_name  varchar(45) NOT NULL,
    last_update  timestamp NOT NULL DEFAULT (datetime('now','localtime')))



     actor_id    
     first_name    
     last_name    
     last_update    




     '3'         'ED'         'CHASE'
             '2006-02-15 12:34:33'    


>Sql
```
INSERT OR IGNORE INTO actor VALUES (3, 'ED', 'CHASE', '2006-02-15 12:34:33')
```
====================#批量插入数据

对于表actor批量插入如下数据
CREATE TABLE  IF NOT EXISTS actor  (
    actor_id  smallint(5)  NOT NULL PRIMARY KEY,
    first_name  varchar(45) NOT NULL,
    last_name  varchar(45) NOT NULL,
    last_update  timestamp NOT NULL DEFAULT (datetime('now','localtime')))



     actor_id    
     first_name    
     last_name    
     last_update    




     1         PENELOPE         GUINESS
             2006-02-15 12:34:33    

     2         NICK         WAHLBERG
             2006-02-15 12:34:33    


>Sql
```


INSERT INTO actor
VALUES (1, 'PENELOPE', 'GUINESS', '2006-02-15 12:34:33'),
(2, 'NICK', 'WAHLBERG', '2006-02-15 12:34:33')
```
====================#创建一个actor表，包含如下列信息

创建一个actor表，包含如下列信息



     列表    
     类型    
     是否为NULL    
     含义    




     actor_id         smallint(5)    
        not null         主键id    

     first_name         varchar(45)    
        not null         名字    

     last_name         varchar(45)    
        not null         姓氏    

     last_update         timestamp    
        not null         最后更新时间，默认是系统的当前时间    


>Sql
```


CREATE TABLE actor
(
actor_id smallint(5) NOT NULL PRIMARY KEY,
first_name varchar(45) NOT NULL,
last_name varchar(45) NOT NULL,
last_update timestamp NOT NULL DEFAULT (datetime('now','localtime')) -- ,
-- PRIMARY KEY(actor_id)
)
```
====================#将employees表的所有员工的last_name和first_name拼接起来作为Name

将employees表的所有员工的last_name和first_name拼接起来作为Name，中间以一个空格区分
CREATE TABLE `employees` (   `emp_no` int(11) NOT NULL,
   `birth_date` date NOT NULL,
   `first_name` varchar(14) NOT NULL,
   `last_name` varchar(16) NOT NULL,
   `gender` char(1) NOT NULL,
   `hire_date` date NOT NULL,
   PRIMARY KEY (`emp_no`));
>Sql
```


select last_name||" "||first_name as name  from employees
```
====================#查找所有员工的last_name和first_name以及对应的dept_name

查找所有员工的last_name和first_name以及对应的dept_name，也包括暂时没有分配部门的员工
CREATE TABLE `departments` (
`dept_no` char(4) NOT NULL,
`dept_name` varchar(40) NOT NULL,
PRIMARY KEY (`dept_no`));
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
>Sql
```


SELECT em.last_name, em.first_name, dp.dept_name
FROM (employees AS em LEFT JOIN dept_emp AS de ON em.emp_no = de.emp_no)
LEFT JOIN departments AS dp ON de.dept_no = dp.dept_no
```
====================#获取当前薪水第二多的员工的emp_no以及其对应的薪水salary，不准使用order by


查找当前薪水(to_date='9999-01-01')排名第二多的员工编号emp_no、薪水salary、last_name以及first_name，不准使用order by
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
>Sql
```
select employees.emp_no,salary,employees.last_name,employees.first_name
from employees,salaries
where salaries.to_date='9999-01-01'
and salaries.emp_no=employees.emp_no
order by salary desc limit 1,1
```
====================#统计出当前各个title类型对应的员工当前薪水对应的平均工资

统计出当前各个title类型对应的员工当前（to_date='9999-01-01'）薪水对应的平均工资。结果给出title以及平均工资avg。 CREATE TABLE `salaries` ( `emp_no` int(11) NOT NULL, `salary` int(11) NOT NULL, `from_date` date NOT NULL, `to_date` date NOT NULL, PRIMARY KEY (`emp_no`,`from_date`)); CREATE TABLE IF NOT EXISTS "titles" ( `emp_no` int(11) NOT NULL, `title` varchar(50) NOT NULL, `from_date` date NOT NULL, `to_date` date DEFAULT NULL);
>Sql
```


SELECT t.title,avg(s.salary)
FROM salaries as s INNER JOIN titles as t
ON s.emp_no = t.emp_no
AND s.to_date = '9999-01-01'
AND t.to_date = '9999-01-01'
GROUP BY title
```
====================#查找employees表

查找employees表所有emp_no为奇数，且last_name不为Mary的员工信息，并按照hire_date逆序排列
 CREATE TABLE `employees` (
 `emp_no` int(11) NOT NULL,
 `birth_date` date NOT NULL,
 `first_name` varchar(14) NOT NULL,
 `last_name` varchar(16) NOT NULL,
 `gender` char(1) NOT NULL,
 `hire_date` date NOT NULL,
 PRIMARY KEY (`emp_no`));
>Sql
```
select * from employees
where emp_no % 2 = 1
and last_name != 'Mary'
order by hire_date desc
```
====================#统计各个部门对应员工涨幅的次数总和

统计各个部门对应员工涨幅的次数总和，给出部门编码dept_no、部门名称dept_name以及次数sum
CREATE TABLE `departments` (
`dept_no` char(4) NOT NULL,
`dept_name` varchar(40) NOT NULL,
PRIMARY KEY (`dept_no`));
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
>Sql
```


select 
    dm.dept_no,dm.dept_name,count(*) sum
from 
    departments dm,dept_emp de,salaries s
where
    dm.dept_no=de.dept_no
and 
    de.emp_no=s.emp_no
group by 
    dm.dept_no
 
```
====================#查找所有员工自入职以来的薪水涨幅情况

查找所有员工自入职以来的薪水涨幅情况，给出员工编号emp_no以及其对应的薪水涨幅growth，并按照growth进行升序 CREATE TABLE `employees` ( `emp_no` int(11) NOT NULL, `birth_date` date NOT NULL, `first_name` varchar(14) NOT NULL, `last_name` varchar(16) NOT NULL, `gender` char(1) NOT NULL, `hire_date` date NOT NULL, PRIMARY KEY (`emp_no`)); CREATE TABLE `salaries` ( `emp_no` int(11) NOT NULL, `salary` int(11) NOT NULL, `from_date` date NOT NULL, `to_date` date NOT NULL, PRIMARY KEY (`emp_no`,`from_date`));
>Sql
```


SELECT sCurrent.emp_no, (sCurrent.salary-sStart.salary) AS growth
FROM (SELECT s.emp_no, s.salary FROM employees e, salaries s WHERE e.emp_no = s.emp_no AND s.to_date = '9999-01-01') AS sCurrent,
(SELECT s.emp_no, s.salary FROM employees e, salaries s WHERE e.emp_no = s.emp_no AND s.from_date = e.hire_date) AS sStart
WHERE sCurrent.emp_no = sStart.emp_no
ORDER BY growth
```
====================#获取当前薪水第二多的员工的emp_no以及其对应的薪水salary

获取当前（to_date='9999-01-01'）薪水第二多的员工的emp_no以及其对应的薪水salary
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
>Sql
```
select emp_no,salary from salaries
where to_date='9999-01-01' order by salary desc limit 1,1
```
====================#查找所有已经分配部门的员工的last_name和first_name

查找所有已经分配部门的员工的last_name和first_name
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
>Sql
```
select last_name,first_name, dept_emp.dept_no from 
dept_emp,employees where dept_emp.emp_no=employees.emp_no

```
====================#获取所有非manager的员工emp_no

获取所有非manager的员工emp_no
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL,
`emp_no` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
>Sql
```
SELECT emp_no FROM employees
WHERE emp_no NOT IN (SELECT emp_no FROM dept_manager)
```
====================#获取所有部门当前manager的当前薪水情况，给出dept_no, emp_no以及salary，当前表示to_date='9999-01-01'

获取所有部门当前manager的当前薪水情况，给出dept_no, emp_no以及salary，当前表示to_date='9999-01-01'CREATE TABLE `dept_manager` (`dept_no` char(4) NOT NULL,`emp_no` int(11) NOT NULL,`from_date` date NOT NULL,`to_date` date NOT NULL,PRIMARY KEY (`emp_no`,`dept_no`));CREATE TABLE `salaries` (`emp_no` int(11) NOT NULL,`salary` int(11) NOT NULL,`from_date` date NOT NULL,`to_date` date NOT NULL,PRIMARY KEY (`emp_no`,`from_date`));
>Sql
```


SELECT dept_no,dept_manager.emp_no,salary
FROM salaries,dept_manager
WHERE salaries.emp_no=dept_manager.emp_no
and salaries.to_date='9999-01-01'
and dept_manager.to_date='9999-01-01'
```
====================#找出所有员工当前薪水salary情况

找出所有员工当前(to_date='9999-01-01')具体的薪水salary情况，对于相同的薪水只显示一次,并按照逆序显示
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
>Sql
```
select distinct salary from salaries where
to_date='9999-01-01' order by salary desc
```
====================#查找入职员工时间排名倒数第三的员工所有信息

查找入职员工时间排名倒数第三的员工所有信息
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
>Sql
```
select *from employees 
where hire_date=(select distinct (hire_date) from employees
                order by hire_date  desc limit 2,1)
```
====================#查找最晚入职员工的所有信息

查找最晚入职员工的所有信息
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
>Sql
```
select *from employees where hire_date=(select max(hire_date) from employees)
```
====================#数字构造

        对于一个十进制数而言，它的数位和等于将它各位数字相加得到的和。比如 231 的数位和 是 6，3179 的数位和是 20。 现在你知道某个十进制数的数位和等于 s，并且这个数不包含 0，且任意相邻的数位是不同 的，比如 112 或者 102 都是不满足条件的。现在你想知道满足这样的条件的最大的数是多少?       
>Java
```


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
 
/**
 * @author wylu
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.println(generate(Integer.parseInt(br.readLine())));
    }
 
    private static String generate(int s) {
        StringBuilder sb = new StringBuilder();
        if (s % 3 == 1) sb.append(1);
        for (int i = 0; i < s / 3; i++) sb.append("21");
        if (s % 3 == 2) sb.append(2);
        return sb.toString();
    }
}
```
====================#骰子游戏

小易参加了一个骰子游戏,这个游戏需要同时投掷n个骰子,每个骰子都是一个印有数字1~6的均匀正方体。 小易同时投掷出这n个骰子,如果这n个骰子向上面的数字之和大于等于x,小易就会获得游戏奖励。 小易想让你帮他算算他获得奖励的概率有多大。
>C++
```


/*
*在网上看了一下思路，特意整理了一下
*dp思想，dp[i][j] 表示i个筛子可以产生j一共有多少种结果
*dp[1][j]=1(j=1~6)
*dp[i][i]=1,dp[i][6*i]=1
*dp[i][j]+=dp[i-1][j-k](k=1~6)，表示i个筛子产生的结果只能1~6，然后加上i-1个产生结果即可
*/
#include<iostream>
#include<random>
using namespace std;
typedef long long ll;
ll dp[30][150];///注意这里一定要用long long 否则会溢出
ll gcd(ll x, ll y)
{
    if (x%y == 0) return y;
    else return (gcd(y, x%y));
}
int main()
{
    int n,x;
    while(cin>>n>>x){
        if(x==n){ ///概率为1的情况
            cout<<1<<endl;
            continue;
        }else if(x<n||x>n*6){///概率为0的情况
            cout<<0<<endl;
            continue;
        }else{
            ///初始化
            for(int i=0;i<=n;i++){
                for(int j=0;j<=6*i;j++){
                    dp[i][j]=0;
                }
            }
            for(int i=1;i<=n;i++){ ///n个筛子，循环n次
                for(int j=i;j<=6*i;j++){
                    if(i==1||i==j||j==6*i){
                        dp[i][j]=1;
                    }else{
                        for(int k=1;k<=6;k++){
                            if(j-k>=i-1)///i-1个筛子的结果范围一定是大于等于i-1的
                                dp[i][j]+=dp[i-1][j-k];
                        }
                    }
                }
            }
        }
        ll sum=0;
        ll p=0;
        for(int i=n;i<=6*n;i++){
            if(i>=x) p+=dp[n][i];
            sum+=dp[n][i];
        }
        ll c=gcd(p,sum);
        p/=c;
        sum/=c;
        cout<<p<<"/"<<sum<<endl;
    }
    return 0;
}
```
====================#神奇数

东东在一本古籍上看到有一种神奇数,如果能够将一个数的数字分成两组,其中一组数字的和等于另一组数字的和,我们就将这个数称为神奇数。例如242就是一个神奇数,我们能够将这个数的数字分成两组,分别是{2,2}以及{4},而且这两组数的和都是4.东东现在需要统计给定区间中有多少个神奇数,即给定区间[l, r],统计这个区间中有多少个神奇数,请你来帮助他。
>Java
```


import java.util.Arrays;
import java.util.Scanner;
 
/**
 * 京东2018秋招Android
 * 神奇数
 * 东东在一本古籍上看到有一种神奇数,如果能够将一个数的数字分成两组,其中一组数字的和等于另一组数字的和,
 * 我们就将这个数称为神奇数。例如242就是一个神奇数,我们能够将这个数的数字分成两组,分别是{2,2}以及{4},
 * 而且这两组数的和都是4.东东现在需要统计给定区间中有多少个神奇数,即给定区间[l, r],统计这个区间中有多
 * 少个神奇数,请你来帮助他。
 * 输入描述:
 * 输入包括一行,一行中两个整数l和r(1 ≤ l, r ≤ 10^9, 0 ≤ r - l ≤ 10^6),以空格分割
 * <p>
 * <p>
 * 输出描述:
 * 输出一个整数,即区间内的神奇数个数
 * <p>
 * 输入例子1:
 * 1 50
 * <p>
 * 输出例子1:
 * 4
 */
public class Main {
    /**
     * 首先判断数组能否被平分，即数组分割问题，
     * dp[i][j]
     * 表示数组前 i
     * 个数字能否求和得到 j
     * 则
     * dp[i][j]=dp[i−1][j]||dp[i−1][j−array[i]]
     * 其中||是逻辑或运算。
     * 优化：
     * 1、若sum（array）为奇数，直接返回false
     * 2、使用逆序循环将dp数组简化为一维数组
     */
 
    public static boolean isMagic(int[] nums, int sum) {
        int len = nums.length;
 
        if (sum % 2 != 0)
            return false;
 
        int mid = sum / 2;
 
        int[] dp = new int[mid + 1];
        dp[0] = 1;
        for (int i = 0; i < len; i++) {
            for (int j = mid; j > 0; j--) {
                if (j >= nums[i] && nums[i] != -1)
                    dp[j] = Math.max(dp[j], dp[j - nums[i]]);
            }
        }
        if (dp[mid] > 0)
            return true;
        else
            return false;
    }
 
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int l = sc.nextInt();
        int r = sc.nextInt();
 
        int result = 0;
 
        for (int i = l; i <= r; i++) {
 
            int num = i;
            int[] nums = new int[10];
            int sum = 0;
            Arrays.fill(nums, -1);
            int index = 0;
            while (num > 0) {
                int temp = num % 10;
                nums[index++] = temp;
                sum += temp;
                num = num / 10;
            }
 
            if (isMagic(nums, sum)) {
                result++;
            }
        }
 
        System.out.println(result);
    }
 
}
```
