-- Study Case 5

--select * from Sales.SalesOrderHeader;
--select * from Sales.Customer;
--select * from Person.Person;

create view vw_FrequentCustomers
as
    SELECT 
        CONCAT(P.FirstName, ' ', P.MiddleName, ' ', P.LastName) as CustomerName,
        count(H.SalesOrderID) as OrderCount
    FROM 
        Sales.SalesOrderHeader H
    JOIN
        Sales.Customer C on H.CustomerID = C.CustomerID
    JOIN
        Person.Person P on C.CustomerID = P.BusinessEntityID
    GROUP BY
        CONCAT(P.FirstName, ' ', P.MiddleName, ' ', P.LastName)
    HAVING
        count(H.SalesOrderID) > 3

go

select * from vw_FrequentCustomers;

drop view vw_FrequentCustomers;

