DROP TABLE IF EXISTS products;

CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price NUMERIC(10, 2),
quantity INT,
added_date DATE,
discount_rate NUMERIC(5, 2)
);

INSERT INTO products (product_name, category, price, quantity, added_date, discount_rate) VALUES
('Laptop', 'Electronics', 75000.50, 10, '2024-01-15', 10.00),
('Smartphone', 'Electronics', 45000.99, 25, '2024-02-20', 5.00),
('Headphones', 'Accessories', 1500.75, 50, '2024-03-05', 15.00),
('Office Chair', 'Furniture', 5500.00, 20, '2023-12-01', 20.00),
('Desk', 'Furniture', 8000.00, 15, '2023-11-20', 12.00),
('Monitor', 'Electronics', 12000.00, 8, '2024-01-10', 8.00),
('Printer', 'Electronics', 9500.50, 5, '2024-02-01', 7.50),
('Mouse', 'Accessories', 750.00, 40, '2024-03-18', 10.00),
('Keyboard', 'Accessories', 1250.00, 35, '2024-03-18', 10.00),
('Tablet', 'Electronics', 30000.00, 12, '2024-02-28', 5.00);

SELECT * FROM products;

-- 1. Aggrigate Functions
-- Total quantity Available of all products

SELECT SUM(quantity) AS Total_quantity
FROM products;

SELECT SUM(quantity) AS quantity_of_electronic
FROM products
WHERE category='Electronics' AND price > 20000;

-- Total Number of products

SELECT COUNT(*) AS total_products
FROM products;

-- count with condition
SELECT COUNT(*) AS total_products
FROM products
WHERE product_name LIKE '%phone%';

-- Average price of products

SELECT AVG(price) AS average_price
FROM products;

-- Average price of products with condition
SELECT AVG(price) AS average_price
FROM products 
WHERE category='Accessories' OR added_date > '2024-02-01';

-- MAximum and Minimum price
SELECT MAX(price) AS MAX_PRICE,
	MIN(PRICE) AS MIN_PRICE
FROM products;


-- 2. String Functions

--  Get all Categories in UPERCASE
SELECT UPPER(category) AS category_CAPITAL FROM products;


--  Get all Categories in LOWERCASE
SELECT LOWER(category) AS category_SMALLAR FROM products;

-- JOIN product_name and category text with hypen
SELECT CONCAT(product_name,'-',category) AS product_details
FROM products;

-- Extract the first 5 characters from product_name

SELECT SUBSTRING(product_name,1,5) AS short_name 
FROM products;

-- count length

SELECT product_name, LENGTH(product_name) AS Count_of_CHAR 
FROM products;


-- Remove leading and trailing spaces from string

SELECT LENGTH(TRIM('  Monitor  ')) AS Trimed_Text;

-- Repalce the word "phone" with "device" in product_name

SELECT REPLACE(product_name,'phone','device') AS updated FROM products;


--  Get the first 3 character from category
SELECT LEFT(category,3) FROM products;

SELECT RIGHT(category,3) FROM products;

-- 3. DATE Functions

-- 1. NOW() - Get current Date and Time
SELECT NOW() AS CURRENT_DATETIME;

-- 2. CURRENT_DATE() - Get current date
SELECT CURRENT_DATE AS Today_date;

SELECT Added_date, (CURRENT_DATE - '2005-07-10') AS Day_difference FROM products;

-- 3. EXTRACT() - Extract Parts of a Date
-- extract the year, month, and day from the added_date column

SELECT product_name,
EXTRACT(YEAR FROM added_date) AS Year_added,

EXTRACT(MONTH FROM added_date) AS Month_added,

EXTRACT(DAY FROM added_date) AS Day_added
FROM products;

-- 4. AGE() Calculate Age Between Dates
-- Calculate the time difference between added_date and today's date

SELECT product_name,
AGE(CURRENT_DATE, added_date) AS Age_since_added
FROM products;

-- 5. TO_CHAR() - Format Dates as Strings
-- Format added_date in a custom format(DD-MM-YYYY)

SELECT product_name,
TO_CHAR(added_date, 'DD-MM-YYYY') AS Formated_Date
FROM products;



-- 6. DATE_PART() - Get Specific Date part
-- Extract the day of the week from added_date

SELECT product_name, added_date,
DATE_PART('dow', added_date) AS day_of_week
FROM products;

-- 7. DATE_TRUNC() - Truncate Date to Precision
-- Truncate added_date to the start of the month

SELECT product_name, added_date,
DATE_TRUNC('month', added_date) AS Month_start
FROM products;

-- 8. INTERVAL - Add or Subtract Time Intervals
-- Add 6 months to the added_date

SELECT product_name, added_date,
added_date + INTERVAL '6 days' AS new_date
FROM products;

-- 9. CURRENT_TIME() - Get Current_Time
-- Retrive only the current time

SELECT CURRENT_TIME AS Current_TIMEs;

-- 10. TO_DATE() - Convert string to date
-- Convert a string to a date format

SELECT TO_DATE('28-11-2024', 'DD-MM-YYYY') AS converted_date;


-- 4. Conditional Functions

/* CASE Function - Categorizing Based on Conditions
We will categorize products into price ranges

Expensive if the price is greater than or equal to 50,000.
Moderate if the price between 10,000 and 49,999.
Affordable if the price is less than 10,000.
*/

SELECT product_name, price,
	CASE
		WHEN price>=50000 THEN 'Expensive'
		WHEN price>=10000 AND price<=49999 THEN 'Moderate'
		ELSE 'Affordable'
	END AS price_category
FROM products;

-- COALESCE() - returns the first non-NULL value
-- Adding discount_price Columns with Null value in it.
	-- Let's simulate a scenario where discount_price is NULL for some products. We'll display price if discount_price is NULL.
	-- First, add a discount_price column and update it for 

ALTER TABLE products
ADD COLUMN discount_price NUMERIC(10,2);

-- UPDATE products 
-- SET discount_price = NULL
-- WHERE product_name IN ('Laptop', 'Desk');

UPDATE products 
-- reverse logic 10% discount
SET discount_price = price*0.9 
WHERE product_name NOT IN ('Laptop', 'Desk');

SELECT * FROM products;

SELECT product_name, price, discount_price FROM products;

SELECT product_name,
	COALESCE (discount_price, price) AS final_price
	FROM products;


--   Window Function
-- Window Function perform calculation across a set of table rows related to the current row. They are useful for ranking, calculation running totals, percentages, and much more.

-- Assign a unique row number to each product within the same category

SELECT product_name, category, price,
	ROW_NUMBER() OVER(PARTITION BY category ORDER BY price DESC) AS row_num
FROM products;

SELECT product_name, category, price,
	DENSE_RANK() OVER(PARTITION BY category ORDER BY price DESC) AS ranking
FROM products;

SELECT product_name, category, price,
	SUM(price) OVER(ORDER BY price ASC) AS running_total
FROM products;