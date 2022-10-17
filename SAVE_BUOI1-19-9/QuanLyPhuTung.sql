-- 1. Tạo database QlyCungcapPhutung và use database này.Create database QlyCungcapPhutung
go
use QlyCungcapPhutung
-- 2. Tạo bảng NhaCungcap như yêu cầu trên, khóa chính là MaNcc.
Create table NhaCungcap 
(
MaNcc varchar(5),
TenNcc varchar(20), 
Thanhpho varchar(30),
NgayTL smalldatetime,
Constraint PKNcc primary key (MaNcc)
)
-- 3. Tạo bảng Phutung như yêu cầu trên, khóa chính là MaPT.
CREATE TABLE Phutung(
	MaPT varchar(5) NOT NULL,
	TenPT varchar(10),
	Mausac varchar(10),
	Khoiluong float,
	Thanhpho varchar(30)
)

ALTER TABLE Phutung ADD CONSTRAINT PKMapt PRIMARY KEY (MaPT)
--4. Tạo bảng Cungcap như yêu cầu trên, khóa chính là (MaNcc, MaPT), 2 khóa ngoại là 
--MaNcc, MaPT
Create table Cungcap 
(
MaNcc varchar(5) ,
MaPT varchar(5),
Soluong numeric(5), 
KhoiluongPT float,
Constraint PKCC primary key (MaNcc,MaPT),
Constraint FKCC1 foreign key (MaNcc) references NhaCungcap 
(MaNcc),
Constraint FKCC2 foreign key (MaPT) references Phutung (MaPT)
)--5. Thêm cột Diachi có kiểu dữ liệu varchar(40) vào bảng NhaCungcap.
ALTER TABLE NhaCungcap ADD Diachi varchar(40)-- 6. Sửa kiểu dữ liệu của cột Diachi trong bảng NhaCungcap thành varchar(100).
ALTER TABLE NhaCungcap ALTER COLUMN Diachi varchar(100)-- 7. Xóa cột Diachi trong bảng NhaCungcapALTER TABLE nhacungcap drop column diachi -- 8. Xóa 2 ràng buộc khóa ngoại trong bảng Cungcap.ALTER TABLE Cungcap DROP CONSTRAINT FKCC1
ALTER TABLE Cungcap DROP CONSTRAINT FKCC2-- 9. Xóa 3 ràng buộc khóa chính từ 3 bảng trênALTER TABLE Cungcap DROP CONSTRAINT PKCCALTER TABLE NhaCungCap DROP CONSTRAINT PKNccALTER TABLE Phutung DROP CONSTRAINT PKMapt-- 10. Tạo lại các ràng buộc khóa chính, khóa ngoại cho các bảng trên--Tạo khóa chính cho 3 bảng: NhaCungcap, Phutung, Cungcap
ALTER TABLE NhaCungcap ADD CONSTRAINT PKNcc PRIMARY KEY (MaNcc)
ALTER TABLE Phutung ADD CONSTRAINT PKPtung PRIMARY KEY (MaPT)
ALTER TABLE Cungcap ADD CONSTRAINT PKCC PRIMARY KEY (MaNcc, MaPT)
--Tạo khóa ngoại cho bảng: Cungcap
ALTER TABLE Cungcap ADD CONSTRAINT FKCC1 FOREIGN KEY (MaNcc) 
REFERENCES NhaCungcap (MaNcc)
ALTER TABLE Cungcap ADD CONSTRAINT FKCC2 FOREIGN KEY (MaPT) 
REFERENCES Phutung (MaPT) -- 11. Viết ràng buộc CHECK: khối lượng của một phụ tùng không được vượt quá 200.ALTER TABLE Phutung ADD CONSTRAINT CK_KLUONG CHECK (Khoiluong<=200)-- 12.Màu sắc của phụ tùng chỉ có thể là ('Do', 'Xanh', 'Vang', 'Trang', 'Tim', 'Den').
ALTER TABLE Phutung ADD CONSTRAINT CK_MAUSAC CHECK (Mausac IN 
('Do', 'Xanh', 'Vang', 'Trang', 'Tim', 'Den'))-- 13.Năm thành lập của nhà cung cấp phải sau năm 1920.
ALTER TABLE Nhacungcap ADD CONSTRAINT CK_NAMTL CHECK 
(YEAR(NgayTL)>1920)-- 14. Viết câu lệnh thêm dữ liệu vào 3 bảng NhaCungcap, Phutung, Cungcap theo dữ liệu mẫu insert into NhaCungcap values ('N0001','Minh','Ho Chi Minh', '1990-08-09')
insert into NhaCungcap values ('N0002','Quang','Ha Noi', '1990-08-04')
insert into NhaCungcap values ('N0003','Tuan','Ha Noi', '1994-02-06')
insert into NhaCungcap values ('N0004','Duy','Ho Chi Minh', '1975-03-05')
insert into NhaCungcap values ('N0005','Cuong','Da Nang', '1990-09-01')
insert into NhaCungcap values ('N0006','Ha','Da Nang', '1930-03-08')
insert into NhaCungcap values ('N0007','Nga','Da Lat', '1937-03-08')


Insert  into Phutung values  ( 'P0001' , 'Guong' , 'Do' , 16.0 , 'Ho Chi Minh')
Insert  into Phutung values  ( 'P0002' , 'Vo xe' , 'Xanh', 17.0 , 'Ha Noi')
Insert  into Phutung values  ( 'P0003' , 'Ban dap' , 'Vang', 17.0 , 'Phan Thiet')
Insert  into Phutung values  ( 'P0004' , 'Ban dap' , 'Do' , 18.0 , 'Ho Chi Minh')
Insert  into Phutung values  ( 'P0005' , 'Day xich' , 'Vang' , 12.0 , 'Ha Noi')
Insert  into Phutung values  ( 'P0006' , 'Rang cua' , 'Do' , 19.0 , 'Ho Chi Minh')
Insert  into Phutung values  ( 'P0007' , 'Tua vit' , 'Do' , 19.0 , 'Da Lat')



Insert into Cungcap values ('N0001','P0001',300, 4800)
Insert into Cungcap values ('N0001','P0002',200, 3400)
Insert into Cungcap values ('N0001','P0003',400, 6800)
Insert into Cungcap values ('N0001','P0004',200, 3600)
Insert into Cungcap values ('N0001','P0005',100, 1200)
Insert into Cungcap values ('N0001','P0006',100, 1900)
Insert into Cungcap values ('N0002','P0001',300, 4800)
Insert into Cungcap values ('N0002','P0002',400, 6800)
Insert into Cungcap values ('N0003','P0002',200, 3400)
Insert into Cungcap values ('N0004','P0002',200, 3400)
Insert into Cungcap values ('N0004','P0004',300, 5400)
Insert into Cungcap values ('N0004','P0005',400, 4800)
Insert into Cungcap values ('N0005','P0005',1300, 15600)
Insert into Cungcap values ('N0006','P0007',2, 38)--15.Tạo bảng NhaCungcap1 chứa toàn bộ dữ liệu của bảng NhaCungcap.
SELECT * INTO NhaCungcap1 
FROM NhaCungcap
--16.Tạo bảng Phutung1 chứa dữ liệu MaPT, TenPT, Mausac của những phụ tùng màu 'Do' 
--và màu 'Xanh'.SELECT MaPT, Mausac, TenPt INTO Phutung1from Phutungwhere Mausac in ('Do','Xanh') -- mausac = 'do' or mausac = 'xanh'select * from Phutung1-- 17.Cập nhật dữ liệu trong bảng NhaCungcap1 với tên mới là 'Nhat' và thành phố là 'Da Lat' 
--của nhà cung cấp N0001.
UPDATE NhaCungcap1
SET TenNcc='Nhat', Thanhpho='Da Lat' 
WHERE MaNcc='N0001'


-- 18.Xóa những nhà cung cấp thành lập năm 1930 trong bảng NhaCungcap1.
DELETE FROM NhaCungcap1
WHERE YEAR(NgayTL)=1930
select * from NhaCungcap1

--IV. Bài tập thực hành tại lớp (QuanLyBanHang)
--Ngôn ngữ định nghĩa dữ liệu (Data Definition Language):
--1. Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
ALTER TABLE SANPHAM ADD GHICHU varchar(20)
--2. Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
ALTER TABLE KHACHHANG ADD LOAIKH tinyint
--3. Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
ALTER TABLE SANPHAM ALTER COLUMN GHICHU varchar(100)
--4. Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
ALTER TABLE SANPHAM DROP COLUMN GHICHU
--5. Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị
--là: “Vang lai”, “Thuong xuyen”, “Vip”, …
ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH varchar(30)
-- Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
--6. Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ
--KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.
SELECT * INTO SANPHAM1
FROM SANPHAM

SELECT * INTO KHACHHANG1 
FROM KHACHHANG

--7. Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ
--SANPHAM1)UPDATE SANPHAM1SET Gia = Gia*1.05WHERE NuocSX = 'Thai Lan'select * from SANPHAM1