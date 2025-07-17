-- Study Case 6

--select * from Sales.SalesOrderHeader;
--select * from Sales.SalesPerson;
--select * from Person.Person;

create view vw_SalespersonPerformance
as
    SELECT 
        CONCAT(P.FirstName, ' ', P.MiddleName, ' ', P.LastName) as SalesName,
        SUM(H.TotalDue) as TotalSalesAmount,
        count(H.SalesOrderID) as OrderCount
    FROM 
        Sales.SalesOrderHeader H
    JOIN
        Sales.SalesPerson SP on H.SalesPersonID = SP.BusinessEntityID
    JOIN
        Person.Person P on SP.BusinessEntityID = P.BusinessEntityID
    WHERE
        CONCAT(P.FirstName, ' ', P.MiddleName, ' ', P.LastName) is not null
    GROUP BY
        CONCAT(P.FirstName, ' ', P.MiddleName, ' ', P.LastName)
    

go

select * from vw_SalespersonPerformance;

drop view vw_SalespersonPerformance;

