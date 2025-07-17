-- Study Case 2

--select * from HumanResources.Employee;
--select * from Person.Person;
--select * from Person.EmailAddress;

create view vw_EmployeeDirectory
as
    SELECT 
        CONCAT(P.FirstName, ' ', P.MiddleName, ' ', P.LastName) as FullName,
        EA.EmailAddress
    FROM 
        HumanResources.Employee HE
    JOIN
        Person.Person P on HE.BusinessEntityID = P.BusinessEntityID
    JOIN
        Person.EmailAddress EA on P.BusinessEntityID = EA.BusinessEntityID
    WHERE
        HE.CurrentFlag = 1

go

select * from vw_EmployeeDirectory

drop view vw_EmployeeDirectory;

