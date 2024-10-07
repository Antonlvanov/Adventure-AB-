use AdventureWorksDW2019

-- proovi lisa klastreeritud indeks, ei luba luua
create clustered index IX_DimEmployee_Name ON DimEmployee(FirstName)

-- leiame indeks
execute sp_helpindex 'DimEmployee';

-- kutsutame indeks, saame vaeteate
drop index DimEmployee.PK_DimEmployee_EmployeeKey

-- lisame uus indeks (vaeteade)
Create Clustered Index IX_DimEmployee_Gender_Salary
ON DimEmployee (Gender DESC, BaseRate ASC)

-- loome eba klastreeritud indeksi 
create NonClustered Index IX_DimEmployee_Name
ON DimEmployee(FirstName asc)

Select * from DimEmployee