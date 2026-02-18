

DROP TABLE IF EXISTS employee;

CREATE TABLE employee(
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	department VARCHAR(50),
	salary DECIMAL(10,2) CHECK(salary>0),
	joining_date DATE NOT NULL,
	age INT
);
SELECT * FROM employee;

-- import CSV file

COPY 
employee(employee_id, first_name, last_name, department, salary, joining_date, age)
FROM 'D:\SQL\employee_data.csv'
DELIMITER','
CSV HEADER;

-- Arthematic Operators
-- 1. Retrive the first_name, salary, and calculate a 10% bonus on the salary.
SELECT first_name, salary,(salary*0.10) AS Bonus FROM employee;

-- 2. Calculate the annual salary and salary increment by 5% - show the new salary as well
SELECT first_name, last_name, salary,
(salary*12) AS annual_salary,
(salary*0.05) AS increment_amount,
(salary*1.05) AS new_salary,
(salary+salary*0.05) AS new_salary2
FROM employee;

-- Comparison Operators
-- 1.Retrive the employees whose age is 30.
SELECT * FROM employee
WHERE age=30;

-- 2. Retrive all age except 30.
SELECT * FROM employee
WHERE age!=30;

-- 3. salary greater than 50000.
SELECT first_name,salary FROM employee
WHERE salary>50000;

-- Logical Operators
-- 1. AND OPERATOR  Both Condition TRUE
-- Retrive the salary>50000 AND age>40
SELECT * FROM employee
WHERE salary>50000 AND age>40;

-- 2. OR OPERATOR One Condition TRUE
SELECT * FROM employee
WHERE salary>50000 OR age>40;

-- 3. NOT OPERATOR 
SELECT * FROM employee
WHERE NOT (department='IT');

-- BETWEEN, LIKE and IN OPERATOR
-- 1. Retrive employees whose salary is between 40000 and 60000.

SELECT * FROM employee
WHERE salary BETWEEN 40000 AND 60000;

-- 2. Find employees whose first_name start with 'J'.
SELECT * FROM employee;

SELECT * FROM employee
WHERE first_name LIKE 'J%';


-- 3. Retrive employees who belong to either the 'Finace' or 'Marketing' departments

SELECT * FROM employee
WHERE department IN ('Finance','Marketing');

-- IS NULL, ORDER BY, LIMIT, DISTINCT OPERATORS

-- Find employees where the email column is NULL (if applicable)
SELECT first_name, last_name, email FROM employee
WHERE email IS NULL;

-- List employees sorted by salary in DESCENDING order.
SELECT first_name, last_name, salary FROM employee
ORDER BY salary DESC;

-- Retrive the top 5 highest paid employees.
SELECT first_name, last_name, salary FROM employee
ORDER BY salary DESC
LIMIT 5;

-- Retrive a list of unique departments
SELECT COUNT(DISTINCT department) FROM employee;

SELECT DISTINCT department FROM employee;

