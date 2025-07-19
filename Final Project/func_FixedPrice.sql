-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION ufn_CarPrice 
(
	@CarId varchar(20),
	@DealerId varchar(20)
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @TaxRate float
	DECLARE @Price float
	DECLARE @FixedPrice float

	SET @Price = (SELECT DealerCarPrice FROM DealerCarList WHERE CarId = @CarId AND DealerId = @DealerId)
	SET @TaxRate = (SELECT TaxRate FROM Dealer Where DealerId = @DealerId)
	SET @FixedPrice = @Price * (1 + (@TaxRate / 100))

	RETURN @FixedPrice

END
GO

