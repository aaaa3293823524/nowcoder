# 8. |如何获取emp_v

## Question description


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
			





## Solution

Language: **Sql**

```Sql
SELECT * FROM employees INTERSECT SELECT * FROM emp_v
```


