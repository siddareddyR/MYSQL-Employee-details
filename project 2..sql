create database employee_details;
use employee_details;
create table employee(employee_id int,
first_name varchar(200),last_name varchar(100),
salary varchar(80),joinning_date varchar(90),
department varchar(50),primary key(employee_id));
show tables;
select * from employee;

insert into employee
(employee_id,first_name,last_name,salary,joinning_date,department)values
(1,'venkatesh','s',1000000,'08/28/2015','banking'),
(2,'ragavi','p',75000,'08/28/2015','business'),
(3,'gopinath','c',50000,'03/02/2016','pharma'),
(4,'dinesh','g',50000,'03/02/2016','insurance'),
(5,'saibabu','e',40000,'07/08/2017','software'),
(6,'hasan','s',29000,'07/08/2017','manufacturing'),
(7,'divya','p',33000,'07/08/2017','healthcare'),
(8,'aravindan','r',40000,'07/08/2017','healthcare'),
(9,'sathish','md',45000,'03/02/2016','automobile'),
(10,'prasanth','pkp',34000,'03/02/2016','insurance'),
(11,'vijay','r',25684,'03/02/2016','business'),
(12,'sivakumar','k',54789,'03/02/2016','software');
drop database employee_details;


create table incentives(employee_ref_id int,
incentive_data varchar(90),
incentive_amount int,
foreign key(employee_ref_id) references employee (employee_id));

show tables;

select * from incentives;

insert into incentives
(employee_ref_id,incentive_data,incentive_amount)values
(1,'01-feb-16',5000),
(2,'01-feb-16',3000),
(3,'01-feb-17',4000),
(1,'01-jan-17',4500),
(2,'01-jan-17',3500);

drop table incentives;



-- 1 get all employee details from the employee table
select * from employee;

-- 2 get first_name and last_name from employee table
select first_name,last_name from employee;

-- 3 get first_name from employee table using alias name "employee name"
select first_name as employee_name from employee ;

-- 4  get first_name from employee table in uppper case
select upper(first_name) from employee ;

-- 5 get first_name from employee table lower case
select lower(first_name) from employee ;

-- 6  get unique department from employee table
select  distinct department from employee ;

-- 7 select first 3 characters of first_name from employee
select substring(first_name,1,3) as first_name from employee;

-- 8 get position 'a' in name 'ragavi' from employee table
select position('a'in first_name) position_of_a_ragavi from employee where employee_id=2;

-- 9 get first_name from employee table after removing white spaces from right side
select rtrim(first_name) first_name from employee;

-- 10 get first_name from employee table after removing white spaces from left side
select ltrim(first_name) first_name from employee;

-- 11 get length of  first_name from employee table
select length (first_name) from employee ;

-- 12 get first_name from employee table after replacing 'a' with '$'
select replace(first_name,'a','$') as modified_first_name from employee;

-- 13 get first_name and last_name as single column from employee table separated by a '_'
select concat(first_name,'_',last_name) from employee;

-- 14 get first_name,joining year,joining month and joining date from employee table
select first_name,substring(joinning_date,7,4),substring(joinning_date,4,2),substring(joinning_date,1,2) from employee;

-- 15 get all employee details from the employee table order by first_name ascending
select * from employee order by first_name asc; 

-- 16 get all the employee details from the employee table order by first_name descending
select * from employee order by first_name desc;

-- 17 get all employee details from the employee table order by first_name ascending and salary descending
select * from employee order by first_name asc,salary desc;

-- 18 get employee details from employee table whose employee name is "dinesh"
select * from employee where first_name='dinesh';

-- 19 get employee details from employee table whose employee name is "dinesh" and "roy"
select * from employee where first_name='dinesh' or first_name='roy';

-- 20 get employee details from employee table whose employee name or not "dinesh" and "roy"
select * from employee where first_name<>'dinesh' and first_name<>'roy';

-- 21 get employee details from employee table whose first_name starts with 's'
select * from employee where first_name like 's%';

-- 22 get employee details from employee table whose first_name contains 'v'
select * from employee where first_name like '%v%';

-- 23 get employee details from employee table whose first_name ends with 'n'
select * from employee where first_name like '%n' ;

  -- 24  get employee details from employee table whose first name ends with 'n' and name contains 4 letters
  select * from employee where first_name like '___n';
  
  -- 25  get employee details from employee table whose first name ends with 'j' and name contains 4 letters
  select * from employee where first_name like '___j';
  
  -- 26 get employee details from employee table who's salary greater than 60000
  select * from employee where salary>60000;

-- 27 get employee details from employee table who's salary lessthan than 80000
select * from employee where salary<80000;

-- 28 get employee details from employee table who's salary between 50000 and 80000
select * from employee where salary<80000 and salary>50000;

-- 29  get employee details from employee table whose name is venkatesh and ragavi
select * from employee where first_name='venkatesh' or first_name='ragavi';

-- 30 get names of employees from employee table who has '%' in last_name.alter
select * from employee where last_name like '%%!%' escape '!';

select * from Employee where FIRST_NAME like '%!%%' escape '!';

-- 40. Get Last Name from Employee tables after replacing Special Character with White Space

select replace(LAST_NAME ,' ','$') from Employee where LAST_NAME like ' ';

-- SQL Queries Question and ANswer on 'SQL Group By Function' Examples

-- 41. Get department, total salary with respect to a department from employee table.

select DEPARTMENT, sum(SALARY)  from Employee group by DEPARTMENT;

-- 42. Get department, total salary with respect to a department from employce table order by total salary descending

select DEPARTMENT, sum(SALARY)  from Employee group by DEPARTMENT order by sum(SALARY) desc;

-- SOL Queries Interview Questions and Answers on "SOL Mathematical Operations using Group By" - Examples

-- 43. Get department,no of employees in a department, total salary with respect to a department from employee table order salary descending

select DEPARTMENT, count(*) , sum(SALARY) from Employee group by DEPARTMENT order by sum(SALARY) desc;

-- 44. Get department wise average salary from employee table order by salary ascending

select DEPARTMENT, avg(SALARY) from Employee group by DEPARTMENT order by avg(SALARY) asc;

-- 45. Get department wise maximum salary from employee table order by salary ascending

select DEPARTMENT, max(SALARY) from Employee group by DEPARTMENT order by max(SALARY) asc;

-- 46. Get department wise minimum salary from employee table order by salary ascending

select DEPARTMENT, min(SALARY) from Employee group by DEPARTMENT order by min(SALARY) asc;

-- 47. Select no of employees joined with respect to year and month from employee table

select year(str_to_date(JOINING_DATE, '%m/%d/%Y')) JOIN_YEAR,
month(str_to_date(JOINING_DATE, '%m/%d/%Y')) JOIN_MONTH, 
count(*) from employee group by JOIN_YEAR , JOIN_MONTH order by JOIN_YEAR, JOIN_MONTH;

-- 48. Select department, total salary with respect to a department from employee table where total salary greater than 800000 Total_Salary descending

select DEPARTMENT, sum(SALARY) from Employee group by DEPARTMENT having sum(SALARY) > 800000 order by sum(SALARY) desc;

-- SOL Queries Interview Questions and Answers on "SQL Joins" - Examples
-- 49. Select first_name, incentive amount from employee and incentives table for those employees who have incentives

select E.FIRST_NAME, I.INCENTIVE_AMOUNT
from EMPLOYEE E
inner join INCENTIVES I on E.EMPLOYEE_ID = I.EMP_REF_ID;

-- 50. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentiv greater than 3000

select E.FIRST_NAME, I.INCENTIVE_AMOUNT
from EMPLOYEE E
inner join INCENTIVES I on E.EMPLOYEE_ID = I.EMP_REF_ID 
WHERE I.INCENTIVE_AMOUNT > 3000;

