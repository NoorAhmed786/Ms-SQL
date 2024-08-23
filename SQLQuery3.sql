use mr;

--Where,AND IN OR BETWEEN ,SUbQuery
select *
from employees
where hire_date>='2000-01-01' and hire_date <= '2005-12-30';

select *
from employees
where hire_date between '2000-01-01' and '2005-12-30'
order by first_name;

select employee_id,
first_name+' '+last_name as "Full name",
job_id,
department_id,
salary
from employees
where salary between 5000 and  6000;

select *
from employees
where salary in (5000,1000,2000,3000,6000)

select *
from employees
where manager_id in (105,160,150,120)

select *
from employees
where job_id in (select job_id
from employees
where salary in (5000,1000,2000,3000,6000));


select *
from employees
where job_id = (select job_id from employees  where employee_id=160)

select *
from employees
where first_name like '%y'

select count(first_name) as "Total Employees",
sum(salary) as "Total Salary",
max(salary) as "Max Salary",
min(salary) as "Min Salary",
avg(salary) as "avg Salary"
from employees;

select *
from employees
where salary = (select max(salary) from employees)

select count(first_name)
from employees
where salary = (select min(salary) from employees)

select *
from employees
where salary = (select min(salary) from employees)


select count(employee_id)
from employees
where salary > (select avg(salary) from employees)

select *
from employees
where salary > (select avg(salary) from employees)


select count(employee_id)
from employees
where salary < (select avg(salary) from employees)

select *
from employees
where salary < (select avg(salary) from employees)

select distinct job_id from employees;