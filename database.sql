create database OnlineCourse;

use OnlineCourse;

create table Log_In
(
    ID_LogIn int primary key,
    UserName varchar(15) null,
    Password varchar(15) null
);

create table TaiKhoan
(
    MaTK int primary key,
    SoTK varchar(20) null,
    SoDu float(25) null,
    NganHangLK nvarchar(30) null
);

create table HocVien
(
    MaHV int primary key,
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
    MaGV int primary key,
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
    MaKH int primary key,
    TenKH varchar(45)  null,
    NgayTao datetime null,
    NgayBD datetime null,
    NgayKT datetime null,
    HocPhi float(25) null,
    SLHV_Max int null,
    MoTa nvarchar(225) null,
    LinhVuc nvarchar(30) null,
    LichHoc nvarchar(100) null,
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
    STT int not null,
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
    STT int not null,
    MaGV int not null,
    MaKH int not null,
    NoiDung nvarchar(225) null,
    ThoiGian datetime null,
    constraint PK_GiaoVienPhanHoi primary key (STT,MaGV,MaKH),
        constraint FK_GiaoVienPhanHoi_HocVien
    foreign key (MaGV) references GiaoVien (MaGV),
        constraint FK_GiaoVienPhanHoi_KhoaHoc
    foreign key (MaKH) references KhoaHoc (MaKH)
);create database OnlineCourse;

use OnlineCourse;

create table Log_In
(
    ID_LogIn int primary key,
    UserName varchar(15) null,
    Password varchar(15) null
);

create table TaiKhoan
(
    MaTK int primary key,
    SoTK varchar(20) null,
    SoDu float(25) null,
    NganHangLK nvarchar(30) null
);

create table HocVien
(
    MaHV int primary key,
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
    MaGV int primary key,
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
    MaKH int primary key,
    TenKH varchar(45)  null,
    NgayTao datetime null,
    NgayBD datetime null,
    NgayKT datetime null,
    HocPhi float(25) null,
    SLHV_Max int null,
    MoTa nvarchar(225) null,
    LinhVuc nvarchar(30) null,
    LichHoc nvarchar(100) null,
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
    STT int not null,
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
    STT int not null,
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