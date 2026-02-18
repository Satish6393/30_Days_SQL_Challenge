CREATE TABLE customer2( 
	user_id SERIAL PRIMARY KEY,
	username varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	age int NOT NULL,
	city varchar(50) NOT NULL
	);

INSERT INTO customer2
	(username,email,age,city)
VALUES
	('Rajesh','rajesh@gmail.com',22,'Delhi'),
	('Priya','priya@gmail.com',25,'Mumbai'),
	('Satish','satish@gmail.com',21,'Lucknow'),
	('Ankit','ankit@gmail.com',24,'Pune'),
	('Rajan','rajan@gmail.com',20,'Gorakhpur'),
	('Abhishek','abhishek@gmail.com',19,'Kushinagar');

SELECT * FROM customer2;

UPDATE customer2 
	SET age=22 
WHERE user_id=6;

SELECT * FROM customer2 ORDER BY username ASC;


UPDATE customer2
SET age=23, city='Deoria'
WHERE username='Rajan';

UPDATE customer2
SET age=age+1
WHERE email LIKE '%@gmail.com';

-- TO rename the username column to Full_name

ALTER TABLE customer2
RENAME COLUMN username TO full_name;

SELECT * FROM customer2 ORDER BY user_id;

SELECT * FROM customer2;

-- To change the age column's data type from INT to SMALLINT

ALTER TABLE customer2
	ALTER COLUMN age TYPE SMALLINT;

-- DROP CONSTRAINT
ALTER TABLE customer2
	DROP CONSTRAINT age;

-- Adding CHECK constraint to age column

ALTER TABLE customer2
ADD CONSTRAINT age CHECK(age>=18);

-- ALTER TABLE name
ALTER TABLE customer2
RENAME TO users;

SELECT * FROM users;