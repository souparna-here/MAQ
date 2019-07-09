SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight
FROM SalesLT.Product;

SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight, DATENAME(YYYY, SellStartDate) AS SellStartYear, DATENAME(MM, SellStartDate) AS SellStartMonth
FROM SalesLT.Product;

SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight, DATENAME(YYYY, SellStartDate) AS SellStartYear, DATENAME(MM, SellStartDate) AS SellStartMonth, 
		LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product;

SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight, DATENAME(YYYY, SellStartDate) AS SellStartYear, DATENAME(MM, SellStartDate) AS SellStartMonth, 
		LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1;

SELECT c.CompanyName, sh.TotalDue, RANK()OVER(ORDER BY sh.TotalDue DESC) AS TotalDueRank
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS sh
ON c.CustomerID = sh.CustomerID;

SELECT p.Name, SUM(sd.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS sd
JOIN SalesLT.Product AS p
ON p.ProductID = sd.ProductID
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

SELECT p.Name, SUM(sd.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS sd
JOIN SalesLT.Product AS p
ON p.ProductID = sd.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

SELECT p.Name, SUM(sd.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS sd
JOIN SalesLT.Product AS p
ON p.ProductID = sd.ProductID
GROUP BY p.Name
HAVING SUM(sd.LineTotal) > 20000
ORDER BY TotalRevenue DESC;
