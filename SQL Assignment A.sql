Create database AssignmentA;
use AssignmentA;
create table Employee (
EmpId int,
Name varchar(20),
age int,
Country varchar(30),
salary int,
dateOfJoining date,
Phone VARCHAR(20));
Alter table employee modify phone Varchar(30);
Alter table employee modify EmpId int Primary Key;
Insert into Employee(EmpId, Name, age, Country, salary, dateOfJoining, Phone)
values
(1, "Reshma", 28, "India", 250000,'2023-01-09', '9898989898'),
(2, "Ana", 32, "Australia", 50000, '2023-09-09', '9876549012'),
(3, "Stephan", 44, "USA", 70000, '2023-09-09', '9876056781'),
(4, "Rahul", 29,"India", 95000, '2023-04-07', '9870632415'),
(5,"Geeta", 29,"India", 77000, '2023-09-14', '8760986709'),
(6,"Edward", 45, "France", 89000, '2022-11-24', '9876590561'),
(7,"Bella", 23, "France", 20000, '2021-09-18', '7890654321');
select* from Employee;
Select Name, salary from Employee;
Select Name, Country from Employee where Country="India";
Select Name from Employee where salary>40000;
Select Name from Employee where salary between 50000 and 80000;
Select Name, age from Employee where age>= 30 order by age desc;
Select Name, dateOFJoining from employee order by dateOfJoining asc;
Select Count(EmpId) from Employee;
Select Name, salary from Employee where Country="France" or Country="Australia";
Delete from Employee where EmpId=2;
Select * From Employee;
Select min(salary) from employee;
Select max(salary) from employee;
Alter table Employee add Email Varchar(20); 
Update Employee set age=55, salary=90000 where EmpId=4;
Alter table Employee rename column Country to address;
alter table employee drop column age;
use AssignmentA;
Create table person (
id int primary key,
name varchar(50) Not null,
city varchar(50) Not null default"Delhi",
age int check(age>=18),
Email varchar(50) Not null Unique,
Country varchar(50) Not Null default"India");
select * From Employee where salary=( select max(salary) from Employee);
select distinct address from Employee;
select * from Employee limit 3 offset 2;
select * from employee where salary= 
(select distinct salary from employee order by salary desc limit 1 offset 1);
select * from employee;
create view employeeview AS select EmpId, Name, Email, dateOFJoining from employee;
select * from employeeview;
create or replace view employeeview AS select EmpId, Name, dateOfjoining from employee;


