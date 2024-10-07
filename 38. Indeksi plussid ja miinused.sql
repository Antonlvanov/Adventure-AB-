use AdventureWorksDW2019

Create NonClustered Index IX_tblEmployee_Salary
on DimEmployee (BaseRate Asc)

select * from DimEmployee

select * from DimEmployee where BaseRate > 40 and BaseRate < 80

delete from DimEmployee where BaseRate = 25
update DimEmployee set BaseRate = 9000 where BaseRate > 50

select * from DimEmployee order by BaseRate

select * from DimEmployee order by BaseRate Desc

select BaseRate, Count(BaseRate) as Total
from DimEmployee
group by BaseRate














delete from DimEmployee where BaseRate = 25
update DimEmployee set BaseRate = 9000 where BaseRate > 50
select * from DimEmployee order by BaseRate