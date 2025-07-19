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
CREATE FUNCTION ufn_DiscountAmount 
(
	-- Add the parameters for the function here
	@DealerCarId varchar(20),
	@LOIId varchar(20)
)
RETURNS int
AS
BEGIN
	DECLARE @BasePrice int, @Discount float, @DiscountAmount int

    SELECT @BasePrice = DealerCarPrice FROM DealerCarList WHERE DealerCarID = @DealerCarID
    SELECT @Discount = Discount FROM LetterOfIntent WHERE LOIId = @LOIID

    SET @DiscountAmount = CAST(@BasePrice * @Discount AS int)

    RETURN @DiscountAmount

END
GO

