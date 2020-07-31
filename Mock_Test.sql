/*MOCK TEST WITHOUT ANSWERS*/

/*1. Create a report showing the title of courtesy and the first and last name
of all employees whose title of courtesy is not "Ms." or "Mrs.".*/

--correct--

SELECT e.TitleOfCourtesy, e.FirstName, e.LastName
FROM Employees e WHERE e.TitleOfCourtesy NOT IN ('Ms.', 'Mrs.');

/*2. Create a report that shows the company name, contact title, city and country of all customers 
in Mexico or in any city in Spain except Madrid(in Spain).*/

--correct--

SELECT c.CompanyName, c.ContactTitle, c.City, c.Country
FROM Customers c 
WHERE c.Country IN ('Mexico' ,'Spain') 
AND c.City NOT IN ('Madrid');

/*3. Create a report showing the title of courtesy and the first and
last name of all employees whose title of courtesy begins with "M" and
is followed by any character and a period (.).*/

--did differently--

SELECT e.TitleOfCourtesy, e.FirstName,e.LastName
FROM Employees e
WHERE e.TitleOfCourtesy LIKE 'M_.'

--Model answer--
SELECT e.TitleOfCourtesy, e.FirstName, e.LastName
FROM Employees e WHERE e.TitleOfCourtesy LIKE ('M%.')

/*4. Create a report showing the first and last names of
all employees whose region is defined.*/

--correct--

SELECT e.FirstName,e.LastName
FROM Employees e
WHERE e.Region IS NOT NULL;

/*5. Select the Title, FirstName and LastName columns from the Employees table.
Sort first by Title in ascending order and then by LastName 
in descending order.*/

--Added ASC which was not required--

SELECT e.TitleOfCourtesy,e.FirstName,e.LastName
FROM Employees e
ORDER BY e.TitleOfCourtesy ASC, e.LastName DESC;

/*6. Write a query to get the number of employees with the same job title.*/
--correct--

SELECT e.Title,COUNT(e.EmployeeID) AS "Total Employees with selected job title"
FROM Employees e
GROUP By e.Title;

/*7.
Create a report showing the Order ID, the name of the company that placed the order,
and the first and last name of the associated employee.
Only show orders placed after January 1, 1998 that shipped after they were required.
Sort by Company Name.
*/

SELECT o.OrderID, c.CompanyName, e.FirstName, e.LastName
FROM Employees e
	JOIN Orders o ON (e.EmployeeID = o.EmployeeID)
	JOIN Customers c ON (c.CustomerID = o.CustomerID)
WHERE o.ShippedDate > o.RequiredDate AND o.OrderDate > '1998-01-01'
ORDER BY c.CompanyName;


/*8.
Create a report that shows the total quantity of per products (from the OrderDetails table) ordered. Only show records for products for which the quantity ordered is fewer than 200. 
The report should return*/

--same answer but no JOIN used--

SELECT od.ProductID,
SUM(od.Quantity) AS "Total Ordered"
FROM [Order Details] od
GROUP BY od.ProductID
HAVING SUM(od.Quantity)<200;

--Model answers--
SELECT p.ProductName, SUM(od.Quantity) AS "TotalUnits"
FROM [Order Details] od JOIN Products p ON
	(p.ProductID = od.ProductID)
GROUP BY p.ProductID,p.ProductName
HAVING SUM(od.Quantity) < 200;

/*9.Create a report that shows the total number of orders by Customer since December 31, 1996. The report should only return rows for which the NumOrders is greater than 15. 
*/
SELECT c.CustomerID, COUNT(o.OrderID) AS "NumOrders"
FROM Customers c JOIN Orders o ON
	(c.CustomerID = o.CustomerID)
WHERE OrderDate >= '31-Dec-1996'
GROUP BY c.CustomerID
HAVING COUNT(o.OrderID) > 15
ORDER BY NumOrders DESC;

/*10.  SQL statement will return all customers, and number of orders they might have placed. 
Include those customers as well who have not placed any orders.*/

--correct--

SELECT c.CustomerID, COUNT(o.OrderID) AS "Total orders placed"
FROM Customers c LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;


----------------


