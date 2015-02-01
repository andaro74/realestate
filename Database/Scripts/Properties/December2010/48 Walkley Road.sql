
/*---------------------------------
Name: Create property pictures
Description: Creates new pictures for a new property
Date: 12/12/2010
Author: Hector Flores
-----------------------------------*/
DECLARE @new_key AS INT;

INSERT INTO [Property]
           (
            [MLSId]
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
               '777787'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=469265294&s=OTW&t=OTW'
			   ,2
			   ,2
			   ,0
			   ,'Beautiful upper unit in absolute move-in condition. 1,280 sq.ft of bright living space. Inviting open concept with luxurious interior finishes. Gourmet kitchen, palladium windows, gorgeous hardwood floor & tiles. Only 20 min to downtown, close to public transportation, shopping, restaurants. Ideal for young professionals, couples, university students. Music wiring-speakers in ceiling. Pet and smoke free.'
			   ,274900
			   ,'1512 WALKLEY RD #48'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K1V 2G7'
			   ,'Canada'
			   ,1
			   ,1
           )
           
		


SET @new_key = SCOPE_IDENTITY();


-- INSERT THE PICTURES
   INSERT INTO Picture
           ([Name]
           ,[Url]
           ,[Description]
           ,[IsMain]
           ,[PropertyId])
     VALUES
           ('777787_101_12.jpg','images/RealEstate/3/777787_101_12.jpg','',1,@new_key),
           ('777787_201_19.jpg','images/RealEstate/3/777787_201_19.jpg','',0,@new_key),
           ('777787_301_20.jpg','images/RealEstate/3/777787_301_20.jpg','',0,@new_key),
           ('777787_401_22.jpg','images/RealEstate/3/777787_401_22.jpg','',0,@new_key),
           ('777787_501_22.jpg','images/RealEstate/3/777787_501_22.jpg','',0,@new_key),
           ('777787_601_18.jpg','images/RealEstate/3/777787_601_18.jpg','',0,@new_key),
           ('777787_701_18.jpg','images/RealEstate/3/777787_701_18.jpg','',0,@new_key),
           ('777787_801_15.jpg','images/RealEstate/3/777787_801_15.jpg','',0,@new_key),
           ('777787_901_56.jpg','images/RealEstate/3/777787_901_56.jpg','',0,@new_key),
           ('777787_A01_56.jpg','images/RealEstate/3/777787_A01_56.jpg','',0,@new_key)
           
           
     




