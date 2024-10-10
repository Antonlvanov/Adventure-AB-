-- U32

use AdventureWorks2019

-- Tabelisisev��rtusega funktsioon e Inline Table Valued function (ILTVF) koodin�ide:
CREATE FUNCTION fn_ILTVF_GetEmployees()
RETURNS TABLE
AS
RETURN (select BusinessEntityID,LoginID,CAST(BirthDate AS DATE) AS DOB
    FROM HumanResources.Employee)

Select * from fn_ILTVF_GetEmployees()


-- Mitme avaldisega tabeliv��rtusega funktsioonid e multi-statement table valued function (MSTVF):
CREATE FUNCTION fn_MSTVF_GetEmployees()
RETURNS @Table TABLE (BusinessEntityID int, LoginID nvarchar(256), DOB Date)
AS
Begin
Insert into @Table
Select BusinessEntityID, LoginID, Cast(BirthDate as Date)
From HumanResources.Employee
Return
End

Select * from fn_ILTVF_GetEmployees()
Select * from fn_MSTVF_GetEmployees()

--- 
Update fn_ILTVF_GetEmployees() set LoginID= 'Kesha' WHERE BusinessEntityID=1;

-- U 33

-- Skaleeritav funktsioon ilma kr�pteerimata:

create function fn_GetEmployeeNameByID(@Id int)
returns nvarchar(256)
as
begin
return (select LoginID from HumanResources.Employee Where BusinessEntityID = @Id)
End

-- Funktsiooni sisu vaatamise koodin�ide: 

sp_helptext fn_GetEmployeeNameByID

-- muudame funktsiooni ja kr�pteerime selle �ra:

Alter Function fn_GetEmployeeNameByID(@Id int)
returns nvarchar(256)
with encryption
as
begin
return (select LoginID from HumanResources.Employee Where BusinessEntityID = @Id)
End


-- Funktsioon nimega fn_GetEmployeeNameById on s�ltuvuses tblEmployees tabelist.

-- 2 Kustuta tblEmployees k�suga: Drop Table tblEmployees
Drop table HumanResources.Employee

-- 3 N��d k�ivita funktsioon fn_GetEmployeeNameById ja saad vastuseks
SELECT dbo.fn_GetEmployeeNameByID(1) AS LoginID;

-- Loome funktsiooni WITH SCHEMABINDING valikuga: 

Alter Function fn_GetEmployeeNameByID(@Id int)
returns nvarchar(256)
with SchemaBinding
as
begin
return (select LoginID from HumanResources.Employee Where BusinessEntityID = @Id)
End

-- U34

-- Loon n�ide tabel

Create Table #PersonDetails(Id int, Name nvarchar(20))

insert into #PersonDetails values (1, 'Masha')
insert into #PersonDetails values (2, 'Kesha')
insert into #PersonDetails values (3, 'Dasha')

-- Vaata tabeli sisu ajutise tabeli abil:

select name from #PersonDetails

-- Kuidas saame teada, et local temporary tabel on loodud

select name from tempdb..sysobjects
where name like '#PersonDetails%'
DROP TABLE #PersonDetails

-- edastab andmeid ja l�hub ajutise tabeli automaatselt peale k�su l�pule j�udmist

CREATE PROCEDURE spCreateLocalTempTable
AS
BEGIN
    CREATE TABLE #PersonDetails (Id INT, Name NVARCHAR(20))

    INSERT INTO #PersonDetails VALUES (1, 'Mike')
    INSERT INTO #PersonDetails VALUES (2, 'John')
    INSERT INTO #PersonDetails VALUES (3, 'Todd')

    SELECT * FROM #PersonDetails
END

-- globaalne ajutine tabel
CREATE TABLE ##EmployeeDetails (Id int, Name nvarchar(20))