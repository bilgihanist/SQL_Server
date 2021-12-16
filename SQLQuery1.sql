--use Northwind;

--CREATE VIEW GERMANY200 AS
--SELECT ([Order Details].UnitPrice*[Order Details].Quantity) AS TOTALPRICE, Orders.CustomerID,Orders.ShipCity,
--CONCAT(Employees.FirstName,' ',Employees.LastName)AS �ALI�AN
--FROM Orders
--INNER JOIN [Order Details] ON Orders.OrderID=[Order Details].OrderID
--INNER JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
--WHERE ([Order Details].UnitPrice*[Order Details].Quantity)>200 AND Orders.ShipCountry='GERMANY';

--SELECT * FROM GERMANY200;

--SELECT ([Order Details].UnitPrice*[Order Details].Quantity) AS TOPLAM_PARA ,Orders.CustomerID,Orders.ShipCity,
--CONCAT(Employees.FirstName,' ',Employees.LastName)AS �ALI�AN
--FROM Orders
--INNER JOIN [Order Details] ON Orders.OrderID=[Order Details].OrderID
--INNER JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
--WHERE ([Order Details].UnitPrice*[Order Details].Quantity)>200 AND Orders.ShipCountry='GERMANY';


---------------------------------------------------------------------------------------------------------

USE Northwind
GO
DECLARE @sayi int;
SET @sayi=15
PRINT @sayi		-- NORMAL YAZI OLARAK G�STER
SELECT @sayi    -- TABLO OLARAK G�STER
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
SET @sayi=10 --T�P� �NT
PRINT CONVERT (NVARCHAR(5),@sayi)
PRINT CONVERT(NVARCHAR(3),123) -- 123 SAYISINI NVARCHAR'A �EV�R EKRANA YAZ
GO

PRINT TRY_CONVERT(NVARCHAR(3),1453)  --1453 SAYISINI NVARCHAR'A �EV�REB�LMEYE �ALI�IR. �EV�REMEZSE HATA VERMEZ.

GO
DECLARE @sayi int
SET @sayi=15
SELECT @sayi =CAST('34' AS INT) --- CAST'�N �LE T�P D�N���M�
PRINT @sayi
GO


GO
DECLARE @HECE NVARCHAR(20)
SELECT @HECE=RIGHT('B�LG�HAN',3)   --- SA�DAK� 3 KARAKTER� AL
PRINT @HECE
GO

GO
DECLARE @HECE NVARCHAR(20)
SELECT @HECE = LEFT('B�LG�HAN',4)		-- SOLDAN 4 KARAKTER� AL
PRINT @HECE
GO


GO
DECLARE @HECE NVARCHAR(20)
SELECT @HECE SUBSTRING('KADIK�Y',0,5)    ---- ///**// BUNA BAKILACAK
PRINT @HECE
GO

PRINT REPLICATE('*',5)   --- REPLICATE TEKRAR ET ANLAMINI TA�IR

PRINT REPLICATE('B�LG�HAN ',5)

PRINT REPLICATE ('ALLAH ',3)


------ DATE FONKS�YONLARI-------------------------------------------------------

PRINT GETDATE() -- ANLIK TAR�H� GET�R�R

				--'ay.g�n.yil'
PRINT DATEDIFF(DD,'08.04.2000',GETDATE())   -- G�N OLARAK GE�T�
PRINT DATEDIFF(MM,'08.04.1995',GETDATE())	-- AY OLARAK GE�EN S�RE
PRINT DATEDIFF(YY,'08.04.1995',GETDATE())	-- YIL OLARAK GE�T�

--- PAR�A PAR�A TAR�H ALMAK
PRINT CAST(DATEPART(DD,'12.18.1900') AS NVARCHAR(MAX)) + '.'+CONVERT(NVARCHAR(MAX),DATEPART(MM,'05.07.2000'))+'.'+ TRY_CONVERT(NVARCHAR(MAX),DATEPART(YYYY,'03.27.1994'))
PRINT CAST(DATEPART(DD,'05.11.1990') AS NVARCHAR(MAX)) + '/'+CONVERT(NVARCHAR(MAX),DATEPART(MM,'05.18.1950'))+'/'+ TRY_CONVERT(NVARCHAR(MAX),DATEPART(YYYY,'01.01.1994'))

PRINT DATENAME(MM,GETDATE())    -- TAR�H�N ADINI ALMAK
PRINT DATENAME(DD,GETDATE())
PRINT DATENAME(YYYY,GETDATE())


PRINT DAY(GETDATE())  
PRINT MONTH(GETDATE())
PRINT YEAR(GETDATE())
PRINT EOMONTH(GETDATE()) -- BU AYIN SON G�N�
PRINT CURRENT_TIMESTAMP 

PRINT UPPER('bilgihan')  -- YAZIYI B�Y�T
PRINT LOWER('AHMET')	 --  YAZIYI K���LT

PRINT ROUND(14.7,0) -- YUVARLAMA HESABI
PRINT ROUND(3.1,0)	-- 3.0 	
PRINT ROUND(3.111,1)  -- 3.100 V�RG�LDEN SONRA KA� KARAKTER SIFIRLAMAK �STERSEK ONU BA�INI ALIR GER�S� 0 LANIR
PRINT ROUND(3.1456,2)  -- 3.15 YAPAR



---------ASCII TABLOSUUUUU

PRINT ASCII('V')
PRINT ASCII(5)
PRINT ASCII('*')

PRINT CHAR(86)   -- �IKTISI (V) 
PRINT CHAR (45)  -- �IKTISI (-) 
PRINT CHAR(250)  -- �IKTISI (�)

PRINT UNICODE('V')  -- �IKTISI 86
PRINT UNICODE('�')  -- �IKTISI 220


PRINT CHARINDEX('K�Y','KADIK�Y')   -- INDEX BULMA
PRINT CHARINDEX('B�L','B�LG�HAN')
PRINT CHARINDEX('N','Z�YACAN')



PRINT LTRIM('    -BJK-')   -- SOLDAK� BO�LUKLARI S�LER
PRINT RTRIM('BJK     ')    -- SA�DAK� BO�LUKLARI S�LER

PRINT CONCAT ('B�LGEHAN',' ','�STANBULLU',' ',99)  -- CONCAR B�RLE�T�RME �ZELL���



GO 
DECLARE @ONDALIKLI_SAYI FLOAT
SET @ONDALIKLI_SAYI = 3.1456789
PRINT STR(@ONDALIKLI_SAYI,7,2)		-- T�P D�N��T�RERER YAZDIRMAK
GO

---------CASE----------------------------------

GO
DECLARE @DURUM NVARCHAR(4)
SET @DURUM= 'EVET'
SELECT CASE @DURUM WHEN 'EVET' THEN 'DURUM EVET' END D�R�M    -- DURUM E�LE�T��� ���N TABLO AHL�NDE GEL�R
GO

GO
DECLARE @DURUM2 NVARCHAR(5)
SET @DURUM2='HAAAAAYIR'
SELECT CASE @DURUM2 WHEN 'HAYIR' THEN 'DURUM HAYIR' END BA�LIK  -- DURUM E�LE�MED��� ���N NULL GEL�R
GO



------------------------KO�UL KONTROL��
GO
DECLARE @SAY� INT
SET @SAY�=999
IF (@SAY�<100)
BEGIN   --BLOK BA�LANGICI
PRINT 'SAY� 100 DEN K��KT�R'
END		--BLOK B�T�����
ELSE
BEGIN
PRINT 'SAY� 100 VEYA 100 EN B�Y�KT�R'
END
GO


GO 
DECLARE @NUMBER INT
SET @NUMBER= 51
IF (@NUMBER>50)
BEGIN
PRINT 'SAYI 50 DEN B�Y�K'
END
ELSE IF (@NUMBER=50)
BEGIN
PRINT 'SAYI 50 YE E��T'
END
ELSE
BEGIN
PRINT 'SAYI 50 DEN K���KT�R'
END
GO




---------- D�NG�LERRR----------------



-----10DAN GER�YE DO�RU SAYDIRMA
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
BREAK			-- D�NG�DEN �IK
END
END
GO




GO
DECLARE @KATEGORIADI NVARCHAR(MAX)
SELECT CategoryName, IIF(CategoryName='Beverages','Yiyecekler','��ecekler')AS T�RK�E FROM Categories
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

SELECT COUNT(*)AS M��TER� FROM Customers    -- KA� M��TER� VAR

SELECT SUM(Products.UnitsInStock*Products.UnitPrice) AS TOPLAMTUAR FROM Products  -- STOKTAK� �R�NLER�N TOPLAM F�YATI

SELECT AVG(Products.UnitPrice) FROM Products    --ORTALAMA B�R�M F�YATI
SELECT MIN(Products.UnitPrice) FROM Products    --MIN�MUM F�YAT
SELECT MAX(Products.UnitPrice) FROM Products	--MAXIMUM F�YAT



----- GROUP BY  KULLANIMI -------

SELECT Customers.CompanyName,Customers.Country FROM Customers
ORDER BY Customers.Country		-- AYRI AYRI L�STELED�K

--HANG� �LKEDEN KA� M��TER�M VAR
SELECT COUNT(*) AS M��TER�_SAY�S�, Customers.Country 
FROM Customers
GROUP BY Country

--5 DEN FAZLA M��TER�N�N OLDU�U �LKELER� GET�R
SELECT  COUNT(*) AS M��TER�_SAYISI, Customers.Country AS �LKE
FROM Customers
GROUP BY Customers.Country
HAVING COUNT(CustomerID)>5

-- PRODUCTS : HANG� KATEGOR�DEN KA� �R�N VAR?

SELECT COUNT(Products.ProductID) , CategoryID 
FROM Products
GROUP BY Products.CategoryID
HAVING COUNT(CategoryID)>10

--HANG� KATEGOR�DEN KA� ADET �R�N VAR?

SELECT COUNT (Products.ProductID),Categories.CategoryName 
FROM Products
INNER JOIN Categories
ON Products.CategoryID=Categories.CategoryID
GROUP BY Categories.CategoryName


---�RNEK 
--HER KATEGOR�DEK� TOPLAM MAL DE�ER� NED�R?

SELECT SUM(Products.UnitPrice*Products.UnitsInStock)AS TOPLAM_MAL_DE�ER� ,Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID=Categories.CategoryID
GROUP BY Categories.CategoryName

--�RNEK 
-- HANG� �R�NDEN KA� ADET S�PAR�� G�R�LM��T�R
SELECT *FROM [Order Details]

SELECT SUM([Order Details].Quantity)AS M�KTAR,[Order Details].ProductID AS �R�N_ID
FROM [Order Details]
GROUP BY [Order Details].ProductID
ORDER BY SUM([Order Details].Quantity) DESC

--1998 TAR�HL� VE 5. AY VE SONRASI L�STELES�N

SELECT SUM([Order Details].Quantity),[Order Details].ProductID,Orders.OrderDate
FROM [Order Details]
INNER JOIN Orders ON [Order Details].OrderID=Orders.OrderID
GROUP BY [Order Details].ProductID,Orders.OrderDate
HAVING Orders.OrderDate >= '1998.05.01 00:00:00:000'
ORDER BY SUM([Order Details].Quantity) DESC


-- ID SI NULL OLANLARI GET�R

SELECT COUNT(*) 
FROM Products 
WHERE Products.SupplierID IS NULL 