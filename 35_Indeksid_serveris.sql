use AdventureWorks2019

Alter table HumanResources.Employee
add Salary int;

Update HumanResources.Employee
Set Salary = 4333
Where BusinessEntityID in (7,11,12,13)

Select * from HumanResources.Employee where Salary > 5000 and Salary < 7000

Create Index IX_HumanResources_EmployeeSalary
on HumanResources.Employee(Salary ASC)

SELECT *
FROM HumanResources.Employee WITH (INDEX(IX_HumanResources_Employee_Salary))

execute sp_helpindex 'HumanResources.Employee';

drop index HumanResources.Employee.IX_HumanResources_EmployeeSalary