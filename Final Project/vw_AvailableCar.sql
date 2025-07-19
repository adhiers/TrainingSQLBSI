CREATE VIEW vw_CarAvailable AS
SELECT
    dcl.DealerCarId,
    d.DealerName AS NamaDealer,
    d.City AS KotaDealer,
    d.Province AS ProvinsiDealer,
    c.CarId,
    c.VIN,
    c.ModelType AS TipeModel,
    c.FuelType AS JenisBahanBakar,
    c.BasePrice AS HargaDasar,
    dcl.DealerCarPrice AS HargaDealer
FROM
    DealerCarList dcl
JOIN
    Car c ON dcl.CarId = c.CarId
JOIN
    Dealer d ON dcl.DealerId = d.DealerId;

--select * from vw_CarAvailable