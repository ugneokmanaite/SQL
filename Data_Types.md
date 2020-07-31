#Data Types

## **VARCHAR** 
- Variable character= Adaptable to different length of characters. Records MAX size e.g. 
 
 `CHAR (10)`  John = Take in all 10 character sets = fixed length
 
 `VARCHAR(10)` John = Memory efficient = variable length 
 
- We would use CHAR as its 50% faster than VARCHAR

- Using CHAR e.g. licence plate in country as the number of characters is fixed

## **CHAR**
- Data must be at fixed length. Fixed amount of space used. 

## **INT**
- Holds a whole number/integer value (see also bigint, smallint and tinyint)- Positive or negative
- Depends what kind of data type you need to use and what space is required (memory) to decide which int type to use
- All about memory efficiency 

## **DATE or TIME or DATETIME**
- Stores Date, Time or both date and time
- Only used inside columns

## **DECIMAL or NUMERIC**
- Fixed Precision and scale (digits to right of decimal point)number
- `DECIMAL (6,4) =12.4567` (scaling= how many digits after decimal point) Length= amount of digits

## **BINARY**
- Use to store binary data such as an image or file

## **FLOAT**
- Scientific use (very large numbers)

## **BIT**
- Equivalent to binary (0,1 or Null)
- More used as a true/false