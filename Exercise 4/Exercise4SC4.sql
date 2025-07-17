-- Study Case 4

--select * from Production.Product;
--select * from Production.ProductSubcategory;
--select * from Production.ProductCategory;

create view vw_ProductPricingByCategory
as
    SELECT 
        P.Name as ProductName,
        S.Name as SubcategoryName,
        C.Name as CategoryName,
        P.ListPrice
    FROM 
        Production.Product P
    JOIN
        Production.ProductSubcategory S on S.ProductSubcategoryID = P.ProductSubcategoryID
    JOIN
        Production.ProductCategory C on S.ProductCategoryID =  C.ProductCategoryID
    WHERE
        P.ListPrice <> 0.00

go

select * from vw_ProductPricingByCategory;

drop view vw_ProductPricingByCategory;

