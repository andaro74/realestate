
/*---------------------------------
Name: Create agency script
Description: Creates a new agency 
Date: 10/2/2010
Author: Hector Flores
-----------------------------------*/


DELETE FROM Agency
GO

SET IDENTITY_INSERT Agency ON
GO
INSERT INTO Agency 
(
 AgencyId,AgencyName,AddressLine1,
 AddressLine2,City,StateProvince,
 PostalCode,Country,Phone1,
 Phone2,Fax,WebPage,EmailAddress)
 VALUES
 (
  1,'Royal LePage Team Realty',
  '200-1335 Carling Avenue',NULL,
  'Ottawa','Ontario','K1Z8N8','Canada','6137251171',NULL,
  '6137253323','http://www.royallepage.ca/',NULL
 )
GO
SET IDENTITY_INSERT Agency OFF
GO
 
select * from Agency
go
 