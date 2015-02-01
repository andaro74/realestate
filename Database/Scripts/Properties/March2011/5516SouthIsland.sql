
/*---------------------------------

Name: Create property pictures
Description: Creates new pictures for a new property
Date: 03/7/2010
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
           ,[AgentId]
           ,[VirtualTourUrl]
           ,[DateOfListing]
           ,[Location])
     VALUES
           (   
               '779479'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1628784852&s=OTW&t=OTW'
			   ,5
			   ,3
			   ,0
			   ,'Great value after a $30,000 price reduction! If you ever wanted to live in Manotick do not miss this one. Almost 4,000 sq ft of bright living space. Fantastic floor plan with 5 bedrooms, 3 baths, office on the main floor, solarium, 3 car garage. Heated salt water pool and south facing back yard. Ready to move it & enjoy it. Call today to  book a private viewing.'
			   ,735000
			   ,'5516 SOUTH ISLAND PARK DR'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K4M 1J2'
			   ,'Canada'
			   ,1
			   ,1
			   ,'http://www.alexlukey.com/5516southislandpark'
			   ,'2011-01-16'
			   ,'Manotick Island'
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
           ('5516_6.jpg','images/RealEstate/5516_6.jpg','',1,@new_key),
           ('5516_10.jpg','images/RealEstate/5516_10.jpg','',0,@new_key),
           ('5516_3.jpg','images/RealEstate/5516_3.jpg','',0,@new_key),
           ('5516_4.jpg','images/RealEstate/5516_4.jpg','',0,@new_key),
           ('5516_7.jpg','images/RealEstate/5516_7.jpg','',0,@new_key),
           ('5516_2.jpg','images/RealEstate/5516_2.jpg','',0,@new_key),
           ('5516_11.jpg','images/RealEstate/5516_11.jpg','',0,@new_key),
           ('5516_1.jpg','images/RealEstate/5516_1.jpg','',0,@new_key),
           ('5516_19.jpg','images/RealEstate/5516_19.jpg','',0,@new_key),
           ('5516_5.jpg','images/RealEstate/5516_5.jpg','',0,@new_key),
           ('5516_8.jpg','images/RealEstate/5516_8.jpg','',0,@new_key),
           ('5516_14.jpg','images/RealEstate/5516_14.jpg','',0,@new_key),
           ('5516_12.jpg','images/RealEstate/5516_12.jpg','',0,@new_key),
           ('5516_15.jpg','images/RealEstate/5516_15.jpg','',0,@new_key),
           
           
           
     




