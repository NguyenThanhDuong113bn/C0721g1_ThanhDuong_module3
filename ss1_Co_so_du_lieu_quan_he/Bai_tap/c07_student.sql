drop database if exists c07_student;
create database c07_student;

-- câu lệnh use dùng để chọn database mong muốn làm việc
use c07_student;
-- tạo table 
create table mon_hoc(

ma_mh int ,
ten_mh varchar(255) 

);
-- thêm dữ liệu vào table
insert into mon_hoc(ma_mh, ten_mh)
value(1,'Toan');
-- Hiển thị dữ liêu của table môn học
select * from mon_hoc;
select ten_mh, ma_mh, hoc_phi from mon_hoc;

--  thêm nhiều dữ liệu cùng lúc


-- Update dữ liệu
update mon_hoc
set ten_mh =' Địa'
where ma_mh =3;

-- thêm column học phí
alter table mon_hoc
add column hoc_phi int ;
insert into mon_hoc(ma_mh, ten_mh, hoc_phi)
value
(2,' Anh',50000),
(3,' Văn ',10),
(4, 'Sử',20);

select * from mon_hoc;