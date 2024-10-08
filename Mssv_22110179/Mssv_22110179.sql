--22110179
--Nguyen Minh Quy
--SQL sever

CREATE DATABASE Csdl_Taxi;
GO

USE Csdl_Taxi;

CREATE TABLE LAIXE(
	MaLX			int				not null,
	Ho				varchar(15)		not null,
	Dem				varchar(15),
	Ten				varchar(15)		not null,
	NgaySinh		date,
	SoGP			char(12)		not null,
	HanGP			date			not null,
	constraint	PK_LAIXE primary key (MaLX),
	constraint	AK_LAIXE unique (MaLX),
);

CREATE TABLE CALAMVIEC(
	MaCLV			int				not null,
	MaLX			int				not null,
	SoPT			int				not null,
	BatDau			timestamp,
	KetThuc			timestamp,
	constraint	PK_CALAMVIEC primary key (MaCLV),
	constraint	FK_CALAMVIEC_LAIXE foreign key (MaLX)
								   references LAIXE (MaLX),
	constraint	AK_CALAMVIEC unique (MaCLV)
);

CREATE TABLE PHUONGTIEN(
	LoaiPT			int					not null,
	SoPT			int					not null,
	BienSo			char(10)			not null,
	NamSanXuat		int					not null,
	ChuPT			int,
	TinhTrang		int check (TinhTrang in ('0','1')) not null default 1,
	constraint	PK_PHUONGTIEN primary key (SoPT),
	constraint  FK_PHUONGTIEN_LAIXE foreign key (ChuPT)
									references LAIXE (MaLX)
);

CREATE TABLE LOAI_PHUONGTIEN(
	LoaiPT		int			not null,
	TenLoai		varchar(64) not null,
	constraint	PK_LOAI_PHUONGTIEN primary key (LoaiPT),
	constraint	AK_LOAI_PHUONGTIEN unique (LoaiPT),
);

insert into LOAI_PHUONGTIEN
values('1','Hatchback'),
	  ('2','Sedan'),
	  ('3','SUV');

insert into	PHUONGTIEN
values('2','1','51E-135.75','2018',null,'1'),
	  ('3','2','51E-482.36','2018','2','1');

insert into CALAMVIEC
values('1','1','1','2023-01-01 8:00:00','2023-01-01 16:00:00'),
      ('2','2','2','2023-02-01 10:00:00','2023-02-01 18:00:00');

UPDATE

insert into LAIXE
values('1','Nguyen','Van','Tung','2000-01-15','799876543210','2030-07-05'),
	  ('2','Le','Quoc','Huy','1998-02-20','798765432109','2032-11-20');
