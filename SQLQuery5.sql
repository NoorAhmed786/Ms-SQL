--================ GROUp,having,Join and ON  =====================

use mr;


select job_id,
count(first_name) as "Employee Count",
max(salary) as "Max Salary",
min(salary) as "Min salary",
avg(salary) as "Avg Salary",
sum(salary) as "Total salary"
from employees
group by job_id
having avg(salary)>10000 and count(first_name)>1;



select department_id,
count(first_name) as "Employee Count",
max(salary) as "Max Salary",
min(salary) as "Min salary",
avg(salary) as "Avg Salary",
sum(salary) as "Total salary"
from employees
group by department_id
having count(first_name)>=6 and min(salary)>2000 and max(salary)>=12000;

select employee_id,first_name,salary,job_id
from employees
where salary = (
select max(salary)
from employees
where salary in (
select max(salary)
from employees
group by job_id) and job_id='SA_REP')

select employee_id,first_name,salary,job_id
from employees
where salary = (
select max(salary)
from employees
where salary in (
select max(salary)
from employees
group by department_id) and department_id=80)

select * from countries
select * from regions

select region_name,country_name
from regions cross join countries

select * from employees
select * from departments

select e.employee_id,e.first_name,e.last_name,d.department_name,d.department_id
from employees as e inner join departments as d
on e.department_id = d.department_id

------------Self Join-----------------------
select e.first_name as "Employee",m.first_name as "Manager"
from employees as e join employees as m
on e.manager_id = m.employee_id;

---------------Outer JOIN---------------------
select *
from employees as e full outer join departments as d
on e.department_id = d.department_id


SELECT e.employee_id, e.first_name, e.salary, e.job_id
FROM employees e
JOIN (
    SELECT job_id, MAX(salary) AS max_salary
    FROM employees
    GROUP BY job_id
) max_salaries
ON e.job_id = max_salaries.job_id
AND e.salary = max_salaries.max_salary;


--===============================  DATE TIME FUNCTION ==============

SYSDATETIME( )
 SYSDATETIMEOFFSET() 
CURRENT_TIMESTAMP
GETDATE(),
DATEPART(WEEKDAY,SYSDATETIME())
day
month
Year
 DATEFROMPARTS  SELECT DATEFROMPARTS ( 2010, 12, 31 ) AS Result; 


SELECT DATEDIFF(year,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(quarter,     '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(month,       '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(dayofyear,   '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(day,         '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(week,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(weekday,     '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(hour,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(minute,      '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(second,      '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(millisecond, '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(microsecond, '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');


SELECT DATEADD(month, 1, '20240830');
SELECT DATEADD(month, 1, '2024-08-31');

EOMONTH() 





select CURRENT_TIMESTAMP,SYSDATETIME(),SYSDATETIMEOFFSET(),GETDATE();

select DATEPART(YEAR,CURRENT_TIMESTAMP),
DATEPART(MONTH,CURRENT_TIMESTAMP),
DATEPART(DAY,CURRENT_TIMESTAMP),
DATEPART(DAYOFYEAR,CURRENT_TIMESTAMP),
DATEPART(WEEKDAY,CURRENT_TIMESTAMP),
DATEPART(WEEK,CURRENT_TIMESTAMP),
DATEPART(MINUTE,CURRENT_TIMESTAMP),
DATEPART(SECOND,CURRENT_TIMESTAMP),
DATEPART(MILLISECOND,CURRENT_TIMESTAMP);

select DATEFROMPARTS(2005,01,12);

select first_name,DATEDIFF(YEAR,hire_date,GETDATE()),
DATEDIFF(MONTH,hire_date,GETDATE()),
DATEDIFF(DAY,hire_date,GETDATE()),
DATEDIFF(DAYOFYEAR,hire_date,GETDATE()),
DATEDIFF(WEEK,hire_date,GETDATE()),
DATEDIFF(MINUTE,hire_date,GETDATE()) 
from employees;

select DATEADD(YEAR,4,GETDATE()),
DATEADD(MONTH,4,GETDATE()),
DATEADD(day,4,GETDATE()); 
select EOMONTH(GETDATE());

select year(getdate()),day(GETDATE());


--***********************Number Functions***********************

--1=> power()
select POWER(2,3); select POWER(salary,2) from employees;
--2=> least()
select least(7,2,0,40,5,6,32,1452);
--3=> greatest()
select greatest(7,2,0,40,5,6,32,1452);
4=> PI()k
select PI()*(5*5)
--5=> Mod()
--6=> sqrt() 
select sqrt(salary) from employees;
--7=> Round()
select round(5.3625,3)
8=> abs()k
select abs(-654),abs(+968)
--9=> ceiling()
select CEILING(5.0)
--10=> floor()
select FLOOR(5.9)
--11=> Square() 
select Pi()*square(8);


--*******************************String Function***********************


--11=> Concat()
select CONCAT('Hello',' ','World',' ','asda',' ','dasdas'); 
select CONCAT(employee_id,salary,manager_id,first_name)
from employees;
--11=> Concat_WS()
select CONCAT_ws(' | ',employee_id,salary,manager_id,first_name) as "Concat Employee Column"
from employees;

--12=> Trim()
select LTRIM('   Abid Ali   ')
--20=> Ltrim()
--21=> Rtrim()	
select RTRIM('         Abid Ali   ')
		select TRIM('         Abid Ali   ')

--13=> Left()
select left('Abid',3),Right('Abid',3);
--14=> Rigth()

--15=> length()/len() 
select len('sdkjad')
16=> Lower()  k
select UPPER('abid'),LOWER('ABID');
--17=> Upper()

--24=> Replace() 
select REPLACE('Abid Ali','Ali','Khan')
--25=> REVERSE()
select REVERSE(first_name) from employees;

--27=> SUBSTRING()
select SUBSTRING('akj sdl asn jdk las',3,8);


--==================   joins  ==================

select employee_id,
CONCAT_ws(' ',first_name,last_name) as "Full name",
e.salary,
e.department_id
from employees e inner join (select department_id as ID,max(salary) as max_salary
from employees
group by department_id)dept_salary
on dept_salary.ID = e.department_id and
dept_salary.max_salary = e.salary


select emp.*,CONCAT_WS(' ',mgr.first_name,mgr.last_name) as Manager
from employees mgr inner join (select employee_id,
CONCAT_ws(' ',first_name,last_name) as "Full name",
e.salary,
e.department_id,
e.manager_id
from employees e inner join (select department_id as ID,max(salary) as max_salary
from employees
group by department_id)dept_salary
on dept_salary.ID = e.department_id and
dept_salary.max_salary = e.salary
)emp
on emp.manager_id = mgr.employee_id

select * from employees
select * from departments
select * from jobs
select * from job_history
select * from locations
select * from regions
select * from countries




select e.employee_id, CONCAT_WS(' ',e.first_name,e.last_name) as "Full Name",
e.salary,d.department_name,j.job_title,jh.start_date,jh.end_date,
l.state_province,l.street_address,l.postal_code,c.country_name,r.region_name
from employees e full outer join departments d
on e.department_id = d.department_id
full outer join jobs j on j.job_id = e.job_id
full outer join job_history jh on jh.employee_id = e.employee_id
full outer join locations l on l.location_id =d.location_id
full outer join countries c on c.country_id = l.country_id
full outer join regions r on r.region_id = c.region_id



select emp_dt.state_province,
count(emp_dt.state_province) as "Employee Count"
from (select e.employee_id, CONCAT_WS(' ',e.first_name,e.last_name) as "Full Name",
e.salary,d.department_name,j.job_title,jh.start_date,jh.end_date,
l.state_province,l.street_address,l.postal_code,c.country_name,r.region_name
from employees e full outer join departments d
on e.department_id = d.department_id
full outer join jobs j on j.job_id = e.job_id
full outer join job_history jh on jh.employee_id = e.employee_id
full outer join locations l on l.location_id =d.location_id
full outer join countries c on c.country_id = l.country_id
full outer join regions r on r.region_id = c.region_id)emp_dt
group by emp_dt.state_province





select e.first_name,e.department_id,e.salary,de.Salary50
from employees e inner join (select department_id,sum(salary)*0.5 as "Salary50"
from employees
group by department_id)de
on e.department_id = de.department_id and e.salary<de.Salary50


select department_id,sum(salary)*0.5
from employees
group by department_id