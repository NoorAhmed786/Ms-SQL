Create database AB_School;

use AB_School;

create table Employee_type
(
ET_ID int Primary key identity,
ET_Name varchar(28) not null
)
select * from Employee_type

insert into Employee_type(ET_Name) values('Teacher'),('HR'),('Finance'),('Staff'),('Marketing')

Create table Employees
(
Emp_ID int primary key identity,
Emp_Name varchar(28) not null,
Emp_Address varchar(200) not null,
Emp_Email varchar(255) unique,
Emp_salary int not null,
Emp_Type int foreign key references Employee_type(ET_ID)
)
select * from Employees

insert into Employees(Emp_Name,Emp_Address,Emp_Email,Emp_salary,Emp_Type)
values('asad Ali','Gilgit Baltistan','asad@gmail.com',20000,1),
('Abid Ali','Gilgit Baltistan','abid@gmail.com',20000,1),
('Urooj','Karachi, Pakistan','urooj@gmail.com',25000,2),
('Samama','Karachi, Pakistan','samama@gmail.com',50000,3),
('Rizwan','Islamabad, Pakistan','rizwan@gmail.com',30000,2),
('Muaaz Hassan','Gilgit Baltistan','muaaz@gmail.com',40000,3),
('Hammad','Rawalpindi, Pakistan','Hammad@gmail.com',20000,2),
('Mairaj','Karachi, Pakistan','mairaj@gmail.com',25000,5),
('Saboor','Hyderabad, Pakistan','Saboor@gmail.com',15000,5),
('Ali Hasnain','Gilgit Baltistan','ali@gmail.com',30000,4)

create table Student(
ID int primary key identity,
Name varchar(25) not null,
Course varchar(50) not null,
Class varchar(20) not null,
TID int foreign key references Employees(Emp_ID),
CR int foreign key references Student(ID) null
)

select * from Student

insert into Student(Name,Course,Class,TID,CR)
values('Rizwan khan','Mobile Application Development','Lab 209',4,1),
('Hasnain','Mobile Application Development','Lab 209',4,1),
('Masoma','Mobile Application Development','Lab 209',4,1),
('urooj','Mobile Application Development','Lab 209',4,1),
('ali','Mobile Application Development','Lab 209',4,1),
('hammad','Mobile Application Development','Lab 209',4,1),
('saboor','Mobile Application Development','Lab 209',4,1)

select * from Student
select * from Employees
select * from Employee_type

update Student
set Name = 'Noor'
where ID = 4;

update Student
set CR = 4
where ID > 5;

delete from Student
where CR = 4;

delete from Student
where ID = 4;

drop table Student
drop table Employees
drop table Employee_type