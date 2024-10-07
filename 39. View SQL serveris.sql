use AdventureWorksDW2019

SELECT * FROM DimEmployee
SELECT * FROM DimDepartmentGroup

SELECT 
EmployeeKey, 
FirstName, 
BaseRate, 
Gender, 
DepartmentName FROM DimEmployee
JOIN DimDepartmentGroup 
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName

----

Create View VWEmployeesByDepartement
AS
SELECT 
EmployeeKey, 
FirstName, 
BaseRate, 
Gender, 
DepartmentName FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName

select * from VWEmployeesByDepartement


----


Create View vWITDepartment_Employees
AS
SELECT 
EmployeeKey, 
FirstName,
BaseRate,
Gender,
DepartmentName FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName
WHERE DimDepartmentGroup.DepartmentGroupName = 'Quality Assurance'

select * from vWITDepartment_Employees;

----


Create View vWEmployeesNonConfidentialData
AS
SELECT 
EmployeeKey, 
FirstName, 
BaseRate, 
Gender, 
DepartmentName FROM DimEmployee 
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName

SELECT * FROM vWEmployeesNonConfidentialData;
---


Create View vWEmployeesCountByDepartment
AS
SELECT 
DepartmentName, COUNT(EmployeeKey) AS TotalEmployees
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName
GROUP BY DepartmentName

SELECT * FROM vWEmployeesCountByDepartment;
