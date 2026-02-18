-- Type of SQL joins
-- 1. INNER JOIN : Retrives record with matching values in both tables.
-- 2. LEFT JOIN (LEFT OUTER JOIN) : Retrives all records from the left table and matching records from the right table. Non-matching records in the right table is NULL.
-- 3. RIGHT JOIN (RIGHT OUTER JOIN) : Retrives all records from the right table and matching records from the left table. Non-matching records in the left table is NULL.
-- 4. FULL JOIN (FULL OUTER JOIN) : A FULL JOIN (also known as a FULL OUTER JOIN) returns all rows from both the left and the right table, combining matching rows and using NULL values for columns where no match exists in the other table. This operation effectively combines the results of a LEFT JOIN and a RIGHT JOIN.
-- 5. CROSS JOIN : A CROSS JOIN in SQL produces the Cartesian product of two or more tables, combining every row from the first table with every row from the second table. Unlike other join types (like INNER JOIN or LEFT JOIN), it does not require a join condition or an ON clause.
-- 6. SELF JOIN : Joins a table to itself.

-- Create employee3 table
CREATE TABLE employee3 (
	employee_id serial PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	department_id INT
);

INSERT INTO employee3 (first_name, last_name, department_id)
VALUES
('Rahul', 'Sharma',101),
('Priya', 'Mehta',102),
('Ankit', 'kumar',103),
('Simran','Kaur',NULL),
('Aman','Singh',101);

SELECT * FROM employee3;

-- Create Department Table
CREATE TABLE Departments(
	department_id INT PRIMARY KEY,
	department_name VARCHAR(50)
);

INSERT INTO Departments ( department_id, department_name)
VALUES
(101,'Sales'),
(102,'Marketing'),
(103,'IT'),
(104,'HR');

SELECT * FROM Departments;

-- INNER JOIN
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_id,
	d.department_name
FROM
	employee3 e
INNER JOIN
	Departments d
ON
	e.department_id = d.department_id;


-- LEFT JOIN
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_id,
	d.department_name
FROM
	employee3 e
LEFT JOIN
	Departments d
ON
	e.department_id = d.department_id;


-- RIGHT JOIN
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_id,
	d.department_name
FROM
	employee3 e
RIGHT JOIN
	Departments d
ON
	e.department_id = d.department_id;

-- FULL JOIN
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_id,
	d.department_name
FROM
	employee3 e
FULL JOIN
	Departments d
ON
	e.department_id = d.department_id;

-- CROSS JOIN
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_id,
	d.department_name
FROM
	employee3 e
CROSS JOIN
	Departments d;

-- SELF JOIN
SELECT 
	e1.first_name AS Employee_name1,
	e2.first_name AS Employee_name2,
	
	d.department_name
FROM
	employee3 e1
JOIN
	employee3 e2
ON
	e1.department_id = e2.department_id AND e1.employee_id != e2.employee_id
JOIN
	Departments d
ON
	e1.department_id = d.department_id;