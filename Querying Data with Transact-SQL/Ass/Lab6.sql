SELECT ProductID, Name, ListPrice 
FROM SalesLT.Product
WHERE ListPrice > 
(SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail);

SELECT ProductID, Name, ListPrice 
FROM SalesLT.Product
WHERE ListPrice >= 100
AND ProductID IN 
(SELECT ProductID
FROM SalesLT.SalesOrderDetail
WHERE UnitPrice < 100);

SELECT p.ProductID, p.Name, p.StandardCost, p.ListPrice, 
(SELECT AVG(sd.UnitPrice) 
FROM SalesLT.SalesOrderDetail AS sd
WHERE sd.ProductID = p.ProductID) AS AverageUnitPrice
FROM SalesLT.Product AS p;

SELECT p.ProductID, p.Name, p.StandardCost, p.ListPrice, 
(SELECT AVG(sd.UnitPrice)
FROM SalesLT.SalesOrderDetail AS sd
WHERE sd.ProductID = p.ProductID) AS AverageUnitPrice
FROM SalesLT.Product AS p
WHERE p.StandardCost > 
(SELECT AVG(sd.UnitPrice)
FROM SalesLT.SalesOrderDetail AS sd
WHERE sd.ProductID = p.ProductID);

SELECT sh.SalesOrderID, ci.CustomerID, ci.FirstName, ci.LastName, sh.TotalDue
FROM SalesLT.SalesOrderHeader AS sh
CROSS APPLY dbo.ufnGetCustomerInformation(sh.CustomerID) AS ci
ORDER BY sh.SalesOrderID;

SELECT ci.CustomerID, ci.FirstName, ci.LastName, a.AddressLine1, a.City
FROM SalesLT.CustomerAddress AS ca
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
OUTER APPLY dbo.ufnGetCustomerInformation(ca.CustomerID) AS ci
ORDER BY ci.CustomerID;

