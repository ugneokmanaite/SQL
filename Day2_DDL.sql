USE ugne_db

DELETE TABLE film_table


CREATE TABLE film_table
(
    film_name VARCHAR(10),
    film_type VARCHAR(6),
    date_of_release DATETIME,
    director VARCHAR (30),
    writer VARCHAR (30),
    star INT,
    film_language VARCHAR (20),
    official_website VARCHAR (30),
    plot_summary VARCHAR (1000)
)

ALTER TABLE film_table
ALTER COLUMN film_name VARCHAR(10) NOT NULL

--restricting so no value can be left Null--

ALTER TABLE film_table
ADD release_date DATETIME;

--inserting data into table--

INSERT INTO film_table
( 
    film_name, film_type, date_of_release, director, writer, star, film_language, official_website, plot_summary
)
VALUES 
(
    'SQL', 'Drama', '2020-06-23', 'Ugne Okmanaite', 'Whatever', 4, 'English', 'www.ugne.com', 'Quick summary'
);


SELECT * from film_table

ALTER TABLE film_table
ADD film_id INT IDENTITY (1,7) PRIMARY KEY

CREATE TABLE director
(
    director_id INT IDENTITY (1,5),
    director_name VARCHAR(50),
    city VARCHAR (20) DEFAULT 'LONDON',
    film_id INT,
    PRIMARY KEY(director_id),
    FOREIGN KEY(film_id) REFERENCES film_table(film_id)
)

SELECT * FROM director

INSERT INTO director
(director_name, film_id)
VALUES
('Steve', 1)

SELECT * FROM director

INSERT INTO director
(director_name, film_id)
VALUES
('BOB', 4)

SELECT * FROM director
SELECT * FROM film_table

DELETE FROM film_table WHERE film_id=1

UPDATE director SET director_name='Jamie'WHERE film_id = 1

SELECT * FROM director
SELECT * FROM film_table


ALTER TABLE director
ADD CONSTRAINT film_id
FOREIGN KEY (film_id)

