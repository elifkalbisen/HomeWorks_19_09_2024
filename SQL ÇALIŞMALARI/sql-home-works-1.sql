-- -- --Veritabanı Oluşturma

-- CREATE DATABASE UniversiteKutuphane;

-- -- -- Veritabanını Kullanma

-- USE UniversiteKutuphane;

-- -- -- 1. Tabloları Oluşturma

-- CREATE TABLE Kitaplar (
--     KitapID INT PRIMARY KEY IDENTITY(1,1),
--     KitapAdi NVARCHAR(100) NOT NULL,
--     Yazar NVARCHAR(100) NOT NULL,
--     YayinYili INT NOT NULL,
--     SayfaSayisi INT NOT NULL,
--     ISBN NVARCHAR(20) NOT NULL
-- );

-- CREATE TABLE Dergiler (
--     DergiID INT PRIMARY KEY IDENTITY(1,1),
--     DergiAdi NVARCHAR(100) NOT NULL,
--     Yayinci NVARCHAR(100) NOT NULL,
--     YayinTarihi DATE NOT NULL,
--     Sayi INT NOT NULL
-- );

-- CREATE TABLE DVDler (
--     DVDID INT PRIMARY KEY IDENTITY(1,1),
--     DVDAdi NVARCHAR(100) NOT NULL,
--     Yonetmen NVARCHAR(100) NOT NULL,
--     YayinYili INT NOT NULL,
--     Sure INT NOT NULL
-- );

-- CREATE TABLE Ogrenciler(
--     OgrenciID INT PRIMARY KEY IDENTITY(1,1),
--     Ad NVARCHAR(50) NOT NULL,
--     Soyad NVARCHAR(50) NOT NULL,
--     DogumTarihi DATE NULL,
--     BolumID INT NOT NULL,
-- );

-- CREATE TABLE OduncAlmalar (
--     OduncID INT PRIMARY KEY IDENTITY(1,1),
--     OgrenciID INT NOT NULL,
--     KitapID INT NULL,
--     DergiID INT NULL,
--     DVDID INT NULL,
--     OduncTarihi DATE NOT NULL,
--     FOREIGN KEY (OgrenciID) REFERENCES Ogrenciler(OgrenciID),
--     FOREIGN KEY (KitapID) REFERENCES Kitaplar(KitapID),
--     FOREIGN KEY (DergiID) REFERENCES Dergiler(DergiID),
--     FOREIGN KEY (DVDID) REFERENCES DVDler(DVDID)
-- );





-- -- --2. Veri Ekleme

-- INSERT INTO Kitaplar (KitapAdi, Yazar, YayinYili, SayfaSayisi, ISBN) VALUES
-- ('Yüzüklerin Efendisi', 'J.R.R. Tolkien', 1954, 1178, '978-3-16-148410-0'),
-- ('Harry Potter ve Felsefe Taşı', 'J.K. Rowling', 1997, 223, '978-3-16-148410-1'),
-- ('Küçük Prens', 'Antoine de Saint-Exupéry', 1943, 96, '978-3-16-148410-2'),
-- ('Suç ve Ceza', 'Fyodor Dostoyevski', 1866, 430, '978-3-16-148410-3'),
-- ('Sefiller', 'Victor Hugo', 1862, 1232, '978-3-16-148410-4'),
-- ('Kayıp Zamanın İzinde', 'Marcel Proust', 1913, 4200, '978-3-16-148410-5'),
-- ('Bülbülü Öldürmek', 'Harper Lee', 1960, 281, '978-3-16-148410-6'),
-- ('1984', 'George Orwell', 1949, 328, '978-3-16-148410-7'),
-- ('Savaş ve Barış', 'Lev Tolstoy', 1869, 1225, '978-3-16-148410-8'),
-- ('Büyük Umutlar', 'Charles Dickens', 1860, 544, '978-3-16-148410-9'),
-- ('Yaban', 'Halide Edib Adıvar', 1918, 256, '978-3-16-148410-10'),
-- ('Ateşten Gömlek', 'Halide Edib Adıvar', 1920, 192, '978-3-16-148410-11'),
-- ('İnce Mehmed', 'Sabahattin Ali', 1939, 384, '978-3-16-148410-12'),
-- ('Çavdar Tarlasında Çocuklar', 'J.D. Salinger', 1951, 277, '978-3-16-148410-13'),
-- ('Kürk Mantolu Madonna', 'Sabahattin Ali', 1943, 192, '978-3-16-148410-14'),
-- ('Sineklerin Tanrısı', 'William Golding', 1954, 224, '978-3-16-148410-15'),
-- ('Yalnızız', 'Kemal Tahir', 1949, 320, '978-3-16-148410-16'),
-- ('Dönüşüm', 'Franz Kafka', 1915, 120, '978-3-16-148410-17'),
-- ('Küçük Kadınlar', 'Louisa May Alcott', 1868, 450, '978-3-16-148410-18'),
-- ('Denizler Altında Yirmi Bin Fersah', 'Jules Verne', 1870, 507, '978-3-16-148410-19');

-- -- -- Dergiler Tablosuna Veri Ekleme

-- INSERT INTO Dergiler (DergiAdi, Yayinci, YayinTarihi, Sayi) VALUES
-- ('Bilim ve Teknik', 'TÜBİTAK', '2024-01-01', 123),
-- ('National Geographic', 'National Geographic Society', '2023-12-01', 456),
-- ('Popular Science', 'Popular Science', '2024-02-01', 789),
-- ('Tarih Vakfı Yurt Yayınları', 'Tarih Vakfı', '2024-01-15', 12),
-- ('Dünya', 'İletişim Yayınları', '2024-03-01', 34);

-- -- --Öğrenci ekleme

-- INSERT INTO Ogrenciler (Ad, Soyad, BolumID) VALUES
-- ('Ali', 'Yılmaz', 1),
-- ('Ayşe', 'Kara', 1),
-- ('Mehmet', 'Çelik', 1),
-- ('Fatma', 'Demir', 1),
-- ('Ahmet', 'Öztürk', 2),
-- ('Elif', 'Aydın', 2),
-- ('Mustafa', 'Koç', 2),
-- ('Zeynep', 'Arslan', 2),
-- ('Emre', 'Yalçın', 2),
-- ('Seda', 'Tekin', 3),
-- ('Burak', 'Polat', 3),
-- ('Cem', 'Güler', 3),
-- ('Derya', 'Uçar', 3),
-- ('Aliye', 'Sönmez', 3),
-- ('Oğuz', 'Çetin', 3),
-- ('Sinem', 'Koçak', 3),
-- ('Ege', 'Korkmaz', 1),
-- ('Cansu', 'Kaya', 2),
-- ('Tugay', 'Kurt', 1),
-- ('Melike', 'Şahin', 2);

-- -- -- DVDler Tablosuna Veri Ekleme

-- INSERT INTO DVDler (DVDAdi, Yonetmen, YayinYili, Sure) VALUES
-- ('Ayla', 'Can Ulkay', 2017, 102),
-- ('Kış Uykusu', 'Nuri Bilge Ceylan', 2014, 196),
-- ('Dedemin İnsanları', 'Ömer Faruk Sorak', 2011, 96),
-- ('Açlık Oyunları', 'Gary Ross', 2012, 142),
-- ('Müslüm', 'Ketche', 2018, 130);

-- -- -- 3. Ödünç İşlemleri

-- INSERT INTO OduncAlmalar (OgrenciID, KitapID, DergiID, DVDID, OduncTarihi) VALUES
-- (1, 1, NULL, NULL, '2024-10-01'),
-- (2, NULL, 1, NULL, '2024-10-02'),
-- (3, NULL, NULL, 1, '2024-10-03'),
-- (4, 2, NULL, NULL, '2024-10-04'),
-- (5, NULL, 2, NULL, '2024-10-05'),
-- (6, NULL, NULL, 2, '2024-10-06'),
-- (7, 3, NULL, NULL, '2024-10-07'),
-- (8, NULL, 3, NULL, '2024-10-08'),
-- (9, NULL, NULL, 3, '2024-10-09'),
-- (10, 4, NULL, NULL, '2024-10-10');

-- Tüm kitapların adını, yazarını ve yayın yılını listeleyin:

-- SELECT KitapAdi, Yazar, YayinYili 
-- FROM Kitaplar;

-- Yayın yılı 2000’den sonra olan kitapların isimlerini ve yazarlarını listeleyin:

-- SELECT
--     KitapAdi,
--     Yazar 
-- FROM Kitaplar 
-- WHERE YayinYili > 2000;

--Hangi öğrencinin hangi kitapları ödünç aldığını gösteren bir liste oluşturun:

-- SELECT O.Ad, O.Soyad, K.KitapAdi 
-- FROM Ogrenciler O 
-- JOIN OduncAlmalar OA ON O.OgrenciID = OA.OgrenciID 
-- JOIN Kitaplar K ON OA.KitapID = K.KitapID;

-- En fazla sayfa sayısına sahip 5 kitabı sayfa sayısına göre azalan sırayla listeleyin:

-- SELECT KitapAdi, SayfaSayisi 
-- FROM Kitaplar 
-- ORDER BY SayfaSayisi DESC 
-- OFFSET 0 ROWS 
-- FETCH NEXT 5 ROWS ONLY;

-- "Orhan Pamuk" adlı yazarın kitaplarını listeleyin:

-- SELECT KitapAdi 
-- FROM Kitaplar 
-- WHERE Yazar = 'Orhan Pamuk';

-- Öğrencilerin ödünç aldığı dergileri ve bu dergilerin yayıncılarını listeleyin:

-- SELECT O.Ad, O.Soyad, D.DergiAdi, D.Yayinci 
-- FROM Ogrenciler O 
-- JOIN OduncAlmalar OA ON O.OgrenciID = OA.OgrenciID 
-- JOIN Dergiler D ON OA.DergiID = D.DergiID;

-- Henüz hiçbir materyal ödünç almayan öğrencileri listeleyin:

-- SELECT O.Ad, O.Soyad 
-- FROM Ogrenciler O 
-- LEFT JOIN OduncAlmalar OA ON O.OgrenciID = OA.OgrenciID 
-- WHERE OA.OgrenciID IS NULL;


-- 8. Her kitabın, derginin ve DVD'nin kaç kez ödünç alındığını gruplandırarak listeleyin:

-- SELECT 'Kitap' AS MateryalTuru, K.KitapAdi AS MateryalAdi, COUNT(OA.KitapID) AS OduncSayisi 
-- FROM Kitaplar K 
-- LEFT JOIN OduncAlmalar OA ON K.KitapID = OA.KitapID 
-- GROUP BY K.KitapAdi 

-- UNION ALL 

-- SELECT 'Dergi' AS MateryalTuru, D.DergiAdi AS MateryalAdi, COUNT(OA.DergiID) AS OduncSayisi 
-- FROM Dergiler D 
-- LEFT JOIN OduncAlmalar OA ON D.DergiID = OA.DergiID 
-- GROUP BY D.DergiAdi 

-- UNION ALL 

-- SELECT 'DVD' AS MateryalTuru, DVD.DVDAdi AS MateryalAdi, COUNT(OA.DVDID) AS OduncSayisi 
-- FROM DVDler DVD 
-- LEFT JOIN OduncAlmalar OA ON DVD.DVDID = OA.DVDID 
-- GROUP BY DVD.DVDAdi;


-- Yayın tarihi en eski olan 3 kitabı listeleyin:

-- SELECT KitapAdi, YayinYili
-- FROM Kitaplar 
-- ORDER BY YayinYili ASC 
-- OFFSET 0 ROWS 
-- FETCH NEXT 3 ROWS ONLY;

-- "Ali Yılmaz" adlı öğrencinin ödünç aldığı tüm materyalleri listeleyin:

-- SELECT O.Ad, O.Soyad, K.KitapAdi, D.DergiAdi, DVD.DVDAdi 
-- FROM Ogrenciler O 
-- LEFT JOIN OduncAlmalar OA ON O.OgrenciID = OA.OgrenciID 
-- LEFT JOIN Kitaplar K ON OA.KitapID = K.KitapID 
-- LEFT JOIN Dergiler D ON OA.DergiID = D.DergiID 
-- LEFT JOIN DVDler DVD ON OA.DVDID = DVD.DVDID 
-- WHERE O.Ad = 'Ali' AND O.Soyad = 'Yılmaz';

