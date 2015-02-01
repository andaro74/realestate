
/*---------------------------------
Description: 143 Fordham PR
Listed on: 10/01/2010
Location: Central Park
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
               '772517'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=814569366&s=OTW&t=OTW'
			   ,2
			   ,2
			   ,0
			   ,'Fantastic home with no neighbors on the back & front. Just minutes from downtown, shopping, public transportation, restaurants. Amazing open concept layout - Ideal for entertaining. Spacious 2 Bedrooms/2 Baths. Bright kitchen with eating area. Inviting family room with walk-out. Gorgeous hardwood floor, ceramic tiles, A/C. All appliances are included! Beautifully landscaped. Ready to move in & enjoy it.'
			   ,279900
			   ,'143 Fordham Pr'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K2C 4G5'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2010-10-01'
			   ,'Central Park'
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
           ('772517_101_12.jpg','images/RealEstate/772517_101_12.jpg','',1,@new_key)
          
                     
/*---------------------------------
Description: 38 Angela Pr
Listed on: 06/25/2010
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
               '764029'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1928130111&s=OTW&t=OTW'
			   ,3
			   ,2
			   ,0
			   ,'BRIGHT & SPACIOUS 3 BEDROOM/1.5 BATH. GARAGE WITH INSIDE ENTRY. BACKING ONTO PARK. ONLY 20 MIN. TO DOWNTOWN. WALKING DISTANCE TO PUBLIC TRANSPORTATION, SHOPPING, RESTAURANTS. COME & SEE IT !!'
			   ,199900
			   ,'38 Angela Pr'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K1V 0E7'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2010-06-25'
			   ,'Heron Gate - Industrial'
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
           ('764029_101_12.jpg','images/RealEstate/764029_101_12.jpg','',1,@new_key)  
           
                                
/*---------------------------------
Description: 2415 Southvale St #90
Listed on: 06/08/2010
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
               '762162'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1406649125&s=OTW&t=OTW'
			   ,3
			   ,3
			   ,0
			   ,'BRIGHT & SPACIOUS 3 BEDROOM/3 BATH HOME WITH GARAGE. FENCED BACKYARD WITH NO NEIGHBORS ON THE BACK. FAMILY ORIENTED NEIGHBORHOOD. JUST STEPS FROM PUBLIC TRANSPORTATION. CLOSE TO SCHOOLS, ENTERTAINMENT, HOSPITALS. GREAT LAYOUT...IDEAL FOR ENTERTAINING FRIENDS & FAMILY. FLEXIBLE CLOSING. COME & SEE IT !!'
			   ,208500
			   ,'2415 Southvale St'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K1B 4V1'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2010-06-08'
			   ,'Sheffield Glen - Ind.Park'
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
           ('762162_101_12.jpg','images/RealEstate/762162_101_12.jpg','',1,@new_key)  
           
/*---------------------------------
Description: 28 Wycliffe St
Listed on: 10/24/2008
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
               '711077'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1151971555&s=OTW&t=OTW'
			   ,5
			   ,4
			   ,0
			   ,'Exceptional location!! Large 3,058 sq. ft home in Centrepointe. Fully bricked,4 bdrms +in-law suite, 3.5 baths, 2 car garage.  Main level: formal dining room, bright living room, private office, family room w/fireplace, renovated kitchen with eating area, sunroom.  Second level: Spacious 4 bedrooms + open library.  Large master bedroom offers retreat area, vanity and 4-piece ensuite'
			   ,559000
			   ,'18 Wycliffe St'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K2G 5L6'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2008-08-24'
			   ,'Centrepointe'
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
           ('711077_101_12.jpg','images/RealEstate/711077_101_12.jpg','',1,@new_key)  
           
/*---------------------------------
Description: 2415 Southvale Cr #98
Listed on: 09/16/2009
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
               '738856'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1093868682&s=OTW&t=OTW'
			   ,3
			   ,2
			   ,0
			   ,'Bright home in absolute move-in condition. Flexible closing. Large 3 bedrooms, 2 baths, finished basement. 16 ft. ceiling in living room. Plenty of storage area. Close to public transportation, schools, hospitals, shopping. '
			   ,206000
			   ,'2415 Southvale Cr #98'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K1B 4T9'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2009-09-16'
			   ,'Sheffield Glen - Ind. Park'
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
           ('738856_101_12.jpg','images/RealEstate/738856_101_12.jpg','',1,@new_key)  
         
/*---------------------------------
Description: 415 Cache Bay Cr
Listed on: 01/03/2008
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
               '682522'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1416725271&s=OTW&t=OTW'
			   ,3
			   ,3
			   ,0
			   ,'High quality finishes thru-out this tastefully decorated, large 1,817 sq.ft home, including maple flooring, maple cabinetry, and berber carpeting. Beautiful open concept main floor, 9-foot ceilings.  Large bedrooms, 4-piece master ensuite, a master walk-in and laundry room on 2nd floor. Large finished basement for entertaining.'
			   ,279000
			   ,'415 Cache Bay Cr'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K1T 4H2'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2008-01-03'
			   ,'Findlay Creek'
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
           ('682522_101_12.jpg','images/RealEstate/682522_101_12.jpg','',1,@new_key)  
           
/*---------------------------------
Description: 864 Clearcrest Cr
Listed on: 06/26/2008
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
               '700362'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1509300513&s=OTW&t=OTW'
			   ,4
			   ,3
			   ,0
			   ,'It has it all! Beautiful home located 20 min. from downtown. It boasts approx. 1,825 sq of well designed living space. Extraordinarily well maintained and upgraded by its original owners. Located in a family oriented neighborhood with all services nearby. Excellent schools, express transportation, community center, parks, library, daycare, and all shopping for your needs. Ready to move in.  Please note: There is no sign on the lawn.'
			   ,342000
			   ,'864 Clearcrest Cr'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K4A 3G1'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2008-06-26'
			   ,'Fallingbrook'
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
           ('700362_101_12.jpg','images/RealEstate/700362_101_12.jpg','',1,@new_key)  
           
/*---------------------------------
Description: 810 Beauregard Cr
Listed on: 06/26/2008
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
           ,VirtualTourUrl
           ,DateOfListing
           ,Location)
     VALUES
           (   
               '720971'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=373465658&s=OTW&t=OTW'
			   ,5
			   ,3
			   ,0
			   ,'Approx. 2,118 sq.ft. - Beautiful 4 bedroom home/ 4 baths.  Located on an extra large diamond shape lot- perfect for a swimming pool and playing area. Delightful, bright and spacious kitchen with sunny eating area adjacent to cozy family room with wood-burning fireplace.  Entertainment sized living room & separate formal dining room.  Impressive master bedroom with stunning bay window, large walk-in closet and ensuite.'
			   ,338500
			   ,'810 Beauregard Cr'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K4A 3C9'
			   ,'Canada'
			   ,0
			   ,1
			   ,'http://tours.macgregormedia.ca/810beauregard/'
			   ,'2009-03-16'
			   ,'Fallingbrook'
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
           ('720971_101_12.jpg','images/RealEstate/720971_101_12.jpg','',1,@new_key)  
           
           
/*---------------------------------
Description: 151 Forestcrest St
Listed on: 04/01/2010
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
               '753445'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=1334649552&s=OTW&t=OTW'
			   ,3
			   ,3
			   ,0
			   ,'Beautiful Executive Townhome in desirable Chapel Hill. 1,742 sq. ft. of bright living space.  Functional open concept and private backyard. 3 Bedrooms, 2.5 bathrooms.  No neighbors on the front. Absolute move-in condition. Schools, parks, services and shopping just moments away.'
			   ,309000
			   ,'151 Forestcrest St'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K1C 7R4'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2010-04-01'
			   ,'Chapel Hill'
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
           ('753445_101_12.jpg','images/RealEstate/753445_101_12.jpg','',1,@new_key)  
           
/*---------------------------------
Description: 25 Beaucache Pr
Listed on: 03/03/2009
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
               '719719'
			   ,'http://oreb.mlxchange.com/Pub/EmailView.asp?r=339599663&s=OTW&t=OTW'
			   ,2
			   ,3
			   ,0
			   ,'Bright, spacious, 2 bedroom, 2 ensuites, upper end unit. 2 years old, plenty of upgrades. Famous Minto Gramercy design, laundry on second level. Open concept dininig/living room. Open kitchen with sunny breakfast nook. Two parking spots in front, two balconies.'
			   ,212900
			   ,'25 Beaucache Pr'
			   ,'Ontario'
			   ,'Ottawa'
			   ,'K4A 0B5'
			   ,'Canada'
			   ,0
			   ,1
			   ,'2009-03-03'
			   ,'Avalon'
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
           ('719719_101_12.jpg','images/RealEstate/719719_101_12.jpg','',1,@new_key)  

