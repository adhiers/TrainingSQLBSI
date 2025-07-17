-- Study Case 3

--select * from Sales.SalesOrderHeader;
--select * from Sales.Customer;
--select * from Person.Person;

create view vw_SalesOrderSummary
as
    SELECT 
        H.SalesOrderID,
        H.OrderDate,
        CONCAT(P.FirstName, ' ', P.MiddleName, ' ', P.LastName) as CustomerName,
        H.TotalDue
    FROM 
        Sales.SalesOrderHeader H
    JOIN
        Sales.Customer C on H.CustomerID = C.CustomerID
    JOIN
        Person.Person P on C.CustomerID =  P.BusinessEntityID

go

select * from vw_SalesOrderSummary;

drop view vw_SalesOrderSummary;

