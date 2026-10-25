create database mastery_sql;
use mastery_sql;

create table employe(
employe_id Int primary key,
employe_name varchar(20),
department varchar(20),
salary decimal(10,2));

describe employe;

insert into employe
values
(101,'Abhishek','mech',45000),
(102,'Viraj','DA',35000),
(103,'Aayush','Design',50000),
(104,'Toufiq','DADS',12000);

select * from employe;

select employe_name,salary
from employe
where salary>30000;

insert into employe values(105,'Sakshi','IT',85000);
insert into employe values(106,'Juhii','DADS',39000);

------------------------------------------------------------------
-- Most Imp Query clauses
-- WHERE Clause
-----------------
select * from employe
where department='it';

select * from employe
where department = 'DADS';

select employe_name , department , salary
from employe
where department='DADS';

--------------------------------------------------------------------
-- ORDER BY
------------
select employe_name , salary
from employe
order by salary asc;

alter table employe
add age int;

update employe
set age=22
where employe_id=101;

update employe
set age=26
where employe_id=106;

select employe_name , department , age
from employe
order by age desc
limit 3;
-------------------------------
select employe_name, department
from employe;
-------------------------------
select employe_name,department
from employe
where department='it';
-------------------------------
select employe_name,salary
from employe
where salary < 40000;
-------------------------------
select employe_name,salary
from employe
order by salary asc;

select * from employe order by salary asc;
-------------------------------
select * from employe order by salary desc limit 1;
--------------------------------------------------------
