use mr;
--======================== PROC or Views ===================

select * from emp_details_view
drop view emp_details_view

create view emp_150
as
(select *
from employees
where employee_id=150 or employee_id=160)

select * from emp_150

update emp_150
set last_name = 'Khan'
where employee_id=150;
select * from locations
create view employee_150_All
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
on r.region_id = c.region_id where em.employee_id=150
)
select * from employee_150_All


Alter proc employee_All_Data @EID int
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
on r.region_id = c.region_id where em.employee_id=@EID
)
declare @id int
set @id = 117
exec employee_All_Data @EID = 150

create proc employee_Groups @Column varchar(20)
as
(select @Column,max(em.salary),min(em.salary),avg(em.salary),sum(em.salary)
from (Select e.employee_id,e.first_name,e.last_name,e.salary,m.first_name as "Manager",e.department_id,e.job_id
from employees e inner join employees m
on e.manager_id = m.employee_id)as em full outer join departments d
on em.department_id = d.department_id full outer join jobs j
on em.job_id = j.job_id full outer join job_history jh
on em.employee_id = jh.employee_id full outer join locations l
on d.location_id = l.location_id full outer join countries c
on l.country_id = c.country_id full outer join regions r
on r.region_id = c.region_id group by @Column
)


alter PROCEDURE employee_Groups @Column VARCHAR(20)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);

    -- Construct the dynamic SQL statement
    SET @SQL = '
    SELECT ' + QUOTENAME(@Column) + ',
           MAX(em.salary) AS MaxSalary,
           MIN(em.salary) AS MinSalary,
           AVG(em.salary) AS AvgSalary,
           SUM(em.salary) AS TotalSalary,
           count(em.salary) AS TotalSalary
    FROM (
        SELECT e.employee_id,
               e.first_name,
               e.last_name,
               e.salary,
               m.first_name AS Manager,
               e.' + QUOTENAME(@Column) + '
        FROM employees e
        INNER JOIN employees m ON e.manager_id = m.employee_id
        FULL OUTER JOIN departments d ON e.department_id = d.department_id
        FULL OUTER JOIN jobs j ON e.job_id = j.job_id
        FULL OUTER JOIN job_history jh ON e.employee_id = jh.employee_id
        FULL OUTER JOIN locations l ON d.location_id = l.location_id
        FULL OUTER JOIN countries c ON l.country_id = c.country_id
        FULL OUTER JOIN regions r ON r.region_id = c.region_id
    ) AS em
    GROUP BY ' + QUOTENAME(@Column);

    -- Execute the dynamic SQL statement
    EXEC sp_executesql @SQL;
END;

exec employee_Groups @Column='department_id'
exec employee_Groups @Column='manager_id'
exec employee_Groups @Column='job_id'
exec employee_Groups @Column='region_id'
select * from locations