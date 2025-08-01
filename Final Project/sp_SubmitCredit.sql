-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE sp_SubmitCredit 
	-- Add the parameters for the stored procedure here
	@CreditId VARCHAR(20),
    @CustomerId VARCHAR(20),
    @NominalKredit FLOAT,
    @StartDate DATE,
    @EndDate DATE,
    @Bunga FLOAT,
    @MonthlyPayment FLOAT,
    @StatusCredit VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Credit (
        CreditId, CustomerId, NominalKredit, StartDate, EndDate, 
        Bunga, MonthlyPayment, StatusCredit
    ) VALUES (
        @CreditId, @CustomerId, @NominalKredit, @StartDate, @EndDate, 
        @Bunga, @MonthlyPayment, @StatusCredit
    );
END
GO
