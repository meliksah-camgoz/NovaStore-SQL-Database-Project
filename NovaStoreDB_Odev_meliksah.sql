-- =========================================================
-- NOVASTORE E-TİCARET VERİ YÖNETİM SİSTEMİ
-- Veritabanı: NovaStoreDB
-- Veritabanı Yönetim Sistemi: MySQL
-- =========================================================


-- =========================================================
-- BÖLÜM 1 - VERİTABANI OLUŞTURMA
-- =========================================================

-- Daha önce oluşturulmuş veritabanı varsa siler.
-- Teslim dosyasını sıfırdan çalıştırmak için kullanılır.

DROP DATABASE IF EXISTS NovaStoreDB;

-- NovaStoreDB veritabanının oluşturulması
CREATE DATABASE NovaStoreDB;

-- Oluşturulan veritabanının seçilmesi
USE NovaStoreDB;


-- =========================================================
-- BÖLÜM 1 - TABLOLARIN OLUŞTURULMASI
-- =========================================================


-- ---------------------------------------------------------
-- 1. Categories Tablosu
-- Kategorilerin tutulduğu tablo
-- ---------------------------------------------------------

CREATE TABLE Categories
(
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);


-- ---------------------------------------------------------
-- 2. Products Tablosu
-- Ürünlerin tutulduğu tablo
-- Categories tablosu ile CategoryID üzerinden ilişkilidir.
-- ---------------------------------------------------------

CREATE TABLE Products
(
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0,
    CategoryID INT NOT NULL,

    CONSTRAINT FK_Products_Categories
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
);


-- ---------------------------------------------------------
-- 3. Customers Tablosu
-- Müşteri bilgilerinin tutulduğu tablo
-- ---------------------------------------------------------

CREATE TABLE Customers
(
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(50) NOT NULL,
    City VARCHAR(20),
    Email VARCHAR(100) UNIQUE NOT NULL
);


-- ---------------------------------------------------------
-- 4. Orders Tablosu
-- Sipariş bilgilerinin tutulduğu tablo
-- Customers tablosu ile CustomerID üzerinden ilişkilidir.
-- ---------------------------------------------------------

CREATE TABLE Orders
(
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);


-- ---------------------------------------------------------
-- 5. OrderDetails Tablosu
-- Siparişlerde bulunan ürünlerin tutulduğu tablo
-- Orders ve Products tabloları ile ilişkilidir.
-- ---------------------------------------------------------

CREATE TABLE OrderDetails
(
    DetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,

    CONSTRAINT FK_OrderDetails_Orders
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    CONSTRAINT FK_OrderDetails_Products
        FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);


-- =========================================================
-- BÖLÜM 2 - VERİ GİRİŞLERİ
-- =========================================================


-- ---------------------------------------------------------
-- GÖREV 1 - Kategorilerin Eklenmesi
-- ---------------------------------------------------------

INSERT INTO Categories (CategoryName)
VALUES
('Elektronik'),
('Bilgisayar'),
('Telefon'),
('Kozmetik'),
('Ev ve Yaşam');


-- ---------------------------------------------------------
-- GÖREV 2 - Ürünlerin Eklenmesi
-- Her kategoriye 10 ürün olmak üzere toplam 50 ürün
-- ---------------------------------------------------------

INSERT INTO Products (ProductName, Price, Stock, CategoryID)
VALUES

-- ELEKTRONİK
('Kablosuz Kulaklık', 1299.90, 25, 1),
('Bluetooth Hoparlör', 899.90, 18, 1),
('Akıllı Saat', 2499.90, 12, 1),
('Powerbank 20000mAh', 749.90, 30, 1),
('Web Kamera', 1099.90, 15, 1),
('USB Mikrofon', 1599.90, 8, 1),
('LED Masa Lambası', 499.90, 22, 1),
('Akıllı TV Kumandası', 349.90, 17, 1),
('Kablosuz Şarj Standı', 699.90, 14, 1),
('Taşınabilir SSD 1TB', 2899.90, 10, 1),

-- BİLGİSAYAR
('Gaming Laptop', 42999.90, 7, 2),
('Ofis Laptop', 24999.90, 12, 2),
('Mekanik Klavye', 1799.90, 20, 2),
('Gaming Mouse', 1299.90, 25, 2),
('Mouse Pad XL', 599.90, 30, 2),
('24 Inch Monitör', 6999.90, 11, 2),
('27 Inch Gaming Monitör', 9999.90, 8, 2),
('Laptop Standı', 899.90, 16, 2),
('USB-C Hub', 1199.90, 19, 2),
('Harici HDD 2TB', 2499.90, 13, 2),

-- TELEFON
('NovaPhone X1', 32999.90, 9, 3),
('NovaPhone X1 Pro', 44999.90, 6, 3),
('NovaPhone Lite', 19999.90, 15, 3),
('Telefon Kılıfı', 399.90, 40, 3),
('Ekran Koruyucu', 249.90, 50, 3),
('Hızlı Şarj Adaptörü', 899.90, 28, 3),
('USB-C Şarj Kablosu', 399.90, 35, 3),
('Araç Telefon Tutucu', 599.90, 21, 3),
('Bluetooth Araç Kiti', 799.90, 18, 3),
('Kablosuz Şarj Cihazı', 999.90, 16, 3),

-- KOZMETİK
('Nemlendirici Krem', 449.90, 35, 4),
('Yüz Temizleme Jeli', 349.90, 30, 4),
('Güneş Kremi SPF50', 599.90, 25, 4),
('Parfüm 50ml', 1499.90, 18, 4),
('Şampuan', 299.90, 40, 4),
('Saç Kremi', 279.90, 38, 4),
('El Kremi', 199.90, 45, 4),
('Dudak Nemlendiricisi', 149.90, 50, 4),
('Makyaj Çantası', 399.90, 22, 4),
('Cilt Bakım Seti', 1299.90, 12, 4),

-- EV VE YAŞAM
('Kahve Makinesi', 4999.90, 10, 5),
('Elektrikli Süpürge', 7499.90, 8, 5),
('Airfryer', 5999.90, 13, 5),
('Blender Seti', 2299.90, 15, 5),
('Çay Makinesi', 2999.90, 11, 5),
('Masa Saati', 399.90, 20, 5),
('Nevresim Takımı', 1299.90, 17, 5),
('Dekoratif Abajur', 799.90, 14, 5),
('Saklama Kabı Seti', 499.90, 26, 5),
('Bambu Organizer', 349.90, 23, 5);


-- ---------------------------------------------------------
-- GÖREV 3 - Müşteri Kayıtlarının Eklenmesi
-- ---------------------------------------------------------

INSERT INTO Customers (FullName, City, Email)
VALUES
('Ahmet Yılmaz', 'İstanbul', 'ahmet.yilmaz@example.com'),
('Elif Demir', 'Ankara', 'elif.demir@example.com'),
('Mehmet Kaya', 'İzmir', 'mehmet.kaya@example.com'),
('Zeynep Çelik', 'Bursa', 'zeynep.celik@example.com'),
('Burak Şahin', 'Antalya', 'burak.sahin@example.com'),
('Ceren Aydın', 'Kocaeli', 'ceren.aydin@example.com');


-- ---------------------------------------------------------
-- GÖREV 4 - Sipariş Kayıtlarının Eklenmesi
-- ---------------------------------------------------------

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, '2026-09-20 10:15:00', 4199.70),
(2, '2026-09-21 14:30:00', 7499.80),
(3, '2026-09-22 11:45:00', 5299.70),
(4, '2026-09-24 16:20:00', 3099.80),
(5, '2026-09-26 09:50:00', 8499.70),
(6, '2026-09-27 13:10:00', 2499.80),
(1, '2026-09-29 15:40:00', 6599.70),
(3, '2026-10-01 12:25:00', 3899.80);


-- ---------------------------------------------------------
-- Sipariş Detaylarının Eklenmesi
-- ---------------------------------------------------------

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES

-- Sipariş 1
(1, 1, 2),
(1, 7, 1),

-- Sipariş 2
(2, 11, 1),
(2, 13, 1),

-- Sipariş 3
(3, 21, 1),
(3, 26, 1),

-- Sipariş 4
(4, 31, 2),
(4, 33, 1),

-- Sipariş 5
(5, 41, 1),
(5, 43, 1),

-- Sipariş 6
(6, 3, 1),
(6, 5, 1),

-- Sipariş 7
(7, 16, 1),
(7, 17, 1),

-- Sipariş 8
(8, 22, 1),
(8, 28, 1);


-- =========================================================
-- BÖLÜM 3 - SELECT / JOIN / GROUP BY SORGULARI
-- =========================================================


-- ---------------------------------------------------------
-- GÖREV 1
-- Stok miktarı 20'den az olan ürünler
-- ---------------------------------------------------------

SELECT
    ProductID,
    ProductName,
    Price,
    Stock
FROM Products
WHERE Stock < 20
ORDER BY Stock ASC;


-- ---------------------------------------------------------
-- GÖREV 2
-- Müşteri ve sipariş bilgileri
-- ---------------------------------------------------------

SELECT
    c.CustomerID,
    c.FullName AS Musteri,
    c.City AS Sehir,
    o.OrderID,
    o.OrderDate AS SiparisTarihi,
    o.TotalAmount AS SiparisTutari
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
ORDER BY o.OrderDate;


-- ---------------------------------------------------------
-- GÖREV 3
-- Belirli bir müşterinin aldığı ürünler
-- Örnek müşteri: Ahmet Yılmaz
-- ---------------------------------------------------------

SELECT
    c.FullName AS Musteri,
    o.OrderID,
    o.OrderDate AS SiparisTarihi,
    p.ProductName AS Urun,
    od.Quantity AS Adet,
    p.Price AS BirimFiyat,
    (od.Quantity * p.Price) AS AraToplam
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails od
    ON o.OrderID = od.OrderID
INNER JOIN Products p
    ON od.ProductID = p.ProductID
WHERE c.FullName = 'Ahmet Yılmaz'
ORDER BY o.OrderDate;


-- ---------------------------------------------------------
-- GÖREV 4
-- Kategori bazında ürün sayısı
-- ---------------------------------------------------------

SELECT
    c.CategoryName AS Kategori,
    COUNT(p.ProductID) AS UrunSayisi
FROM Categories c
LEFT JOIN Products p
    ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY UrunSayisi DESC;


-- ---------------------------------------------------------
-- GÖREV 5
-- Müşteri bazında toplam ciro
-- ---------------------------------------------------------

SELECT
    c.CustomerID,
    c.FullName AS Musteri,
    SUM(o.TotalAmount) AS ToplamCiro
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FullName
ORDER BY ToplamCiro DESC;


-- ---------------------------------------------------------
-- GÖREV 6
-- Siparişlerin bugüne göre kaç günlük olduğu
-- ---------------------------------------------------------

SELECT
    OrderID,
    CustomerID,
    OrderDate AS SiparisTarihi,
    DATEDIFF(CURDATE(), DATE(OrderDate)) AS GunOnce
FROM Orders
ORDER BY OrderDate;


-- =========================================================
-- BÖLÜM 4 - İLERİ SQL
-- =========================================================


-- ---------------------------------------------------------
-- GÖREV 7
-- Müşteri, sipariş ve ürün bilgilerini gösteren VIEW
-- ---------------------------------------------------------

CREATE VIEW vw_OrderDetails AS
SELECT
    o.OrderID,
    c.FullName AS Musteri,
    c.City AS Sehir,
    o.OrderDate AS SiparisTarihi,
    p.ProductName AS Urun,
    od.Quantity AS Adet,
    p.Price AS BirimFiyat,
    (od.Quantity * p.Price) AS AraToplam,
    o.TotalAmount AS SiparisToplami
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID
INNER JOIN OrderDetails od
    ON o.OrderID = od.OrderID
INNER JOIN Products p
    ON od.ProductID = p.ProductID;


-- VIEW kontrolü

SELECT *
FROM vw_OrderDetails
ORDER BY OrderID;


-- =========================================================
-- BÖLÜM 5 - VERİTABANI KONTROLLERİ
-- =========================================================


-- Kategori sayısı

SELECT COUNT(*) AS KategoriSayisi
FROM Categories;


-- Ürün sayısı

SELECT COUNT(*) AS UrunSayisi
FROM Products;


-- Müşteri sayısı

SELECT COUNT(*) AS MusteriSayisi
FROM Customers;


-- Sipariş sayısı

SELECT COUNT(*) AS SiparisSayisi
FROM Orders;


-- Sipariş detayı sayısı

SELECT COUNT(*) AS SiparisDetaySayisi
FROM OrderDetails;


-- Tüm tabloların kayıt sayılarını tek seferde gösterme

SELECT
    'Categories' AS Tablo,
    COUNT(*) AS KayitSayisi
FROM Categories

UNION ALL

SELECT
    'Products',
    COUNT(*)
FROM Products

UNION ALL

SELECT
    'Customers',
    COUNT(*)
FROM Customers

UNION ALL

SELECT
    'Orders',
    COUNT(*)
FROM Orders

UNION ALL

SELECT
    'OrderDetails',
    COUNT(*)
FROM OrderDetails;


-- =========================================================
-- PROJE SONU
-- NOVASTORE E-TİCARET VERİ YÖNETİM SİSTEMİ
-- =========================================================