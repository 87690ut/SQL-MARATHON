use company_db;

-- 1. Update salary for specific deprtment
update employees
set salary = 66753
where dept_id = '6';
 
 -- second way
 update employees
 join  departments on
 departments.dept_id = employees.dept_id
  set salary = 66753
 where departments.dept_name = 'Marketing';
 
 delete employees
 from employees
 join departments on 
 departments.dept_id = employees.dept_id
 where departments.dept_name = 'HR';
 
 -- 3. Create a view for high-earning employees.
create  view hig_earn as select  employees.first_name, employees.salary
from  employees
order by employees.salary desc;
select * from hig_earn;

-- 4. Add validation to ensure salary is always positive.
alter table employees
add check (salary >= 0);   

-- 5. Identify departments that have employees.(qu from last assignment)

select distinct departments.dept_name 
from departments
inner join employees
on departments.dept_id = employees.dept_id;


-- 6. Generate department-wise salary totals.
select departments.dept_name as departments, sum(employees.salary) as salary_total
from departments
left join employees
on departments.dept_id = employees.dept_id
group by departments.dept_name;


-- 7. Generate department-wise salary totals  having more than 50000 total salary and also employees have more than 50000 salary. 
select departments.dept_name as departments,  sum(employees.salary) as salary_total
from departments
left join employees
on departments.dept_id = employees.dept_id
where employees.salary > 50000
group by departments.dept_name
having salary_total > 50000;

-- 8.  indexing for the data search.Improve search performance using indexing
create index idx_dept_id_m on departments(dept_id);
create index idx_dept_id_n on employees(dept_id);