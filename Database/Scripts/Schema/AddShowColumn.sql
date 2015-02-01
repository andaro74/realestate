-- This script adds a new column to Show on the carrousel

USE RealEstateDB
GO
ALTER TABLE dbo.Picture ADD Show bit default 1
GO
UPDATE dbo.Picture SET Show=1;
GO
ALTER TABLE dbo.Picture ADD [Order] int null
GO

UPDATE dbo.Picture SET [Order]=1;
GO








