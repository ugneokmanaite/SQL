USE ugne2_db;

DROP TABLE spartans_table

CREATE TABLE spartans_table
(
    spartan_ID INT IDENTITY (1,1),
    title VARCHAR(5),
    first_name VARCHAR(15),
    last_name VARCHAR(20),
    university_attended VARCHAR(40),
    course_taken VARCHAR (50),
    mark_achieved VARCHAR(3) NOT NULL DEFAULT 'PENDING',
    PRIMARY KEY(spartan_ID)
);

SELECT * FROM spartans_table

INSERT INTO spartans_table
VALUES
('Miss.','Georgina','Bartlett ','Newcastle University','Archaeology ','2:1')
,('Mr.','Ibrahim','Bocus','University of Leicester','Mechanical Engineering','2:1')
,('Mr.','Humza','Malak','University of Kent','Computer Science','2:2')
,('Mr.','Ibrahim','Bocus','University of Leicester','Mechanical Engineering','2:1')
,('Mr.','Bari','Allali','Lancaster University','Business Economics','2:1')
,('Mr.','Mehdi','Shamaa','University of Nottingham','Philosophy and Economics','2:2')
,('Miss.','Anais','Tang','Edinburgh University','Modern Languages','2:1')
,('Mr.','Saheed','Lamina','University of Warwick','Politics and International Studies','2:1')
,('Mr.','Man-Wai','Tse','University of Hertfordshire','Aerospace Engineering','2:1')
,('Mr.','Sohaib','Sohail','Brunel University London','Communications and Media Studies','2:1')
,('Miss.','Ugne','Okmanaite','Aston University','International Business & Management','2:1')
,('Mr.','Max','Palmer','University of Birmingham','Ancient History','2:1')
,('Mr.','Daniel','Teegan','University of Brighton','Product Design','2:2')

INSERT INTO spartans_table(title, first_name, last_name , university_attended, course_taken)
VALUES 
('Mr.', 'John', 'Byrne', 'University of Greenwich', 'Computing with Games development');

