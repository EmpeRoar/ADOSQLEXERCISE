[Parameters=[@__searchTerm_0='555-123-5678' (Size = 4000)], CommandType='Text', CommandTimeout='30']
SELECT [r].[Id], [r].[Email], [r].[Name], [r].[Phone], [r].[WillAttend]
FROM [Responses] AS [r]
WHERE ([r].[Phone] = @__searchTerm_0) AND ([r].[WillAttend] = 1)
ORDER BY [r].[WillAttend] DESC