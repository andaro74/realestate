
/*---------------------------------
Name: Create property pictures
Description: Creates new pictures
Date: 10/4/2010
Author: Hector Flores
-----------------------------------*/


-- Truncate the Picture table
DELETE FROM dbo.Picture
GO
-- DELETE THE PROPERTY
DELETE FROM dbo.Property
GO

/*---------------------------------
Name: Create property
Description: Creates a new property 
Date: 10/2/2010
Author: Hector Flores
-----------------------------------*/

-- INSERT THE PROPERTY
SET IDENTITY_INSERT Property ON
GO

INSERT INTO [Property]
           (
            PropertyId
           ,[MLSId]
           ,[MLSUrl]
           ,[Beds]
           ,[Baths]
           ,[SqFt]
           ,[Description]
           ,[Price]
           ,[StreetAddress]
           ,[StateProvince]
           ,[City]
           ,[PostalCode]
           ,[Country]
           ,[StatusId]
           ,[AgentId])
     VALUES
           (   
                1
			   ,'774246'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1411085320&s=OTW&t=OTW'
			   ,5
			   ,3
			   ,21909
			   ,'Live the Manotick lifestyle in this bright & spacious home. Functional floor plan with 5 bedrooms, 3 baths, office, 3 car garage. Perfectly located just walking distance from the Medical Centre, public library, shopping, restaurants.  Beautiful hardwood floor throughout. Professionally renovated. Septic(2002), roof (2002)... and more. Ready to move in and enjoy it !!'
			   ,765000
			   ,'5516 South Island Park DR'
			   ,'Ontario'
			   ,'Manotick'
			   ,'K4M 1J2'
			   ,'Canada'
			   ,1
			   ,1
           )
           
		INSERT INTO [Property]
           (
            PropertyId
           ,[MLSId]
           ,[MLSUrl]
           ,[Beds]
           ,[Baths]
           ,[SqFt]
           ,[Description]
           ,[Price]
           ,[StreetAddress]
           ,[StateProvince]
           ,[City]
           ,[PostalCode]
           ,[Country]
           ,[StatusId]
           ,[AgentId])
		VALUES
           (   
                2
			   ,'774125'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1069313943&s=OTW&t=OTW'
			   ,4
			   ,2
			   ,6365
			   ,'If you are looking for a bungalow in Alta Vista... This is it !!  Bright & spacious home across from the park. Just steps from prestigious Pleasant Park Public School. Beautifully updated and ready to move in. Priced right for a great value. Close to hospitals, shopping, public transportation. List of improvements available upon request. Come & see it !!'
			   ,519000
			   ,'1810 Playfair Park'
			   ,'Ontario'
			   ,'Alta Vista'
			   ,'K1H 5S1'
			   ,'Canada'
			   ,0
			   ,1
           )
GO
SET IDENTITY_INSERT Property OFF
GO 

-- INSERT THE PICTURES
SET IDENTITY_INSERT dbo.Picture ON
GO

   INSERT INTO Picture
           ([PictureId]
           ,[Name]
           ,[Url]
           ,[Description]
           ,[IsMain]
           ,[PropertyId])
     VALUES
           (1,'774246_101_12.jpg','images/RealEstate/1/774246_101_12.jpg','',1,1),
           (2,'774246_201_19.jpg','images/RealEstate/1/774246_201_19.jpg','',0,1),
           (3,'774246_301_20.jpg','images/RealEstate/1/774246_301_20.jpg','',0,1),
           (4,'774246_401_22.jpg','images/RealEstate/1/774246_401_22.jpg','',0,1),
           (5,'774246_501_18.jpg','images/RealEstate/1/774246_501_18.jpg','',0,1),
           (6,'774246_601_17.jpg','images/RealEstate/1/774246_601_17.jpg','',0,1),
           (7,'774246_701_15.jpg','images/RealEstate/1/774246_701_15.jpg','',0,1),
           (8,'774246_801_52.jpg','images/RealEstate/1/774246_801_52.jpg','',0,1),
           (9,'774246_901_60.jpg','images/RealEstate/1/774246_901_60.jpg','',0,1),
           (10,'774246_A01_75.jpg','images/RealEstate/1/774246_A01_75.jpg','',0,1)
           
           
     INSERT INTO Picture
           ([PictureId]
           ,[Name]
           ,[Url]
           ,[Description]
           ,[IsMain]
           ,[PropertyId])
     VALUES
           (11,'774125_101_12.jpg','images/RealEstate/2/774125_101_12.jpg','',1,2),
           (12,'774125_201_19.jpg','images/RealEstate/2/774125_201_19.jpg','',0,2),
           (13,'774125_301_20.jpg','images/RealEstate/2/774125_301_20.jpg','',0,2),
           (14,'774125_401_18.jpg','images/RealEstate/2/774125_401_18.jpg','',0,2),
           (15,'774125_501_15.jpg','images/RealEstate/2/774125_501_15.jpg','',0,2),
           (16,'774125_601_52.jpg','images/RealEstate/2/774125_601_52.jpg','',0,2),
           (17,'774125_701_56.jpg','images/RealEstate/2/774125_701_56.jpg','',0,2),
           (18,'774125_801_60.jpg','images/RealEstate/2/774125_801_60.jpg','',0,2),
           (19,'774125_901_22.jpg','images/RealEstate/2/774125_901_22.jpg','',0,2),
           (20,'774125_A01_22.jpg','images/RealEstate/2/774125_A01_22.jpg','',0,2)
           
GO
SET IDENTITY_INSERT Picture OFF
GO





