-- Tạo Database
CREATE DATABASE QuanLyHoaDon;
GO

-- Sử dụng Database
USE QuanLyHoaDon;
GO

-- Tạo bảng HoaDon
CREATE TABLE HoaDon (
    ID INT PRIMARY KEY IDENTITY(1,1),
    HoVaTenNhanVien NVARCHAR(100) NOT NULL,
    HoVaTenKhachHang NVARCHAR(100) NOT NULL,
    NgayLap DATE NOT NULL,
    TongTienHoaDon DECIMAL(18,2) NOT NULL,
    XemChiTiet NVARCHAR(255) NULL
);
GO

-- Tạo bảng HoaDon_ChiTiet
CREATE TABLE HoaDon_ChiTiet (
    ID INT PRIMARY KEY IDENTITY(1,1),
    HoaDonID INT NOT NULL,
    TenSanPham NVARCHAR(200) NOT NULL,
    DonGiaBan DECIMAL(18,2) NOT NULL,
    SoLuongBan INT NOT NULL,
    ThanhTien DECIMAL(18,2) NOT NULL,
    
    CONSTRAINT FK_HoaDon_ChiTiet_HoaDon
    FOREIGN KEY (HoaDonID) REFERENCES HoaDon(ID)
);
GO

-- =========================
-- DỮ LIỆU MẪU BẢNG HoaDon
-- =========================
INSERT INTO HoaDon (HoVaTenNhanVien, HoVaTenKhachHang, NgayLap, TongTienHoaDon, XemChiTiet)
VALUES 
(N'Nguyễn Văn A', N'Trần Thị B', '2026-02-01', 1500000, N'Xem chi tiết HD1'),
(N'Lê Văn C', N'Phạm Thị D', '2026-02-05', 2750000, N'Xem chi tiết HD2'),
(N'Trần Văn E', N'Hoàng Văn F', '2026-02-10', 980000,  N'Xem chi tiết HD3');

-- ================================
-- DỮ LIỆU MẪU BẢNG HoaDon_ChiTiet
-- ================================
INSERT INTO HoaDon_ChiTiet (HoaDonID, TenSanPham, DonGiaBan, SoLuongBan, ThanhTien)
VALUES
-- Chi tiết hóa đơn 1
(1, N'Laptop Dell Inspiron', 1200000, 1, 1200000),
(1, N'Chuột Logitech', 150000, 2, 300000),

-- Chi tiết hóa đơn 2
(2, N'Điện thoại Samsung Galaxy', 2500000, 1, 2500000),
(2, N'Ốp lưng điện thoại', 250000, 1, 250000),

-- Chi tiết hóa đơn 3
(3, N'Bàn phím cơ', 700000, 1, 700000),
(3, N'Tai nghe Bluetooth', 280000, 1, 280000);

SELECT 
    hd.ID,
    hd.HoVaTenNhanVien,
    hd.HoVaTenKhachHang,
    hd.NgayLap,
    ct.TenSanPham,
    ct.DonGiaBan,
    ct.SoLuongBan,
    ct.ThanhTien
FROM HoaDon hd
JOIN HoaDon_ChiTiet ct ON hd.ID = ct.HoaDonID
ORDER BY hd.ID;