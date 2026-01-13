create database fk;
use fk;

create table dept(
id int primary key, -- this is pointed by the second(child) tables dept_id column.
name varchar(50));

insert into dept(id, name)
values
(101, 'english'),
(102, 'IT');

update dept
set id = 103
where id = 102;

select * from dept;

create table teacher(
id int primary key,
name varchar(50),
dept_id int,  -- this tables this part is pointed first(parent) table id column.
foreign key (dept_id) references dept(id)
on update cascade
on delete cascade);

alter table teacher
add column age int not null;    -- adding new column in teacher table

update  teacher
set age = case when id = 101 then 50 when id = 102 then 30 end where id in(101,102);  -- update multiple value in multiple table at a time.

 
insert into teacher(id,name,dept_id)
values
(101,'adam',101),
(102, 'eve', 102);

select * from teacher;  -- now in this dept_id is changed because point the id from dept by on update cascade.

show tables;

