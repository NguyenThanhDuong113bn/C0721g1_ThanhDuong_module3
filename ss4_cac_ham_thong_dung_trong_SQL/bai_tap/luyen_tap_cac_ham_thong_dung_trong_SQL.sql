use bai3_QuanLySinhVien;
SELECT 
    sub_id,
    sub_name,
    `status`,
    MAX(credit) AS max_credit
FROM
    `subject`;