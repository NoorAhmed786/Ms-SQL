use mr;


select distinct job_id
from employees;

select * 
from employees
where (salary* 1.15)>10000;


select first_name +' ' + last_name as "Full Name"
from employees
where len(first_name) > 6;

select * 
from employees
where MONTH(hire_date)=1;

select * 
from employees
where salary < 3500;

select * 
from employees
where hire_date < '1991';


select employee_id, 
first_name +' ' + last_name as "Full Name",
hire_date,salary
from employees
where (hire_date <'1991-04-01') ;

select employee_id, 
first_name +' ' + last_name as "Full Name",
hire_date,salary
from employees
where (salary < 100) ;

select *
from employees
where salary/31>=500 ;

select *
from employees
where salary*2>=1;
