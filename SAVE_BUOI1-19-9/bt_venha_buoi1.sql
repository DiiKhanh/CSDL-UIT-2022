USE QLBH_2022
-- Ngôn ngữ định nghĩa dữ liệu (Data Definition Language):
--1. Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)
ALTER TABLE SANPHAM1 ADD CONSTRAINT CK_DONVI CHECK (DVT IN ('cay','hop','cai','quyen','chuc'))
--2. Giá bán của sản phẩm từ 500 đồng trở lên.
ALTER TABLE SANPHAM1 ADD CONSTRAINT CK_GIABAN CHECK (GIA >= 500)
--3. Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
ALTER TABLE HOADON ADD CONSTRAINT CK_KHSP CHECK (TRIGIA > 0)
--4. Ngày khách hàng đăng ký là thành viên phải lớn hơn ngày sinh của người đó
ALTER TABLE KHACHHANG1 ADD CONSTRAINT CK_DK_NS CHECK (NGDK > NGSINH)
--Ngôn ngữ thao tác dữ liệu (Data Manipulation Language)
--5. Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 
--trở xuống (cho quan hệ SANPHAM1).
SELECT * FROM SANPHAM1 WHERE NUOCSX='TRUNG QUOC'
UPDATE SANPHAM1
SET GIA = GIA - GIA/(100/5) 
WHERE NUOCSX='TRUNG QUOC' AND GIA<=10000
--6. Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước 
--ngày 1/1/2007 có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ
--1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).
UPDATE  KHACHHANG1
SET LOAIKH = 'Vip'
WHERE (NGDK < '2007/1/1' AND DOANHSO >= 10000000) OR (NGDK > '2007/1/1' AND DOANHSO >= 2000000)
