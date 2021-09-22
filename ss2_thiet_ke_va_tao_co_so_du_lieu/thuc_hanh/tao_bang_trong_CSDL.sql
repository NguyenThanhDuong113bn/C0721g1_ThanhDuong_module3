create database QuanLyDiemThi;
use QuanLyDiemThi;
create table Hoc_sinh(
ma_HS varchar(20) primary key,
ten_HS varchar(50),
ngay_sinh datetime,
lop varchar(20),
GT varchar(20)
);

create table Mon_hoc(
ma_MH varchar (20) primary key,
ten_MH varchar(50)
);

create table Bang_diem(
ma_HS varchar(20),
ma_MH varchar(20),
diem_thi int,
ngay_KT datetime,
primary key (ma_HS, ma_MH),
foreign key(ma_HS) references Hoc_sinh(ma_HS),
foreign key(ma_MH) references Mon_hoc(ma_MH)
);

create table Giao_vien(
ma_GV varchar (20) primary key,
ten_GV varchar(20),
so_DT varchar(10)
);
-- Chỉnh sửa lại bảng môn học bổ sung thêm trường ma_GV là khóa ngoại  của bảng Mon_hoc
alter table Mon_hoc add ma_GV varchar (20);
alter table Mon_hoc add constraint FK_ma_GV foreign key (ma_GV) references Giao_vien (ma_GV);
