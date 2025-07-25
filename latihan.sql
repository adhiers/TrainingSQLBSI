--1. List product names and their list prices from the Production.Product table where the ListPrice is greater than 1000.
select Name, ListPrice from Production.Product where ListPrice > 1000;

--2. Find employees in the HumanResources.Employee table who were hired after January 1, 2012.
select * from HumanResources.Employee where HireDate > '2012-01-01';

--3. Display top 10 most expensive products based on ListPrice in descending order.
select top 10 * from Production.Product order by ListPrice desc;

--4. Show product names that start with the letter ‘B’ from the Production.Product table.
select Name from Production.Product where Name like 'b%';

-- pegawai paling muda dan tuaa
select top 1 * from HumanResources.Employee order by BirthDate desc
select top 1 * from HumanResources.Employee order by BirthDate asc
