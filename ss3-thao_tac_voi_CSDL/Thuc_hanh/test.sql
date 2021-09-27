create database test;
use test;
create table kieu_thue(
id_kieu_thue int auto_increment primary key,
ten_kieu_thue varchar (45),
gia int
);

create table loai_dich_vu(
id_loai_dich_vu int auto_increment primary key,
ten_loai_dich_vu varchar(45)
);
create table dich_vu(
id_dich_vu int auto_increment primary key,
ten_dich_vu varchar(45),
dien_tich int,
so_tang int,
so_nguoi_toi_da varchar(45),
chi_phi_thue varchar(45),
id_loai_dich_vu int,
foreign key(id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu),
trang_thai varchar (45)
);
drop table dich_vu;
drop database test;