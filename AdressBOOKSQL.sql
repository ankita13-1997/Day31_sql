create database addressbook;
use addressbook;

create table book(id Integer primary key auto_increment not null,
				  first_name varchar(20) not null,
                  last_name  varchar(30) not null,
                  state      varchar(90) not null,
                  city       varchar(30) not null,
                  zip_code   varchar(50) not null,
                  phone_no   varchar(20) not null,
                  email      varchar(40) not null
       
                 );
                 
select * from book;

insert into book(first_name,last_name,state,city,zip_code,phone_no,email)value('Ankita','Parhi','Odisha','dhenkanal','759121','90909090','pa@gmail.com');
insert into book(first_name,last_name,state,city,zip_code,phone_no,email)value('Sheevendra','Singh','MP','satna','485005','909096790','shiv@gmail.com');
insert into book(first_name,last_name,state,city,zip_code,phone_no,email)value('katta','shravani','AP','Hybd','423005','569096790','katta@gmail.com');
insert into book(first_name,last_name,state,city,zip_code,phone_no,email)value('pranil','kakade','MHA','Mumbai','4223005','2369096790','pranil@gmail.com');
insert into book(first_name,last_name,state,city,zip_code,phone_no,email)value('shamal','patil','MHA','pune','467005','569456790','shamal@gmail.com');

UPDATE book set zip_code='898989' where first_name='katta';
UPDATE book set zip_code='898989',city='Nagpur' where first_name='pranil';

DELETE from book where first_name='shamal';
delete from book where state='MHA';

SELECT first_name , last_name from book where state='MHA';
SELECT first_name , last_name from book where city='hybd';
SELECT * from book where city='satna';	

SELECT count(city) from book;
SELECT count(city) as city , count(state) as state from book;
SELECT count(first_name) , count(last_name) from book

SELECT * from book ORDER BY first_name DESC;
SELECT * from book ORDER BY zip_code;

Alter Table book add type_name varchar(13) after last_name;
UPDATE book set type_name='family';
Update book set type_name='freinds' where first_name='Ankita';
Update book set type_name='profession' where first_name='pranil';


SELECT count(type_name) as count_type from book where type_name='family';
SELECT count(type_name) as count_type from book where type_name='freinds';
SELECT count(type_name) as count_type from book where type_name='profession';

UPDATE book set type_name='fam,freinds' where first_name='katta';  
select *from book where type_name='fam,freinds';