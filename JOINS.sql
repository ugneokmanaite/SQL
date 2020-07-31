SELECT table_catalog [database], table_schema [schema], table_name [name], table_type [type]
FROM INFORMATION_SCHEMA.TABLES
GO


SELECT * from Customers
SELECT * from Orders

SELECT Orders.OrderID, Customers.ContactName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
ORDER BY Customers.ContactName;

SELECT Customers.ContactName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Orders.OrderID;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Employees.LastName;

SELECT Customers.ContactName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.ContactName;

SELECT A.ContactTitle AS CustomerName1, B.ContactTitle AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

SELECT , p.UnitsOnOrder, 
FROM Products p 
INNER JOIN Supplier s
ON p.SupplierID= 

SELECT * FROM Products
SELECT * FROM Suppliers



SELECT s.CompanyName, p.ProductID
FROM Products p INNER JOIN Suppliers s
ON s.SupplierID=p.SupplierID
ON 

SELECT s.CompanyName , AVG
FROM Products p 
INNER JOIN Suppliers s
ON p.SupplierID=s.SupplierID
GROUP BY s.CompanyName
ORDER BY "AVG"DESC