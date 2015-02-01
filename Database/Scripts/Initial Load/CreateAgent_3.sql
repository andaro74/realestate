
/*---------------------------------
Name: Create agent script
Description: Creates a new agent 
Date: 10/2/2010
Author: Hector Flores
-----------------------------------*/

DELETE FROM Agent
GO

SET IDENTITY_INSERT Agent ON
GO
INSERT INTO Agent 
(
 AgentId, FirstName, MiddleName, LastName,
 Title, EmailAddress, WorkPhone, CellPhone, AgencyId, URL
 )
 VALUES
 (
  1,'Monica',NULL, 'Flores',
  'Sales Representative',
  'mflores@royallepage.ca',
  '6137251171','6137254121',1, NULL
 )
GO
SET IDENTITY_INSERT Agent OFF
GO
 
select * from Agent
go
 