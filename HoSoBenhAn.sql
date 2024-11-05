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
    Email VARCHAR(100) UNIQUE NOT NULL
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
INSERT INTO Nguoi (CCCD, HoTen, NgaySinh, GioiTinh, SDT, DiaChi, Email) VALUES
('034204000782', 'Bui Van Nam', '1999-04-27', 'Nam', '0865942678', '275 Nguyen Trai, Thanh Xuan Trung, Thanh Xuan, Ha Noi', 'nam274@gmail.com'),
('009201234567', 'Hoang Van Hung', '2001-03-01', 'Nam', '0934567812', '117/4H Ho Van Long, Tan Tao, Binh Tan, Ho Chi Minh', 'hung.hoangvan@gmail.com'),
('027277654321', 'Le Thi Lan Huong', '1977-04-10', 'Nu', '0912345679', 'D. Hong Bang, TP. Hai Phong', 'huonglanle77@gmail.com'),
('045391234567', 'Pham Van Kien', '1991-08-23', 'Nam', '0987654321', 'D. Hoang Dieu, TP. Da Nang', 'kienpham1991@gmail.com'),
('036201987654', 'Nguyen Thi Hoa', '2001-07-15', 'Nu', '0923456789', 'D. Nguyen Trai, TP. Nam Dinh', 'hoa.nguyen2001@gmail.com'),
('040389987654', 'Phan Thi Nhu Y', '1989-07-24', 'Nu', '0945678901', '4 Ng. 176 P. Le Trong Tan, Khuong Mai, Thanh Xuan, Ha Noi', 'phannhuy2407@gmail.com'),
('027202234567', 'Nguyen Tuan Khang', '2002-01-05', 'Nam', '0919876543', '41 P. Phuong Liet, Phuong Liet, Thanh Xuan, Ha Noi', 'khangnguyen2k@gmail.com'),
('035307001456', 'Nguyen Thi Lan', '2007-05-11', 'Nu', '0978423416', '11 Pho Nam Cao, Giang Vo, Ba Dinh, Ha Noi', 'lan185.hn@gmail.com'),
('040389004513', 'Nguyen Lan Chi', '1989-11-04', 'Nu', '0915202456', 'Xom An Phu, Nghia Dan, Nghe An', 'chichi89@gmail.com'),
('001277012536', 'Le Thanh Cong', '1977-01-14', 'Nam', '0908460204', '184 D. Truong Chinh, Khuong Thuong, Dong Da, Ha Noi', 'thcong.1977@gmail.com'),
('001200123456', 'Le Hoai Nam', '2000-03-15', 'Nam', '0977456789', '10 Ng. 134 P. Le Trong Tan, Khuong Mai, Thanh Xuan, Ha Noi', 'namle2000@gmail.com'),
('015210456789', 'Dao Minh Chau', '2010-06-05', 'Nu', '0901765432', 'D. Tran Phu, TP. Ha Giang', 'chau.minhdao02@gmail.com'),
('036201789012', 'Vu Thi Hang', '2001-09-18', 'Nu', '0972345678', 'D. Bach Dang, TP. Ha Long, Quang Ninh', 'hangvu1908@gmail.com'),
('045397876543', 'Dao Thi Ai', '1997-11-18', 'Nu', '0986543210', 'Khom 2, Thi Tran Krong Klang, Huyen Dakrong, Quang Tri', 'ai18111997@gmail.com'),
('036201123098', 'Phan Van Ban', '2001-05-09', 'Nam', '0934567890', '627 D. Giai Phong, Van Mieu, Nam Dinh', 'banpv2001@gmail.com'),
('015202098765', 'Phan Ha Tuan', '2002-06-21', 'Nam', '0909876543', '505A D. Giai Phong, Truong Thi, Nam Dinh', 'htuan.phan02@gmail.com'),
('033200456789', 'Pham Viet Hung', '2000-12-12', 'Nam', '0993876543', 'Gan tram xa cong an, Nguyen Van Linh, Chi Thanh, Hung Yen', 'hungpv2000@gmail.com'),
('009201283746', 'Dinh Van Tu', '2001-04-30', 'Nam', '0946321098', '3 Trang Tien, Phan Chu Trinh, Hoan Kiem, Ha Noi', 'tu.dinh2001@gmail.com'),
('041393345678', 'Nguyen Thi Ngoc Mai', '1993-02-25', 'Nu', '0913210987', '191 P. Ba Trieu, Le Dai Hanh, Hai Ba Trung, Ha Noi', 'ngocmai93@gmail.com'),
('017288374651', 'Le Cong Thanh', '1988-03-03', 'Nam', '0965432109', 'QL6, Thu Phong, Cao Phong, Hoa Binh, Viet Nam', 'thanhlc1988@gmail.com'),
('027201283746', 'Bui Van Son', '2001-04-19', 'Nam', '0923748593', 'So 5 Ngo 203, Hao Nam, Dong Da, Ha Noi', 'sonbui1904@gmail.com'),
('045391098765', 'Tran Thi Thu Ha', '1991-09-22', 'Nu', '0902765421', '23 P. Dang Dung, Phuong Quan Thanh, Ba Dinh, Ha Noi', 'thuhatran1991@gmail.com'),
('012277654321', 'Dang Hoang Nam', '1977-12-14', 'Nam', '0981765432', '18 Ng. 42 P. Doi Can, Ba Dinh, Ha Noi', 'hoangnam1977@gmail.com'),
('033200765432', 'Pham Thi Hoai Thuong', '2000-08-16', 'Nu', '0942765431', '21 Ng. 214 P. Doi Can, Ba Dinh, Ha Noi', 'thuongpham@gmail.com'),
('012200234567', 'Vu Minh Quang', '2000-05-01', 'Nam', '0973765412', '12 P. Dai Co Viet, Le Dai Hanh, Hai Ba Trung, Ha Noi', 'quangminhvu2000@gmail.com'),
('035200987654', 'Tran Huu Minh', '2000-06-12', 'Nam', '0901283746', '2 Ng. 214 P. Doi Can, Ba Dinh, Ha Noi', 'huuminhtran@gmail.com'),
('040389654321', 'Le Thi Bich Ngoc', '1989-07-23', 'Nu', '0934875690', '56 P. Doi Can, Ba Dinh, Ha Noi', 'ngocbichle230789@gmail.com'),
('001277567890', 'Pham Van Tung', '1977-10-20', 'Nam', '0975478921', '78 P. Dang Thai Mai, Quang An, Tay Ho, Ha Noi', 'vantungpham77@gmail.com'),
('033200123456', 'Nguyen Thi Thu Trang', '2000-09-15', 'Nu', '0924871234', '34 P. Dang Dung, Quan Thanh, Ba Dinh, Ha Noi', 'thu.trang2000@gmail.com'),
('045397321654', 'Vu Thi Anh Dao', '1997-04-09', 'Nu', '0912048756', '67 P. Dang Van Ngu, Phu Nhuan, TP Ho Chi Minh', 'daovu1997@gmail.com'),
('036201456789', 'Tran Van Nam', '2001-02-18', 'Nam', '0906482937', '12 P. Truong Chinh, Tan Binh, TP. Ho Chi Minh', 'namtv2001@gmail.com'),
('015202789012', 'Pham Thi Quynh', '2002-08-25', 'Nu', '0942047589', '45 P. Phan Dinh Phung, Ba Dinh, Ha Noi', 'quynhpham02@gmail.com'),
('001200897654', 'Le Minh Tuan', '2000-11-30', 'Nam', '0978394756', '78 P. Ly Thai To, Hoan Kiem, Ha Noi', 'tuanle2000@gmail.com'),
('040389012345', 'Pham Thi Hong Nhung', '1989-05-14', 'Nu', '0925478123', '14 P. Nguyen Trai, Thanh Xuan, Ha Noi', 'hongnhungpham@gmail.com'),
('001277234567', 'Nguyen Van Binh', '1977-12-27', 'Nam', '0902147589', '90 P. Kim Ma, Ba Dinh, Ha Noi', 'binhnguyen77@gmail.com'),
('041393876543', 'Tran Van Binh', '1993-08-16', 'Nam', '0934765432', 'D. Truong Chinh, TP. Quy Nhon, Binh Dinh', 'binhtran1993@gmail.com'),
('027201456789', 'Le Thi Thanh', '2001-03-04', 'Nu', '0912678945', 'D. Le Hong Phong, TP. Hai Phong', 'thanhle2001@gmail.com'),
('040389765432', 'Nguyen Van Hai', '1989-05-27', 'Nam', '0945876543', 'D. Le Duan, TP. Vinh, Nghe An', 'hainguyen89@gmail.com'),
('033200987654', 'Phan Thi Nhung', '2000-12-11', 'Nu', '0973456789', 'D. Hung Vuong, TP. Hue, Thua Thien Hue', 'nhungphan2000@gmail.com'),
('041302234567', 'Nguyen Thi Mai', '1993-03-27', 'Nu', '0942756431', 'Duong Le Hong Phong, TP. Quy Nhon, Binh Dinh', 'mai.nguyen93@gmail.com'),
('027201765432', 'Tran Van Hung', '2001-04-19', 'Nam', '0912875643', 'Duong Phan Boi Chau, TP. Hai Phong', 'hung.tran2001@gmail.com'),
('040389876543', 'Le Thi Hanh', '1989-08-02', 'Nu', '0923654789', 'Duong Tran Phu, TP. Vinh, Nghe An', 'hanhle1989@gmail.com'),
('033200133456', 'Pham Van Quang', '2000-07-05', 'Nam', '0901234567', 'Duong Nguyen Hue, TP. Hue, Thua Thien Hue', 'quangpham2000@gmail.com'),
('015202345678', 'Vu Thi Hoa', '2002-09-21', 'Nu', '0932145678', 'Duong Ngo Quyen, TP. Ha Giang', 'hoa.vu02@gmail.com'),
('036201654321', 'Hoang Thi Lan', '2001-05-12', 'Nu', '0943765123', 'Duong Nguyen Van Cu, TP. Ha Long, Quang Ninh', 'lanhoang2001@gmail.com'),
('009201765432', 'Tran Minh Huy', '2001-02-03', 'Nam', '0912345678', 'Duong Cach Mang Thang 8, Quan 1, TP. Ho Chi Minh', 'huy.tran2001@gmail.com'),
('027277987654', 'Le Van Nam', '1977-01-14', 'Nam', '0901234569', 'Duong Tran Hung Dao, TP. Hai Phong', 'nam.le1977@gmail.com'),
('045311876543', 'Nguyen Thi Hang', '1991-06-11', 'Nu', '0987654322', 'Duong Bach Dang, TP. Da Nang', 'hang.nguyen1991@gmail.com'),
('036201432109', 'Phan Minh Anh', '2001-03-09', 'Nam', '0912345671', 'Duong Phan Boi Chau, TP. Nam Dinh', 'anh.phan2001@gmail.com'),
('027201876543', 'Nguyen Thi Bich', '2001-05-22', 'Nu', '0945789123', 'Duong Nguyen Duc Canh, TP. Hai Phong', 'bichnguyen2001@gmail.com'),
('040389123456', 'Tran Van Hoang', '1989-10-15', 'Nam', '0932654789', 'Duong Tran Hung Dao, TP. Vinh, Nghe An', 'hoang.tran1989@gmail.com'),
('033200654321', 'Le Thi Thu', '2000-11-08', 'Nu', '0971654321', 'Duong Le Loi, TP. Hue, Thua Thien Hue', 'thule2000@gmail.com'),
('015202987654', 'Pham Van Hung', '2002-04-17', 'Nam', '0913654789', 'Duong Minh Khai, TP. Ha Giang', 'hungpham02@gmail.com'),
('036201543210', 'Vu Minh Anh', '2001-12-19', 'Nam', '0902134567', 'Duong Le Thanh Tong, TP. Ha Long, Quang Ninh', 'anh.vuminh2001@gmail.com'),
('009201876543', 'Tran Thi Thanh Huong', '2001-02-28', 'Nu', '0973214568', 'Duong Dien Bien Phu, Quan 1, TP. Ho Chi Minh', 'huong.tranthanh@gmail.com'),
('027277123456', 'Le Van Tam', '1977-07-05', 'Nam', '0934875123', 'Duong Hoang Hoa Tham, TP. Hai Phong', 'tamle1977@gmail.com'),
('045311543210', 'Nguyen Van Thanh', '1991-09-14', 'Nam', '0912543678', 'Duong Nguyen Van Linh, TP. Da Nang', 'thanh.nguyen91@gmail.com'),
('036201345678', 'Pham Thi Lan', '2001-08-11', 'Nu', '0903546789', 'Duong Tran Nhat Duat, TP. Nam Dinh', 'lan.pham2001@gmail.com'),
('041302543210', 'Tran Van Huu', '1993-04-23', 'Nam', '0934215678', 'Duong Nguyen Hue, TP. Quy Nhon, Binh Dinh', 'huu.tran93@gmail.com'),
('040389432109', 'Le Thi Hong', '1989-05-06', 'Nu', '0942134657', 'Duong Tran Hung Dao, TP. Vinh, Nghe An', 'hongle89@gmail.com'),
('033200321456', 'Nguyen Van Toan', '2000-12-19', 'Nam', '0902543678', 'Duong Phan Dinh Phung, TP. Hue, Thua Thien Hue', 'toannguyen2000@gmail.com'),
('015202123456', 'Tran Thi Minh', '2002-11-12', 'Nu', '0932145670', 'Duong Nguyen Trai, TP. Ha Giang', 'minh.tranth@gmail.com'),
('036201678901', 'Vu Thi Thu Hang', '2001-07-25', 'Nu', '0912454789', 'Duong Dinh Tien Hoang, TP. Ha Long, Quang Ninh', 'hangvu2001@gmail.com'),
('009201543210', 'Hoang Van Minh', '2001-01-13', 'Nam', '0972134567', 'Duong Bui Vien, Quan 1, TP. Ho Chi Minh', 'minhhoang01@gmail.com'),
('027277876543', 'Le Thi Mai Huong', '1977-08-22', 'Nu', '0912654789', 'Duong Hoang Hoa Tham, TP. Hai Phong', 'huongmai.le77@gmail.com'),
('045391654321', 'Nguyen Thi Le', '1991-02-14', 'Nu', '0903214567', 'Duong Nguyen Van Linh, TP. Da Nang', 'le.nguyen1991@gmail.com'),
('001388454231', 'Cao Van Tu', '1988-03-18', 'Nam', '0974562581', 'Ap Thanh Ba, Can Giuoc, Long An', 'tucao88@gmail.com');

INSERT INTO NguoiGiamHo(CCCD) VALUES
('041393876543'), ('027201456789')

INSERT INTO BenhNhan (MaBenhNhan, CCCD, NGH_CCCD, TienSuBenhAn) VALUES
('BN001', '034204000782', NULL, 'Cao huyet ap'),
('BN002', '009201234567', NULL, 'Tieu duong'),
('BN003', '027277654321', NULL, 'Di ung phan hoa'),
('BN004', '045391234567', NULL, 'Viem gan B'),
('BN005', '036201987654', NULL, 'Viem xoang'),
('BN006', '040389987654', NULL, 'Tieu duong'),
('BN007', '027202234567', NULL, 'Mat ngu'),
('BN008', '035307001456', '041393876543', 'Loang xuong'),
('BN009', '040389004513', NULL, 'Thoai hoa cot song'),
('BN010', '001277012536', NULL, 'Suy ho hap'),
('BN011', '001200123456', NULL, 'Dau da day'),
('BN012', '015210456789', '027201456789', 'Roi loan tieu hoa'),
('BN013', '036201789012', NULL, 'Hen xuyen'),
('BN014', '045397876543', NULL, 'Tieu duong'),
('BN015', '036201123098', NULL, 'Di ung tom'),
('BN016', '015202098765', NULL, 'Mat ngu'),
('BN017', '033200456789', NULL, 'Dau da day'),
('BN018', '009201283746', NULL, 'Cao huyet ap'),
('BN019', '041393345678', NULL, 'Di ung phan hoa'),
('BN020', '017288374651', NULL, 'Mat ngu'),
('BN021', '027201283746', NULL, 'Cao huyet ap'),
('BN022', '045391098765', NULL, 'Viem xoang'),
('BN023', '012277654321', NULL, 'Di ung'),
('BN024', '033200765432', NULL, 'Tieu duong'),
('BN025', '012200234567', NULL, 'Trao nguoc da day'),
('BN026', '035200987654', NULL, 'Suy than'),
('BN027', '040389654321', NULL, 'Di ung tom'),
('BN028', '001277567890', NULL, 'Viem khop'),
('BN029', '033200123456', NULL, 'Suy giap'),
('BN030', '045397321654', NULL, 'Thieu mau'),
('BN031', '036201456789', NULL, 'Bieng an'),
('BN032', '015202789012', NULL, 'Loet da day'),
('BN033', '001200897654', NULL, 'Tram cam'),
('BN034', '040389012345', NULL, 'Tai bien mach mau nao'),
('BN035', '001277234567', NULL, 'Di ung thoi tiet');

INSERT INTO BacSi (MaBacSi, CCCD, ChuyenKhoa) VALUES
('BS001', '040389765432', 'Hoi suc cap cuu'),
('BS002', '033200987654', 'Ung buou'),
('BS003', '041302234567', 'Tam than'),
('BS004', '027201765432', 'Xet nghiem'),
('BS005', '040389876543', 'Chan doan hinh anh'),
('BS006', '033200123456', 'Y hoc co truyen'),
('BS007', '015202345678', 'Tai - Mui - Hong'),
('BS008', '036201654321', 'Rang - Ham - Mat'),
('BS009', '009201765432', 'Da lieu'),
('BS010', '027277987654', 'Khoa Nhi'),
('BS011', '045311876543', 'Khoa San'),
('BS012', '036201432109', 'Tim mach'),
('BS013', '027201765432', 'Khoa Mat'),
('BS014', '040389123456', 'Khoa Phu san'),
('BS015', '033200654321', 'Chan thuong chinh hinh'),
('BS016', '015202987654', 'Than kinh'),
('BS017', '036201543210', 'Than - Tiet nieu'),
('BS018', '009201876543', 'Phuc hoi chuc nang'),
('BS019', '027277123456', 'Ngoai tong quat'),
('BS020', '045311543210', 'Gay me hoi suc'),
('BS021', '036201345678', 'Huyet hoc'),
('BS022', '041302543210', 'Khoa Duoc'),
('BS023', '040389432109', 'Phau thuat long nguc'),
('BS024', '033200321456', 'Co xuong khop'),
('BS025', '015202123456', 'Phau thuat tao hinh tham my'),
('BS026', '036201678901', 'Ho hap'),
('BS027', '009201543210', 'Dinh duong'),
('BS028', '027277876543', 'Phau thuat than kinh'),
('BS029', '045391654321', 'Di ung'),
('BS030', '001388454231', 'Tieu hoa');

