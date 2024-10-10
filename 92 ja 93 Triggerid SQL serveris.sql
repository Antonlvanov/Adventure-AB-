use AdventureWorksDW2019

-- 92
------

Create trigger trMyFirstTrigger
ON Database
FOR CREATE_TABLE
AS
BEGIN
  Print 'New table created'
END

-----

Create Table Test (Id int)

-- trigger käivitub mitme toimingu sooritamisel

ALTER TRIGGER trMyFirstTrigger
ON Database
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
  Print 'A table has just been created, modified or deleted'
END

ALTER TABLE Test
ADD test varchar(10)

--- ära hoida kasutajatel loomaks, muutmaks või kustutamiseks tabelit

ALTER TRIGGER trMyFirstTrigger
ON Database
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
Rollback
  Print 'You cannot create, alter or drop a table'
END

DROP TABLE Test
  
-- triggerite keelata
DISABLE TRIGGER trMyFirstTrigger ON Database

-- triggerite kustutamine
DROP TRIGGER trMyFirstTrigger ON Database

--Järgnev kood muudab TestTable nime NewTestTable nimeks
CREATE TRIGGER trRenameTable
ON Database
FOR RENAME
AS
BEGIN
  Print 'You just renamed something'
END

--

sp_rename 'Test','NewTesttable'


-- 93

-- ei luba luua / muuta / kustutada andmebaasi tabeleid

Create trigger tr_DatabaseScopeTrigger
ON Database
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
Rollback
  Print 'You cannot create, alter or drop a table in the current database'
END

Create Table Test2 (Id int)

-- Serveri-vahemikus olev DDL trigger

CREATE TRIGGER tr_ServerScopeTrigger
ON ALL SERVER
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
ROLLBACK
  Print 'You cannot create, alter or drop a table in any database on the server'
END

Create Table Test3 (Id int)

-- trigeti keelamine
DISABLE Trigger tr_ServerScopeTrigger ON ALL SERVER

-- lubada Serveri ulatuses olevat DDL trigerit
ENABLE Trigger tr_ServerScopeTrigger ON ALL SERVER

-- kustutada serveri ulatuses olevat DDL trigerit
DROP Trigger tr_ServerScopeTrigger ON ALL SERVER