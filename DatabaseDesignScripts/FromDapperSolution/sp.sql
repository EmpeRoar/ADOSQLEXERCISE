USE [DAPPERSOLUTION]
GO
/****** Object:  StoredProcedure [DAP].[uspGetCustomerWithFilter]    Script Date: 1/26/2019 8:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [DAP].[uspGetCustomerWithFilter]
    @FirstName nvarchar(50),
	@Country nvarchar(50)
AS   

    SET NOCOUNT ON;  
    SELECT *
    FROM DAP.Customer
	WHERE FullName_FirstName = @FirstName OR HomeAddress_Country = @Country;
