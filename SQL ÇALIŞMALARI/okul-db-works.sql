-- CREATE TABLE Notlar
-- (
--     NotID INT PRIMARY KEY IDENTITY(1,1),
--     OgrenciID INT NOT NULL,
--     DersID INT NOT NULL,
--     Notlar FLOAT NOT NULL,
--     FOREIGN KEY (OgrenciID) REFERENCES Ogrenciler(OgrenciID),
--     -- Öğrenciler tablosuna referans
--     FOREIGN KEY (DersID) REFERENCES Dersler(DersID)
--     -- Dersler tablosuna referans
-- );


-- INSERT INTO Notlar
--     (OgrenciID, DersID, Notlar)
-- VALUES
--     -- Bilgisayar Mühendisliği öğrencileri için notlar
--     (1, 1, 80),
--     (1, 2, 90),
--     (1, 3, 70),
--     (1, 4, 85),
--     (2, 1, 60),
--     (2, 2, 75),
--     (2, 3, 50),
--     (2, 4, 45),
--     (3, 1, 85),
--     (3, 2, 80),
--     (4, 1, 90),
--     (4, 2, 65),

--     -- Elektrik Mühendisliği öğrencileri için notlar
--     (5, 5, 78),
--     (5, 6, 85),
--     (6, 5, 70),
--     (7, 7, 90),
--     (8, 8, 55),

--     -- Makine Mühendisliği öğrencileri için notlar
--     (10, 9, 88),
--     (11, 10, 77),
--     (12, 11, 95),
--     (13, 12, 60),
--     (14, 10, 82),
--     (15, 11, 75);


-- Bölüm Bazında Not Ortalaması

-- SELECT
--     b.BolumAdi,
--     AVG(n.Notlar) AS OrtalamaNot
-- FROM
--     Bolumler b JOIN Ogrenciler o ON b.BolumID = o.BolumID 
--         JOIN Notlar n ON o.OgrenciID = n.OgrenciID
-- GROUP BY b.BolumAdi
-- ORDER BY b.BolumAdi;

-- En Yüksek Notu Alan Öğrenciyi Bulma:

-- SELECT 
--     o.Ad,                            
--     o.Soyad,                         
--     b.BolumAdi,                      
--     d.DersAdi,   
--     n.Notlar AS EnYuksekNot       
-- FROM Notlar n                      
-- JOIN 
--     Ogrenciler o ON n.OgrenciID = o.OgrenciID 
-- JOIN 
--     Dersler d ON n.DersID = d.DersID         
-- JOIN 
--     Bolumler b ON o.BolumID = b.BolumID      
-- WHERE 
--     n.Notlar = (SELECT MAX(Notlar) FROM Notlar)


-- Başarısız Öğrencilerin Listesi

-- SELECT 
--     o.Ad,                            
--     o.Soyad,                         
--     b.BolumAdi,                      
--     d.DersAdi,                       
--     n.Notlar
-- FROM Notlar n JOIN Ogrenciler o ON n.OgrenciID = o.OgrenciID  
--     JOIN Dersler d ON n.DersID = d.DersID            
--     JOIN Bolumler b ON o.BolumID = b.BolumID        
-- WHERE 
--     n.Notlar < 50                        
-- ORDER BY 
--     o.Ad, o.Soyad;


-- Ogretmenler Tablosunu Oluşturma:

-- CREATE TABLE Ogretmenler (
--     OgretmenID INT PRIMARY KEY IDENTITY(1,1),
--     Ad NVARCHAR(50) NOT NULL,          
--     Soyad NVARCHAR(50) NOT NULL,          
--     BolumID INT NOT NULL,           
--     FOREIGN KEY (BolumID) REFERENCES Bolumler(BolumID)
-- );

-- INSERT INTO Ogretmenler (Ad, Soyad, BolumID) VALUES
--     ('Mehmet', 'Yılmaz', 1), 
--     ('Ayşe', 'Kara', 2),   
--     ('Ali', 'Çelik', 3), 
--     ('Fatma', 'Demir', 1),   
--     ('Emre', 'Aydın', 2); 


-- OgretmenDersler Tablosunu Oluşturma: 

-- CREATE TABLE OgretmenDersler (
--     OgretmenID INT NOT NULL,  
--     DersID INT NOT NULL,      
--     PRIMARY KEY (OgretmenID, DersID),  
--     FOREIGN KEY (OgretmenID) REFERENCES Ogretmenler(OgretmenID),  
--     FOREIGN KEY (DersID) REFERENCES Dersler(DersID)  
-- );


-- INSERT INTO OgretmenDersler (OgretmenID, DersID) VALUES
--     (1, 1),  
--     (1, 2),  
--     (2, 5),  
--     (2, 6),  
--     (3, 9), 
--     (3, 10),
--     (4, 1), 
--     (4, 3),
--     (5, 7),
--     (5, 8); 


-- Sorgulama:

-- SELECT 
--     o.Ad AS OgretmenAdi,
--     o.Soyad AS OgretmenSoyadi,
--     d.DersAdi,
--     ogr.Ad AS OgrenciAdi,
--     ogr.Soyad AS OgrenciSoyadi
-- FROM 
--     OgretmenDersler od
-- JOIN 
--     Ogretmenler o ON od.OgretmenID = o.OgretmenID
-- JOIN 
--     Dersler d ON od.DersID = d.DersID
-- JOIN 
--     DersOgrenciler do ON od.DersID = do.DersID
-- JOIN 
--     Ogrenciler ogr ON do.OgrenciID = ogr.OgrenciID
-- ORDER BY 
--     o.Ad, d.DersAdi, ogr.Ad;
