
--===================  Alter /Create  ===============


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

--insert into Employees(Emp_Name,Emp_Address,Emp_Email,Emp_salary,Emp_Type)
--values('asad Ali','Gilgit Baltistan','asad@gmail.com',20000,1),
--('Abid Ali','Gilgit Baltistan','abid@gmail.com',20000,1),
--('Urooj','Karachi, Pakistan','urooj@gmail.com',25000,2),
--('Samama','Karachi, Pakistan','samama@gmail.com',50000,3),
--('Rizwan','Islamabad, Pakistan','rizwan@gmail.com',30000,2),
--('Muaaz Hassan','Gilgit Baltistan','muaaz@gmail.com',40000,3),
--('Hammad','Rawalpindi, Pakistan','Hammad@gmail.com',20000,2),
--('Mairaj','Karachi, Pakistan','mairaj@gmail.com',25000,5),
--('Saboor','Hyderabad, Pakistan','Saboor@gmail.com',15000,5),
--('Ali Hasnain','Gilgit Baltistan','ali@gmail.com',30000,4)

create table Student(
ID int primary key identity,
Name varchar(25) not null,
Course varchar(50) not null,
Class varchar(20) not null,
TID int foreign key references Employees(Emp_ID),
CR int foreign key references Student(ID) null
)

select * from Student

--insert into Student(Name,Course,Class,TID,CR)
--values('Rizwan khan','Mobile Application Development','Lab 209',4,1),
--('Hasnain','Mobile Application Development','Lab 209',4,1),
--('Masoma','Mobile Application Development','Lab 209',4,1),
--('urooj','Mobile Application Development','Lab 209',4,1),
--('ali','Mobile Application Development','Lab 209',4,1),
--('hammad','Mobile Application Development','Lab 209',4,1),
--('saboor','Mobile Application Development','Lab 209',4,1)

select * from Student
select * from Employees
select * from Employee_type




exec sp_rename 'Employee_type','Category'

alter table Category
drop column ET_ID

alter table student
add email varchar(150) default 'abc@gmail.com' not null;

update student
set email = LOWER(Name)+'@gmail.com'

alter table student
alter column email varchar(200)

alter table employee_type
drop column ET_ID

alter table student
drop column cascade TID

update Student set CR = null

drop table student

exec sp_rename 'Employees','Teacher'

alter table student
drop constraint ID


alter table student
drop constraint [PK__Student__3214EC270D2D6719]

alter table Employees
drop constraint [PK__Employee__2623598BA9FDEF19]

alter table Employees
add constraint PK_Employees_Emp_ID
primary key (Emp_ID)

alter table Employees
add constraint FK_Employees_EmpType
Foreign key (Emp_Type)
References Employee_type(ET_ID)
on Delete cascade on update cascade


-- ============== view ===============
use HR

select * from emp_details_view
drop view emp_details_view

alter view emp_150
as
(select em.employee_id,em.fullname,em.manager,em.salary,d.department_name,j.job_title,jh.start_date,jh.end_date,l.state_province,
l.street_address,l.postal_code,c.country_name,r.region_name
from (select e.employee_id,e.first_name+''+e.last_name as fullname ,m.first_name as manager,e.salary,
e.department_id,e.job_id from employees 
e inner join employees m on e.manager_id=m.employee_id)as em full outer join departments d
on em.department_id=d.department_id
full outer join jobs j on em.job_id= j.job_id
full outer join job_history jh on jh.employee_id= em.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
)


select * from emp_150

update emp_150
set last_name = 'Khan'
where employee_id=150;

-- =================== procedure =============
--Alter proc employee_All_Data @EID int
--as
--(select em.employee_id,em.first_name,em.Manager,em.salary,
--d.department_name,j.job_title,jh.start_date,jh.end_date,l.city,
--l.state_province,l.street_address,l.postal_code,c.country_name,r.region_name
--from (Select e.employee_id,e.first_name,e.last_name,e.salary,m.first_name as "Manager",e.department_id,e.job_id
--from employees e inner join employees m
--on e.manager_id = m.employee_id)as em full outer join departments d
--on em.department_id = d.department_id full outer join jobs j
--on em.job_id = j.job_id full outer join job_history jh
--on em.employee_id = jh.employee_id full outer join locations l
--on d.location_id = l.location_id full outer join countries c
--on l.country_id = c.country_id full outer join regions r
--on r.region_id = c.region_id where em.employee_id=@EID
--)
--declare @id int
--set @id = 117
--exec employee_All_Data @EID = 150


Alter proc employee_All_Data @col varchar(50)
as
(select em.employee_id,em.first_name,em.Manager,em.salary,
d.department_name,j.job_title,jh.start_date,jh.end_date,l.city,
l.state_province,l.street_address,l.postal_code,c.country_name,r.region_name
from (Select e.employee_id,e.first_name,e.last_name,e.salary,m.first_name as "Manager",e.department_id,e.job_id
from employees e inner join employees m
on e.manager_id = m.employee_id)as em full outer join departments d
on em.department_id = d.department_id full outer join jobs j
on em.job_id = j.job_id full outer join job_history jh
on em.employee_id = jh.employee_id full outer join locations l
on d.location_id = l.location_id full outer join countries c
on l.country_id = c.country_id full outer join regions r
on r.region_id = c.region_id where em.first_name=@col
)

exec employee_All_Data @col = 'neena'


Alter proc employee_Data @column varchar(20)
as
(select
count(@column) as "column",
max(@column)as "max salary",
min(@column) as "min salary",
avg(@column) as " avg salary ",
sum(@column) as "avg salary"
from  (select em.employee_id,em.first_name,em.Manager,em.salary,
d.department_name,j.job_title,jh.start_date,jh.end_date,l.city,
l.state_province,l.street_address,l.postal_code,c.country_name,r.region_name
from (Select e.employee_id,e.first_name,e.last_name,e.salary,m.first_name as "Manager",e.department_id,e.job_id
from employees e inner join employees m
on e.manager_id = m.employee_id)as em full outer join departments d
on em.department_id = d.department_id full outer join jobs j
on em.job_id = j.job_id full outer join job_history jh
on em.employee_id = jh.employee_id full outer join locations l
on d.location_id = l.location_id full outer join countries c
on l.country_id = c.country_id full outer join regions r
on r.region_id = c.region_id group by @column)

exec employee_Data @column = 'employee_id'

