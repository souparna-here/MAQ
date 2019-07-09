SELECT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID;

SELECT c.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Shipping'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID;

SELECT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
UNION ALL
SELECT c.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Shipping'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
ORDER BY CompanyName, AddressType;

SELECT c.CompanyName
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
EXCEPT
SELECT c.CompanyName
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Shipping'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
ORDER BY CompanyName;

SELECT c.CompanyName
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
INTERSECT
SELECT c.CompanyName
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Shipping'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID;