USE ursula_2339;
-- Exercises

-- Create a file named temporary_tables.sql to do your work for this exercise.

-- Using the example from the lesson, create a temporary table called employees_with_departments that contains 
-- first_name, last_name, and dept_name for employees currently with that department. 
-- Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.
CREATE TEMPORARY TABLE employees_with_departments (first_name VARCHAR(20), last_name VARCHAR(20),
       dept_name VARCHAR(20));
SELECT *
FROM employees_with_departments;
  
-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.
ALTER TABLE employees_with_departments ADD COLUMN full_name VARCHAR(40);

-- Update the table so that the full_name column contains the correct data.
INSERT INTO employees_with_departments (full_name)
  SELECT CONCAT(first_name, ' ', last_name)
  FROM employees.employees;
  
-- Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

-- What is another way you could have ended up with this same table?
CREATE TEMPORARY TABLE employees_with_departments_2 AS
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

SELECT *
FROM employees_with_departments_2;

-- Create a temporary table based on the payment table from the sakila database.
CREATE TEMPORARY TABLE temp_akila  AS
SELECT *
FROM sakila.payment
;

SELECT *
FROM temp_akila;


-- Write the SQL necessary to transform the amount column such that it is stored as 
-- an integer representing the number of cents of the payment. For example, 1.99 should become 199.
UPDATE temp_akila SET amount = amount * 100
LIMIT 40;

ALTER TABLE temp_akila MODIFY amount INTEGER;


-- Go back to the employees database. Find out how the current average pay in each department compares to the overall current pay for everyone at the company. 
-- For this comparison, you will calculate the z-score for each salary. 
-- In terms of salary, what is the best department right now to work for? The worst?
USE employees;
-- 1- 6,899.370881541041
-- 2- 4,704.445403963594
-- 3- 6,028.272629643805
-- 4--12,837.7454169569
-- 5--15,441.63421432176
-- 6–5,521.142188919663
-- 7-36,679.02885308959
-- 8–3,656.306155484866
-- 9–4,797.744533266708
SELECT
(SELECT 
	SUM((salary - 
		(SELECT AVG(salary) 
			FROM salaries 
            where to_date > now()))
            /
		(SELECT stddev(salary) 
			FROM salaries 
            where to_date > now())) Zscore
    FROM salaries s
    JOIN dept_emp de
    USING (emp_no)
    WHERE de.to_date > now()
    AND s.to_date > now()
    AND dept_no = 'd001');

SELECT
(SELECT 
	SUM((salary - 
		(SELECT AVG(salary) 
			FROM salaries 
            where to_date > now()))
            /
		(SELECT stddev(salary) 
			FROM salaries 
            where to_date > now())) Zscore
    FROM salaries s
    JOIN dept_emp de
    USING (emp_no)
    WHERE de.to_date > now()
    AND s.to_date > now()
    AND dept_no = 'd002');
    
    SELECT
(SELECT 
	SUM((salary - 
		(SELECT AVG(salary) 
			FROM salaries 
            where to_date > now()))
            /
		(SELECT stddev(salary) 
			FROM salaries 
            where to_date > now())) Zscore
    FROM salaries s
    JOIN dept_emp de
    USING (emp_no)
    WHERE de.to_date > now()
    AND s.to_date > now()
    AND dept_no = 'd003');
    
    SELECT
(SELECT 
	SUM((salary - 
		(SELECT AVG(salary) 
			FROM salaries 
            where to_date > now()))
            /
		(SELECT stddev(salary) 
			FROM salaries 
            where to_date > now())) Zscore
    FROM salaries s
    JOIN dept_emp de
    USING (emp_no)
    WHERE de.to_date > now()
    AND s.to_date > now()
    AND dept_no = 'd004');
    
    SELECT
(SELECT 
	SUM((salary - 
		(SELECT AVG(salary) 
			FROM salaries 
            where to_date > now()))
            /
		(SELECT stddev(salary) 
			FROM salaries 
            where to_date > now())) Zscore
    FROM salaries s
    JOIN dept_emp de
    USING (emp_no)
    WHERE de.to_date > now()
    AND s.to_date > now()
    AND dept_no = 'd005');
    
    SELECT
(SELECT 
	SUM((salary - 
		(SELECT AVG(salary) 
			FROM salaries 
            where to_date > now()))
            /
		(SELECT stddev(salary) 
			FROM salaries 
            where to_date > now())) Zscore
    FROM salaries s
    JOIN dept_emp de
    USING (emp_no)
    WHERE de.to_date > now()
    AND s.to_date > now()
    AND dept_no = 'd006');
    
    SELECT
(SELECT 
	SUM((salary - 
		(SELECT AVG(salary) 
			FROM salaries 
            where to_date > now()))
            /
		(SELECT stddev(salary) 
			FROM salaries 
            where to_date > now())) Zscore
    FROM salaries s
    JOIN dept_emp de
    USING (emp_no)
    WHERE de.to_date > now()
    AND s.to_date > now()
    AND dept_no = 'd007');
    
    SELECT
(SELECT 
	SUM((salary - 
		(SELECT AVG(salary) 
			FROM salaries 
            where to_date > now()))
            /
		(SELECT stddev(salary) 
			FROM salaries 
            where to_date > now())) Zscore
    FROM salaries s
    JOIN dept_emp de
    USING (emp_no)
    WHERE de.to_date > now()
    AND s.to_date > now()
    AND dept_no = 'd008');
    
    SELECT
(SELECT 
	SUM((salary - 
		(SELECT AVG(salary) 
			FROM salaries 
            where to_date > now()))
            /
		(SELECT stddev(salary) 
			FROM salaries 
            where to_date > now())) Zscore
    FROM salaries s
    JOIN dept_emp de
    USING (emp_no)
    WHERE de.to_date > now()
    AND s.to_date > now()
    AND dept_no = 'd009');
-- BONUS Determine the overall historic average department average salary, the historic overall average, and the historic z-scores for salary. Do the z-scores for current department average salaries (from exercise 3) tell a similar or a different story than the historic department salary z-scores?

-- BONUS Determine the overall historic average department average salary, the historic overall average, and the historic z-scores for salary. Do the z-scores for current department average salaries (from exercise 3) tell a similar or a different story than the historic department salary z-scores?

-- Hint: How should the SQL code used in exercise 3 be altered to instead use historic salary values?