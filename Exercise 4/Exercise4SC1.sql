-- Study Case 1

create view vw_ActiveProductCatalog
as
    SELECT 
        p.ProductID,
        p.Name AS ProductName,
        p.ProductNumber,
        p.ListPrice,
        p.SellStartDate
    FROM 
        Production.Product p
    WHERE
        SellEndDate is not null

go

select * from vw_ActiveProductCatalog

drop view vw_ActiveProductCatalog;

