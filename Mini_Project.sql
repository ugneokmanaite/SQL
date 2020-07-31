/* 1.1 Write a query that lists all Customers in either Paris or London
Include Customer ID, Company Name, and all address fields*/

SELECT c.CustomerID, c.CompanyName, c.Address, c.city,c.PostalCode, c.Country
FROM Customers c
WHERE c.City IN ('Paris','London');

/* 1.2 List all products in bottles*/


SELECT p.ProductName, p.QuantityPerUnit
FROM PRODUCTS p
WHERE p.QuantityPerUnit LIKE '%bottle%';

/* 1.3 Repeat question above but add in the Supplier Name and Country */

SELECT p.ProductName, p.QuantityPerUnit, s.CompanyName AS "Supplier Name", s.Country
FROM Products p INNER JOIN Suppliers s 
ON p.SupplierID=s.SupplierID
WHERE p.QuantityPerUnit LIKE '%bottle%';

/* 1.4	Write an SQL Statement that shows how many products there are in each category
    Include Category Name in result set and list the highest number first. */

SELECT c.CategoryName,
COUNT (p.ProductID) AS "Total amount of products"
FROM Categories c INNER JOIN Products p 
ON p.CategoryID=c.CategoryID
GROUP BY c.CategoryName;

SELECT c.CategoryName,
COUNT (*) AS "Total amount of products"
FROM Categories c INNER JOIN Products p 
ON p.CategoryID=c.CategoryID
GROUP BY c.CategoryName
ORDER BY COUNT(*)DESC;

/*1.5	List all UK employees using concatenation to join their title of courtesy, first name and last name together. Also include their city of residence.*/

SELECT CONCAT(e.TitleOfCourtesy,' ', FirstName,' ', e.LastName) AS "Full Name",
e.City AS "City of Residence"
FROM Employees e
WHERE e.Country LIKE 'UK'

SELECT TitleOfCourtesy + ' ' + FirstName + ' ' + LastName As Employee, City
  FROM Employees
  WHERE Country = 'UK';

/* 1.6	List Sales Totals for all Sales Regions (via the Territories table using 4 joins) 
     with a Sales Total greater than 1,000,000. Use rounding or FORMAT to present the numbers. */

SELECT ROUND(SUM((od.UnitPrice*od.Quantity) * (1-od.Discount)), 2) AS "Total Sales By Region"
FROM Territories t 
INNER JOIN EmployeeTerritories et ON et.TerritoryID=t.TerritoryID
INNER JOIN Employees e ON e.EmployeeID=et.EmployeeID
INNER JOIN Orders o ON o.EmployeeID=e.EmployeeID
INNER JOIN [Order Details]od ON od.OrderID=o.OrderID
GROUP BY t.regionID
HAVING SUM((od.UnitPrice*od.Quantity) * (1-od.Discount)) > 1000000
ORDER BY "Total Sales By Region"DESC

SELECT r.RegionID, r.RegionDescription AS Region, 
FORMAT(SUM((UnitPrice * Quantity) * (1-Discount)),'C') 
AS "Sales Total by Region"
    FROM Orders AS o
    	INNER JOIN [Order Details] AS od ON od.OrderID = o.OrderID
    	INNER JOIN EmployeeTerritories AS et ON o.EmployeeID = et.EmployeeID
    	INNER JOIN Territories AS t ON et.TerritoryID = t.TerritoryID
    	INNER JOIN Region AS r ON t.RegionID = r.RegionID
    GROUP BY r.RegionDescription, r.RegionID
    HAVING SUM((UnitPrice * Quantity) * (1-Discount)) > 1000000
    ORDER BY "Sales Total by Region" DESC


/*1.7	Count how many Orders have a Freight amount greater than 100.00 
           and either USA or UK as Ship Country.*/

SELECT COUNT(o.Freight)AS "Orders with Freight over 100 in UK or US"
FROM Orders o
WHERE o.Freight > 100
AND o.ShipCountry IN ('USA','UK')

SELECT COUNT(*) AS 'No of Orders >100 from US or UK'
	FROM Orders
  WHERE Freight>100 AND ShipCountry IN ('USA','UK');

/*1.8	Write an SQL Statement to identify the Order Number of the Order with the highest amount(value) of discount applied to that order.*/

SELECT TOP 1 od.OrderID,
SUM((od.UnitPrice*od.Quantity) *od.Discount) AS "Total amount discounted"
FROM [Order Details]od
GROUP BY od.OrderID
ORDER BY "Total amount discounted" DESC

--SIMPLIFIED ANSWER--
SELECT OrderID AS 'Order ID', 
       FORMAT((UnitPrice * Quantity) * Discount,'C') AS 'Discount Amount'
    FROM [Order Details]
    ORDER BY [Discount Amount] DESC;

--MODEL ANSWER--
  SELECT Orderid AS "Order ID", 
		FORMAT((UnitPrice * Quantity) * Discount,'C') AS "Total Discount"
    FROM [Order Details]
    WHERE ((UnitPrice * Quantity) * Discount) =
    (
SELECT MAX(
       (UnitPrice * Quantity) * Discount) -- AS 'Discount Amount'
    FROM [Order Details]
    )

/*Write SQL statements to extract the data required for the following charts (create these in Excel):
3.1 List all Employees from the Employees table and who they report to. No Excel required. (5 Marks)*/

SELECT  e.EmployeeID,
CONCAT(e.FirstName, ' ' , e.LastName) AS "Full Name",e.Title,e.ReportsTo AS "Reports to ID", CONCAT(e1.FirstName, ' ', e1.LastName) AS "Reports to Full Name"
FROM Employees e INNER JOIN Employees e1
ON e.reportsto = e1.EmployeeID 
ORDER BY e.ReportsTo

SELECT e.FirstName + ' ' + e.LastName AS "Employee Name",
		b.FirstName + ' ' + b.LastName AS "Reports To"
	FROM Employees e 
	LEFT JOIN Employees b ON e.ReportsTo=b.EmployeeID
    ORDER BY "Reports to ", "Employee Name";


/*3.2 List all Suppliers with total sales over $10,000 in the Order Details table. 
        Include the Company Name from the Suppliers Table and present as a bar chart as below: (5 Marks)*/*/

SELECT s.CompanyName,
ROUND(SUM((od.UnitPrice*od.Quantity) * (1-od.Discount)),0) AS "Total Supplier Sales"
FROM Suppliers s INNER JOIN Products p
ON p.SupplierID=s.SupplierID
JOIN [Order Details]od ON od.ProductID=p.ProductID
GROUP BY s.CompanyName 
HAVING SUM((od.UnitPrice*od.Quantity) * (1-od.Discount))>10000
ORDER BY "Total Supplier Sales" DESC;

SELECT s.CompanyName,SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) As "Supplier Total"
	FROM [Order Details] od
	INNER JOIN Products p ON od.ProductID=p.ProductID
	INNER JOIN Suppliers s ON p.SupplierID=s.SupplierID
	GROUP BY s.CompanyName
	HAVING SUM(od.UnitPrice*od.Quantity*(1-od.Discount))>10000
	ORDER BY SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) DESC;

/*3.3 List the Top 10 Customers YTD for the latest year in the Orders file. Based on total value of orders shipped.
          No Excel required. (10 Marks)*/

SELECT TOP 10 c.CustomerID, c.CompanyName,
FORMAT(SUM(UnitPrice * Quantity * (1-Discount)),'C') AS "YTD Sales"
FROM Customers c INNER JOIN Orders o   
ON o.CustomerID= c.CustomerID
INNER JOIN [Order Details]od
ON o.OrderID=od.OrderID
WHERE YEAR(o.OrderDate) =(SELECT MAX(YEAR(OrderDate)) From Orders)
AND o.ShippedDate IS NOT NULL
GROUP BY c.CustomerID, c.CompanyName
ORDER BY SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) DESC;
/*
--top 10 customers--> need customer table, need orders table , need order details table as all sales are there
3 JOINS 

-- need to consider latest year (best way to do this is using subquery)
-- max operation finds the maximum year and then feed it into the WHERE YEAR
-- list the top 10 customers based on total value of orders shipped
-- for total always need to do minus 1
--group by just customer ID was fine in this question
--ORDER sales in descending order
-- SHIPPED DATE SHOULD NOT BE SHIPPED AS IT IS BASED ON THE VALUE OF ORDERS SHIPPED --
*/

SELECT TOP 10 c.CustomerID AS "Customer ID", c.CompanyName As "Company",
FORMAT(SUM(UnitPrice * Quantity * (1-Discount)),'C') 
AS "YTD Sales"
FROM Customers c
 		INNER JOIN Orders o ON o.CustomerID=c.CustomerID
 		INNER JOIN [Order Details] od ON od.OrderID=o.OrderID
	WHERE YEAR(OrderDate)=(SELECT MAX(YEAR(OrderDate)) From Orders)
 	--WHERE YEAR(OrderDate)=1998 --WHERE YEAR(OrderDate)='1998'
AND o.ShippedDate IS NOT NULL
	GROUP BY c.CustomerID, c.CompanyName
 	ORDER BY SUM(UnitPrice * Quantity * (1-Discount)) DESC;

/*3.4 Plot the Average Ship Time by month for all data in the Orders Table using a line chart as below. (10 Marks)*/

SELECT 
FORMAT (o.OrderDate, 'MMM-yy') AS "Year to Month",
AVG(DATEDIFF(d, OrderDate, ShippedDate)) AS "Average Shipping Time"
FROM Orders o
GROUP BY MONTH (o.OrderDate), YEAR(o.OrderDate), FORMAT(o.OrderDate, 'MMM-yy')
ORDER BY MONTH(o.OrderDate)ASC, YEAR(o.OrderDate)ASC

/*Model Answer*/
/*As soon  it asks for average date it will always be datediff
-- Cast it will convert it into something--
*/

SELECT MONTH(OrderDate) Month, YEAR(OrderDate) Year, AVG(CAST(DATEDIFF(d, OrderDate, ShippedDate) As DECIMAL(10,2))) As ShipTime
	FROM orders 
	WHERE ShippedDate IS NOT NULL
	GROUP BY YEAR(OrderDate),MONTH(OrderDate)
	ORDER BY Year ASC, Month ASC



SELECT * FROM Products
