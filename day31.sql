show databases;
use anki;
show tables;
use employee_payroll;


select * from employee_roll;
drop table employee_system;
update employee_roll set gender='female' where name='parhi';
create table employee_system(id Integer primary key auto_increment,
                             name varchar(20),
                             salary double,
                             date_join date
                              );

insert into employee_system(name,salary,date_join)value('Ankita',14000,'2015-01-13');
insert into employee_system(name,salary,date_join)value('Sheevendra',140000,'2014-02-10');
insert into employee_system(name,salary,date_join)value('pranil',160000,'2013-01-10');
insert into employee_system(name,salary,date_join)value('john',130000,'2010-01-10');
insert into employee_system(name,salary,date_join)value('katta',130000,'2009-01-10');

select * from employee_system;


select name from employee_system where date_join between '2012-01-01' and '2014-12-31';


select name from employee_system 
                          where date_join
                          between cast('2000-01-01' as date) and date(now());
                          
ALTER TABLE employee_system add gender varchar(10) after name;
ALTER TABLE employee_system add adress varchar(30) after salary;
ALTER TABLE employee_system add phone_no varchar(30) after adress;
ALTER TABLE employee_system add department varchar(30) after phone_no;

UPDATE employee_system set adress='BSL COLONY ,odisha',phone_no='89898989898' where name='Ankita';
UPDATE employee_system set adress='satna ,MP',phone_no='8989898909' where name='Sheevendra';
UPDATE employee_system set adress='mumbai ,MHA',phone_no='8900989898' where name='pranil';
UPDATE employee_system set adress='texas,USA',phone_no='89898989898' where name='john';
UPDATE employee_system set adress='hydrabad ,AP',phone_no='89898989898' where name='katta';


UPDATE  employee_system set gender='male';
UPDATE  employee_system set gender='female' where name='katta';
select sum(salary) from employee_system where gender='male' group by gender; 
select sum(salary) as sum_salary from employee_system where gender='female' group by gender; 

select avg(salary) as avg_salary from employee_system where gender='male' group by gender;
select avg(salary) as avg_salary from employee_system where gender='female' group by gender;

select min(salary) as minmum from employee_system where gender='male' group by gender;
select max(salary) as maximum from employee_system where gender='male' group by gender;

select min(salary) as minmum from employee_system where gender='female' group by gender;
select max(salary) as maximum from employee_system where gender='female' group by gender;

select count(salary) as count_salary from employee_system where gender='male' group by gender;
select count(salary) as count_salary from employee_system where gender='female' group by gender;

show databases;
use employee_payroll;
show tables;
select * from employee_system; 
alter table employee_system drop adress;
alter table employee_system drop phone_no;
alter table employee_system drop department;

create table department(
                         dept_id  INTEGER   PRIMARY KEY ,
                         dept_name    varchar(30)  not null,
                         id INTEGER,
						 FOREIGN KEY(id)  
                         REFERENCES employee_system(id)
                         );
select * from department;    
insert into department values(1,'HR',1);
insert into department values(2,'DEVOPS',2);
insert into department values(4,'HR',5);
insert into department values(3,'HR',4);
insert into department values(5,'HR',3);

select * from department;
select * from employee_system;  

SELECT employee_system.id, employee_system.name, employee_system.salary,employee_system.date_join ,department.dept_name
from department
INNER JOIN employee_system  ON department.id=employee_system.id
order by department.dept_name;

create table earning(
                         id         INTEGER primary key,
						 BASIC_PAY  DOUBLE,
                         DEDUCTION  DOUBLE,
                         TAX_PAY    DOUBLE,
                         TAX        DOUBLE,
                         E_id       INTEGER,
                         FOREIGN KEY(E_id)
						 REFERENCES  employee_system(id)				
						);               
                        
                        SELECT * from earning;
insert into earning (id,BASIC_PAY,DEDUCTION,TAX_PAY,TAX,E_id)values (6,17000,200,6800,2.5,6);
insert into earning (id,BASIC_PAY,DEDUCTION,TAX_PAY,TAX,E_id)values(2,130000,800,8200,2.5,4),
																    (3,160000,100,7200,8.5,3),
                                                                    (4,140000,900,200,2.5,2),
                                                                    (5,14000,200,6800,2.5,1),
                                                                    (6,17000,200,6800,2.5,7);

insert into employee_system(name,gender,salary,adress,phone_no,date_join)
value('terisa','female',170000,'chicago,USA','987654456','2009-01-10');

select * from department;
select * from employee_system;  



insert into department 
values(6,'market',6),
(7,'sales',6);
select * from employee_system;  

SELECT employee_system.id, employee_system.name, employee_system.salary,employee_system.date_join ,department.dept_name
from employee_system 
INNER JOIN department ON department.id=employee_system.id
WHERE employee_system.id=6;

SELECT employee_system.id, employee_system.name, employee_system.salary,employee_system.date_join ,department.dept_name
from employee_system 
INNER JOIN department ON department.id=employee_system.id
WHERE name='terisa';