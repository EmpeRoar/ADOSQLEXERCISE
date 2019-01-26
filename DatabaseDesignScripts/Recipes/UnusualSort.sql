SELECT p.ProductID,   p.Name,   p.Color 
FROM  Production.Product AS p 
WHERE  p.Color IS NOT NULL 
ORDER BY CASE p.Color    
   WHEN 'Red' THEN NULL    
   ELSE p.Color    
   END;
