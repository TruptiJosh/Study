Create database AssignmentB;
use AssignmentB;
create table Employee (
EmpId int Primary key,
Name varchar(20),
City varchar(30),
age int,
salary int);
Insert into Employee(EmpId, Name, City, age, salary)
values
(1, "Ana", "Delhi", 22,77000),
(2, "Geeta","Noida", 25,45000),
(3, "Raj", "Banglore",32, 56000),
(4, "Ema", "Delhi", 35,44000),
(5,"Sunil", "Lucknow", 29,95000),
(6,"shweta",  "Udaipur",20, 77000),
(7,"Evee",  "Chennai", 44,95000);
select* from Employee;
create table Department (
DeptId int ,
DeptName varchar(20),
EmpId int,
foreign key (EmpId) references Employee(EmpId));
Insert into Department (DeptId, DeptName,EmpId )
values
(10, "Marketing",1),
(20, "Purchasing",2),
(30, "Human Resources",1),
(40, "Shipping",3),
(50,"Shipping",4),
(70,"Shipping",5),
(90,"Finance",7);
select* from Department;
-- 1)Q.to display the name of employee who works in shipping department
select * from Employee 
join Department on Department.EmpId=Employee.EmpId
where department.DeptName ="Shipping";
-- 2)Write a query to display
-- the names of the employees who are not in the shipping department.
select * from Employee  join Department on Department.EmpId=Employee.EmpId
where department.DeptName !="Shipping";
-- 3)write a query to display the name of the department having employees with a salary less than 50000
select DeptName from Department
 join Employee on Employee.EmpId=Department.EmpId
 where salary<50000;
 -- using subquery
 select DeptName from Department
 where EmpId in (select EmpId from Employee where Salary < 50000);
 -- 2nd Que. Worker & Bonus , Title Table
 create table Worker (
worker_id int Primary key,
first_Name varchar(20),
last_name varchar(30),
salary int,
Joining_date date,
department VARCHAR(20));
Insert into Worker(worker_id, first_Name, last_name, salary, Joining_date, department)
values
(1, "Monika", "Arora", 100000, "2021-02-20" ,"HR"),
(2, "Niharika","Verma",80000, "2021-06-11" ,"Admin"),
(3, "Vishal", "Singhal",300000, "2021-02-20" ,"HR"),
(4, "Amitabh", "Singh", 500000,"2021-02-20","Admin"),
(5,"Vivek", "Bhati", 500000,"2021-06-11","Admin"),
(6,"Vipul",  "Diwan",200000,"2021-06-11","Account"),
(7,"Satish",  "Kumar",75000,"2021-01-20","Account"),
(8,"Geetika",  "Chauhan", 90000,"2021-04-11","Admin");
select* from Worker;
create table Bonus (
worker_ref_id int ,
bonus_amount int,
bonus_date date,
foreign key (worker_ref_id) references Worker(worker_id));
Insert into Bonus (worker_ref_id, bonus_amount,bonus_date )
values
(1,5000,"2023-02-20"),
(2,3000,"2023-06-11"),
(3,4000,"2023-02-20"),
(1, 4500,"2023-02-20"),
(2,3500,"2023-06-11");
select* from Bonus;
create table Title (
worker_ref_id int ,
worker_title varchar(30),
affected_from date,
foreign key (worker_ref_id) references Worker(worker_id));
Insert into Title (worker_ref_id, worker_title,affected_from )
values
(1,"Manager","2023-02-20"),
(2,"Executive","2023-06-11"),
(8,"Executive","2023-06-11"),
(5, "Manager","2023-06-11"),
(4,"Asst Manager","2023-06-11"),
(7,"Executive","2023-06-11"),
(6,"Lead","2023-06-11"),
(3,"Lead","2023-06-11");
select* from Title;
-- A)to fetch "first_name"from worker table using the alias name <worker_name>
select first_name from worker as worker_name;
-- B)the unique values of Department from the worker table
select distinct department from worker;
-- C)print all worker details from the worker table order by FIRST_NAME Ascending
select * from worker order by first_name asc;
-- D)to print details from workers with the first name VIPUL and SATISH from the worker table.
select * from Worker where first_name ='Vipul' or first_name ='Satish' ;
 -- E)to print details of workers excluding first names, "Vipul" and "Satish" from the worker table
 select * from Worker where first_name !='Vipul' or first_name !='Satish' ;
 -- Alternate way NOT IN
 select * from worker where first_name not in ('Vipul','Satish');
 -- F) to print details of workers with DEPARTMENT name as "Admin"
 select * from Worker where department="Admin" ;
 -- G)to print details of workers whose FIRST_NAME contains 'a'
 select * from worker where lower(first_name) like '%a%' ;
 -- H) to print the details of workers who joined in feb 2021 
 select * from Worker where joining_date between "2021-02-01" and "2021-02-28";
 -- ALTERNATE WAY
 select * from worker where extract(month from Joining_date) = 2 
and extract(year from Joining_date) = 2021;
-- I) to fetch the count of employees working in the department "Admin"
select count(worker_id) from Worker where department="Admin";
-- J)to fetch the number of workers for each department in descending order
select count(worker_id) as C,department from Worker group by department order by C desc;
-- K) to show the first 10 records of the table
select * from Worker limit 10; 
-- L) to fetch the departments that have less than 5 people in them
select count(worker_id) as C, department from worker group by department having count(worker_id) <=5;
-- M) to fetch the departments along with the total salries paid for each of them
select sum(salary) as Total_Salary , department from worker group by department ;