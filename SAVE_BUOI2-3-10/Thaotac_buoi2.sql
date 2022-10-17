Create database QlyCungcapPhutung_buoi2
go
use QlyCungcapPhutung_buoi2
go
Create table NhaCungcap 
(
MaNcc		varchar(5),
TenNcc	varchar(20), 
Thanhpho	varchar(30),
NgayTL	smalldatetime,
Constraint PKNcc primary key (MaNcc)
)


create table Phutung 
(
 MaPT		varchar(5),
 TenPT	varchar(10),
 Mausac	varchar(10),
 Khoiluong	float,
 Thanhpho	varchar(30),
 Constraint PKPtung Primary Key (MaPT) 
)


Create table Cungcap 
(
MaNcc		varchar(5) ,
MaPT		varchar(5),
Soluong	numeric(5), 
KhoiluongPT	float	
Constraint PKCC primary key (MaNcc,MaPT),
Constraint FKCC1 foreign key (MaNcc) references NhaCungcap (MaNcc),
Constraint FKCC2 foreign key (MaPT) references Phutung (MaPT)
)


insert into NhaCungcap values ('N0001','Minh','Ho Chi Minh', '1990-08-09')
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
Insert into Cungcap values ('N0006','P0007',2, 38)


-- 1. hien thi tat ca thong tin nha cung cap
select * from NhaCungcap 
--2. hien thi thong tin phu tung
SELECT * FROM Phutung
--3. hien thi mancc ten ncc thanh pho cua nha cc
SELECT MaNcc, TenNcc,Thanhpho
FROM NhaCungcap
where Thanhpho = 'Ho Chi Minh'
-- 4. Hiển thị MaPT, TenPT, Mausac, Khoiluong của những phụ tùng có khối lượng lớn hơn 16
SELECT MaPT, TenPT,Mausac,Khoiluong
FROM Phutung
where Khoiluong > 16
--5. Hiển thị MaPT, TenPT, Mausac, Khoiluong của những phụ tùng có khối lượng lớn hơn 16 và không phải màu đỏ ('Do')
SELECT MaPt,tenpt,mausac,khoiluong
from Phutung
where (Khoiluong > 16) and (Mausac <> 'DO')
--6. Hiển thị MaPT, TenPT, Mausac, Khoiluong của những phụ tùng có khối lượng lớn hơn 16 và không phải màu đỏ ('Do') cũng không phải màu xanh ('Xanh')
SELECT Mapt,tenpt,mausac,khoiluong
from Phutung
where (Khoiluong > 16) AND (Mausac not in ('do','xanh'))
--(Mausac <> 'do') and (Mausac <> 'xanh')
--7.Hiển thị MaPT, TenPT, Khoiluong của những phụ tùng có khối lượng trong khoảng từ 15 đến 19. Sắp xếp theo TenPT
SELECT mapt,tenpt,khoiluong
from Phutung
WHERE (Khoiluong between 15 and 19)
--(Khoiluong >= 15 and Khoiluong <= 19)
ORDER BY TenPT 
-- ko de mac dinh la tang dan
--ASC tang dan
--desc giam dan
-- 8. Nhà cung cấp nào được thành lập trong tháng 8 năm 1990
SELECT *
from NhaCungcap
where MONTH(NgayTL) = 8 and YEAR(NgayTL) = 1990
--9. Nhà cung cấp nào được thành lập vào ngày 01-09-1990
SELECT *
from NhaCungcap
where NgayTL = '19900901'
-- Phép kết
--10.Hiển thị thông tin phụ tùng (MaPT, TenPT, Mausac) được cung cấp bởi nhà cung cấp có mã số N0001.
SELECT p.mapt, p.tenpt, p.mausac
from Phutung p 
join Cungcap c on p.MaPT = c.MaPT
where c.MaNcc = 'n0001'
-- hoac
SELECT p.mapt, p.tenpt, p.mausac
from Phutung p, Cungcap c
where  p.MaPT = c.MaPT and c.MaNcc = 'n0001'
--11.Hiển thị thông tin nhà cung cấp (MaNcc, TenNcc, NgayTL) có cung cấp phụ tùng mã số P0001. Sắp xếp theo NgayTL giảm dần.
SELECT n.MaNcc,n.TenNcc,n.NgayTL
from NhaCungcap n
JOIN Cungcap c on c.MaNcc = n.MaNcc
where c.MaPT = 'P0001'
ORDER BY NgayTL DESC 
--12.Hiển thị nhà cung cấp ở thành phố 'Ho Chi Minh' có cung cấp phụ tùng cũng ởthành phố 'Ho Chi Minh'. Loại bỏ kết quả trùng.
SELECT DISTINCT n.*
from NhaCungcap n 
join Cungcap c on c.MaNcc = n.MaNcc
join Phutung p on p.MaPT = c.MaPT
where n.Thanhpho = 'Ho Chi Minh' and p.Thanhpho = 'Ho Chi Minh'
--13.Hiển thị thông tin nhà cung cấp và thông tin phụ tùng màu đỏ (Mausac='Do') được cung cấp bởi nhà cung cấp này có số lượng lớn hơn 150. Thông tin hiển thị gồm: MaNcc, TenNcc, MaPT, TenPT, Soluong. Sắp xếp theo Soluong giảm dần.
SELECT n.TenNcc, n.MaNcc, p.MaPT, Soluong, p.TenPT
From NhaCungcap n
join Cungcap c on c.MaNcc = n.MaNcc
join Phutung p on p.MaPT = c.MaPT
where Mausac = 'do' AND Soluong > 150
ORDER BY Soluong DESC

--Phép toán trên tập hợp, phép kết ngoài
--14.Hiển thị nhà cung cấp (MaNcc, TenNcc, Thanhpho) ở thành phố 'Da lat' hoặc nhà cung cấp có cung cấp phụ tùng của thành phố 'Da lat'.
SELECT MaNcc, TenNcc, Thanhpho
FROM NhaCungcap
WHERE Thanhpho='Da Lat'
UNION
SELECT n.MaNcc, n.TenNcc, n.Thanhpho
FROM NhaCungcap n, Cungcap c, Phutung p
WHERE n.MaNcc=c.MaNcc AND c.MaPT=p.MaPT
AND p.Thanhpho='Da Lat'
--15..Hiển thị nhà cung cấp (MaNcc) có cung cấp phụ tùng mã số P0002 nhưng không cung cấp phụ tùng mã số P0004
SELECT mancc
from Cungcap 
WHERE MaPT = 'P0002'
EXCEPT
SELECT mancc
from Cungcap
where MaPT = 'p0004'
--16. Hiển thị nhà cung cấp (MaNcc, TenNcc) có cung cấp phụ tùng mã số P0002 nhưng không cung cấp phụ tùng mã số P0004.
SELECT c.mancc, TenNcc
from Cungcap c join NhaCungcap n on c.MaNcc=n.MaNcc
where MaPT='p0002'
EXCEPT
SELECT c.mancc, TenNcc
from Cungcap c join NhaCungcap n on c.MaNcc=n.MaNcc
where MaPT='p0004'
--17. Hiển thị nhà cung cấp (MaNcc) có cung cấp phụ tùng màu đỏ (Mausac='Do') nhưng không cung cấp phụ tùng màu Xanh (Mausac='Xanh')
SELECT mancc
from Cungcap c join Phutung p on c.MaPT = p.MaPT
where p.Mausac = 'do'
EXCEPT
SELECT mancc
from Cungcap c join Phutung p on c.MaPT = p.MaPT
where p.Mausac = 'xanh'
--18. Nhà cung cấp nào (MaNcc) cung cấp cả 2 phụ tùng có mã số P0002 và P0005.
SELECT MaNcc
FROM Cungcap
WHERE MaPT='P0002'
INTERSECT
SELECT MaNcc
FROM Cungcap
WHERE MaPT='P0005'
--19. .Phụ tùng màu Xanh nào được cung cấp bởi 2 nhà cung cấp thuộc thành phố 'Ho Chi Minh' và 'Ha Noi
SELECT p.*
from NhaCungcap n, Cungcap c, Phutung p
where n.MaNcc=c.MaNcc and c.MaPT = p.MaPT and Mausac = 'xanh' and n.Thanhpho='Ho Chi Minh'
INTERSECT
SELECT p.*
from NhaCungcap n, Cungcap c, Phutung p
where n.MaNcc=c.MaNcc and c.MaPT = p.MaPT and Mausac = 'xanh' and n.Thanhpho='Ha Noi'
--20 Nhà cung cấp nào chưa cung cấp phụ tùng nào cả.
SELECT *
FROM NhaCungcap
EXCEPT
SELECT n.*
FROM NhaCungcap n 
JOIN Cungcap c ON n.MaNcc=c.MaNcc

SELECT *
FROM NhaCungcap n 
LEFT JOIN Cungcap c ON n.MaNcc=c.MaNcc
WHERE c.MaNcc IS NULL
--21.Hiển thị nhà cung cấp (MaNcc, TenNcc) và mã phụ tùng (MaPT) được nhà cung cấp này cung cấp, kể cả nhà cung cấp chưa cung cấp mã phụ tùng nào.
SELECT n.MaNcc, TenNcc, MaPT
FROM NhaCungcap n 
LEFT JOIN Cungcap c ON n.MaNcc=c.MaNcc


