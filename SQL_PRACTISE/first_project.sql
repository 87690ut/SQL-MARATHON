create database emp_data;
USE emp_data;
create table employee
(emp_id int primary key,
Name varchar(50),
Salary int);
INSERT INTO employee(emp_id, Name, Salary)
VALUES
(1,'Adam',25000),
(2,'Bob',30000),
(3,'Casey',40000),
(4,'John',35000),
(5,'Uttam',39000);
alter table employee   -- in this the alter is used because we are going to do change in table matter only in default value add, remove or update related to default value
alter column salary SET default 24000;  -- in this we provides a default value to the salay where the  id is 3. 

update employee
set Salary = default
where emp_id = 3;

alter table employee
modify Salary int not null;
select * from employee
