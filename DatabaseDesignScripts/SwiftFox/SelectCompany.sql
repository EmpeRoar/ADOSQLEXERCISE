SELECT C.OrganizationName, 
       C.RegisteredName, 
	   GA.AddressLine1, 
	   GA.AddressLine2, 
	   GC.Value, 
	   GLA.Value as AddressType
FROM [Organization].[Company] AS C
  INNER JOIN [OrganizationJunction].[OrganizationAddress] AS CA
     ON C.Id = CA.OrganizationId
  INNER JOIN [General].[Address] AS GA
     ON GA.Id = CA.AddressId
  INNER JOIN [GeneralLookup].[Country] AS GC
     ON GC.Id = GA.CountryId
  INNER JOIN [GeneralLookup].[AddressType] AS GLA
     ON GLA.Id = GA.AddressTypeId



------------------------------------------------------------------------------     