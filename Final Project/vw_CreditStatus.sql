CREATE VIEW vw_CreditStatus AS
SELECT
    c.CreditId,
    cu.CustomerId,
    cu.CustomerName,
    c.NominalKredit AS TotalKredit,
    c.StartDate AS TanggalMulai,
    c.EndDate AS TanggalSelesai,
    c.Bunga,
    c.MonthlyPayment AS CicilanBulanan,
    c.StatusCredit AS StatusKredit
FROM
    Credit c
JOIN
    Customer cu ON c.CustomerId = cu.CustomerId;