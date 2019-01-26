WITH C AS
(
   SELECT 
      ROW_NUMBER() OVER(PARTITION BY categoryid
                        ORDER BY unitprice, productid) AS rownum,
       categoryid, productid, productname, unitprice
   FROM Production.Products    
)
SELECT categoryid, productid, productname, unitprice
FROM C
WHERE rownum <= 2;