# 1. |获取所有员工的em

## Question description


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
			







## Solution

Language: **Sql**

```Sql


select e.emp_no,de.dept_no,eb.btype,eb.recevied
from employees e 
inner join dept_emp de on e.emp_no=de.emp_no
left join  emp_bonus eb on e.emp_no=eb.emp_no
```


