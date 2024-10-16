-- -- --Veritabanı Oluşturma

-- CREATE DATABASE OkulYonetim;
-- USE OkulYonetim;

-- 1. Tabloları Oluşturma

-- CREATE TABLE Personel (
--     PersonelID INT PRIMARY KEY IDENTITY(1,1),
--     Ad VARCHAR(50),
--     Soyad VARCHAR(50),
--     Pozisyon VARCHAR(50),
--     BaslangicTarihi DATE
-- );

-- CREATE TABLE Maaslar (
--     MaasID INT PRIMARY KEY IDENTITY(1,1),
--     PersonelID INT,
--     MaasMiktari DECIMAL(10, 2),
--     GuncellemeTarihi DATE,
--     FOREIGN KEY (PersonelID) REFERENCES Personel(PersonelID)
-- );

--2. Veri Ekleme
-- Personel Ekleme

-- INSERT INTO Personel (Ad, Soyad, Pozisyon, BaslangicTarihi)
-- VALUES
-- ('Ali', 'Kara', 'Okul Müdürü', '2022-01-15'),
-- ('Ayşe', 'Yılmaz', 'Öğretmen', '2021-09-01'),
-- ('Mehmet', 'Can', 'Öğretmen', '2020-03-12'),
-- ('Fatma', 'Bolu', 'Sekreter', '2019-07-18'),
-- ('Ahmet', 'Deniz', 'Öğretmen', '2023-01-05'),
-- ('Elif', 'Güneş', 'Sekreter', '2018-11-20'),
-- ('Zeynep', 'Duman', 'Okul Müdürü', '2020-06-14'),
-- ('Kemal', 'Yıldız', 'Öğretmen', '2019-05-24'),
-- ('Selin', 'Baş', 'Öğretmen', '2022-02-10'),
-- ('Murat', 'Demir', 'Öğretmen', '2021-11-09');

-- -- İlk Maaşlar

-- INSERT INTO Maaslar (PersonelID, MaasMiktari, GuncellemeTarihi)
-- VALUES
-- (1, 8000, '2022-01-15'),
-- (2, 4500, '2021-09-01'),
-- (3, 4700, '2020-03-12'),
-- (4, 3500, '2019-07-18'),
-- (5, 4600, '2023-01-05'),
-- (6, 3400, '2018-11-20'),
-- (7, 8100, '2020-06-14'),
-- (8, 4800, '2019-05-24'),
-- (9, 4700, '2022-02-10'),
-- (10, 4900, '2021-11-09');

-- -- Maaş Güncellemeleri

-- INSERT INTO Maaslar (PersonelID, MaasMiktari, GuncellemeTarihi)
-- VALUES
-- (1, 8200, '2023-01-01'),
-- (2, 4700, '2022-06-01'),
-- (3, 4900, '2021-12-01'),
-- (4, 3600, '2020-12-01'),
-- (5, 4800, '2023-07-01'),
-- (6, 3500, '2020-05-01'),
-- (7, 8300, '2022-03-01'),
-- (8, 5000, '2021-08-01'),
-- (9, 4900, '2023-03-01'),
-- (10, 5100, '2022-10-01');

-- 4. SORGULAR

--Her personelin mevcut maaşını listeleyin (En son güncelleme tarihine göre)

-- SELECT p.Ad, p.Soyad, m.MaasMiktari
-- FROM Personel p
-- JOIN Maaslar m ON p.PersonelID = m.PersonelID
-- WHERE m.GuncellemeTarihi = (SELECT MAX(GuncellemeTarihi) FROM Maaslar WHERE PersonelID = p.PersonelID);

-- Tüm personelin ortalama maaşını hesaplayan bir sorgu yazın.

-- SELECT AVG(MaasMiktari) AS OrtalamaMaas FROM Maaslar;

--Aynı pozisyonda çalışan personelin maaşlarını karşılaştırarak en yüksek ve en düşük maaşları getirin.

-- SELECT Pozisyon, MAX(MaasMiktari) AS EnYuksekMaas, MIN(MaasMiktari) AS EnDusukMaas
-- FROM Personel p
-- JOIN Maaslar m ON p.PersonelID = m.PersonelID
-- GROUP BY Pozisyon;

--Tüm personelin adını, soyadını ve pozisyonunu listeleyin. (SELECT ve FROM)

-- SELECT Ad, Soyad, Pozisyon FROM Personel;

--Hangi pozisyonda kaç personel çalıştığını gösteren bir liste oluşturun. (GROUP BY ve COUNT)

-- SELECT Pozisyon, COUNT(*) AS PersonelSayisi
-- FROM Personel
-- GROUP BY Pozisyon;

--Her personelin en son maaş miktarını ve güncelleme tarihini listeleyin. (JOIN ve MAX)

-- SELECT p.Ad, p.Soyad, m.MaasMiktari, m.GuncellemeTarihi
-- FROM Personel p
-- JOIN Maaslar m ON p.PersonelID = m.PersonelID
-- WHERE m.GuncellemeTarihi = (SELECT MAX(GuncellemeTarihi) FROM Maaslar WHERE PersonelID = p.PersonelID);

--"Öğretmen" pozisyonunda çalışan tüm personelleri listeleyin. (WHERE)

-- SELECT Ad, Soyad
-- FROM Personel
-- WHERE Pozisyon = 'Öğretmen';

--Tüm personelin ortalama maaşını hesaplayın. (AVG)

-- SELECT AVG(MaasMiktari) AS OrtalamaMaas FROM Maaslar;

--En yüksek maaş alan personelin adını, soyadını ve maaşını listeleyin. (ORDER BY ve LIMIT)

-- SELECT TOP 1 p.Ad, p.Soyad, m.MaasMiktari
-- FROM Personel p
-- JOIN Maaslar m ON p.PersonelID = m.PersonelID
-- ORDER BY m.MaasMiktari DESC;


--Bir personelin tüm maaş değişikliklerini kronolojik sırayla listeleyin. (WHERE ve ORDER BY)

-- SELECT MaasMiktari, GuncellemeTarihi
-- FROM Maaslar
-- WHERE PersonelID = 1 -- Belirli bir PersonelID'yi girin
-- ORDER BY GuncellemeTarihi;

--Aynı pozisyondaki personellerin maaşlarını karşılaştırarak en yüksek ve en düşük maaşı listeleyin. (GROUP BY ve HAVING)

-- SELECT Pozisyon, MAX(MaasMiktari) AS EnYuksekMaas, MIN(MaasMiktari) AS EnDusukMaas
-- FROM Personel p
-- JOIN Maaslar m ON p.PersonelID = m.PersonelID
-- GROUP BY Pozisyon
-- HAVING COUNT(*) > 1;

--Son 6 ay içinde maaşı güncellenen personelleri listeleyin. (WHERE ve DATEADD)

-- SELECT p.Ad, p.Soyad, m.GuncellemeTarihi
-- FROM Personel p
-- JOIN Maaslar m ON p.PersonelID = m.PersonelID
-- WHERE m.GuncellemeTarihi >= DATEADD(MONTH, -6, GETDATE());

--Maaşı en az iki kez güncellenmiş olan personelleri listeleyin. (GROUP BY ve HAVING)

-- SELECT PersonelID
-- FROM Maaslar
-- GROUP BY PersonelID
-- HAVING COUNT(*) >= 2;

