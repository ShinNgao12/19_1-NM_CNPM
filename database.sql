create database OnlineCourse;

use OnlineCourse;

create table Log_In
(
    ID_LogIn int auto_increment primary key,
    UserName varchar(50) null,
    Pass varchar(15) null
);

create table TaiKhoan
(
    MaTK int auto_increment primary key,
    SoTK varchar(20) null,
    SoDu float(25) null,
    NganHangLK nvarchar(30) null
);

create table HocVien
(
    MaHV int auto_increment primary key,
    HoTen nvarchar(50) null,
    NgaySinh datetime null,
    GioiTinh char(3) null,
    SoDienThoai varchar(15) null,
    Email varchar(30) null,
    DiaChi varchar(30) null,
    MaTK int null,
    ID_LogIn int null,
        constraint FK_HocVien_TaiKhoan
    foreign key (MaTK) references TaiKhoan (MaTK),
        constraint FK_HocVien_Log_In
    foreign key (ID_LogIn) references Log_In (ID_LogIn)
);

create table GiaoVien
(
    MaGV int auto_increment primary key,
    HoTen nvarchar(50) null,
    NgaySinh datetime null,
    GioiTinh char(3) null,
    SoDienThoai varchar(15) null,
    Email varchar(30) null,
    DiaChi varchar(30) null,
    MaTK int null,
    LinkAvatar varchar(255) null,
    ID_LogIn int null,
        constraint FK_GiaoVien_TaiKhoan
    foreign key (MaTK) references TaiKhoan (MaTK),
        constraint FK_GiaoVien_Log_In
    foreign key (ID_LogIn) references Log_In (ID_LogIn)
);

create table KhoaHoc
(
    MaKH int auto_increment primary key,
    TenKH varchar(45)  null,
    NgayTao datetime null,
    NgayBD datetime null,
    NgayKT datetime null,
    HocPhi float(25) null,
    SLHV_Max int null,
    MoTa nvarchar(225) null,
    LinhVuc nvarchar(30) null,
    LichHoc nvarchar(100) null,
    TrangThaiHD nvarchar(20) null,
    Slug varchar(255) null,
    LinkImage varchar(255) null,
    LinkVideo varchar(255) null,
    GVCN int null,
        constraint FK_KhoaHoc_GiaoVien
    foreign key (GVCN) references GiaoVien (MaGV)
);

create table HocVien_TG_KhoaHoc
(
    MaHV int not null,
    MaKH int not null,
    NgayTG datetime null,
    TinhTrang nvarchar(20) null,
    constraint PK_HocVien_TG_KhoaHoc primary key (MaHV,MaKH),
        constraint FK_HocVien_TG_KhoaHoc_HocVien
    foreign key (MaHV) references HocVien (MaHV),
        constraint FK_HocVien_TG_KhoaHoc_KhoaHoc
    foreign key (MaKH) references KhoaHoc (MaKH)
);

create table HocVienPhanHoi
(
    STT int auto_increment not null,
    MaHV int not null,
    MaKH int not null,
    NoiDung nvarchar(225) null,
    ThoiGian datetime null,
    constraint PK_HocVienPhanHoi primary key (STT,MaHV,MaKH),
        constraint FK_HocVienPhanHoi_HocVien
    foreign key (MaHV) references HocVien (MaHV),
        constraint FK_HocVienPhanHoi_KhoaHoc
    foreign key (MaKH) references KhoaHoc (MaKH)
);

create table GiaoVienPhanHoi
(
    STT int auto_increment not null,
    MaGV int not null,
    MaKH int not null,
    NoiDung nvarchar(225) null,
    ThoiGian datetime null,
    constraint PK_GiaoVienPhanHoi primary key (STT,MaGV,MaKH),
        constraint FK_GiaoVienPhanHoi_HocVien
    foreign key (MaGV) references GiaoVien (MaGV),
        constraint FK_GiaoVienPhanHoi_KhoaHoc
    foreign key (MaKH) references KhoaHoc (MaKH)
);

insert Log_In(UserName,Pass) values('dnhung@gmail.com','123456');
insert Log_In(UserName,Pass) values('hrose@gmail.com','123456');
insert Log_In(UserName,Pass) values('huuphu@gmail.com','123456');
insert Log_In(UserName,Pass) values('anhquoc@gmail.com','123456');
insert Log_In(UserName,Pass) values('phuthu@gmail.com','123456');
insert Log_In(UserName,Pass) values('anhtuan@gmail.com','123456');

insert GiaoVien(HoTen,Email,LinkAvatar,ID_LogIn) 
	values(N'Đàm Vĩnh Hưng','dnhung@gmail.com',null,1);
insert GiaoVien(HoTen,Email,LinkAvatar,ID_LogIn) 
	values(N'Huấn Rose','hrose@gmail.com',null,2);
insert GiaoVien(HoTen,Email,LinkAvatar,ID_LogIn) 
	values(N'Nguyễn Hữu Phú','huuphu@gmail.com',null,3);
insert GiaoVien(HoTen,Email,LinkAvatar,ID_LogIn) 
	values(N'Nguyễn Anh Quốc','anhquoc@gmail.com',null,4);
insert GiaoVien(HoTen,Email,LinkAvatar,ID_LogIn) 
	values(N'Nguyễn Phú Thụ','phuthu@gmail.com',null,5);
insert GiaoVien(HoTen,Email,LinkAvatar,ID_LogIn) 
	values(N'Lê Huỳnh Minh Tuấn','minhtuan@gmail.com',null,6);

insert KhoaHoc(TenKH,LinhVuc,TrangThaiHD,LinkImage,LinkVideo,GVCN)
	values(N'JavaScript',N'IT',N'Đang mở',null,null,1);
insert KhoaHoc(TenKH,LinhVuc,TrangThaiHD,LinkImage,LinkVideo,GVCN)
	values(N'HTML/CSS',N'IT',N'Đang mở',null,null,2);
insert KhoaHoc(TenKH,LinhVuc,TrangThaiHD,LinkImage,LinkVideo,GVCN)
	values(N'NodeJS',N'IT',N'Đang mở',null,null,3);
insert KhoaHoc(TenKH,LinhVuc,TrangThaiHD,LinkImage,LinkVideo,GVCN)
	values(N'ReactJS',N'IT',N'Đang mở',null,null,4);
insert KhoaHoc(TenKH,LinhVuc,TrangThaiHD,LinkImage,LinkVideo,GVCN)
	values(N'C/C++',N'IT',N'Sắp mở',null,null,5);
insert KhoaHoc(TenKH,LinhVuc,TrangThaiHD,LinkImage,LinkVideo,GVCN)
	values(N'Python',N'IT',N'Sắp mở',null,null,6);
insert KhoaHoc(TenKH,LinhVuc,TrangThaiHD,LinkImage,LinkVideo,GVCN)
	values(N'Julia',N'IT',N'Sắp mở',null,null,1);
insert KhoaHoc(TenKH,LinhVuc,TrangThaiHD,LinkImage,LinkVideo,GVCN)
	values(N'TOEIC',N'Tiếng Anh',N'Sắp mở',null,null,3);
insert KhoaHoc(TenKH,LinhVuc,TrangThaiHD,LinkImage,LinkVideo,GVCN)
	values(N'IELTS',N'Tiếng Anh',N'Sắp mở',null,null,4);
	