-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
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
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER trg_UpdateStock
ON Agreement
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kurangi stok mobil sesuai DealerCarID yang ada di Agreement baru
    UPDATE DCL
    SET DCL.Stock = DCL.Stock - 1
    FROM DealerCarList DCL
    JOIN inserted i ON DCL.DealerCarID = i.DealerCarID;

END;