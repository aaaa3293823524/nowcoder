# 3. |对于employe

## Question description


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
			





## Solution

Language: **Sql**

```Sql


SELECT e1.first_name FROM 
  (SELECT e2.first_name, 
    (SELECT COUNT(*) FROM employees AS e3 
     WHERE e3.first_name <= e2.first_name) 
   AS rowid FROM employees AS e2) AS e1
WHERE e1.rowid % 2 = 1
```


