use AdventureWorksDW2019

SELECT * FROM DimEmployee
SELECT * FROM DimDepartmentGroup

Create view vWEmployeesDataExceptSalary
as
select 
EmployeeKey, 
FirstName, 
Gender, 
DepartmentName
From DimEmployee

select * from vWEmployeesDataExceptSalary

------

Update vWEmployeesDataExceptSalary
SET FirstName='Mikey' WHERE EmployeeKey=2

-------
DELETE FROM vWEmployeesDataExceptSalary WHERE EmployeeKey=2
INSERT INTO vWEmployeesDataExceptSalary VALUES (2, 'Mikey', 'M', 'Unemployed');

-----
Create view vWEmployeesDatailsByDepartment
as
select
EmployeeKey, 
FirstName, 
Gender, 
DepartmentName 
from DimEmployee join DimDepartmentGroup
on DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName

select * from vWEmployeesDatailsByDepartment

-----

Update vWEmployeesDatailsByDepartment
set DepartmentName='IT' where FirstName='Peng'

SELECT * 
FROM DimEmployee 
WHERE FirstName = 'Rob';