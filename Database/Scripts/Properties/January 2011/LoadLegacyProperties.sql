
/*---------------------------------
Description: 1105 HALTON TE
Listed on: 03/09/09
Location: Morgan's Grant
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
           ,DateOfListing
           ,Location)
     VALUES
           (   
               '720381'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1060096628&s=OTW&t=OTW'
			   ,4
			   ,4
			   ,0
			   ,'Stunning Minto Douglas model home in Morgan''s Grant. Approx. 3,206 sq.ft. of bright living space. All the upgrades you can imagine... granite, hardwood, double-sided fireplace, stainless steel appliances and more. Four bedroom/four baths. Private office on main floor.'
			   ,476900
			   ,'1105 Halton Te'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K2W 1G8'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2009-03-09'
			   ,'Morgan''s Grant'
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
           ('720381_101_12.jpg','images/RealEstate/720381_101_12.jpg','',1,@new_key)
          
                     
/*---------------------------------
Description: 11 GRANDLEA WA
Listed on: 02/04/09
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
           ,[AgentId]
           ,DateOfListing
           ,Location)
     VALUES
           (   
               '717439'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=949644808&s=OTW&t=OTW'
			   ,4
			   ,4
			   ,0
			   ,'Situated on a premium pie shaped lot. Great family home across from the park.  4 bedrooms - 4 bathrooms - hardwood floor. Great home for entertaining. Only 20 minutes from downtown.  Enjoy all the amenities that Barrhaven has to offer. Professionally finished basement.'
			   ,459000
			   ,'11 Grandlea Wa'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K2G 6X6'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2009-02-04'
			   ,'Barrhaven'
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
           ('717439_101_12.jpg','images/RealEstate/717439_101_12.jpg','',1,@new_key)  
           
                                
/*---------------------------------
Description: 7 PENDERBROOK AV
Listed on: 06/13/09
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
           ,[AgentId]
           ,DateOfListing
           ,Location)
     VALUES
           (   
               '730916'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=344757018&s=OTW&t=OTW'
			   ,4
			   ,4
			   ,0
			   ,'Exceptional four-bedroom home in prestigious Winding Way. Breathtaking inside. Beautiful master bedroom with retreat and luxurious ensuite. The kitchen is bright, has high quality cabinetry and granite counter tops. In the family room, impressive fireplace with custom limestone mantel and hearth. Meticulous attention to detail. This home is in truly move-in condition. Perfect home for a family and entertaining.'
			   ,889000
			   ,'7 Penderbrook Av.'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K2G 6Y6'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2009-06-13'
			   ,'Winding Way'
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
           ('730916_101_12.jpg','images/RealEstate/730916_101_12.jpg','',1,@new_key)  
           
/*---------------------------------
Description: 4 SETTLER'S RIDGE WAY WA
Listed on: 02/19/09
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
           ,[AgentId]
           ,DateOfListing
           ,Location)
     VALUES
           (   
               '718623'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1494753484&s=OTW&t=OTW'
			   ,5
			   ,4
			   ,0
			   ,'Gorgeous bungalow with loft in ready to move-in condition. Ideal for multi-generations. Three + 2 bedrooms, four bathrooms and a beautiful loft. Amazing layout, quiet street, quality hardwood and ceramic floors, barrier free for handicap access, outdoor hot tub.  Premium lot with a private fenced backyard.  Professionally finished basement perfect for teens or in-law suite. It shows like a model home !!'
			   ,425000
			   ,'4 Settler''s ridge Way Wa'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K2J 4V1'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2009-02-19'
			   ,'Barrhaven'
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
           ('718623_101_12.jpg','images/RealEstate/718623_101_12.jpg','',1,@new_key)  
           
