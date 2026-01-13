use company_db;
-- 1.Show employees along with their managers
SELECT 
    e.first_name AS 'Employee Name',
    m.first_name AS 'Manager Name'
FROM
    employees e
        LEFT JOIN
    employees m ON e.manager_id = m.emp_id;

-- 2. Find employees earning more than average salary
SELECT 
    employees.first_name, employees.last_name, employees.salary
FROM
    employees
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employees);-- subquery 

SELECT 
    employees.first_name,
    last_name,
    departments.dept_name,
    companies.company_name
FROM
    employees
        JOIN
    departments ON employees.dept_id = departments.dept_id
        JOIN
    companies ON departments.company_id = companies.company_id;

-- 4 Identify the second-highest salary
SELECT DISTINCT
    employees.salary
FROM
    employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- 2nd way
SELECT 
    MAX(employees.salary)
FROM
    employees
WHERE
    salary < (SELECT 
            MAX(salary)
        FROM
            employees);

-- 5.Rank employees by salary within departments(rank the employes (1,2,3)on the basis of salary in each department).
select employees.first_name , last_name , employees.salary , departments.dept_name,
dense_rank() over (partition by departments.dept_id order by employees.salary desc ) as rank_
from employees
join departments 
on employees.dept_id = departments.dept_id;

-- 6. Categorize employees as Low / Medium / High earners
SELECT 
    employees.first_name,
    last_name,
    employees.salary,
    CASE
        WHEN employees.salary > 50000 THEN 'High'
        WHEN employees.salary BETWEEN 30000 AND 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM
    employees;
    
    
    -- view
   create view emvidata as SELECT 
    employees.first_name,
    last_name,
    
    CASE
        WHEN employees.salary > 50000 THEN 'High'
        WHEN employees.salary BETWEEN 30000 AND 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM
    employees;
    
    select * from emvidata;