-- This script adds a new column to the Picture table

USE RealEstateDB
GO
ALTER TABLE dbo.Picture ADD  Thumbnail varchar(150) null

