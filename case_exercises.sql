-- Exercise Goals

-- Use CASE statements or IF() function to explore information in the employees database
USE employees;
-- Create a file named case_exercises.sql and craft queries to return the results for the following criteria:

-- Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.
SELECT CONCAT(first_name, ' ', last_name) Employee, de.dept_no Department, e.hire_date Start_Date, de.to_date End_date,
		IF (de.to_date = '9999-01-01', TRUE, FALSE) is_current_employee
FROM employees AS e
JOIN dept_emp AS de
	USING (emp_no)
WHERE e.emp_no IN 
(
SELECT DISTINCT(emp_no)
FROM employees AS e
JOIN dept_emp AS de
	USING (emp_no)
)
;

-- Write a query that returns all employee names (previous and current), 
-- and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT CONCAT(first_name, ' ', last_name) AS Name,
		CASE 
			WHEN last_name BETWEEN 'a%' AND 'h%' THEN 'A-H'
            WHEN last_name BETWEEN 'i%' AND 'q%' THEN 'I-Q'
            ELSE 'R-Z'
		END AS 'alpha_group'
FROM employees
;

-- How many employees (current or previous) were born in each decade?
SELECT 
SUM(IF (birth_date like '196%', 1, 0)) AS "1960's", 
SUM(IF (birth_date like '195%', 1, 0)) AS "1950's"
FROM employees;
/*
1950's 182,886
1960's 117,138
*/

-- What is the current average salary for each of the following department groups: 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
SELECT
	CASE
       WHEN dept_name IN ('research', 'development') THEN 'R&D'
       WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
       WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
       WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
       ELSE 'Customer Service'
   END AS Department,
   ROUND(AVG(s.salary),2) AS Average_Salary
FROM dept_emp AS de
JOIN departments AS d
	USING (dept_no)
JOIN salaries AS s
	USING (emp_no)
WHERE s.to_date like '%9999%'
GROUP BY Department
;

-- BONUS

-- Remove duplicate employees from exercise 1.

SELECT CONCAT(first_name, ' ', last_name) Employee, de.dept_no Department, e.hire_date Start_Date, de.to_date End_date,
		IF (de.to_date = '9999-01-01', TRUE, FALSE) is_current_employee
FROM employees AS e
JOIN dept_emp AS de
	USING (emp_no)
WHERE e.emp_no IN 
(
SELECT DISTINCT(emp_no)
FROM employees AS e
JOIN dept_emp AS de
	USING (emp_no)
)
;