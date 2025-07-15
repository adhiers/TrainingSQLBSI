-- Section 1

-- 1. List product names and their list prices
select Name, ListPrice from Production.Product where ListPrice > 1000;

-- 2. Find employees in the HumanResources.Employee table who were hired after January 1, 2012.
select * from HumanResources.Employee where HireDate > '2012-01-01';

-- 3. Display top 10 most expensive products based on ListPrice in descending order.
select top 10 * from Production.Product order by ListPrice desc;

-- 4. Show product names that start with the letter ‘B’ from the Production.Product table.
select Name from Production.Product where Name like 'b%';


-- Section 2

-- 5. List all sales order (Sales.SalesOrderHeader) with the customer's full name, order date, and total due amount
-- hint: Join Sales.Customer, Sales.SalesOrderHeader ,and Person.Person
--select * from Sales.Customer;
--select * from Sales.SalesOrderHeader;
--select * from Person.Person;
select concat(P.FirstName, ' ', P.MiddleName, ' ', P.LastName) AS CustomerFullName, H.OrderDate, H.TotalDue from Sales.SalesOrderHeader H
LEFT JOIN Person.Person P ON P.BusinessEntityID = H.CustomerID;

-- 6. Find product names and their corresponding subcategory names from Production.Product and Production.ProductSubcategory
--select * from Production.Product;
--select * from Production.ProductSubcategory;
select P.Name AS ProductName, S.Name AS SubcategoryName from Production.Product P 
left join Production.ProductSubcategory S ON P.ProductSubcategoryID = S.ProductSubcategoryID;

-- 7. Show each employee's name and their job title using HumanResources.Employee and Person.Person
--select * from HumanResources.Employee;
--select * from Person.Person;
select concat(P.FirstName, ' ', P.MiddleName, ' ', P.LastName) AS CustomerFullName, E.JobTitle from HumanResources.Employee E
inner join Person.Person P ON P.BusinessEntityID = E.BusinessEntityID

-- 8. List all orders along with the salesperson's full name (if assigned)
-- hint: use sales.salesorderheader, sales.salesperson, and person.person
--select * from Sales.SalesPerson;
--select * from Sales.SalesOrderHeader;
--select * from Person.Person;
select  H.SalesOrderID, concat(P.FirstName, ' ', P.MiddleName, ' ', P.LastName) AS SalesFullName
from Sales.SalesOrderHeader H 
left join Sales.SalesPerson S on S.BusinessEntityID = H.SalesPersonID
left join Person.Person P on P.BusinessEntityID = H.SalesPersonID

-- Section 3

-- 9. Count the number of products in the Production.Product table by ProductLine
select ProductLine, count(ProductLine) AS Stock from Production.Product group by ProductLine

-- 10. Find the average list price of products for each ProductSubcategoryID
--select * from Production.ProductSubcategory;
--select * from Production.Product;
select S.ProductSubcategoryID, AVG(P.ListPrice) AS AverageListPrice 
from Production.Product P 
inner join Production.ProductSubcategory S ON S.ProductSubcategoryID = P.ProductSubcategoryID
group by S.ProductSubcategoryID

-- 11. Show the total number of employees in each JobTitle
--select * from HumanResources.Employee;
select JobTitle, count(BusinessEntityID) as TotalEmployee from HumanResources.Employee group by JobTitle

-- 12. Count how many orders were placed per year
-- hit Use YEAR(OrderDate) and group the result
select * from Sales.SalesOrderHeader;
select YEAR(OrderDate), count(YEAR(OrderDate)) from Sales.SalesOrderHeader group by YEAR(OrderDate)

-- Section 4

-- 13. List the total Sales amount (TotalDue) by customer full name
--hint Join Sales.SalesOrderHeader , Sales.Customer , Person.Person
select * from Sales.SalesOrderHeader;
select * from Sales.Customer;
select * from Person.Person;
select concat(P.FirstName, ' ', P.MiddleName, ' ', P.LastName) AS CustomerFullName, SUM(H.TotalDue) AS TotalSales
from Sales.SalesOrderHeader H
inner join Sales.Customer C on C.CustomerID = H.CustomerID
inner join Person.Person P on P.BusinessEntityID = H.CustomerID
group by P.BusinessEntityID, concat(P.FirstName, ' ', P.MiddleName, ' ', P.LastName)

-- 14. Show the total number of orders per salesperson
select * from Sales.SalesPerson;
select * from Sales.SalesOrderHeader;
select * from Person.Person;

select concat(P.FirstName, ' ', P.MiddleName, ' ', P.LastName) AS SalesFullName, count(H.SalesOrderID) AS TotalOrder
from Sales.SalesOrderHeader H
left join Sales.SalesPerson S on S.BusinessEntityID = H.SalesPersonID
left join Person.Person P on P.BusinessEntityID = H.SalesPersonID
group by P.BusinessEntityID, concat(P.FirstName, ' ', P.MiddleName, ' ', P.LastName)
order by count(H.SalesOrderID) desc

-- 15. Get the average order amount (totalDue) by year
select * from Sales.SalesOrderHeader;

select YEAR(OrderDate) as year, AVG(TotalDue) as AverageOrderAmount from Sales.SalesOrderHeader
group by YEAR(OrderDate)

-- 16. Find the top 5 products with the highest total quantity sold
-- hint use Sales.SalesOrderDetail, Production.Product, aggregate SUM(OrderQTY)
select * from Production.Product;
select * from Sales.SalesOrderDetail;

select top 5 P.Name, SUM(D.OrderQty) AS TotalSold from Production.Product P
inner join Sales.SalesOrderDetail D on P.ProductID = D.ProductID
group by P.ProductID, P.Name
order by SUM(D.OrderQty) desc

-- 17. For each subcategory, find the number of products with a list price greater than 500
-- hint Use Production.Product and Production.ProductSubcategory
select * from Production.Product;
select * from Production.ProductSubcategory;

select P.ProductSubcategoryID, count(S.Name) as TotalProduct from Production.Product P
inner join Production.ProductSubcategory S on S.ProductSubcategoryID = P.ProductSubcategoryID
where P.ListPrice > 500
group by P.ProductSubcategoryID

-- 18. Show the employee with the highest number of orders handled as salesperson
-- hint use sales.salesorderheader, sales.salesperson, and person.person
select top 1 concat(P.FirstName, ' ', P.MiddleName, ' ', P.LastName) AS SalesFullName, count(H.SalesOrderID) AS TotalOrder
from Sales.SalesOrderHeader H
inner join Sales.SalesPerson S on S.BusinessEntityID = H.SalesPersonID
inner join Person.Person P on P.BusinessEntityID = H.SalesPersonID
group by P.BusinessEntityID, concat(P.FirstName, ' ', P.MiddleName, ' ', P.LastName)
order by count(H.SalesOrderID) desc
