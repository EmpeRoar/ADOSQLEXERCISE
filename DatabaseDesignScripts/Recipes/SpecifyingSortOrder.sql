SELECT p.Name,   h.EndDate,   h.ListPrice 
FROM  Production.Product AS p   
  INNER JOIN Production.ProductListPriceHistory AS h     
    ON p.ProductID = h.ProductID 
ORDER BY p.Name DESC, h.EndDate DESC;
