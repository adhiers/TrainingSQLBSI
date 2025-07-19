CREATE VIEW vw_SalesReport AS
SELECT 
    a.agreementid,
    c.CustomerName,
    sp.SalesName AS sales_name,
    a.agreementdate,
    a.MethodPayment
FROM Agreement a
JOIN Customer c ON a.customerid = c.customerid
JOIN SalesPerson sp ON a.salespersonid = sp.salespersonid
