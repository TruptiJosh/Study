Use trupti;
    create table Teacher (
    Rollno int,
    Name varchar(20),
    age int,
    address varchar(30));
    insert into Teacher
    values(1,"Trupti",28,"Pune"),
    (2,"Kajal",12,"Delhi"),
    (3,"Kiran",15,"Chennai");
    select* from Teacher;
    Select Name From Teacher where address="delhi";
    select Rollno, age from Student;	
    select * From Teacher 
    where Rollno=3 OR Name= "Trupti" ;
    Select * from Teacher where Rollno IN(1,3) ;
    Drop table Student;
    Select * from Teacher where Rollno between 1 and 2;
    Create table Employees (
    ID Int primary key,
    FirstName Varchar(50) Not null,
    Email Varchar(50) Unique Not null,
    Salary Int,
    Phone Varchar(50) Unique
    );
    
    
    
    
    