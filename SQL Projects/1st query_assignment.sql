use company_db;
  -- 1. Display all employees
  select employees.first_name 
  from
   employees;
   
   -- 2. find the employees working in the specific department
   
  select e.first_name , e.last_name , e.email
  from employees as e
  join departments as d
  on e.dept_id = d.dept_id
  where d.dept_name = 'sales';
  
  -- 3.List unique job titles.
  select distinct job_title from employees;
  
  -- 4. Sort employee by salary.
  select * from employees
  order by salary asc;
  
  -- 5. Count total employees
  select count(employees.first_name) from employees;
  
  -- 6. Calculate average salary per department.
  select departments.dept_name , round(avg(employees.salary),2)
  from departments
  join employees
  on departments.dept_id = employees.dept_id
  group by departments.dept_id;
  
  -- 7 - Show employees name along with their department name.
  select employees.first_name , departments.dept_name
  from employees
  join departments
  on employees.dept_id = departments.dept_id;
  