--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
----- *** HOW TO CREATE VirtualWallet DATABASE (SSMS) *** -------------------------------------------
-----------------------------------------------------------------------------------------------------
-- STEP 1: Enable the SQLCMD Mode (Query -> SQLCMD Mode).
-- STEP 2: Enable the SQL Server Agent (Object Explorer -> SQL Server Agent).
-- STEP 3: Change "SQL Files Path" below.
-- STEP 4: Click "Execute" or "F5".
-- Enjoy!

-- SQL Files Path
:setvar path "C:\Users\Damianek\OneDrive\studia\InzynierkaXamASP\SqlQueries"
GO
:r $(path)\InzynierkaXamAspDB&User.sql
GO
USE DigitalDocs

GO
-- Create Tables
:r $(path)\Tabless\PhotoTable.sql
:r $(path)\Tabless\MeetupTable.sql
:r $(path)\Tabless\RolesTable.sql
:r $(path)\Tabless\Users.sql
:r $(path)\Tabless\UserMeetupTable.sql
:r $(path)\Tabless\UserRolesTable.sql

 -- Create Stored Procedures
:r $(path)\Proceduress\CREATEE\CreateMeetup.sql
:r $(path)\Proceduress\CREATEE\CreatePhoto.sql
:r $(path)\Proceduress\CREATEE\CreateRole.sql
:r $(path)\Proceduress\CREATEE\CreateUser.sql
:r $(path)\Proceduress\CREATEE\CreateUser_Meetup.sql
:r $(path)\Proceduress\CREATEE\CreateUser_Role.sql

:r $(path)\Proceduress\DELETEE\DeleteRow.sql

:r $(path)\Proceduress\READD\ReadMeetup.sql
:r $(path)\Proceduress\READD\ReadPhoto.sql
:r $(path)\Proceduress\READD\ReadRole.sql
:r $(path)\Proceduress\READD\ReadUser.sql
:r $(path)\Proceduress\READD\ReadUser_Meetup.sql
:r $(path)\Proceduress\READD\ReadUser_Role.sql

:r $(path)\Proceduress\UPDATEE\UpdateMeetup.sql
:r $(path)\Proceduress\UPDATEE\UpdatePhoto.sql
:r $(path)\Proceduress\UPDATEE\UpdateRole.sql
:r $(path)\Proceduress\UPDATEE\UpdateUser.sql
:r $(path)\Proceduress\UPDATEE\UpdateUser_Meetup.sql
:r $(path)\Proceduress\UPDATEE\UpdateUser_Role.sql