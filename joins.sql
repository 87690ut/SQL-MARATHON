-- -------------------------------------------------------------------Inner Join ------------------------------------------------------------------------------------------------
create database jo;
use jo;

create table students(
id int primary key,
name varchar(50) not null,
age int not null);

insert into students
values
(1, 'Uttam', 20),
(2,'Amit',24),
(3,'Ajay',22),
(4,'sarthak',21);
select * from students;

create table cources(
id int not null,
name varchar(50) not null);

insert into cources
values
(1,'english'),
(2,'math'),
(3,'science'),
(4,'history');

select * from cources;
update cources
set id = 9
where id= 3;

select * from students
inner join cources
on students.id = cources.id;  -- now it will show the data of both table in one which ids are same.

-- -------------------------------------------------------------------Left Join -----------------------------------------------------------------------------------------------
select * from students
left join cources
on students.id = cources.id;

-- -------------------------------------------------------------------Right Join ----------------------------------------------------------------------------------------------

select * from students
right join cources
on students.id = cources.id;

-- ------------------------------------------------------------------Full Join--------------------------------------------------------------------------------------------------

select * from students
left join cources
on students.id = cources.id
union                        -- union is also used for printing the unique value rather than duplicates such as we use it in two diffrent table or single or oon more.
select * from students
right join cources
on students.id = cources.id;

-- ----------------------------------------------------------------Left Exclusive Join-----------------------------------------------------------------------------------------

-- ----------------------------------------------------------------Right Exclusive Join----------------------------------------------------------------------------------------


-- --------------------------------------------------------------------Self Join-----------------------------------------------------------------------------------------------

create table sj(
id int ,
name varchar(50) ,
manager_id int );



insert into sj
values
(101, 'adam',103),
(102, 'bob',104),
(103, 'casey',Null),
(104, 'donald',103);

select * from sj;

select  a.name as manager_name, b.name  -- in this we copied the table and print both table side by side after that we print the manager name and their manager name on the basis of condition.

from sj as a
join sj as b
on a.id = b.manager_id;
