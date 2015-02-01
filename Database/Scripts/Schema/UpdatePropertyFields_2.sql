-- *******************************************
-- Hector Flores
-- Description: This script adds data to the 
-- Virtual TourUrl, DateOfListing and Location
-- Date: 12/18/2010
-- *********************************************

UPDATE dbo.Property 
SET  Location='Manotick'
	,VirtualTourUrl='http://www.alexlukey.com/5516southislandpark'
	,DateOfListing='2010-10-21'
WHERE MLSId LIKE '774246'

UPDATE dbo.Property 
SET Location='Alta Vista'
	,VirtualTourUrl='http://www.alexlukey.com/1810playfair'
	,DateOfListing='2010-10-20'
WHERE MLSId LIKE '774125'

UPDATE dbo.Property 
SET Location='Walkley Road'
	,VirtualTourUrl='http://www.alexlukey.com/48-1512walkley'
	,DateOfListing='2010-12-09'
WHERE MLSId LIKE '777787'

UPDATE dbo.Property 
SET Location='Walkley Road'
	,DateOfListing='2009-05-25'
WHERE MLSId LIKE '728840'

UPDATE dbo.Property 
SET Location='Walkley Road'
	,DateOfListing='2009-11-17'
WHERE MLSId LIKE '743334'

UPDATE dbo.Property
SET Location='Walkley Road'
	,DateOfListing='2010-05-23'
	,VirtualTourUrl='http://www.alexlukey.com/116-1512walkley/'
WHERE MLSId LIKE '760161'

UPDATE dbo.Property 
SET Location='Walkley Road'
	,DateOfListing='2010-09-22'
	,VirtualTourUrl='http://www.alexlukey.com/104-1512walkley'
WHERE MLSId LIKE '771729'




