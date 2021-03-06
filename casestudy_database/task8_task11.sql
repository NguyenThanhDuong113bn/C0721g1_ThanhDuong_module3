USE casestudy_database;
/* task 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên */

select khach_hang.ho_va_ten	
from khaCH_HANg
group by Khach_hang.hO_VA_ten;


/* tASK 9.	Thực hiện thỐng kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019
 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.*/
 
select month(ngay_lam_hop_dong) as "Thang", sum(dich_vu.chi_phi_thue +hoP_DONG_CHI_TIet.so_luong*dich_Vu_Di_kem.giA) AS "Tong tIen",
count(hoP_dong.id_khach_haNg) as "SO khach thue diCh vU"
From hop_dong
jOIN DIch_vu on hop_dong.id_dIcH_vu=dich_vu.id_dich_vu
joiN HOp_dong_chi_TIEt on hop_DOng.id_hop_dong=hop_dOng_chi_Tiet.id_hop_DONG
join dich_vu_di_keM on hop_doNg_chi_tiet.Id_dich_vu_di_kem=Dich_vu_di_keM.ID_dich_vu_di_kem
WHere year(ngay_lam_Hop_dong)=2021
groUp by month(ngaY_lam_hop_dong);

/* TASk 10.	Hiển thị thông tiN TƯƠNg ỨNG vỚI TỪNG Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
(được tính dựa trên việc count các IDHopDongChiTiet).*/

 select hd.id_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc,count(hdct.id_hop_dong_chi_tiet) as "so_luong_dicH_VU_Di_kEm"
from hop_doNg hd
join hop_donG_cHi_tiet hdct oN hD.id_hop_dong=HDCT.Id_hoP_dong
group by hd.id_hOP_dong;

/* task 11.	Hiển thỊ THông tin các DỊCH vụ đi kèm đã được sử dụnG bởi những Khách hàng có TenLoaiKhACHHAnG 
là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.*/
 SELECT 
    dvdk.id_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    dvdk.gia,
    dvdk.don_vi,
    dvdk.trang_thai_kha_dung,
    lk.ten_loai_khach,
    kh.dia_chi
   
FROM
    dich_vu_DI_KEm dvdk
        JOIN
    hop_Dong_chi_tIet hdct ON dvdk.id_dich_vu_dI_keM = hdct.iD_dich_Vu_di_kem
        JOIN
    hop_dong hd ON hdct.id_hop_dong = Hd.id_hop_DONg
        JOIN
    khach_hang kh ON Hd.id_khach_hang = kh.id_khacH_hang
        JOIN
    loAi_khaCh lk ON kh.id_loai_khach = LK.id_loai_khach
WHERE
    Kh.id_loai_khAch = 1
        AND (kh.dIA_Chi = 'Quang Ngai'
        OR kh.dia_chi = 'Vinh') group by id_dich_vu_di_kem;
	

        
     
        
 /* task 12.Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
 (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách
 hàng đặt vào 3 tháng cuối năm 2021 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021 */

select hd.id_hop_dong,nv.ho_ten_nhan_vien as "ten_nhan_vien",kh.ho_va_ten as "ten_khach_hang",kh.so_DT as "so_dien_thoai_khach_hang",
dv.ten_dich_vu,count(hdct.id_hop_dong) as "so_luong_dich_vu_di_kem",hd.tien_dat_coc
from hop_dong hd
join nhan_vien nv on hd.id_nhan_vien = nv.id_nhan_vien
join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong 
where year(hd.ngay_lam_hop_dong)=2021 and month(hd.ngay_lam_hop_dong) in (10,11,12)and hd.id_hop_dong
 not in (select id_hop_dong
	from hop_dong hd
	where month(hd.ngay_lam_hop_dong)between 1 and 6); 

/* task 13 Hiển THị THÔNG Tin các Dịch vụ đi kèM ĐưỢC sử dụng nhiều nhẤT bỞI CÁC KHách hàng đã đặt pHòNg.
(LƯU Ý LÀ cÓ thể cÓ nhiều dịch VỤ CÓ sỐ LẦN sỬ dụng nhiều như nHaU).*/
SELECT 
    hdct.id_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.id_dich_vu_di_kem) AS so_luong_dich_vu_di_kem
FROM
    hop_dong_chi_tiet hdct
        JOIN
    dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_dI_KEM
GROUP BY hDct.id_dich_vu_di_Kem
HAVING COUNT(hdct.id_dich_vu_di_KEM) >= ALL (SELECT 
        COUNT(hdct.id_dich_vu_di_keM)
    FROM
        hop_dong_chi_tiet hdCT
    GROUP BY hdct.id_dich_VU_di_kEm);
    
    /*task 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.*/
select hd.id_hop_dong, ldv.ten_loai_dich_vu,dvdk.ten_dich_vu_di_kem, count(hdct.id_dich_vu_di_kem) as 'so lan su dung'
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
join hop_dong hd on hdct.id_hop_dong = hd.id_hop_dong
join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
group by hdct.id_dich_vu_di_kem
having count(hdct.id_dich_vu_di_kem) = 1;

/*	Task 15: Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi 
mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.*/
select nv.id_nhan_vien,nv.ho_ten_nhan_vien,td.trinh_do,bp.ten_bo_phan,nv.so_DT,nv.dia_chi,count(hd.id_hop_dong) as "so_lan_lam_hop_dong"
from nhan_vien nv
join trinh_do td on nv.id_trinh_do = td.id_trinh_do
join bo_phan bp on nv.id_bo_phan = bp.id_bo_phan
join hop_dong hd on nv.id_nhan_vien = hd.id_nhan_vien
where (year(hd.ngay_lam_hop_dong) between 2020 and 2021)
group by hd.id_nhan_vien
having count(hd.id_hop_dong) <=3;

/*Task 16:	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.*/
set SQL_SAFE_UPDATES=0;
delete from nhan_vien 
where id_nhan_vien not in (select id_nhan_vien
    from(select nv.id_nhan_vien
        from nhan_vien nv
        join hop_dong hd ON nv.id_nhan_vien = hd.id_nhan_vien
        where year(hd.ngay_lam_hop_dong) between 2017 and 2019
        group by nv.id_nhan_vien
        having count(hd.id_hop_dong) > 0) as xoa);
set SQL_SAFE_UPDATES=1;

select * from nhan_vien;
     -- 
 /*Task 17:Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, 
 chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.*/
 create temporary table bang_tam_id_tong_tien (select kh.id_loai_khach,hd.id_khach_hang,
		sum(dv.chi_phi_thue + hdct.so_luong*dvdk.gia) as "tong_tien"
        from hop_dong hd
        join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
        join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
        join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
        join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
        where year(hd.ngay_lam_hop_dong)=2021
        group by hd.id_khach_hang
        having tong_tien > 10000000);
select * from bang_tam_id_tong_tien;

update khach_hang 
set id_loai_khach = 1
where id_khach_hang = (select bang_tam_id_tong_tien.id_khach_hang from bang_tam_id_tong_tien);           

select * from khach_hang;
drop table bang_tam_id_tong_tien;

/*Task 18:Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).*/
set SQL_SAFE_UPDATES = 0;
delete from khach_hang 
where id_khach_hang in (select id_khach_hang
    from (select kh.id_khach_hang
    from khach_hang kh
	join hop_dong hd on hd.id_khach_hang = kh.id_khach_hang
    where year(hd.ngay_lam_hop_dong) < 2016) as a);
set SQL_SAFE_UPDATES = 1;
select * from khach_hang;

-- 
/*Task 19:Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.*/
create temporary table bang_tam_dich_vu_di_kem (select dvdk.id_dich_vu_di_kem as "id" , count(hdct.id_dich_vu_di_kem) as "so_lan_su_dung"
            from dich_vu_di_kem dvdk
            join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
            group by hdct.id_dich_vu_di_kem 
            having so_lan_su_dung > 10);
update dich_vu_di_kem
set gia = gia*2
where dich_vu_di_kem.id_dich_vu_di_kem in (select bang_tam_dich_vu_di_kem.id from bang_tam_dich_vu_di_kem);
select * from dich_vu_di_kem;
drop table bang_tam_dich_vu_di_kem;

/*  Task 20:.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống,
 thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.*/
 select id_khach_hang as id,ho_va_ten as ho_ten, email, so_DT, ngay_sinh, dia_chi
 from khach_hang
 union all
 select id_nhan_vien as id,ho_ten_nhan_vien ,email, so_DT, ngay_sinh, dia_chi
 from nhan_vien;
 
 
 
