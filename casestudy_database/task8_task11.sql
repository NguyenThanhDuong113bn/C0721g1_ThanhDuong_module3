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
        OR kh.dia_chi = 'Vinh');
        
 
SELECT 
    hd.id_hop_dong,
    Dv.id_dich_vu,
    Hd.ngay_lam_hop_DONG,
    nV.ho_ten_nhan_vIeN,
    kh.HO_vA_tEn,
    kH.so_DT,
    COUNT(hdct.Id_dIch_vu_di_kem) AS so_luong_dich_VU_DI_kem
FROM
    dich_vU dv
        JOIN
    hop_dOng hd ON dv.id_diCh_vu = Hd.id_dich_vu
        JOIN
    khacH_hang kH ON hD.id_kHACH_Hang = kh.id_khach_hang
        JOIN
    nhan_vien nV ON nv.id_nhan_vien = hd.id_NHAn_vien
        JOIN
    hop_dong_cHi_tIet hdct ON hdct.id_HOP_dong = hd.id_hop_doNG
        JOIN
    Dich_vu_di_kem dvdk ON dvdk.ID_dich_vu_di_kem = hDCt.iD_dich_vu_di_kEm
WHERE
    dv.id_dich_vu IN (SELECT 
            dv.id_dICh_vu
        FROM
            dich_vu dv
                JOIN
            hop_dOng hd ON dv.id_dicH_vu = hd.id_dich_vu
        WHERE
            (QUARTER(HD.ngay_lam_hop_donG) = 4)
                AND (YEAR(hd.ngay_lam_hop_dong) = 2021))
        AND dv.id_dich_vu NOT IN (SELECT 
            dv.id_dich_vu
        FROM
            DICh_Vu dv
                JOIN
            hoP_DoNG HD ON dv.id_dich_vu = hD.Id_DICH_vu
        WHERE
            (QUARTER(HD.ngay_lam_hop_donG) = 1
                OR QUARTER(hd.ngay_lam_hop_dong) = 2)
                AND (YEAR(hd.ngaY_lam_hop_dong) = 2021))
GROUP BY hdct.id_HOP_dong
HAVING YEAR(HD.NGay_lam_hop_dong) = 2021;

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

