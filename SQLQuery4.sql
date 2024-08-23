--==================== Asssigment  ======================
use mr;

--1) Select locations with postal codes less than or equal to '50000'.
 select *
from locations
where postal_code <= '50000';
--2) Get all jobs with a minimum salary greater than 50000.
 select *
from jobs
where min_salary >= '50000';
--3) Retrieve departments where the manager ID is not null.
 select *
from departments
where manager_id is not null ;
--4) Find employees with a commission percentage equal to 0.10.
 select *
from employees
where commission_pct = 0.10;
--5) Select employees hired after '2022-01-01'.
 select *
from employees
where (hire_date >'2022-01-01');

--6) Retrieve employees with salaries between 40000 and 60000.
select *
from employees
where salary between '40000' and '60000';

--7) Retrieve regions with names containing 'America'.
select *
from regions
where region_name like 'Americas';

--8) Find countries with region IDs between 3 and 6.
select *
from countries
where region_id between 3 and 6;

--9) Select locations in cities starting with 'New'.
select *
from locations
where city like 'NEW%';

--10) Get jobs with titles not containing 'Manager'.
select *
from jobs
where job_title  not like '%Manager%';


--11) Retrieve departments where the manager ID is either 101 or 102.
select *
from departments
where manager_id  between 101 and 102;

--12) Find employees in departments with IDs not between 100 and 190.
select *
from departments
where manager_id not between 101 and 102;

--13) Select employees hired between '2022-01-01' and '2022-06-30'.

select *
from employees
where hire_date  between '2022-01-01' and '2022-06-30';

--14) Retrieve job history records for employees with IDs in (101, 109, 113).

select *
from job_history
where employee_id in(101,109,113);

--15) Find employees with first names starting with 'J' and last names starting with 'D'.
select *
from employees
where  first_name  like 'J%'  and last_name like '%D' ;

--16) Get employees with salaries greater than 5000 and commission percentage less than 0.15.
select *
from employees
where salary> 5000 and commission_pct< '0.15' ;

--17) Retrieve countries with names ending with 'nd'.
select *
from countries
where country_name like '%nd' ;

--18) Find locations with street addresses containing 'Street'.
select *
from locations
where street_address like '%Street%' ;

--19) Select jobs with titles starting with 'Senior'.
select *
from jobs
where job_title like 'Senior%' ;

--20) Retrieve departments with names containing 'HR'.
select *
from departments
where department_name like '%HR%' ;

--21) Find countries with region IDs in (1, 2, 3).

select *
from countries
where region_id in (1,2,3) ;

--22) Retrieve locations in countries with IDs in ('US', 'UK', 'CA').
select *
from countries  
where country_id in ('US','UK','CA');
--23) Select jobs with IDs in ('IT_PROG', 'SA_REP', 'HR_REP').
select * 
from jobs
where job_id in('IT_PROG', 'SA_REP', 'HR_REP');

--24) Get departments with IDs in (100, 200, 300).
select * from 
departments
where department_id in (100, 200, 300);

--25) Retrieve employees in departments with names in ('IT', 'Finance').
select * from departments
 where department_name in ('IT', 'Finance');

--26) Find regions with IDs between 3 and 6.
select *
from regions
where region_id between 3 and 6;

--27) Retrieve countries with region IDs between 1 and 3.
select * 
from countries
 where region_id between 1 and 3;
--28) Select locations with postal codes between '1000' and '2000'.
select * 
 from locations
 where postal_code between '1000' and '2000';

--29) Get jobs with salaries between 4000 and 6000.
select * 
 from jobs
 where min_salary between 4000 and 6000;

--30) Retrieve departments with IDs between 100 and 200.
select * 
 from departments
 where department_id between 100 and 200;

--31) Retrieve employee details along with their department names.
select * 
 from employees e inner join(select department_name,department_id
  from departments) as detl on e.department_id=detl.department_id;

--32) Find countries along with their region names.
select country_name,region_name
 from countries c inner join(select region_name,region_id from regions) as re on c.region_id=re.region_id;

--33) Select locations with their corresponding country names.
select * from locations l left join (select country_name,country_id from countries) as c on l.country_id=c.country_id;
--34) Get job details along with their department names.
select jh.*,d.department_name from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id

--35) Retrieve employee details along with their job titles.
select e.*,j.job_title  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id

--36) Find employees along with their managers' details.
 select e.first_name,m.* from employees e left join employees m on e.employee_id=m.manager_id

--37) Retrieve employees along with their department and location details
select e.first_name+e.last_name as employee,d.department_name,l.* from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--38) Get employees along with their country and region details.
select e.first_name+e.last_name as employee,c.country_name,r.*  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--39) Retrieve employees along with their job titles and department names.
select e.first_name+e.last_name as employee,j.job_title,d.department_name  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--40) Find employees along with their location details and country names.
select e.first_name+e.last_name as employee,l.*,c.country_name  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--41) Retrieve job history records along with employee details.
select e.*,jh.*  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--42) Find employees with their corresponding job history.
select e.first_name+e.last_name as employee,jh.*  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--43) Select employees along with their job history and department names.
select e.first_name+e.last_name as employee,jh.*,d.department_name  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--44) Get employees with their job history, department, and location details.
select e.first_name+e.last_name as employee,jh.*,d.*,l.*  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--45) Retrieve employees along with their job history and country names.
select e.first_name+e.last_name as employee,jh.* ,c.country_name from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id

--46) Find job history records with employee and department details.
select e.first_name+e.last_name as employee,jh.*,d.*  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--47) Retrieve job history records along with employee and job details.
select e.first_name+e.last_name as employee,jh.*,j.*  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--48) Get job history records with employee, job, and department details.
select e.*,jh.*,j.*,d.*  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--49) Retrieve job history records along with employee, job, and location details.
select e.*,jh.*,j.*,l.*  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--50) Find job history records with employee, job, and country details.
select e.*,jh.*,c.*  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id

--51) Retrieve regions along with their countries and locations.
select r.*,c.*,l.*  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id

--52) Find countries along with their regions and locations.
select c.*,r.*,l.*  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id

--53) Retrieve locations along with their countries and regions.
select l.*,c.*,r.*  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id

--54) Find departments along with their employees and locations.
select e.first_name+e.last_name as employee,d.department_name,l.* from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--55) Retrieve employees along with their departments, locations, and countries.
select e.first_name+e.last_name as employee,d.department_name,l.*,c.country_name  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--56) Find employees along with their managers, departments, and locations.
select e.first_name+e.last_name as employee,d.department_name,l.*,e.first_name+e.last_name as manager from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--57) Retrieve employees along with their job titles, departments, and locations.
select e.first_name+e.last_name as employee,d.department_name,l.*,j.job_title from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--58) Find employees along with their job titles, departments, and managers.
select e.first_name+e.last_name as employee,d.department_name,j.job_title,e.first_name+e.last_name as manager  from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--59) Retrieve employees along with their job titles, departments, managers, and locations.
select e.first_name+e.last_name as employee,d.department_name,j.job_title,e.first_name+e.last_name as manager ,l.* from employees 
e full outer join departments d on e.department_id=d.department_id
full outer join jobs j on e.job_id= j.job_id
full outer join job_history jh on jh.employee_id= e.employee_id
full outer join locations l on l.location_id=d.location_id
full outer join countries c on c.country_id=l.country_id
full outer join regions r on r.region_id= c.region_id
--60) Retrieve the names of countries in Region 1.
select * from countries where region_id= 1

--61) Find the departments located in cities starting with 'N'.
select * from departments
inner join locations on department_name like 'N%'

--62) Select employees who work in departments managed by employees with a commission percentage greater than 0.15.
select * from employees
inner join departments on commission_pct >0.15

--63) Get the job titles of employees who are managers.
select job_title, ma.Employee,ma.Manager from jobs j inner join
(select e.first_name as "Employee",m.first_name as "Manager",e.job_id
from employees as e join employees as m
on e.manager_id = m.employee_id)ma on j.job_id= ma.job_id

--64) Retrieve the postal codes of locations where the country's region name is 'Asia'.

select l.postal_code, r.region_name from regions
r inner join (select * from locations) l on r.region_name like 'Asia'

--65) Select the names of departments that have employees with commission percentages less than the average commission percentage across all departments.
--66) Retrieve the job titles of employees whose salary is higher than the average salary of employees in the same department.
--67) Find the IDs of employees who have not been assigned to any department.
--68) Get the names of employees who have held more than one job position (multiple entries in the job history table).
--69) Retrieve the count of employees in each department.
--70) Find the total salary for each job title.
--71) Get the average commission percentage for each department.
--72) Retrieve the maximum salary in each country.
--Write a query in
--SQL to display those employees who contain a letter z to their first name and
--also display their last name, department, city, and state province.


--73) Write a query in SQL to
--display the job title, department name, full name (first and last name) of the employee,
--and starting date for all the jobs that started on or after 1st January 1993
--and ending with on or before 31 August 1997.


--74) Write a query in SQL to
--display the country name, city, and number of those departments where at least
--2 employees are working.


-- 75) Write a query in SQL to
--display full name (first and last name), job title, and starting and ending
--date of last jobs for those employees with worked without a commission
--percentage.


--76) Write a query in SQL to
--display the full name (first and last name) of the employee with ID and name of
--the country presently where (s)he is working.


--77) Write a query to display
--the name (first name and last name), salary, and department ID for those
--employees who earn such an amount of salary which is the smallest salary of any
--of the departments.


--78) Write a query to display
--all the information for those employees whose id is any id who earn the third
--highest salary.


--79) Write a query to display
--the employee number, name (first name and last name), and salary for all
--employees who earn more than the average salary and who work in a department
--with any employee with a J in their name.


--80)  Display the employee name
--(first name and last name), employee ID, and job title for all employees whose
--department location is Toronto.


--81) Write a query to display
--the department ID and the total salary for those departments that contain at
--least one employee.


--82) Write a query to display
--the employee id, name (first name and last name), salary, and the Salary Status
--column with the title HIGH and LOW respectively for those employees whose
--salary is more than and less than the average salary of all employees.


--83) Write a query that will
--identify all employees who work in departments located in the United Kingdom.


--84) Write a query that is
--looking for the names of all employees whose salary is greater than 50% of
--their department’s total salary.


--85) Write a query to get the
--details of employees who are managers.


--86) Write a query to display
--the employee ID, name (first name and last name), salary, department name, and
--city for all the employees who get the salary as the salary earned by the
--employee which is maximum within the joining person January 1st, 2002 and
--December 31st, 2003.


--87) Write a query in SQL to display
--the first and last name, salary, and department ID for those employees who earn
--less than the average salary and also work at the department where the employee
--Laura is working as a first name holder.


--88) Write a query in SQL to
--display the details of those departments whose max salary is 7000 or above for
--those employees who have already done one or more jobs.89) Find the minimum postal code length for each region.
--90) Retrieve employee details ordered by their hire date in descending order.
--91) Find employees ordered by their salary in ascending order.
--92) Get countries ordered by the number of locations they have in descending order.
--93) Retrieve departments with more than five employees.
 select * from employees e inner join (select * from departments where de) d on e.department_id=d.department_id
--94) Find job titles with an average salary greater than 15000.
 select job_title from jobs
 group by job_title
 having avg(max_salary) > 15000
--95) Get countries with more than three locations.
select * from countries c inner join (select * from locations) l on l.country_id=c.country_id
--96) Retrieve the length of each employee's first name.
select len(first_name) as employee from employees
--97) Find the uppercase version of each country name.
select Upper( country_name)as country_name from countries

--98) Find the first three characters of each job title.
select SUBSTRING(job_title,1,3) as jobtitle from jobs

--99) Get the last four characters of each postal code.
select SUBSTRING(postal_code,1,4) as postal_code from locations


