# Date Functions

**1. GETDATE**
`SELECT GETDATE()`to return the current date and time

**2. SYSDATETIME**
`SYSDATETIME()`  to return the date and time of the computer being used

**3. DATEADD**
`DATEADD(d,5,OrderDate) AS "Due Date"` to add 5 days

**4. DATEDIFF**
`DATEDIFF(d.OrderDate, ShippedDate) AS "Ship Time"` to calculate difference between dates 

**5. YEAR**
`SELECT YEAR(OrderDate) AS "Order Year"` to extract the year from a date 

**6. MONTH**
`SELECT MONTH(OrderDate) AS "Order Month"` to extract the month from a date

**7. DAY** 
`SELECT DAY (OrderDATE) AS "Order Day"` to extract the day from a date 