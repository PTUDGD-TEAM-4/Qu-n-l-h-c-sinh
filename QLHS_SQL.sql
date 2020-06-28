use master
go
create database QLHS
go
use QLHS
go
create table TaiKhoan
(
Id int identity constraint PK_Acc primary key,
TenHienThi nvarchar(100) not null,
TenDN nvarchar(100) not null,
Password nvarchar(1000) not null,
);
go
Insert into TaiKhoan(TenHienThi,TenDN,Password) values
(N'Host',N'Host',N'0'),
(N'Nhom4',N'Nhom4',N'.')
go
select * from TaiKhoan
go

create table MonHoc
(
MaMonHoc varchar(20) constraint PK_MonHoc primary key,
TenMonHoc nvarchar(20) ,
);
go

insert into MonHoc 
values
('Toan',N'Toán'),
('Ly',N'Lý'),
('Hoa',N'Hóa')
go
--delete from MonHoc;
select * from MonHoc
go
select MonHoc.MaMonHoc 
from MonHoc 
where MonHoc.TenMonHoc = TenMonHoc

create table SoHocKi
(
MaHocKi varchar(10) constraint PK_HocKi primary key,
HocKi nvarchar(10),
);
go

insert into SoHocKi
values('HK1',N'Học Kì 1'),
	  ('HK2',N'Học Ki 2')
go

select * from SoHocKi
go

create table Lop
(
MaLop varchar(10)  constraint PK_Lop primary key,
TenLop nvarchar(10)not null  default ' ',
);
go

alter table Lop
add SiSo int
go

insert into Lop
values
('10A1',N'Lớp 10A1',40),
('10A2',N'Lớp 10A2',40),
('10A3',N'Lớp 10A3',40),
('10A4',N'Lớp 10A4',40),
('11A1',N'Lớp 11A1',40),
('11A2',N'Lớp 11A2',40),
('11A3',N'Lớp 11A3',40),
('12A1',N'Lớp 12A1',40),
('12A2',N'Lớp 12A2',40)
go
select * from Lop
go

create table HocSinh
(
MaHS varchar(50) constraint PK_HocSinh primary key,
HoTen nvarchar(50) not null default ' ',
NgaySinh date not null,
GioiTinh nvarchar(5)not null, --0  la nam,1 la nu
Email varchar (100), 
DiaChi nvarchar(100),
TenLop varchar(10) not null,
constraint FK_HocSinh foreign key(TenLop) references Lop(MaLop)
);
go

insert into HocSinh values
('103001',N'Trần Thị Xuân Diễm','2004-11-04',N'Nữ','xuandiem1814@gmail.com',N'Quận 1','10A1'),
('103004',N'Đặng Sơn Hải', '2004-01-05',N'Nam','dangsonhai.ld@gmail.com',N'Quận 10','10A1'),
('103014',N'Chế Chí Công', '2004-10-17',N'Nam','chechicong.@gmail.com',N'Quận 12','10A1'),
('103043',N'Phạm Thị Bình', '2004-04-13',N'Nữ','binh.hdnn@gmail.com',N'Quận 11','10A1'),
('103015',N'Phạm Công Duy', '2004-01-05',N'Nam','duypc.ld@gmail.com',N'Quận 7','10A1'),
('103018',N'Hà Tử Hào', '2004-10-31',N'Nam','tuhao3110@gmail.com',N'Quận 11','10A1'),
('103020',N'Trần Huỳnh Minh Hương', '2004-12-22',N'nữ','huongtran.2212@gmail.com',N'Quận 4','10A1'),
('103021',N'Đỗ Văn Khoa', '2004-11-04',N'Nam','dovankhoa.2105@gmail.com',N'Quận 8','10A1'),
('103022',N'Cao Lâm Vĩnh Khuê', '2004-05-31',N'Nam','lamvinh1112@gmail.com',N'Quận 11','10A1'),
('103024',N'Ngô Hồ Hoàng Long', '2004-09-15',N'Nam','hoanglongngoho@gmail.com',N'Quận 11','10A1'),
('103025',N'Ngô Thị Lượm', '2004-11-11',N'Nữ','ngothiluom083@gmail.com',N'Quận 9','10A1'),
('103027',N'Đặng Thanh Ngân', '2004-08-14',N'Nam','thanhngan1482000@gmail.com',N'Quận 10','10A1'),
('103007',N'Nguyễn Thị Kim Ngọc', '2004-10-15',N'Nữ','ngocnguyen.15102000@gmail.com',N'Quận 6','10A1'),
('103011',N'Ngô Ngọc Thạch', '2004-01-29',N'Nam','ngongocthachtcg@gmail.com',N'Quận 11','10A1'),
('103038',N'Lương Thị Thơm', '2004-02-19',N'Nữ','luongdinhthanh78@gmail.com',N'Quận 11','10A1'),
('103039',N'Võ Hoàng Minh Thư', '2004-09-05',N'Nữ','danuyennn@gmail.com',N'Quận 12','10A1'),
('103031',N'Nguyễn Cao Tiến', '2004-10-18',N'Nam','nguyencaotien99999@gmail.com',N'Quận 1','10A1'),
('103032',N'Nguyễn Hồ Trọng Tín', '2004-09-15',N'Nam','nhttin1509@gmail.com',N'Quận 11','10A1'),
('103033',N'Nguyễn Kiều Trung Tính', '2004-06-15',N'Nam','blackrabit112@gmail.com',N'Quận 3','10A1'),
('103041',N'Nguyễn Ngọc Bảo Trân', '2004-12-11',N'Nữ','baotranvt12@gmail.com',N'Quận 5','10A1')
go
select * from HocSinh
go

create table Diem
(
MaHS varchar(50),
TenMonHoc varchar(20) not null,
Diem15p float(2) not null,
Diem45p float(2) not null,
DiemCuoiHK float(2) not null,
HocKi varchar(10),
constraint FK_DiemHS foreign key(MaHS) references HocSinh(MaHS),
constraint FK_DiemMH foreign key(TenMonHoc) references MonHoc(MaMonHoc),
constraint FK_HocKi foreign key(HocKi)  references SohocKi(MaHocKi)
);
go

create table DiemTB
(
MaHS varchar(50),
MaMon varchar(20),
DTB float,
MaHocKi varchar(10),
constraint FK_DIEMTB_HS foreign key(MaHS) references HocSinh(MaHS),
constraint FK_DIEMTB_MON foreign key(MaMon) references MonHoc(MaMonHoc),
constraint FK_DIEMTB_HocKi foreign key(MaHocKi) references SoHocKi(MaHocKi)
)
go

create table DiemTBHK
(
MaHS varchar(50),
DTBHK float,
Lop varchar(20),
MaHocKi varchar(10),
constraint FK_DIEMTBHK_HS foreign key(MaHS) references HocSinh(MaHS),
constraint FK_DIEMTBHK_HocKi foreign key(MaHocKi) references SoHocKi(MaHocKi)
)
go

create proc USP_Login
@userName varchar(20), @passWord varchar(8)
as begin
select TaiKhoan.Id from TaiKhoan where TaiKhoan.TenDN=@userName and TaiKhoan.Password=@passWord
end
go
--------------------------------------
create proc USP_ThemHS
@MaHS varchar(50),@Hoten nvarchar(100),@NgaySinh date,@GioiTinh nvarchar(5),@Email varchar(100),@DiaChi nvarchar(100),@TenLop varchar(10)
as
begin
Insert into HocSinh(MaHS,HoTen,NgaySinh,GioiTinh,Email,DiaChi,TenLop) values
(@MaHS,@Hoten,@NgaySinh,@GioiTinh,@Email,@DiaChi,@TenLop)
end
go

create proc USP_SiSo
@Lop varchar(10)
as
begin
select count(*)
from HocSinh,Lop
where HocSinh.TenLop=Lop.MaLop
and Lop.MaLop=@Lop
end
go

-----
create proc USP_ThemMonHoc
@TenMonHoc nvarchar(20),@MaMonHoc varchar(20)
as begin
insert into MonHoc values(@MaMonHoc,@TenMonHoc)
end
go

create proc USP_ThemDiem
@MaHS varchar(50),@TenMonHoc nvarchar(20),@Diem15p float(2),@Diem45p float(2),@DiemCuoiHK float(2),@HocKi varchar(10)
as
begin
insert into Diem(MaHS,TenMonHoc,Diem15p,Diem45p,DiemCuoiHK,HocKi)
values(@MaHS,@TenMonHoc,@Diem15p,@Diem45p,@DiemCuoiHK,@HocKi)
end
go


create proc USP_SuaDiem
@MaHS varchar(50),@MonHoc varchar(10),@MaHocKi varchar(20),@Diem15p float(2),@Diem45p float(2),@DiemCuoiHK float(2)
as
begin
update Diem	set Diem15p=@Diem15p,Diem45p=@Diem45p,DiemCuoiHK=@DiemCuoiHK 
where Diem.MaHS=@MaHS and Diem.HocKi=@MaHocKi and Diem.TenMonHoc=@MonHoc
end
go

create proc USP_ThemHocKi
@HocKi varchar(10),@MaHocKi varchar(10)
as begin
insert into SoHocKi values(@MaHocKi,@HocKi)
end
go


create proc USP_TraCuuBangDiem
@TenLop varchar(10),@TenMonHoc nvarchar(20),@HocKi varchar(10)
as begin
select Diem.MaHS,HocSinh.HoTen,Diem.Diem15p,Diem.Diem45p,Diem.DiemCuoiHK from HocSinh,Diem,MonHoc,SoHocKi

where Diem.MaHS=HocSinh.MaHS 
and Diem.TenMonHoc=MonHoc.MaMonHoc
and Diem.HocKi=SoHocKi.MaHocKi

and HocSinh.TenLop=@TenLop
and MonHoc.MaMonHoc=@TenMonHoc
and SoHocKi.MaHocKi=@HocKi
end
go