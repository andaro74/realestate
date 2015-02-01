
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
               '780296'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1194534066&s=OTW&t=OTW'
			   ,2
			   ,2
			   ,0
			   ,'Stunning END unit with no rear neighbors. NEW home with low condo fees. Just minutes from downtown. Close to transit, shopping, schools, airport. Gorgeous hardwood floor on main level! Amazing open concept layout features a combined liv/din space with a railing overlooking the lower level. The bottom floor offers 2 spacious bedrooms & cheater ensuite next to a cozy family room. Gourmet kitchen. Balcony. A/C.'
			   ,274900
			   ,'1512 Walkley Road'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K1V 2G7'
			   ,'Canada'
			   ,1
			   ,1
			   ,'http://www.alexlukey.com/565reardon'
			   ,'2011-01-26'
			   ,'Walkley Road'
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
           ('ALP_1232.jpg','images/RealEstate/ALP_1232.jpg','',1,@new_key),
           ('ALP_1237.jpg','images/RealEstate/ALP_1237.jpg','',0,@new_key),
           ('ALP_1240.jpg','images/RealEstate/ALP_1240.jpg','',0,@new_key),
           ('ALP_1245.jpg','images/RealEstate/ALP_1245.jpg','',0,@new_key),
           ('ALP_1247.jpg','images/RealEstate/ALP_1247.jpg','',0,@new_key),
           ('ALP_1250.jpg','images/RealEstate/ALP_1250.jpg','',0,@new_key),
           ('ALP_1254.jpg','images/RealEstate/ALP_1254.jpg','',0,@new_key),
           ('ALP_1255.jpg','images/RealEstate/ALP_1255.jpg','',0,@new_key),
           ('ALP_1256.jpg','images/RealEstate/ALP_1256.jpg','',0,@new_key),
           ('ALP_1260.jpg','images/RealEstate/ALP_1260.jpg','',0,@new_key),
           ('ALP_1262.jpg','images/RealEstate/ALP_1262.jpg','',0,@new_key),
           ('ALP_1264.jpg','images/RealEstate/ALP_1264.jpg','',0,@new_key)
           
           
     




