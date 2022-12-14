create database ABCD
go
use ABCD
go
CREATE TABLE SINHVIEN (
	MASV CHAR(8) PRIMARY KEY,
	HOTEN VARCHAR(50) NOT NULL,
	NGAYSINH SMALLDATETIME,
	CMND CHAR(12) UNIQUE
)

create table LOP (
	MALOP CHAR(5) PRIMARY KEY,
	TENLOP VARCHAR(20),
	TRLOP CHAR(8)
	CONSTRAINT FK_LOP FOREIGN KEY(TRLOP) REFERENCES SINHVIEN (MASV)
)

ALTER TABLE SINHVIEN ADD MALOP CHAR(5)
alter table SINHVIEN add constraint FK_SV_LOP FOREIGN KEY(MALOP) REFERENCES LOP (MALOP)
ALTER TABLE LOP ADD CONSTRAINT UQ_LOP_TL UNIQUE(TENLOP)

ALTER TABLE SINHVIEN ALTER COLUMN HOTEN VARCHAR(100)

CREATE TABLE MONHOC(
	MAMH CHAR(4),
	TENMH VARCHAR(30)
)

ALTER TABLE MONHOC ALTER COLUMN MAMH CHAR(4) NOT NULL
GO
ALTER TABLE MONHOC ADD CONSTRAINT PK_MONHOC PRIMARY KEY(MAMH)

create table DANGKY(
	MASV CHAR(8) NOT NULL,
	MAMH CHAR(4) NOT NULL,
	DIEM INT
)

alter table DANGKY ADD CONSTRAINT PK_DANGKY PRIMARY KEY(MASV, MAMH)
ALTER TABLE DANGKY ADD CONSTRAINT FK_SV_DK FOREIGN KEY(MASV) REFERENCES SINHVIEN(MASV)
ALTER TABLE DANGKY ADD CONSTRAINT FK_MH_DK FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
--XOA COT
ALTER TABLE SINHVIEN DROP COLUMN NGAYSINH
--XOA RANG BUOC
ALTER TABLE  DANGKY DROP CONSTRAINT FK_DK_SV

--insert
INSERT INTO SINHVIEN(MASV,HOTEN) VALUES ('SV01', 'NGUYEN VAN A')

SELECT * FROM SINHVIEN



--COMMENT 1 LINE
/* 
COMMENT N LINE 
*/