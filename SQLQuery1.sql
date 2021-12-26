--use Northwind;

--CREATE VIEW GERMANY200 AS
--SELECT ([Order Details].UnitPrice*[Order Details].Quantity) AS TOTALPRICE, Orders.CustomerID,Orders.ShipCity,
--CONCAT(Employees.FirstName,' ',Employees.LastName)AS ÇALIÞAN
--FROM Orders
--INNER JOIN [Order Details] ON Orders.OrderID=[Order Details].OrderID
--INNER JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
--WHERE ([Order Details].UnitPrice*[Order Details].Quantity)>200 AND Orders.ShipCountry='GERMANY';

--SELECT * FROM GERMANY200;

--SELECT ([Order Details].UnitPrice*[Order Details].Quantity) AS TOPLAM_PARA ,Orders.CustomerID,Orders.ShipCity,
--CONCAT(Employees.FirstName,' ',Employees.LastName)AS ÇALIÞAN
--FROM Orders
--INNER JOIN [Order Details] ON Orders.OrderID=[Order Details].OrderID
--INNER JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
--WHERE ([Order Details].UnitPrice*[Order Details].Quantity)>200 AND Orders.ShipCountry='GERMANY';


---------------------------------------------------------------------------------------------------------

USE Northwind
GO
DECLARE @sayi int;
SET @sayi=15
PRINT @sayi		-- NORMAL YAZI OLARAK GÖSTER
SELECT @sayi    -- TABLO OLARAK GÖSTER
GO


GO
DECLARE @kategoriSayisi int
SELECT @kategoriSayisi = COUNT(*) FROM Categories;
SELECT @kategoriSayisi = COUNT(Categories.CategoryID) FROM Categories
PRINT @KategoriSayisi
GO

PRINT GETDATE()

GO
DECLARE @sayi int
SET @sayi=10 --TÝPÝ ÝNT
PRINT CONVERT (NVARCHAR(5),@sayi)
PRINT CONVERT(NVARCHAR(3),123) -- 123 SAYISINI NVARCHAR'A ÇEVÝR EKRANA YAZ
GO

PRINT TRY_CONVERT(NVARCHAR(3),1453)  --1453 SAYISINI NVARCHAR'A ÇEVÝREBÝLMEYE ÇALIÞIR. ÇEVÝREMEZSE HATA VERMEZ.

GO
DECLARE @sayi int
SET @sayi=15
SELECT @sayi =CAST('34' AS INT) --- CAST'ÝN ÝLE TÝP DÖNÜÞÜMÜ
PRINT @sayi
GO


GO
DECLARE @HECE NVARCHAR(20)
SELECT @HECE=RIGHT('BÝLGÝHAN',3)   --- SAÐDAKÝ 3 KARAKTERÝ AL
PRINT @HECE
GO

GO
DECLARE @HECE NVARCHAR(20)
SELECT @HECE = LEFT('BÝLGÝHAN',4)		-- SOLDAN 4 KARAKTERÝ AL
PRINT @HECE
GO


GO
DECLARE @HECE NVARCHAR(20)
SELECT @HECE SUBSTRING('KADIKÖY',0,5)    ---- ///**// BUNA BAKILACAK
PRINT @HECE
GO

PRINT REPLICATE('*',5)   --- REPLICATE TEKRAR ET ANLAMINI TAÞIR

PRINT REPLICATE('BÝLGÝHAN ',5)

PRINT REPLICATE ('ALLAH ',3)


------ DATE FONKSÝYONLARI-------------------------------------------------------

PRINT GETDATE() -- ANLIK TARÝHÝ GETÝRÝR

				--'ay.gün.yil'
PRINT DATEDIFF(DD,'08.04.2000',GETDATE())   -- GÜN OLARAK GEÇTÝ
PRINT DATEDIFF(MM,'08.04.1995',GETDATE())	-- AY OLARAK GEÇEN SÜRE
PRINT DATEDIFF(YY,'08.04.1995',GETDATE())	-- YIL OLARAK GEÇTÝ

--- PARÇA PARÇA TARÝH ALMAK
PRINT CAST(DATEPART(DD,'12.18.1900') AS NVARCHAR(MAX)) + '.'+CONVERT(NVARCHAR(MAX),DATEPART(MM,'05.07.2000'))+'.'+ TRY_CONVERT(NVARCHAR(MAX),DATEPART(YYYY,'03.27.1994'))
PRINT CAST(DATEPART(DD,'05.11.1990') AS NVARCHAR(MAX)) + '/'+CONVERT(NVARCHAR(MAX),DATEPART(MM,'05.18.1950'))+'/'+ TRY_CONVERT(NVARCHAR(MAX),DATEPART(YYYY,'01.01.1994'))

PRINT DATENAME(MM,GETDATE())    -- TARÝHÝN ADINI ALMAK
PRINT DATENAME(DD,GETDATE())
PRINT DATENAME(YYYY,GETDATE())


PRINT DAY(GETDATE())  
PRINT MONTH(GETDATE())
PRINT YEAR(GETDATE())
PRINT EOMONTH(GETDATE()) -- BU AYIN SON GÜNÜ
PRINT CURRENT_TIMESTAMP 

PRINT UPPER('bilgihan')  -- YAZIYI BÜYÜT
PRINT LOWER('AHMET')	 --  YAZIYI KÜÇÜLT

PRINT ROUND(14.7,0) -- YUVARLAMA HESABI
PRINT ROUND(3.1,0)	-- 3.0 	
PRINT ROUND(3.111,1)  -- 3.100 VÝRGÜLDEN SONRA KAÇ KARAKTER SIFIRLAMAK ÝSTERSEK ONU BAÞINI ALIR GERÝSÝ 0 LANIR
PRINT ROUND(3.1456,2)  -- 3.15 YAPAR



---------ASCII TABLOSUUUUU

PRINT ASCII('V')
PRINT ASCII(5)
PRINT ASCII('*')

PRINT CHAR(86)   -- ÇIKTISI (V) 
PRINT CHAR (45)  -- ÇIKTISI (-) 
PRINT CHAR(250)  -- ÇIKTISI (ú)

PRINT UNICODE('V')  -- ÇIKTISI 86
PRINT UNICODE('Ü')  -- ÇIKTISI 220


PRINT CHARINDEX('KÖY','KADIKÖY')   -- INDEX BULMA
PRINT CHARINDEX('BÝL','BÝLGÝHAN')
PRINT CHARINDEX('N','ZÝYACAN')



PRINT LTRIM('    -BJK-')   -- SOLDAKÝ BOÞLUKLARI SÝLER
PRINT RTRIM('BJK     ')    -- SAÐDAKÝ BOÞLUKLARI SÝLER

PRINT CONCAT ('BÝLGEHAN',' ','ÝSTANBULLU',' ',99)  -- CONCAR BÝRLEÞTÝRME ÖZELLÝÐÝ



GO 
DECLARE @ONDALIKLI_SAYI FLOAT
SET @ONDALIKLI_SAYI = 3.1456789
PRINT STR(@ONDALIKLI_SAYI,7,2)		-- TÝP DÖNÜÞTÜRERER YAZDIRMAK
GO

---------CASE----------------------------------

GO
DECLARE @DURUM NVARCHAR(4)
SET @DURUM= 'EVET'
SELECT CASE @DURUM WHEN 'EVET' THEN 'DURUM EVET' END DÜRÜM    -- DURUM EÞLEÞTÝÐÝ ÝÇÝN TABLO AHLÝNDE GELÝR
GO

GO
DECLARE @DURUM2 NVARCHAR(5)
SET @DURUM2='HAAAAAYIR'
SELECT CASE @DURUM2 WHEN 'HAYIR' THEN 'DURUM HAYIR' END BAÞLIK  -- DURUM EÞLEÞMEDÝÐÝ ÝÇÝN NULL GELÝR
GO



------------------------KOÞUL KONTROLÜÜ
GO
DECLARE @SAYÝ INT
SET @SAYÝ=999
IF (@SAYÝ<100)
BEGIN   --BLOK BAÞLANGICI
PRINT 'SAYÝ 100 DEN KÇÜKTÜR'
END		--BLOK BÝTÝÞÝÝÝ
ELSE
BEGIN
PRINT 'SAYÝ 100 VEYA 100 EN BÜYÜKTÜR'
END
GO


GO 
DECLARE @NUMBER INT
SET @NUMBER= 51
IF (@NUMBER>50)
BEGIN
PRINT 'SAYI 50 DEN BÜYÜK'
END
ELSE IF (@NUMBER=50)
BEGIN
PRINT 'SAYI 50 YE EÞÝT'
END
ELSE
BEGIN
PRINT 'SAYI 50 DEN KÜÇÜKTÜR'
END
GO




---------- DÖNGÜLERRR----------------



-----10DAN GERÝYE DOÐRU SAYDIRMA
GO 
DECLARE  @SAYAC TINYINT
SET @SAYAC=10
WHILE (@SAYAC>0)
BEGIN
PRINT @SAYAC
SELECT @SAYAC=@SAYAC-1
END
GO


-----1 DEN 10 KADAR YAZDIRMA
GO
DECLARE @SAYAC INT
SET @SAYAC=0
WHILE (@SAYAC<10)
BEGIN
SELECT @SAYAC=@SAYAC+1
PRINT @SAYAC
END
GO





GO
DECLARE @SAYAC INT
SET @SAYAC=0
WHILE (@SAYAC<10)
BEGIN
SELECT @SAYAC=@SAYAC+1
IF(@SAYAC*@SAYAC>10)
BEGIN
PRINT 'SAYININ KARESI 10 DEGERINI GECTI'
BREAK			-- DÖNGÜDEN ÇIK
END
END
GO




GO
DECLARE @KATEGORIADI NVARCHAR(MAX)
SELECT CategoryName, IIF(CategoryName='Beverages','Yiyecekler','Ýçecekler')AS TÜRKÇE FROM Categories
GO

IF EXISTS (SELECT *FROM Orders WHERE ShipCountry='France')
BEGIN
PRINT 'FRANSA MEVCUTTUR'
END

PRINT @@MAX_CONNECTIONS

PRINT @@LANGID

PRINT @@SERVERNAME

PRINT @@SERVICENAME


-----------------------------------------------------------------------------------------------

--------AGGREGATE - GROUP BY - HAVING------------------------

SELECT COUNT(*)AS MÜÞTERÝ FROM Customers    -- KAÇ MÜÞTERÝ VAR

SELECT SUM(Products.UnitsInStock*Products.UnitPrice) AS TOPLAMTUAR FROM Products  -- STOKTAKÝ ÜRÜNLERÝN TOPLAM FÝYATI

SELECT AVG(Products.UnitPrice) FROM Products    --ORTALAMA BÝRÝM FÝYATI
SELECT MIN(Products.UnitPrice) FROM Products    --MINÝMUM FÝYAT
SELECT MAX(Products.UnitPrice) FROM Products	--MAXIMUM FÝYAT



----- GROUP BY  KULLANIMI -------

SELECT Customers.CompanyName,Customers.Country FROM Customers
ORDER BY Customers.Country		-- AYRI AYRI LÝSTELEDÝK

--HANGÝ ÜLKEDEN KAÇ MÜÞTERÝM VAR
SELECT COUNT(*) AS MÜÞTERÝ_SAYÝSÝ, Customers.Country 
FROM Customers
GROUP BY Country

--5 DEN FAZLA MÜÞTERÝNÝN OLDUÐU ÜLKELERÝ GETÝR
SELECT  COUNT(*) AS MÜÞTERÝ_SAYISI, Customers.Country AS ÜLKE
FROM Customers
GROUP BY Customers.Country
HAVING COUNT(CustomerID)>5

-- PRODUCTS : HANGÝ KATEGORÝDEN KAÇ ÜRÜN VAR?

SELECT COUNT(Products.ProductID) , CategoryID 
FROM Products
GROUP BY Products.CategoryID
HAVING COUNT(CategoryID)>10

--HANGÝ KATEGORÝDEN KAÇ ADET ÜRÜN VAR?

SELECT COUNT (Products.ProductID),Categories.CategoryName 
FROM Products
INNER JOIN Categories
ON Products.CategoryID=Categories.CategoryID
GROUP BY Categories.CategoryName


---ÖRNEK 
--HER KATEGORÝDEKÝ TOPLAM MAL DEÐERÝ NEDÝR?

SELECT SUM(Products.UnitPrice*Products.UnitsInStock)AS TOPLAM_MAL_DEÐERÝ ,Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID=Categories.CategoryID
GROUP BY Categories.CategoryName

--ÖRNEK 
-- HANGÝ ÜRÜNDEN KAÇ ADET SÝPARÝÞ GÝRÝLMÝÞTÝR
SELECT *FROM [Order Details]

SELECT SUM([Order Details].Quantity)AS MÝKTAR,[Order Details].ProductID AS ÜRÜN_ID
FROM [Order Details]
GROUP BY [Order Details].ProductID
ORDER BY SUM([Order Details].Quantity) DESC

--1998 TARÝHLÝ VE 5. AY VE SONRASI LÝSTELESÝN

SELECT SUM([Order Details].Quantity),[Order Details].ProductID,Orders.OrderDate
FROM [Order Details]
INNER JOIN Orders ON [Order Details].OrderID=Orders.OrderID
GROUP BY [Order Details].ProductID,Orders.OrderDate
HAVING Orders.OrderDate >= '1998.05.01 00:00:00:000'
ORDER BY SUM([Order Details].Quantity) DESC


-- ID SI NULL OLANLARI GETÝR

SELECT COUNT(*) 
FROM Products 
WHERE Products.SupplierID IS NULL 