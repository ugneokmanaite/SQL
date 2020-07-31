**_NORMALIZATION_**

-Normal Form (takes all the redundancies out of the database)
- QUALITY GATE = explain normalisation with examples
- **Through normalisation we attain between design and performance by removing redundant values from databased e.g. duplicate or repeating values  **


_**1st Normal Form**_
- A database is in First Normal Form when the following conditions are satisfied:

- Make everything Atomic (data must be as small as it can be)
- There should be no repeating groups - e.g. a table that records data on a book and its authors with following columns [BOOK ID] [AUTHOR 1] [AUTHOR 2]
- This is not in 1NF because AUTHOR 1, AUTHOR 2 are repeating same attribute
- There should not be any repeating groups!
- So we would create 2 tables - TABLE A (BOOK ID & Price) and TABLE B (BOOK ID & AUTHOR ID) 
- PRODUCT ID will always be a certain price, but it can have both authors. 
- first table = primary key 
- second table = composite key 

**2nd Normal Form**
- A database is in second from when the following conditions are satisfied: IT IS in 1NF and all non key attributes are fully functional dependent on the PRIMARY KEY
-  E.g. if composite key is used the column should depend on BOTH values
- Second table would have to be created to have dependant composite keys

**3rd Normal Form**
- When following conditions are satisfied: It is in 2NF & There is no transitive functional dependency ( when non key column is functionally dependant on another non key column )