-- create a TABLE
CREATE TABLE employee(
	employee_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
		position VARCHAR(50),
	department VARCHAR(50),
	hire_date DATE,
	salary NUMERIC(10,2)	
);

SELECT * FROM employees;

-- RENAME the TABLE name
ALTER TABLE employee RENAME TO employees;

-- INSERT value into TABLE
INSERT INTO employees
	(name, position, department, hire_date, salary)
VALUES
('Satish SINGH','Data Analyst','Data Science', '2026/01/20',45000),
('Arpit Singh','Graphic Designer','Designing', '2026/04/15',35000),
('Aniket Singh','Power House Engineer','Energy', '2027/03/10',50000),
('Anurag Singh','Frontend Developer','Web Design', '2028/05/25',25000),
('Susheel Singh','HR','Electrical', '2026/05/15',38000);

-- UPDATE Name
UPDATE employees SET name = 'Satish Singh' WHERE employee_id = 1;

-- Delete the table but not their structure
TRUNCATE TABLE employees RESTART IDENTITY;

-- SELECT * FROM employees ORDER BY employee_id ASC, name ASC;

ALTER TABLE employees ADD age INT;

SELECT * FROM employees;

INSERT INTO employees(age) VALUES (21), WHERE employee_id=1;
INSERT INTO employees(age) VALUES (19);
INSERT INTO employees(age) VALUES (20);
INSERT INTO employees(age) VALUES (19);
INSERT INTO employees(age) VALUES (23);

-- UPDATE employees
-- SET age = 21
-- WHERE employee_id = 1;

-- UPDATE employees
-- SET age = 20
-- WHERE employee_id = 2;

-- UPDATE employees
-- SET age = 19
-- WHERE employee_id = 3;

-- UPDATE employees
-- SET age = 20
-- WHERE employee_id = 4;

-- UPDATE employees
-- SET age = 23
-- WHERE employee_id = 5;

ALTER TABLE employees ADD email VARCHAR(50);

UPDATE employees SET email = 'satishsinghg07@gmail.com';

UPDATE employees
SET age = age+1
WHERE department LIKE '%@gmail.com';

SELECT * FROM employees;




