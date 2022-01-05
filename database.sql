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
    DiaChi varchar(50) null,
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
    DiaChi varchar(50) null,
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

insert Log_In(UserName,Pass) values('vinhhung@gmail.com','123456');
insert Log_In(UserName,Pass) values('thuytrang@gmail.com','123456');
insert Log_In(UserName,Pass) values('huuphu@gmail.com','123456');
insert Log_In(UserName,Pass) values('anhquoc@gmail.com','123456');
insert Log_In(UserName,Pass) values('phuthu@gmail.com','123456');
insert Log_In(UserName,Pass) values('minhtuan@gmail.com','123456');
insert Log_In(UserName,Pass) values('peter@gmail.com','123456');
insert Log_In(UserName,Pass) values('tony@gmail.com','123456');
insert Log_In(UserName,Pass) values('bruce@gmail.com','123456');
insert Log_In(UserName,Pass) values('clark@gmail.com','123456');

insert GiaoVien(HoTen,NgaySinh,GioiTinh,SoDienThoai,Email,DiaChi,MaTK,LinkAvatar,ID_LogIn) 
	values(N'Đàm Vĩnh Hưng','1989-09-09',N'Nam','0111111111','vinhhung@gmail.com',N'Đường D4, Vũng Tàu, Bà Rịa Vũng Tàu',null,'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',1);
insert GiaoVien(HoTen,NgaySinh,GioiTinh,SoDienThoai,Email,DiaChi,MaTK,LinkAvatar,ID_LogIn) 
	values(N'Lê Thùy Trang','1996-22-3',N'Nữ','0222222222','thuytrang@gmail.com',N'Đường CN2, Nam Từ Liêm, Hà Nội',null,'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',2);
insert GiaoVien(HoTen,NgaySinh,GioiTinh,SoDienThoai,Email,DiaChi,MaTK,LinkAvatar,ID_LogIn) 
	values(N'Nguyễn Hữu Phú','2001-11-10',N'Nam','0333333333','huuphu@gmail.com',N'Đường Phan Văn Lưu, Bến Lức, Long An',null,'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',3);
insert GiaoVien(HoTen,NgaySinh,GioiTinh,SoDienThoai,Email,DiaChi,MaTK,LinkAvatar,ID_LogIn) 
	values(N'Nguyễn Anh Quốc','2001-11-11',N'Nam','0444444444','anhquoc@gmail.com',N'Đường Tân Kỳ Tân Quý, Tân Bình, Hồ Chí Minh',null,'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',4);
insert GiaoVien(HoTen,NgaySinh,GioiTinh,SoDienThoai,Email,DiaChi,MaTK,LinkAvatar,ID_LogIn) 
	values(N'Nguyễn Phú Thụ','2001-11-12',N'Nam','0555555555','phuthu@gmail.com',N'Phố Thanh Đàm, Hoàng Mai, Hà Nội',null,'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',5);
insert GiaoVien(HoTen,NgaySinh,GioiTinh,SoDienThoai,Email,DiaChi,MaTK,LinkAvatar,ID_LogIn) 
	values(N'Lê Huỳnh Minh Tuấn','2000-03-02',N'Nam','0666666666','minhtuan@gmail.com',N'Phố Hai Bà Trưng, Sơn Hòa, Phú Yên',null,'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',6);
insert GiaoVien(HoTen,NgaySinh,GioiTinh,SoDienThoai,Email,DiaChi,MaTK,LinkAvatar,ID_LogIn) 
	values(N'Peter Parker','1996-06-01',N'Nam','0777777777','peter@gmail.com',N'Đường Lý Thái Tổ, Bỉm Sơn, Thanh Hóa',null,'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',7);
insert GiaoVien(HoTen,NgaySinh,GioiTinh,SoDienThoai,Email,DiaChi,MaTK,LinkAvatar,ID_LogIn) 
	values(N'Tony Stark','1985-04-04',N'Nam','0888888888','tony@gmail.com',N'Đường Thuỷ Sơn 5, Ngũ Hành Sơn, Đà Nẵng',null,'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',8);
insert GiaoVien(HoTen,NgaySinh,GioiTinh,SoDienThoai,Email,DiaChi,MaTK,LinkAvatar,ID_LogIn) 
	values(N'Bruce Wayne','1988-05-04',N'Nam','0999999999','bruce@gmail.com',N'Đường Phần Lăng 11, Thanh Khê, Đà Nẵng',null,'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',9);
insert GiaoVien(HoTen,NgaySinh,GioiTinh,SoDienThoai,Email,DiaChi,MaTK,LinkAvatar,ID_LogIn) 
	values(N'Clark Kent','1989-06-04',N'Nam','0101010101','clark@gmail.com',N'Đường Triệu Quốc Đạt, Cẩm Lệ, Đà Nẵng',null,'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',10);

insert KhoaHoc(TenKH,NgayTao,NgayBD,NgayKT,HocPhi,SLHV_Max,MoTa,LinhVuc,LichHoc,TrangThaiHD,Slug,LinkImage,LinkVideo,GVCN)
	values(N'JavaScript','2022-01-01','2022-01-10','2022-03-03',1000000,30,N'm o  t a',
	N'IT',N'09:30-11:00 Thứ 2,4,6 mỗi tuần',N'Đang mở',null,'https://i2.wp.com/enrollmind.com/wp-content/uploads/2021/10/Free-Javascript-Course-For-Beginners.jpg',null,1);
insert KhoaHoc(TenKH,NgayTao,NgayBD,NgayKT,HocPhi,SLHV_Max,MoTa,LinhVuc,LichHoc,TrangThaiHD,Slug,LinkImage,LinkVideo,GVCN)
	values(N'HTML/CSS','2022-01-01','2022-01-11','2022-03-21',1100000,35,N'm o  t a',
	N'IT',N'16:30-18:00 Thứ 2,4,6 mỗi tuần',N'Đang mở',null,'https://miro.medium.com/max/750/1*eTuCOcn_u09KDIkEKoOhZQ.jpeg',null,3);
insert KhoaHoc(TenKH,NgayTao,NgayBD,NgayKT,HocPhi,SLHV_Max,MoTa,LinhVuc,LichHoc,TrangThaiHD,Slug,LinkImage,LinkVideo,GVCN)
	values(N'NodeJS','2022-01-01','2022-01-12','2022-03-22',1200000,40,N'm o  t a',
	N'IT',N'16:30-18:00 Thứ 3,5,7 mỗi tuần',N'Đang mở',null,'https://rafaellaurindo.com.br/wp-content/uploads/2019/01/nodejs-vale-a-pena-vantagens.jpg',null,4);
insert KhoaHoc(TenKH,NgayTao,NgayBD,NgayKT,HocPhi,SLHV_Max,MoTa,LinhVuc,LichHoc,TrangThaiHD,Slug,LinkImage,LinkVideo,GVCN)
	values(N'ReactJS','2022-01-01','2022-01-13','2022-03-23',1500000,30,N'm o  t a',
	N'IT',N'09:30-11:00 Thứ 3,5,7 mỗi tuần',N'Đang mở',null,'https://miro.medium.com/max/1400/1*EVqCcmCPgpNKxU1wzcTHgw.png',null,5);
insert KhoaHoc(TenKH,NgayTao,NgayBD,NgayKT,HocPhi,SLHV_Max,MoTa,LinhVuc,LichHoc,TrangThaiHD,Slug,LinkImage,LinkVideo,GVCN)
	values(N'C/C++','2022-01-01','2022-01-14','2022-03-24',2100000,35,N'm o  t a',
	N'IT',N'09:30-11:00 Thứ 2,4,6 mỗi tuần',N'Đang mở',null,'https://miro.medium.com/max/2000/1*oiwBIOAfbC5oN8Ml67arTQ.png',null,6);
insert KhoaHoc(TenKH,NgayTao,NgayBD,NgayKT,HocPhi,SLHV_Max,MoTa,LinhVuc,LichHoc,TrangThaiHD,Slug,LinkImage,LinkVideo,GVCN)
	values(N'Python','2022-01-01','2022-01-20','2022-03-25',1800000,40,N'm o  t a',
	N'IT',N'16:30-18:00 Thứ 2,4,6 mỗi tuần',N'Sắp mở',null,'https://cdn.springpeople.com/media/python%20logo.png',null,7);
insert KhoaHoc(TenKH,NgayTao,NgayBD,NgayKT,HocPhi,SLHV_Max,MoTa,LinhVuc,LichHoc,TrangThaiHD,Slug,LinkImage,LinkVideo,GVCN)
	values(N'Julia','2022-01-01','2022-01-21','2022-03-26',1900000,30,N'm o  t a',
	N'IT',N'09:30-11:00 Thứ 3,5,7 mỗi tuần',N'Sắp mở',null,'https://news.mit.edu/sites/default/files/styles/news_article__image_gallery/public/images/201808/julia-programming-language-mit-00_0.png',null,8);
insert KhoaHoc(TenKH,NgayTao,NgayBD,NgayKT,HocPhi,SLHV_Max,MoTa,LinhVuc,LichHoc,TrangThaiHD,Slug,LinkImage,LinkVideo,GVCN)
	values(N'TOEIC ADVANCED 700+','2022-01-22','2022-01-17','2022-03-23',2200000,35,N'm o  t a',
	N'Tiếng Anh',N'16:30-18:00 Thứ 3,5,7 mỗi tuần',N'Sắp mở',null,'https://www.dolenglish.vn/wp-content/uploads/2021/08/toeic.jpg',null,9);
insert KhoaHoc(TenKH,NgayTao,NgayBD,NgayKT,HocPhi,SLHV_Max,MoTa,LinhVuc,LichHoc,TrangThaiHD,Slug,LinkImage,LinkVideo,GVCN)
	values(N'IELTS 8.0','2022-01-01','2022-01-23','2022-03-28',2900000,40,N'm o  t a',
	N'Tiếng Anh',N'16:30-18:00 Thứ 3,5,7 mỗi tuần',N'Sắp mở',null,'https://acet.edu.vn/wp-content/uploads/2021/03/hoc-ielts-8-0.jpg',null,10);
insert KhoaHoc(TenKH,NgayTao,NgayBD,NgayKT,HocPhi,SLHV_Max,MoTa,LinhVuc,LichHoc,TrangThaiHD,Slug,LinkImage,LinkVideo,GVCN)
	values(N'TOEFL iBT','2022-01-01','2022-01-24','2022-03-29',2500000,30,N'm o  t a',
	N'Tiếng Anh',N'16:30-18:00 Thứ 2,4,6 mỗi tuần',N'Sắp mở',null,'https://indec.vn/wp-content/uploads/2021/03/image2-11.png',null,2);	
