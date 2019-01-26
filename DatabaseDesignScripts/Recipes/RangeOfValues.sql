SELECT SalesOrderID, 
       ShipDate 
FROM  Sales.SalesOrderHeader 
WHERE ShipDate BETWEEN '2005-07-23T00:00:00' AND '2005-07-24T23:59:59';
