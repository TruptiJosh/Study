select * from excelimport;
select * from assignmenta.excelimport;
select * , rank() over (partition by department order by salary desc) as Rnk  ,
dense_rank() over (partition by department order by salary desc) as den_rnk,
row_number() over (partition by department order by salary desc) as rw_num from excelimport;
select * from (select *, dense_rank() over (partition by department order by 
salary desc) as den_rnk from excelimport ) as ranked_table where den_rnk=1;
use school;
create table salary(
Emp_ID int primary key,
Emp_name varchar(20),
Emp_salary int,
Emp_age int,
Emp_gender varchar(20),
Emp_Dept varchar(20));
Insert into salary(Emp_ID, Emp_name,Emp_salary, Emp_age,Emp_gender,Emp_Dept)
values
(1,'sam',95000,45,'Male','Operations'),
(2,'Bob',80000,21,'Male','Support'),
(3,'Anne',125000,23,'Female','Analytics'),
(4,'Julia',73000,30,'Female','Analytics'),
(5,'Matt',159000,33,'Male','Sales');
select * from salary;
select Emp_salary from salary order by Emp_salary desc limit 1 offset 1;
select max(Emp_salary) from salary where Emp_salary < (select max(Emp_salary) from salary);
