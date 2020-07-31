SELECT DATEADD(D,5,OrderDate)AS "Due Date",
DATEDIFF(d,OrderDate, ShippedDate) AS "Ship Days"
FROM Orders

/*Output employee list from Employees table, including their Name (concatenated)*/
/*Include their Age(calculated from BirthDate*/

SELECT
CONCAT(e.FirstName, ' ' , e.LastName) AS "Name",
DATEDIFF(YEAR,e.BirthDate, GetDate()) AS "Age"
FROM Employees e 


/* Getting the decimal place for age */

SELECT
CONCAT(e.FirstName, ' ' , e.LastName) AS "Name",
DATEDIFF(DAY,e.BirthDate, GetDate()) /365.25 AS "Age"
FROM Employees e 

/*Case Statements */ 
--When varying results output based on differing data--
--Use single quotes for data and double quotes for column aliases--

SELECT CASE
WHEN DATEDIFF(d,OrderDate, ShippedDate) < 10 THEN 'On Time'
ELSE 'Overdue'
END AS "Status"
FROM Orders

/**/

SELECT
CONCAT(e.FirstName, ' ' , e.LastName) AS "Name",
DATEDIFF(YEAR,e.BirthDate, GetDate()) AS "Age"
FROM Employees e 
SELECT CASE
WHEN (DATEDIFF(DAY, e.BirthDate, GETDATE())/365) > 65 THEN 'Retired'
WHEN (DATEDIFF(DAY, e.BirthDate, GETDATE())/365) > 60 THEN 'Retirement Due'
ELSE 'More than 5 years to go'
END AS "Retirement Status"
FROM Employees e 

/*Aggregates*/

SELECT SupplierID, SUM(UnitsOnOrder) AS "Total On Order",
AVG(UnitsOnOrder) AS "Avg On Order",
MIN(UnitsOnOrder) AS "Min On Order",
MAX (UnitsOnOrder) AS "Max On Order"
FROM Products p 
GROUP BY SupplierID
-- Grouping based on Supplier ID--

SELECT p.UnitsOnOrder
FROM Products p

SELECT * FROM Products

SELECT SupplierID, SUM(UnitsOnOrder) AS "Total On Order",
AVG(UnitsOnOrder) AS "Avg On Order",
MIN(UnitsOnOrder) AS "Min On Order",
MAX (UnitsOnOrder) AS "Max On Order"
FROM Products p 
GROUP BY SupplierID

/*Use GROUP BY to calculate Average Reorder Level for all Products by Category ID*/
--Select clause must match the GROUP BY clause, apart from any aggregates--
--What is Average Reorder Level? Use ORDER BY with DESC to confirm--

SELECT p.CategoryID,
AVG(p.ReorderLevel) AS "Avg Reorder Level"
FROM Products p
GROUP BY p.CategoryID
ORDER BY "Avg Reorder Level" DESC


/*Just show orders which are more than 5*/

SELECT p.CategoryID,
AVG(p.ReorderLevel) AS "Avg Reorder Level"
FROM Products p
GROUP BY p.CategoryID
HAVING AVG(UnitsOnOrder)>5