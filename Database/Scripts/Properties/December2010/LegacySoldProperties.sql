
/*---------------------------------
Description: 28 - 1512 Walkley Road
Listed on: 5/25/2009
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
               '728840'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1511485565&s=OTW&t=OTW'
			   ,2
			   ,2
			   ,0
			   ,'CONTEMPORARY 2 BEDROOM HOME W LOFT. IDEAL FOR YOUNG PROFESSIONALS & COUPLES. CLOSE TO DOWNTOWN, PUBLIC TRANSPORTATION, SHOPPING.  OPEN CONCEPT - GREAT FOR ENTERTAINING. BRIGHT MASTER BEDROOM WITH SPACIOUS BATHROOM. HARDWOOD FLOOR, FIREPLACE, BALCONY, CERAMIC TILES IN BATHROOMS, A/C. PARKING SPOT JUST STEPS FROM THE DOOR .  SHOWS LIKE A MODEL HOME.  MOVE-IN CONDITION.'
			   ,225000
			   ,'1512 WALKLEY RD #28'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K1V 2G7'
			   ,'Canada'
			   ,0
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
           ('728840_101_12.jpg','images/RealEstate/728840_101_12.jpg','',1,@new_key)
          

/*---------------------------------
Description: 32 - 1512 Walkley Road
List Date: 11/17/2009
Author: Hector Flores
-----------------------------------*/

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
               '743334'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=670598571&s=OTW&t=OTW'
			   ,2
			   ,2
			   ,0
			   ,'Absolutely gorgeous !! Stylish open concept home, great for entertaining.  Only 20 min. to downtown. Ideal for young professionals and couples. Close to restaurants, shopping, public transportation.'
			   ,226900
			   ,'1512 WALKLEY RD #32'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K1V 2G7'
			   ,'Canada'
			   ,0
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
           ('743334_101_12.jpg','images/RealEstate/743334_101_12.jpg','',1,@new_key)
                     
/*---------------------------------
Description: 116 - 1512 Walkley Road
Listed on: 5/23/2010
Author: Hector Flores
-----------------------------------*/

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
               '760161'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=352665617&s=OTW&t=OTW'
			   ,2
			   ,2
			   ,0
			   ,'BEAUTIFUL END UNIT HOME !! NO NEIGHBORS ON THE BACK. IDEAL FOR YOUNG PROFESSIONALS & COUPLES. JUST A FEW MIN. TO DOWNTOWN, SHOPPING, PUBLIC TRANSPORTATION, RESTAURANTS. OPEN CONCEPT - GREAT FOR ENTERTAINING. BRIGHT MASTER BEDROOM WITH SPACIOUS BATHROOM. HARDWOOD FLOOR, CERAMIC, BALCONY, A/C. ALL APPLIANCES ARE INCLUDED. PARKING JUST STEPS FROM YOUR DOOR.'
			   ,258500
			   ,'1512 WALKLEY RD #116'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K1V 2G7'
			   ,'Canada'
			   ,0
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
           ('760161_101_12.jpg','images/RealEstate/760161_101_12.jpg','',1,@new_key)
           
                               
/*---------------------------------
Description: 104 - 1512 Walkley Road
Listed on: 9/22/2010
Author: Hector Flores
-----------------------------------*/

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
               '771729'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1194155392&s=OTW&t=OTW'
			   ,2
			   ,2
			   ,0
			   ,'Bright & Spacious END unit with no rear neighbors. NEW home with LOW CONDO FEES. Just minutes from downtown. Close to transit, shopping, schools, airport.  Amazing open concept layout features a combined living/dining space with a railing overlooking the lower level. The bottom floor offers 2 spacious bedrooms & a cheater ensuite next to a cozy family room. Gourmet kitchen w eating area. Balcony. A/C. All appliances included.'
			   ,249000
			   ,'1512 WALKLEY RD #104'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K1V 2G7'
			   ,'Canada'
			   ,0
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
           ('771729_101_12.jpg','images/RealEstate/771729_101_12.jpg','',1,@new_key)