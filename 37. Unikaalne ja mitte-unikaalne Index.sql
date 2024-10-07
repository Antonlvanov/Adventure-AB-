use AdventureWorksDW2019

CREATE TABLE [tblEmployee] 
(
    [Id] int PRIMARY KEY,
    [FirstName] nvarchar(50),
	[LastName] nvarchar(50),
    [Salary] int,
    [Gender] nvarchar(10),
    [City] nvarchar(50)
)

execute sp_helpindex tblEmployee;

Insert into tblEmployee Values(1, 'Mike', 'Snadox', 4500, 'Male', 'New York')
Insert into tblEmployee Values(1, 'John', 'Menco', 2500, 'Male', 'London')

drop index tblEmployee.PK__tblEmplo__3214EC079575009A

Insert into tblEmployee Values(1,'Mike', 'Sandoz',4500,'Male','New York')
Insert into tblEmployee Values(1,'John', 'Menco',2500,'Male','London')

Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)

ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)

EXECUTE SP_HELPCONSTRAINT tblEmployee

CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY

