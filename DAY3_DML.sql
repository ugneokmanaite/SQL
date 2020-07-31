USE Northwind

-- WHERE clause-filters the data--

--COUNT is counting all of the data with the WHERE filter--

--AS= SQL aliases are used to give a table, or a column in a table, a temporary name--

--Aliases are often used to make column names more readable. An alias only exists for the duration of the query.--

SELECT COUNT(*) AS "Number of Employees in London " FROM Employees 
WHERE CITY = 'London'

SELECT COUNT(*) AS "Number of Employees with Dr. as Title" FROM Employees
WHERE TitleOfCourtesy = 'Dr.'

SELECT COUNT(*) AS "Number of Products Dicontinued" FROM Products
WHERE Discontinued= 1

SELECT c.CompanyName, c.City, c.Country, c.Region
FROM Customers c
WHERE c.Region = 'BC'

SELECT c.CustomerID, c.City
FROM Customers c
WHERE Country='France'

-- SELECT TOP --

SELECT TOP 100 c.CompanyName
FROM Customers c
WHERE Country='France'

-- AND/ OR / NOT---
-- AND displays record if all conditions separated by AND are TRUE---
-- OR displays record if any conditions separated by OR is TRUE---
-- NOT operator displays a record if the condition(s) are NOT TRUE---
-- <> OR != EQUAL TO
-- < LESS THAN
-- > MORE THAN
-- <= Less than or equal to
-- >= Greater than or equal to 

SELECT p.ProductName, p.UnitPrice, p.CategoryID, p.Discontinued
FROM Products p
WHERE CategoryID= 1 OR Discontinued = 0

--Select DISTINCT to remove duplicates--
--DISTINCT is used to return only distinct values--

SELECT DISTINCT c.Country
FROM Customers c
WHERE ContactTitle = 'Owner'

--Arithmetic Operators--

-- + = ADD   - = Subtract  * = Multiple  / = Divide  %= Modulo (remainder)

SELECT p.ProductName, p.UnitPrice
FROM Products p
WHERE UnitsInStock > 0 AND UnitPrice > 29.99

/*WILD CARDS*/

-- %---
---Represents 0 or more characters ---

-- Returning Countries starting with G--

SELECT c.Country
FROM Customers c
WHERE c.Country LIKE 'G%'

SELECT p.ProductName
FROM Products p
WHERE p.ProductName LIKE 'C%'

/*Selecting Distinctive countries from customers table that begin with G*/
SELECT DISTINCT c.Country
FROM Customers c
WHERE COUNTRY LIKE 'G%'

--Countries ending in A--

--This give us the whole list--

SELECT c.Country
FROM Customers c
WHERE COUNTRY LIKE'%A'

--This only gives us the number of different countries--

SELECT DISTINCT c.Country
FROM Customers c
WHERE COUNTRY LIKE '%A' 

/*Countries starting with U, ending with A*/

SELECT DISTINCT c.Country
FROM Customers c
WHERE COUNTRY LIKE 'U%A'

/*Countries starting with any of those letters*/

SELECT DISTINCT c.Country
FROM Customers c
WHERE COUNTRY LIKE '[UAM]%'

/*Countries ending with any of those letters*/

SELECT DISTINCT c.Country
FROM Customers c
WHERE COUNTRY LIKE '%[UAM]'

/* Ordering in ascending order*/

SELECT DISTINCT c.Country
FROM Customers c
WHERE COUNTRY LIKE '%[UAM]'
ORDER BY c.Country

/* Ordering in descending order*/

SELECT DISTINCT c.Country
FROM Customers c
WHERE COUNTRY LIKE '%[UAM]'
ORDER BY c.Country DESC

/*Countries NOT starting with any of those letters*/

SELECT DISTINCT c.Country
FROM Customers c
WHERE COUNTRY LIKE '[^UAM]%'

/*Countries NOT ending with any of those letters*/

SELECT DISTINCT c.Country
FROM Customers c
WHERE COUNTRY LIKE '%[^UAM]'

/*Countries whose 3rd letter is A*/

SELECT DISTINCT c.Country
FROM Customers c
WHERE COUNTRY LIKE '__A%'

/*Product names which begin with 'CH'*/

SELECT p.ProductName
FROM Products p
WHERE p.ProductName LIKE 'Ch%'

/*If we need to find regions with 2 character length, ending in A*/

SELECT *
FROM Customers
WHERE Region LIKE '_A'

/*IN Operator allows you to add multiple values in WHERE*/

SELECT *
FROM Customers
WHERE Region IN ('WA', 'SP')

SELECT *
FROM Products p
WHERE p.SupplierID IN (3,20)


/*Without IN Operator*/ 

SELECT *
FROM Customers
WHERE Region = 'WA' OR Region = 'SP'

SELECT *
FROM Products p
WHERE p.SupplierID =3 OR  SupplierID = 20

/*Without IN Operator & Country  Brazil*/ 
--Brackets show which ones you want to compute together--

SELECT *
FROM Customers
WHERE (Region = 'WA' OR Region = 'SP')
AND (Country = 'Brazil' OR Country = 'USA')

/*Now  simplify this!*/

SELECT *
FROM Customers
WHERE Region IN ('WA','SP')
AND Country IN ('Brazil','USA')

/*BETWEEN - includes values between and as well as the boundary values*/

SELECT* 
FROM EmployeeTerritories
WHERE TerritoryID BETWEEN 06800 and 09999

/*What are names & product IDs of the product with unit price below 5.00*/

SELECT p.ProductName, p.ProductID
FROM Products p 
WHERE p.UnitPrice<5

/*Which categories have a category name with initials beggining with B or S*/

SELECT c.CategoryName
FROM Categories c
WHERE c.CategoryName LIKE '[BS]%'

/*How many orders are there for EmployeeIDs 5 and 7 (The total of both)*/

SELECT o.EmployeeID
FROM Orders o
WHERE o.EmployeeID IN (5,7)

--SIMPLIFIED--

SELECT COUNT(*) AS "Orders with Employee IDs 5 and 7" 
FROM Orders o
WHERE o.EmployeeID IN (5,7)


/*How many orders placed by Employee IDs 5 and 7 seperately*/ 
--Grouping data based on Employer ID--

SELECT o.EmployeeID, COUNT(*) AS "Orders placed by Employees" 
FROM Orders o
WHERE o.EmployeeID IN (5,7)
GROUP BY o.EmployeeID

/*Concatenation*/
--Adding 2 or more string together--
--Using + along with single quotes ' '

SELECT c.CompanyName AS 'Company Name', c.City + ', '+ c.Country AS 'City'
FROM Customers c

--Can also do it using CONCAT function--

SELECT c.CompanyName AS 'Company Name',
CONCAT(c.City , ',', c.Country)  AS 'City'
FROM Customers c


/*Write SELECT using Employees table and concentrate First Name and Last name together. 
Use collumn alias to rename the column to Employee Name */

SELECT CONCAT(e.FirstName ,' ' ,  e.LastName) AS 'Employee Name'
FROM Employees e

/*IS NULL and IS NOT NULL*/ 

SELECT c.CompanyName AS 'Company Name', c.City + ', ' + c.Country AS 'City'
FROM Customers c 
WHERE Region IS NULL


/*Select statement to list the 6 countries that have region code in customer table */
SELECT TOP 6 c.Country, c.Region
FROM Customers c 
WHERE Region IS NOT NULL

-- Modulus %= remainder
76%3=1
88/2=44
90%7=6

-- Go to store Apples = £2 quantity =10 discount = 25%
-- Gross Total = £20 = 2*10
-- Net total (amount I pay the shop keeper at the end) = £15 = 20 -(25/100) * 20 = £15

/*Arithmetic Operations*/

SELECT UnitPrice, Quantity, Discount,
UnitPrice * Quantity AS "Gross Total"
FROM [Order Details]

--SIMPLIFY--

SELECT od.UnitPrice, od.Quantity, od.Discount,
od.UnitPrice * od.Quantity AS "Gross Total"
FROM [Order Details] od

-- NOW ADD NET PRICE --

--Selecting 2 Net Total in descending order--

SELECT TOP 2
od.OrderID,
od.UnitPrice, od.Quantity, od.Discount,
od.UnitPrice * od.Quantity AS "Gross Total",
ROUND ((od.UnitPrice * Quantity) * (1.00-Discount), 2) AS 'Net Total'
FROM [Order Details] od
ORDER BY 'Net Total' DESC

SELECT c.PostalCode "Post Code",
LEFT(c.PostalCode, CHARINDEX(' ',c.PostalCode)-1) AS "Post Code Region",
    CHARINDEX(' ',c.PostalCode) AS "Space Found", c.Country
FROM Customers c
WHERE Country = 'UK'

--------

/*Use CHARINDEX to list only product names that contain a single quote */
-- An Apostrophe is a Reserved Character which escapes character and adds apostrophe--

SELECT p.ProductName "Product Name"
CHARINDEX('' '', p.ProductName) AS "Index of quote"
FROM Products p
WHERE CHARINDEX('' '', p.ProductName) !=0

----------

/*Date Functions*/

--Current Date & Time --
SELECT GETDATE() 

--Date & Time of system--
SELECT SYSDATETIME()

--To add days--
-- This is adding 5 days to the original ordee date--
SELECT DATEADD(DAY, 5, o.OrderDate) AS "Due Date"
FROM Orders o

--To calculate difference between dates--
SELECT DATEDIFF(d,OrderDate,ShippedDate) AS "Ship Time"
FROM Orders 

--To extract the year from a date--
SELECT YEAR(OrderDate) AS "Order Year"
FROM Orders

--To extract the month from a date --
SELECT MONTH(OrderDate) AS "Order Month"
FROM Orders

SELECT DAY (OrderDate)AS "Order Day"
FROM Orders


SELECT DATEADD(DAY,5,OrderDate) AS "Due Date",
DATEDIFF(day,OrderDate,ShippedDate) AS "Ship Days"
FROM Orders

/*CASE STATEMENT*/
--Pay close attention to WHEN, THEN, ELSE and END--
--Use single quotes for data and double quotes for column aliases--

SELECT CASE
WHEN DATEDIFF(d, OrderDate, ShippedDate)<10 THEN 'On Time'
ELSE 'Overdue'
END AS "Status"
FROM Orders 


--Use CASE to add a column to the previous activity solution called Retirement Status as follows:
--1) Age greater than 65 = "Retired"
--2) Age greater than 60 = "Retirement due"
--3) Age less than 60 = "More than 5 years to go"

SELECT e.LastName, e.FirstName, e.BirthDate,
CONCAT(e.LastName, ', ', e.FirstName) AS "Full Name",
(DATEDIFF(DAY, e.BirthDate, GETDATE()) / 365) AS "Age",
CASE
WHEN (DATEDIFF(DAY, e.BirthDate, GetDate()) /365)>65 THEN 'Retired'
WHEN (DATEDIFF(DAY, e.BirthDate, GetDate()) /365)>60 THEN 'Retirement Due'
ELSE 'More than 5 years to go'
END AS "Retirement Status"
FROM Employees e

/*Aggregate Functions*/
-- Can be used to calculate totals usuually in conjuction with GROUP BY clause:---

--SUM for the grand total of column for all the rows selected---
SELECT SUM(OrderTotal)

--AVG for the average of a column for all rows selected
AVG(UnitPrice)

--MIN for the smallest value in column for all rows selected
MIN(UnitPrice)

--MAX for the largest value in column for all rows selected
MAX(UnitPrice)

--COUNT for the number of NOT NULL rows selected. If * selected then all rows are counted
COUNT(*)

/*Example*/

--GROUP B is added to provide subtotals--
--Aggregate functions are calculated for each Supplier--
--SupplierID was added in to the SELECT to help identify each total output
--Multiple columns can be added as a comma separated list to provide further level of subtotal--

SELECT p.SupplierID,
SUM(p.UnitsOnOrder) AS "Total on Order",
AVG(p.UnitsOnOrder) AS "Avg On Order",
MAX(p.UnitsOnOrder) AS "Max On Order"
FROM Products p 
GROUP BY p.SupplierID

--Use GROUP BY to calculate the Average Reorder Level or all Products by Category ID--
--SELECT clause must match the GROUP BY clause--
SELECT p.CategoryID,
AVG(p.ReorderLevel) AS "Average Reordered" 
FROM Products p
GROUP BY p.CategoryID
ORDER BY "Average Reordered" DESC
/*Now order this by DESC*/

---Filtering based on an Average---
---WHERE will NOT work on GROUP BY Data---
---So we need to use HAVING---
--Column alias cannot be used in the HAVING clause due to SQL processing sequence--
SELECT p.SupplierID,
SUM(p.UnitsOnOrder) AS "Total on Order",
AVG(p.UnitsOnOrder) AS "Avg On Order"
FROM Products p
GROUP BY SupplierID
HAVING AVG(p.UnitsOnOrder)>5

/*SQL SELECT STATEMENT - LOGICAL SYNTAX SEQUENCE*/
--1. Select
--2. DISTINCT
--3. FROM
--4. WHERE
--5.GROUP BY
--6.HAVING
--7.ORDER BY

/*SQL SELECT STATEMENT - Processing SEQUENCE*/
--1. FROM
--2. WHERE
--3. GROUP BY
--4. HAVING
--5. SELECT
--6. DISTINCT
--7. ORDER BY

/*JOIN and HANDS ON*/
--HOMEWORK --

/**List Orders from the Orders table
JOIN to the customers and Employees tables to  include Customer Name(Company Name), and Employee Name (first and last)
From the Orders table, include Order ID, OrderDate and Freight/ **/

SELECT * FROM Orders;
SELECT * FROM Customers;
SELECT * FROM Employees;

SELECT 
CONCAT(FirstName, ' ', LastName) AS 'Employee Name',
c.CompanyName AS 'Customer Name',
o.OrderID, 
o.OrderDate, 
o.Freight
FROM Customers c INNER JOIN Orders o
ON o.CustomerID = c.CustomerID
INNER JOIN employees e 
ON o.EmployeeID = e.EmployeeID
ORDER BY OrderID


/*FORMAT*/ 

SELECT o.OrderID, FORMAT(o.OrderDate, 'dd/MM/yyy') AS "After 2012"
FROM Orders o;

/*Subquery*/
--nested query inside another SELECT statement--
--inner query will trun first, feeding data to outer query and then the outer query will run-
--JOINS can also be used to solve
-- To see which Customers have not placed any orders-- 

SELECT c.CompanyName AS "Customer"
FROM Customers c
WHERE c.CustomerID NOT IN 
    (SELECT o.CustomerID FROM Orders o)

--same problem but using JOIN to solve it--

SELECT c.CompanyName AS "Customer"
FROM Customers c LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL
    
SELECT * FROM Customers
SELECT * FROM Orders 

/*How a nested query (subquery) can be used in SELECT clause in column*/
--Must be contained by a parenthesis(excluding any allias--
--Output the highest price in the table on every row in the result set--

SELECT od.OrderID, od.ProductID, od.Quantity, od.Discount,
(SELECT MAX(UnitPrice)FROM [Order Details]) AS "Max Price"
FROM [Order Details] od

/*How can a nested query be used in table itself*/
--Inline view---
SELECT od.ProductID, sq1.totalmt AS "Total Sold for this Product",
((od.UnitPrice, od.Quantity/sq1.totalmt*100 AS "% of Total"
    FROM [Order Details] od
    INNER JOIN   
        (SELECT od.ProductID, SUM(od.UnitPrice*Quantity)AS totalamt
        FROM [Order Details]od
        GROUP BY od.ProductID) sq1.ProductID=od.ProductID



/**/
-- Using Subquery in the WHERE clause, list all Orders(OrderID, Product ID, Unit Price, Quantity & Discount)
-- from the [Orders Details] table where the product has been discontinued


SELECT od.OrderID, od.ProductID, od.UnitPrice, od.Quantity, od.Discount
FROM [Order Details] od
WHERE od.ProductID IN
    (SELECT p.ProductID FROM Products p WHERE Discontinued=1)

/*Repeat exersize using simple JOIN*/

SELECT od.OrderID, od.productID, od.UnitPrice, od.Quantity, od.Discount, p.Discontinued
FROM [Order Details] od
INNER JOIN Products p
ON p.ProductID = od.ProductID
WHERE Discontinued = 1;

/*Adding multiple queries in the same column */

SELECT e.EmployeeID AS "Employee/Supplier"
FROM Employees e
UNION ALL 
SELECT s.SupplierID
FROM Suppliers s

/*JOINS*/
-- SQL Keyword used to combine matched rows from 2 or more tables--
-- Allows creation of ocmbined rows of matching data from different tables--
-- Its up to you which table you put in the LEFT and which in the RIGHT --


/* INNER:    SELECT<columns>
             FROM <Left Table>
             JOIN <Right Table>
             ON <left table column key>=<right table column key>

   LEFT:     SELECT<columns>
             FROM <Left Table>
             LEFT JOIN <Right Table>
             ON <left table column key>=<right table column key>

    RIGHT:   SELECT <columns>
             FROM <Left table>
             RIGHT JOIN <Right Table>
             ON <left table column key>=<right table column key>



*/

SELECT * FROM [Order Details]
SELECT * FROM Products

--LEFT JOIN--
SELECT * FROM Products p LEFT JOIN [Order Details]od 
ON p.ProductID = od.ProductID

--RIGHT JOIN--
SELECT p.ProductID, p.UnitPrice, p.UnitsInStock
FROM Products p RIGHT JOIN [Order Details]od
ON p.ProductID = od.ProductID
ORDER BY p.ProductID DESC


---JOIN to the customers and Employees tables to  include Customer Name(Company Name), and Employee Name (first and last)---
---From the Orders table, include Order ID, OrderDate and Freight/ **/---

SELECT c.CompanyName, e.FirstName, e.LastName, o.OrderID, o.OrderDate, o.Freight
FROM Employees e JOIN Orders o 
ON e.EmployeeID = o.EmployeeID
JOIN Customers c 
ON o.CustomerID=c.CustomerID
ORDER BY o.OrderID



--Average units on order per supplier--

SELECT s.CompanyName, AVG(p.UnitsOnOrder) AS "Avg per Supplier"
FROM Products p JOIN Suppliers s
ON s.SupplierID=p.SupplierID
GROUP BY s.CompanyName, s.SupplierID
ORDER BY "Avg per Supplier" DESC


