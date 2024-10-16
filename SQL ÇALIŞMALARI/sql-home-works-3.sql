-- CREATE DATABASE OgrenciKulupYonetim;

-- USE OgrenciKulupYonetim;

-- 2. Tabloları Oluşturma

-- CREATE TABLE Kulupler (
--     KulupID INT PRIMARY KEY IDENTITY(1,1),
--     KulupAdi VARCHAR(100),
--     KurulusYili INT
-- );

-- CREATE TABLE OgrenciKulup (
--     OgrenciID INT,
--     KulupID INT,
--     Rol VARCHAR(50),
--     KatilimTarihi DATE,
--     PRIMARY KEY (OgrenciID, KulupID),
--     FOREIGN KEY (KulupID) REFERENCES Kulupler(KulupID)
-- );

-- 3. Veri Ekleme

-- INSERT INTO Kulupler (KulupAdi, KurulusYili)
-- VALUES 
-- ('Tiyatro Kulübü', 2010),
-- ('Müzik Kulübü', 2012),
-- ('Spor Kulübü', 2015),
-- ('Bilim Kulübü', 2018),
-- ('Sanat Kulübü', 2020);


-- INSERT INTO OgrenciKulup (OgrenciID, KulupID, Rol, KatilimTarihi)
-- VALUES 
-- (1, 1, 'Başkan', '2023-01-10'),
-- (2, 1, 'Üye', '2023-02-15'),
-- (3, 1, 'Sekreter', '2023-03-12'),
-- (4, 2, 'Başkan', '2023-01-20'),
-- (5, 2, 'Üye', '2023-03-05'),
-- (6, 2, 'Üye', '2023-04-10'),
-- (7, 3, 'Başkan', '2023-01-25'),
-- (8, 3, 'Üye', '2023-02-08'),
-- (9, 3, 'Üye', '2023-02-22'),
-- (10, 4, 'Başkan', '2023-01-18'),
-- (11, 4, 'Üye', '2023-02-14'),
-- (12, 4, 'Sekreter', '2023-03-18'),
-- (13, 5, 'Başkan', '2023-01-30'),
-- (14, 5, 'Üye', '2023-03-12'),
-- (15, 5, 'Üye', '2023-04-02');


--Tüm kulüp üyelerinin adlarını, soyadlarını ve hangi kulüpte yer aldıklarını listeleyin. (JOIN)

-- SELECT ok.OgrenciID, k.KulupAdi
-- FROM OgrenciKulup ok
-- JOIN Kulupler k ON ok.KulupID = k.KulupID;


--"Tiyatro Kulübü" üyelerini ve rollerini listeleyin. (WHERE ve JOIN)

-- SELECT ok.OgrenciID, ok.Rol
-- FROM OgrenciKulup ok
-- JOIN Kulupler k ON ok.KulupID = k.KulupID
-- WHERE k.KulupAdi = 'Tiyatro Kulübü';

--Tüm kulüplerde başkan olarak görev yapan öğrencileri listeleyin. (WHERE)

-- SELECT ok.OgrenciID, k.KulupAdi
-- FROM OgrenciKulup ok
-- JOIN Kulupler k ON ok.KulupID = k.KulupID
-- WHERE ok.Rol = 'Başkan';

--Her kulübün kaç üyesi olduğunu listeleyin. (GROUP BY ve COUNT)

-- SELECT k.KulupAdi, COUNT(ok.OgrenciID) AS UyeSayisi
-- FROM OgrenciKulup ok
-- JOIN Kulupler k ON ok.KulupID = k.KulupID
-- GROUP BY k.KulupAdi;

--Kuruluş yılı en eski olan kulübün üyelerini listeleyin. (ORDER BY ve JOIN)

-- SELECT TOP 1 WITH TIES ok.OgrenciID, k.KulupAdi
-- FROM OgrenciKulup ok
-- JOIN Kulupler k ON ok.KulupID = k.KulupID
-- ORDER BY k.KurulusYili ASC;


--Öğrencilerin hangi tarihte hangi kulübe katıldıklarını listeleyin. (SELECT ve JOIN)

-- SELECT ok.OgrenciID, k.KulupAdi, ok.KatilimTarihi
-- FROM OgrenciKulup ok
-- JOIN Kulupler k ON ok.KulupID = k.KulupID;

--"Müzik Kulübü"nde bulunan tüm rollerin bir listesini çıkarın. (WHERE ve DISTINCT)

-- SELECT DISTINCT ok.Rol
-- FROM OgrenciKulup ok
-- JOIN Kulupler k ON ok.KulupID = k.KulupID
-- WHERE k.KulupAdi = 'Müzik Kulübü';

--Her kulüpte kaç başkan olduğunu gruplandırarak listeleyin. (GROUP BY ve COUNT)

-- SELECT k.KulupAdi, COUNT(ok.OgrenciID) AS BaskanSayisi
-- FROM OgrenciKulup ok
-- JOIN Kulupler k ON ok.KulupID = k.KulupID
-- WHERE ok.Rol = 'Başkan'
-- GROUP BY k.KulupAdi;

--Hangi öğrenci en son hangi kulübe katılmış, bu bilgiyi listeleyin. (JOIN ve ORDER BY)

-- SELECT ok.OgrenciID, k.KulupAdi, ok.KatilimTarihi
-- FROM OgrenciKulup ok
-- JOIN Kulupler k ON ok.KulupID = k.KulupID
-- ORDER BY ok.KatilimTarihi DESC;

--Birden fazla kulüpte yer alan öğrencileri ve katıldıkları kulüpleri listeleyin. (GROUP BY ve HAVING)

-- SELECT ok.OgrenciID, COUNT(ok.KulupID) AS KulupSayisi
-- FROM OgrenciKulup ok
-- GROUP BY ok.OgrenciID
-- HAVING COUNT(ok.KulupID) > 1;
