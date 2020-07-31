# String Functions
 
 Used to manipulate text in various ways in the SELECT clause:
 
 **1. CHARSTRING**
 
`CHARINDEX('a' ,'text') ` to search for a string e.g. find 'a' in a column called 'text'
 
 ```oracle-sql

SELECT film_name, CHARINDEX('s', film_name) AS "Position of Character"

/*This would provide an answer */
```
|   film_name  |  position of character
----| ------
|____Star Wars  | 5 |
| Superman |  1|
| Batman | 0|

- Searches within the string and returns the index of that something
- IN SQL index starts at 1

**2.SUBSTRING**

`SUBSTRING(expression, start, length)`
 
 `SUBSTRING(name,1,1) for the initial`
 
 - 1 = start point
 - 3 = length

```
SELECT film_name, SUBSTRING(film_name, 1, 3) AS "Extracted String"
```
|   film_name  | Extracted String
-------| ------|
____Star Wars| |
Star Trek | Sta|
Batman | Bat
Superman | Sup

- 4 spaces in front of Star wars so produced 5
- 1 = star position
- 3 = length

3. **LEFT OR RIGHT**
- LEFT(name,5) for the first (or last if RIGHT) 5 characters 

```oracle-sql
SELECT film_name, RIGHT(film_name, 2) AS "Extracted String" FROM film_table

```

|  film_name | Extracted string
|-----|------|
|____Star Wars| rs
|Batman____|     |
|Superman| an |

```oracle-sql

- Batman has 4 spaces after so it would produce space as string


SELECT film_name, LEFT(film_name, 2) AS "Extracted String" FROM film_table
```

|  film_name | Extracted string
|-----|------|
|____Star Wars| 
|Batman|Ba |
|Superman|Su |

- Start wars has 4 spaces in front so it would produce space as a string

4. **LTRIM, RTRIM**
- Used to remove spaces at the beginning or end of a string

```oracle-sql
SELECT film_name, LTRIM(film_name) AS "Trimmed String" from film_table
```
|  film_name | Trimmed string
|-----|------|
|____Star Wars|Star Wars
|Batman___|Ba |Batman____
|Superman|Su |Superman

- Spaces from Star Wars at beginning were removed

```oracle-sql
SELECT film_name, RTRIM(film_name) AS "Trimmed String" from film_table

```

|  film_name | Trimmed string
|-----|------|
|____Star Wars|____Star Wars
|Batman___|Ba |Batman
|Superman|Su |Superman

- Spaces at the end of Batman were removed

5. **LEN**
- `LEN(name) `For the length of the name

```oracle-sql

SELECT film_name, LEN(film_name) AS "LENGTH of String" FROM film_table
```
|  film_name | LENGTH of String
|-----|------|
|____Star Wars|13
|Batman___|Ba |9
|Superman|Su |8

- 4 spaces before Star Wars
- 4 spaces after Batman

6. **REPLACE**
- `REPLACE(name, ' ' , '_') `to replace spaces with underscores 

```oracle-sql
SELECT film_name, REPLACE (film_name, ' ', 'A') AS "Replaced String" FROM film_table

/* This will replace the spaces with the character A*/
```
|  film_name | Replaces string
|-----|------|
|____Star Wars|AAAAStarAWars
|Batman___|Ba |BatmanAAAA
|Superman|Su |Superman

- This replaces spaces at beginning of Star Wars and end of Batman

7. **UPPER or LOWER**
- `UPPER(name) `to convert all to upper _(or lower)_ case
 
 ```oracle-sql
SELECT film_name, UPPER(film_name) AS "Uppercase String", LOWER(film_name) AS "Lowecase String" FROM film_table;

```
