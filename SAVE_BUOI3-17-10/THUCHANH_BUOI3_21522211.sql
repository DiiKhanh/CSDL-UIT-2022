USE QLBH_2022

--1. Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(DISTINCT MASP) AS TONGSOSANPHAM
FROM SANPHAM
GROUP BY NUOCSX
--2. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*)
FROM HOADON H
WHERE MAKH NOT IN (SELECT MAKH
FROM KHACHHANG K 
WHERE K.MAKH = H.MAKH)
--3. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu?
SELECT MAX(TRIGIA) AS MAX, MIN(TRIGIA) AS MIN
FROM HOADON
--4. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(trigia) as TriGiaTB
from HOADON
WHERE YEAR(NGHD) = 2006

--5. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT NUOCSX, MAX(GIA) AS MAX, MIN(GIA) AS MIN, AVG(GIA) AS AVG
FROM SANPHAM
GROUP BY NUOCSX
--6. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
--7. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT MASP, COUNT(DISTINCT MASP) AS TONGSO
FROM SANPHAM
WHERE MASP IN(SELECT MASP
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006)
GROUP BY MASP
--8. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất.
SELECT *
FROM HOADON
WHERE SOHD IN(SELECT SOHD
FROM CTHD C INNER JOIN SANPHAM S
ON C.MASP = S.MASP
WHERE NUOCSX = 'VIET NAM' AND SL >= 3)
--9. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD
FROM HOADON
WHERE TRIGIA = (SELECT MAX(TRIGIA)
FROM HOADON)
--10.Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT HOTEN FROM HOADON HD INNER JOIN KHACHHANG KH
ON HD.MAKH = KH.MAKH
WHERE YEAR(NGHD) = 2006 AND TRIGIA = (
	SELECT MAX(TRIGIA) FROM HOADON
)
--12.In ra danh sách khách hàng và thứ hạng của khách hàng (xếp hạng theo doanh số).
SELECT MAKH, HOTEN, DOANHSO,
				(RANK() OVER (ORDER BY DOANHSO DESC)) XEP_HANG
FROM KHACHHANG

--13.In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm dần.
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC
--14.In ra thông tin (MAKH, HOTEN, DOANHSO) và loại của khách hàng. Nếu doanh số lớn hơn 2000000 là khách hàng VIP. Nếu doanh số lớn hơn 500000 là khách hàng TV, còn lại là khách hàng TT.
SELECT MAKH, HOTEN, DOANHSO, LOAIKH = (CASE 
        WHEN DOANHSO > 2000000 then 'khach hang vip'
        when DOANHSO > 500000 then 'khach hang tv'
        else 'khach hang TT'
END)
from KHACHHANG


