CREATE DATABASE HoSoBenhAn
USE HoSoBenhAn

--Tạo bảng
CREATE TABLE Nguoi (
    CCCD VARCHAR(12) PRIMARY KEY,
    HoTen VARCHAR(50) NOT NULL,
    NgaySinh DATE NOT NULL,
    GioiTinh VARCHAR(10),
    SDT CHAR(10) UNIQUE NOT NULL,
    DiaChi VARCHAR(100),
    Email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE NguoiGiamHo (
    CCCD VARCHAR(12) PRIMARY KEY,
    FOREIGN KEY (CCCD) REFERENCES Nguoi(CCCD)
);

CREATE TABLE BenhNhan (
    MaBenhNhan VARCHAR(20) PRIMARY KEY,                  
    CCCD VARCHAR(12) NOT NULL,                  
    NGH_CCCD VARCHAR(12),                        
    TienSuBenhAn TEXT,     
	FOREIGN KEY (CCCD) REFERENCES Nguoi(CCCD),
    FOREIGN KEY (NGH_CCCD) REFERENCES NguoiGiamHo(CCCD) 
);

CREATE TABLE BacSi (
    MaBacSi VARCHAR(20) PRIMARY KEY,
	CCCD VARCHAR(12) NOT NULL,
    ChuyenKhoa VARCHAR(100) NOT NULL,
	FOREIGN KEY (CCCD) REFERENCES Nguoi(CCCD)
);

CREATE TABLE Kham (
    MaBenhNhan VARCHAR(20),
    MaBacSi VARCHAR(20),
    FOREIGN KEY (MaBenhNhan) REFERENCES BenhNhan(MaBenhNhan),
    FOREIGN KEY (MaBacSi) REFERENCES BacSi(MaBacSi)
);

CREATE TABLE HoSoBenhAn (
    MaHoSo VARCHAR(20) PRIMARY KEY,              
    MaBenhNhan VARCHAR(20) NOT NULL,            
    NgayNhapVien DATE NOT NULL,                 
    NgayXuatVien DATE,                       
    ChanDoan TEXT NOT NULL,                
    PhuongAnDieuTri TEXT NOT NULL,           
    KetQua TEXT,        
    FOREIGN KEY (MaBenhNhan) REFERENCES BenhNhan(MaBenhNhan)  
);

CREATE TABLE DichVuYTe (
    MaDichVu VARCHAR(20) PRIMARY KEY,           
    MaBenhNhan VARCHAR(20) NOT NULL,            
    ChiPhi DECIMAL(10, 2) NOT NULL,              
    TenDichVu VARCHAR(100) NOT NULL,             
    FOREIGN KEY (MaBenhNhan) REFERENCES BenhNhan(MaBenhNhan)  
);

CREATE TABLE TheoDoi (
    MaBacSi VARCHAR(20) NOT NULL,
    MaHoSo VARCHAR(20) NOT NULL,
	FOREIGN KEY (MaBacSi) REFERENCES BacSi(MaBacSi),
    FOREIGN KEY (MaHoSo) REFERENCES HoSoBenhAn(MaHoSo),
	UNIQUE (MaBacSi, MaHoSo)
);

CREATE TABLE DonThuoc (
    MaDon VARCHAR(20) PRIMARY KEY,
    MaBacSi VARCHAR(20) NOT NULL,
    LieuDung VARCHAR(50),
    NgayKeDon DATE,
    FOREIGN KEY (MaBacSi) REFERENCES BacSi(MaBacSi)
);

CREATE TABLE LoaiThuoc (
    MaThuoc VARCHAR(20) PRIMARY KEY,
    MaDon VARCHAR(20) NOT NULL,
    TenLoai VARCHAR(100),
    NhaSanXuat VARCHAR(100),
    FOREIGN KEY (MaDon) REFERENCES DonThuoc(MaDon)
);

CREATE TABLE LichSuKham (
    MaHoSo VARCHAR(20),                                  
    MaBenhNhan VARCHAR(20),                              
    MaBacSi VARCHAR(20),                                
    MaDon VARCHAR(20),                                  
    NgayGioKham DATETIME NOT NULL,               
    FOREIGN KEY (MaHoSo) REFERENCES HoSoBenhAn(MaHoSo),      
    FOREIGN KEY (MaBenhNhan) REFERENCES BenhNhan(MaBenhNhan),
    FOREIGN KEY (MaBacSi) REFERENCES BacSi(MaBacSi),         
    FOREIGN KEY (MaDon) REFERENCES DonThuoc(MaDon)           
);

--Insert dữ liệu