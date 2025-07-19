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
CREATE PROCEDURE sp_RegisterCustomer
	@CustomerId varchar(20),
	@CustomerName varchar(50),
    @Email varchar(50),
    @PhoneNumber varchar(20),
	@IdCardNumber varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Customer (CustomerId, CustomerName, Email, PhoneNumber, IdCardNumber)
    VALUES (@CustomerId, @CustomerName, @Email, @PhoneNumber, @IdCardNumber);

    SELECT SCOPE_IDENTITY() AS NewCustomerID;
END
GO
