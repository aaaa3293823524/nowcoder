# 4. |统计salary的

## Question description


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
			





## Solution

Language: **Sql**

```Sql


SELECT s1.emp_no, s1.salary, 
(SELECT SUM(s2.salary) FROM salaries AS s2 
 WHERE s2.emp_no <= s1.emp_no AND s2.to_date = '9999-01-01') AS running_total 
FROM salaries AS s1 WHERE s1.to_date = '9999-01-01' ORDER BY s1.emp_no
```


