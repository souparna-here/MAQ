SELECT p.ProductID, p.Name AS ProductName, pmcd.Name AS ProductModelName, pmcd.Summary AS ProductModelSummary
FROM SalesLT.Product AS p
JOIN SalesLT.vProductModelCatalogDescription AS pmcd
ON p.ProductModelID = pmcd.ProductModelID
ORDER BY p.ProductID;

DECLARE @Colors AS TABLE(Color varchar(15));
INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product;

SELECT ProductID, Name AS ProductName, Color
FROM SalesLT.Product
WHERE Color IN (SELECT * FROM @Colors);

SELECT p.ProductID, p.Name, ac.ParentProductCategoryName, ac.ProductCategoryName
FROM SalesLT.Product AS p
JOIN dbo.ufnGetAllCategories() AS ac
ON p.ProductCategoryID = ac.ProductCategoryID
ORDER BY p.ProductID;

WITH SoSummary(ContactName, TotalDue)
AS
(
SELECT CONCAT(c.CompanyName, ' ('+c.FirstName+' '+c.LastName+') '), soh.TotalDue
FROM SalesLT.SalesOrderHeader AS soh
JOIN SalesLT.Customer AS c
ON soh.CustomerID = c.CustomerID
)
SELECT ContactName, SUM(TotalDue) AS TotalRevenue
FROM SoSummary
GROUP BY ContactName
ORDER BY ContactName;