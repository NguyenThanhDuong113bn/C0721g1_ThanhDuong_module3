drop database if exists casestudy_database;
create database casestudy_database;
use casestudy_database;
create table vi_tri(
id_vi_tri int auto_increment primary key,
ten_vi_tri varchar(45)
);
create table trinh_do(
id_trinh_do int auto_increment primary key,
trinh_do varchar(45)
);
create table bo_phan(
id_bo_phan int auto_increment primary key,
ten_bo_phan varchar (45)
);
create table nhan_vien(
id_nhan_vien int auto_increment primary key,
ho_ten_nhan_vien varchar(50),
id_vi_tri int,
foreign key (id_vi_tri) references vi_tri( id_vi_tri) on update cascade on delete cascade,
id_trinh_do int,
foreign key (id_trinh_do) references trinh_do( id_trinh_do)on update cascade on delete cascade,
id_bo_phan int,
foreign key (id_bo_phan) references bo_phan (id_bo_phan)on update cascade on delete cascade,
ngay_sinh date,
so_CMTND varchar(45),
luong varchar(45),
so_DT varchar(45),
email varchar (45),
dia_chi varchar (45)
);
create table loai_khach(
id_loai_khach int auto_increment primary key,
ten_loai_khach varchar (45)
);
create table khach_hang(
id_khach_hang int auto_increment primary key,
id_loai_khach int,
foreign key(id_loai_khach) references loai_khach(id_loai_khach)on update cascade on delete cascade,
ho_va_ten varchar(45),
ngay_sinh date,
so_CMTND varchar (45),
so_DT varchar (45),
email varchar  (45),
dia_chi varchar (45)
);
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
foreign key(id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)on update cascade on delete cascade,
id_kieu_thue int,
foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue) on update cascade on delete cascade,
trang_thai varchar (45)
);
create table dich_vu_di_kem(
id_dich_vu_di_kem int auto_increment primary key,
ten_dich_vu_di_kem varchar(45),
gia int,
don_vi int,
trang_thai_kha_dung varchar (45)
);
create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int auto_increment primary key,
id_hop_dong int,
id_dich_vu_di_kem int,
foreign key(id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)on update cascade on delete cascade,
so_luong int
);
create table hop_dong(
id_hop_dong int auto_increment primary key,
id_nhan_vien int,
foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien)on update cascade on delete cascade,
id_khach_hang int,
foreign key (id_khach_hang) references khach_hang(id_khach_hang)on update cascade on delete cascade,
id_dich_vu int,
foreign key (id_dich_vu) references dich_vu(id_dich_vu)on update cascade on delete cascade,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int,
tong_tien int
);


-- Task1: Thêm mới thông tin cho tất cả các bảng trong CSDL --

insert into vi_tri( ten_vi_tri)
values
('Le tan'),
('Phuc vu'),
('Chuyen vien'),
('Giam sat'),
('Quan ly'),
('Giam doc');
insert into trinh_do(trinh_do)
values
('Trung cap'),
('Cao Dang'),
('Dai hoc'),
('Sau dai hoc');
insert into bo_phan(ten_bo_phan)
values
('Sale- Marketing'),
('Hanh chinh'),
('Phuc vu'),
('Quan ly');
insert into nhan_vien(ho_ten_nhan_vien, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_CMTND, luong, so_DT, email, dia_chi)
values
('Nguyen Thanh Duong', 1,1,1 , '1998/01/06','123424567','100000000','0339234234','duong123@gmail.com','Da Nang'),
('Nguyen Thai Kha', 1,2,3 , '1994/07/11','456724567','20000000','0339235872','khanh456@gmail.com','Quang Nam'),
('Nguyen Ngoc Lan Thao', 1,2,1,  '1997/09/18','7000000','241578934','0339678789','thao678@gmail.com','Quang Tri'),
('Nguyen Thi Hoa', 1,2,2 , '1990/08/11','24199432','9000000','0339728245','hoa333@gmail.com','Hue'),
('Nguyen Ngoc Lan Huong', 1,3,1,  '1997/05/12','8000000','301578934','0339678777','huong578@gmail.com','Hoi An'),
('Nguyen Thi Hanh', 2,2,2 , '1990/03/11','33399432','9500000','0339728347','hanh333@gmail.com','Hue'),
('Huynh Thi Nga',1,3,1,'1994/08/10','097354920',7000000,'0392065098','ngahuynh@gmail.com','Quang Tri'),
('Truong Van Quang',5,4,4,'1991/11/15','034586038',12000000,'0394908776','truongquang@gmail.com','Hue'),
('Nguyen Thi Thanh',2,1,3,'1997/10/25','239876509',8500000,'0987987098','thanhnguyen@gmail.com','Da Nang'),
('Vo Thanh Dat', 3,2,2, '1993/04/12', '097354042', 9000000, '0392853968', 'thanhdat@gmail.com','Hai Chau');


insert into loai_khach(id_loai_khach,ten_loai_khach)
values
(1,'Diamond'),
(2,'Platinium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');






insert into khach_hang( id_loai_khach, ho_va_ten, ngay_sinh, so_CMTND, so_DT, email,dia_chi)
values
(1,'Nguyen Thanh Nhan', '1998/09/09','777424567','03392222222','nhan123@gmail.com','Da nang'),
(1,'Nguyen Trong Gia Bao', '1999/06/06','888425555','0339333333','bao789@gmail.com','Vinh'),
(2,'Nguyen Thanh Tai', '1998/12/12','666424566','033944444444','tai123@gmail.com','Quang tri'),
(3,'Nguyen Ngoc Anh Tho', '2000/03/03','555424599','0339555555','tho666@gmail.com','Hue'),
(1,'Nguyen Thanh Hien', '1998/07/08','587424567','03392222200','hien123@gmail.com','Da nang'),
(1,'Nguyen Trong Gia Binh', '1999/06/15','128425555','0339333399','binh789@gmail.com','Quang nam'),
(2,'Nguyen Thanh Lan Huong', '1995/12/14','966424566','033944444466','huong123@gmail.com','Vinh'),
(3,'Nguyen Ngoc Suong Mai', '2001/04/04','775424599','0339555577','mai666@gmail.com','Hue'),
(2,'Nguyen Van An','1989/02/19','176086789','0971098789','nguyenan@gmail.com','Da Nang'),
(5,'Tran Nhu ngoc','1975/12/07','297479674','0989098765','tranngoc@gmail.com','Nha Trang'),
(4,'Nguyen Van Nhat','1995/10/04','098057336','0396098779','nhatnguyen@gmail.com','Vinh');

insert into khach_hang( id_loai_khach, ho_va_ten, ngay_sinh, so_CMTND, so_DT, email,dia_chi)
values
(1,'Nguyen Van Nhat','1995/10/04','098057336','0396098779','nhatnguyen@gmail.com','Vinh');


select * from khach_hang; 

insert into kieu_thue(ten_kieu_thue, gia)
values
('12gio',80000),
('1ngay',230000),
('1thang',2500000),
('1nam',10000000);
insert into loai_dich_vu(ten_loai_dich_vu)
values
('Villa'),
('House'),
('Room');

insert into dich_vu (ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, id_loai_dich_vu, trang_thai)
values
('thue Villa', 350, 4, 10, 9000000, 1, 1, ' dang thue' ),
('thue Villa', 400, 5, 10, 15000000, 1, 2, ' dang thue' ),
('thue Villa', 450, 6, 10, 16000000, 2, 1, ' dang thue' ),
('thue House', 300, 3, 5, 5000000, 1, 2 , 'dang thue'),
('thue House', 310, 3, 5, 5500000, 1, 3 , 'dang thue'),
('thue House', 320, 3, 6, 6000000, 1, 2 , 'dang thue'),
('thue Room', 200, 1, 2, 1000000, 2, 3, 'dang thue'),
('thue Room', 230, 1, 2, 1500000, 1, 3, 'dang thue'),
('thue Room', 250, 2, 2, 2000000, 1, 2, 'dang thue'),
('thue Villa',405 ,3 ,12 ,10000000, 1, 1,'dang thue'),
('thue House',355, 2, 8, 7000000, 3, 1,'dang thue'),
('thue Room', 255, 1, 4, 3000000, 2, 2,'dang thue'),
('thue Villa', 360 ,2, 10, 9000000, 1, 2, 'dang thue'),
('thue Room', 25, 1, 4, 3000000, 2, 2,'dang thue');
insert into dich_vu_di_kem(ten_dich_vu_di_kem, don_vi, gia, trang_thai_kha_dung)
values
('Massage' ,1, 300000, 'Ok'),
('Karaoke' ,1, 400000, 'OK'),
('Thuc an', 1, 600000, 'OK'),
('Nuoc uong' ,1, 20000, 'OK'),
('Thue xe', 1, 500000, 'OK');
insert into hop_dong_chi_tiet(id_hop_dong, id_dich_vu_di_kem, so_luong)
values
(1,1,2 ),
(1,1,3 ),
(1,2,2),
(2,2,3),
(2,3,2),
(3,1,1),
(1,2,5);

insert into hop_dong (id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc)
values
(1,1,2, '2021/08/12', '2021/08/15', 5000000),
(1,2,3, '2021/08/13', '2021/08/22', 5500000),
(1,2,2, '2021/09/15', '2021/09/18', 1000000),
(1,2,3, '2021/09/20', '2021/09/17', 3000000),
(1,2,2,'2021/04/12','2021/05/12',5000000),
(3,1,1,'2021/02/22','2021/02/23',3000000),
(2,3,3,'2021/11/05','2021/11/11',4000000),
(4,4,4,'2021/12/12','2021/12/13',6000000),
(2,3,3,'2019/11/05','2021/11/11',4000000);




