

CREATE TABLE employees (
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	department VARCHAR(50),
	salary DECIMAL(10,2) CHECK(salary>0),
	joining_date DATE NOT NULL,
	age INT CHECK(age>=18)
);


INSERT INTO employees (first_name, last_name,department, salary, joining_date, age)
VALUES 
('AMIT','Sharma','IT',60000.00,'2022-05-01',29),
('Neha','Patel','HR',55000.00,'2021-08-15',32),
('Ravi','Kumar','Finance',70000.00,'2020-03-10',35),
('Anjali','Verma','IT',65000.00,'2019-11-22',28),
('Suresh','Reddy','Operations',50000.00,'2023-08-10',26);

SELECT * FROM employees;

-- Practice Assignment Questions 

-- Q1: Retrieve all employees' first names and their departments.

SELECT first_name, department FROM employees;

-- Q2: Update the salary of all employees in the 'IT' department by increasing it by 10%.

UPDATE employees 
SET salary = salary+0.1
WHERE department='IT';

SELECT * FROM employees;

-- Q3: Delete all employees who are older than 34 years.

DELETE from employees WHERE age>34;

SELECT * FROM employees;


-- Q4: Add a new column 'email' to the employees' table.

ALTER TABLE employees 
ADD email VARCHAR(50);

SELECT * FROM employees;

-- Q5: Rename the department column to 'dept_name".

ALTER TABLE employees
RENAME COLUMN department TO dept_name;

SELECT * FROM employees;

-- Q6: Retrieve the names of employees who joined after January 1, 2021.

SELECT first_name FROM employees WHERE joining_date>'2021-01-01';

-- Q7: Change the data type of the 'salary column to "INTEGER'.

ALTER TABLE employees
ALTER COLUMN salary TYPE INT;

SELECT * FROM employees;

-- Q8: List all employees with their age and salary in descending order of salary.

SELECT first_name,age,salary FROM employees
ORDER BY salary DESC;

-- Q9: Insert a new employee with the following details: 'Raj', 'Singh', "Marketing', 60000, '2023-09-15', 30.

INSERT INTO employees(first_name,last_name,dept_name,salary,joining_date,age)
VALUES ('Raj', 'Singh', 'Marketing', 60000, '2023-09-15', 30);

SELECT * FROM employees;

-- Q10: Update age of employee 1 to every employee

UPDATE employees
SET age=age+1;


