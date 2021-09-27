CREATE DATABASE QuanLyDiemThi;
USE QuanLyDiemThi;
CREATE TABLE Hoc_sinh(
ma_HS VARCHAR(20) PRIMARY KEY,
ten_HS VARCHAR(50),
ngay_sinh DATETIME,
lop VARCHAR(20),
GT VARCHAR(20)
);

CREATE TABLE Mon_hoc(
ma_MH VARCHAR (20) PRIMARY KEY,
ten_MH VARCHAR(50)
);

CREATE TABLE Bang_diem(
ma_HS VARCHAR(20),
ma_MH VARCHAR(20),
diem_thi INT,
ngay_KT DATETIME,
PRIMARY KEY (ma_HS, ma_MH),
FOREIGN KEY(ma_HS) REFERENCES Hoc_sinh(ma_HS),
FOREIGN KEY(ma_MH) REFERENCES Mon_hoc(ma_MH)
);

CREATE TABLE Giao_vien(
ma_GV VARCHAR (20) PRIMARY KEY,
ten_GV VARCHAR(20),
so_DT VARCHAR(10)
);
-- Chỉnh sửa lại bảng môn học bổ sung thêm trường ma_GV là khóa ngoại  của bảng Mon_hoc
alter table Mon_hoc add mA_GV vARCHAr (20);
aLTEr table MON_HOc ADD cONSTRaINT FK_ma_GV fOREiGN KEY (MA_GV) referENCES GiAO_vIen (mA_GV);
