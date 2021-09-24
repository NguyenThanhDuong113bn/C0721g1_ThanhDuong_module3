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
foreign key (id_vi_tri) references vi_tri( id_vi_tri),
id_trinh_do int,
foreign key (id_trinh_do) references trinh_do( id_trinh_do),
id_bo_phan int,
foreign key (id_bo_phan) references bo_phan (id_bo_phan),
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
foreign key(id_loai_khach) references loai_khach(id_loai_khach),
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
foreign key(id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu),
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
foreign key(id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem),
so_luong int
);
create table hop_dong(
id_hop_dong int auto_increment primary key,
id_nhan_vien int,
foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien),
id_khach_hang int,
foreign key (id_khach_hang) references khach_hang(id_khach_hang),
id_dich_vu int,
foreign key (id_dich_vu) references dich_vu(id_dich_vu),
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int,
tong_tien int
);
-- Task1: Thêm mới thông tin cho tất cả các bảng trong CSDL

insert into vi_tri
values
(1,'Le tan'),
(2,'Phuc vu'),
(3,'Chuyen vien'),
(4,'Giam sat'),
(5,'Quan ly'),
(6,'Giam doc');
insert into trinh_do
values
(1,'Trung cap'),
(2,'Cao Dang'),
(3,'Dai hoc'),
(4,'Sau dai hoc');
insert into bo_phan
values
(1,'Sale- Marketing'),
(2,'Hanh chinh'),
(3,'Phuc vu'),
(4,'Quan ly');
insert into nhan_vien
values
(1,'Nguyen Thanh Duong', '06/01/1998','123424567','0339234234','duong123@gmail.com','Dai hoc','Giam doc','100000000'),
(2,'Nguyen Thai Long', '11/07/1994','456724567','0339235872','long456@gmail.com','Dai hoc','Quan ly','20000000'),
(3,'Nguyen Ngoc Lan Phuong', '18/09/1997','241578934','0339678789','phuong678@gmail.com','Cao Dang','Le tan','7000000'),
(4,'Nguyen Thi Hoa', '08/11/1990','24199432','0339728245','hoa333@gmail.com','Trung Cap','Chuyen vien','9000000');
insert into loai_khach
values
(1,'Diamond'),
(2,'Platinium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');
insert into khach_hang
values
(1,'Nguyen Thanh Nhan', '09/09/1998','Nam','777424567','03392222222','nhan123@gmail.com','Diamond'),
(1,'Nguyen Trong Gia Bao', '06/06/1999','Nam','888425555','0339333333','bao789@gmail.com','Platinum'),
(1,'Nguyen Thanh Nhan', '12/12/1998','Nu','666424566','033944444444','nhan123@gmail.com','Sliver'),
(1,'Nguyen Ngoc Suong Mai', '03/003/2000','Nu','555424599','0339555555','mai666@gmail.com','Gold');
insert into kieu_thue
values
(1,'12gio',80000),
(2,'1ngay',230000),
(3,'1thang',2500000);
insert into loai_dich_vu
values
(1,'Vip'),
(2,'Thuong');
insert into dich_vu
values
(1,'Villa'),
(2,'House'),
(3,'Room');
insert into dich_vu_di_kem
values
(1,'Massage','1',300000),
(2,'Karaoke','2',400000),
(3,'Thuc an','2',600000),
(4,'Nuoc uong','1',20000),
(5,'Thue xe','1',500000);
insert into hop_dong_chi_tiet
values
('1');
insert into hop_dong
values
(1,'15','12/08/2021','20/8/2021',5000000),
(2,'16','13/08/2021','22/08/2021',5500000),
(3,'17','15/09/2021','18/09/2021',1000000),
(4,'18','20/09/2021','27/09/2021/',3000000);




