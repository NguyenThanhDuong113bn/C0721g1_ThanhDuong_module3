create database student_management;
use student_management;
create table class (
id_class int,
name_class varchar(255)
);
insert into class
values (1,'C0321G1');
select * from class;
select id_class from class;
insert into class
values 
(2,'C0421G1'),
(3,'C0521G1'),
(2,'C0621G1');
update class
set name_class = 'C0321G2'
where id_class = 1;
delete from class
where id_class = 1;
use bai01_baiTap;
create table teacher (
id_teacher int,
name_teacher varchar(255),
age int,
country varchar(255)
);