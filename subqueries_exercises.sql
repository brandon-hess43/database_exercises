-- Exercises

-- Exercise Goals

-- Use subqueries to find information in the employees database
-- Create a file named subqueries_exercises.sql and craft queries to return the results for the following criteria:
USE employees;
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_manager;
DESCRIBE employees;
DESCRIBE salaries;
DESCRIBE titles;

-- Find all the current employees with the same hire date as employee 101010 using a subquery.
SELECT *
FROM employees 
WHERE hire_date = 
	(
	select hire_date
	from employees as e
	where emp_no = 101010
	)
;


-- Find all the titles ever held by all current employees with the first name Aamod.
/*
select first_name
	from employees as e
	where first_name = 'Aamod';
*/
SELECT title
FROM (
	select first_name, emp_no
	from employees as e
	where first_name = 'Aamod'
	) query
JOIN titles AS t
USING (emp_no)
;


-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT count(*)
FROM employees
WHERE emp_no
	NOT IN (SELECT emp_no
	FROM titles
	where to_date LIKE '9999-01-01')
;


-- Find all the current department managers that are female. List their names in a comment in your code.
SELECT CONCAT(first_name, ' ', last_name) Name
FROM employees
WHERE emp_no IN (
		SELECT emp_no
		FROM dept_manager
		WHERE to_date LIKE '9999-01-01'
		)
AND gender = 'F'
;

/*
'Isamu Legleitner'
'Karsten Sigstam'
'Leon DasSarma'
'Hilary Kambil'
*/

-- Find all the employees who currently have a higher salary than the company's overall, historical average salary.
SELECT CONCAT(first_name, ' ', last_name) AS Name
FROM employees
WHERE emp_no IN 
				(
				SELECT emp_no
				FROM salaries
				WHERE salary > 
								(
								SELECT AVG(salary)
								FROM salaries
								WHERE to_date NOT LIKE '9999-01-01'
								) 
				AND to_date LIKE '9999-01-01'
				)
;




-- How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built-in function to calculate the standard deviation.) What percentage of all salaries is this?
-- 83
SELECT COUNT(salary)
FROM (SELECT salary
	FROM salaries
	WHERE
	(salary < 
			((
			SELECT max(salary)
			FROM salaries
			WHERE to_date LIKE '9999-01-01'
			) 
			+
			(SELECT STD(salary)
			FROM salaries
			WHERE to_date LIKE '9999-01-01'))
	AND
	salary > 
			((
			SELECT max(salary)
			FROM salaries
			WHERE to_date LIKE '9999-01-01'
			) 
			-
			(SELECT STD(salary)
			FROM salaries
			WHERE to_date LIKE '9999-01-01')))
	AND 
    to_date LIKE '9999-01-01'
) AS sub_within_1
;

SELECT ((SELECT COUNT(salary)
FROM (SELECT salary
	FROM salaries
	WHERE
	(salary < 
			((
			SELECT max(salary)
			FROM salaries
			WHERE to_date LIKE '9999-01-01'
			) 
			+
			(SELECT STD(salary)
			FROM salaries
			WHERE to_date LIKE '9999-01-01'))
	AND
	salary > 
			((
			SELECT max(salary)
			FROM salaries
			WHERE to_date LIKE '9999-01-01'
			) 
			-
			(SELECT STD(salary)
			FROM salaries
			WHERE to_date LIKE '9999-01-01')))
	AND 
    to_date LIKE '9999-01-01'
)AS SD) / (Select count(salary)
from salaries
WHERE to_date LIKE '9999-01-01')) * '100' AS Percent;


/* 
The above should be the answer to the first question but I'm not sure if it is 
because our internet is worst than my great aunt tilda's and that's saying something. 
I joined a coding bootcamp that's still running dial up. Everything is fine, I'm fine, it's fine 
*/

Select count(salary)
from salaries
WHERE to_date LIKE '9999-01-01';

SELECT max(salary)
FROM salaries
WHERE to_date LIKE '9999-01-01';

SELECT STD(salary)
FROM salaries
WHERE to_date LIKE '9999-01-01';

-- Hint You will likely use multiple subqueries in a variety of ways
-- Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.
-- BONUS

-- Find all the department names that currently have female managers.
            
SELECT dept_name
FROM departments
WHERE dept_no IN (SELECT dept_no
					FROM dept_manager
					WHERE 
						(emp_no IN (SELECT emp_no
							FROM employees
							WHERE gender LIKE 'F'))
					AND to_date LIKE '9999-01-01');

-- Find the first and last name of the employee with the highest salary.

-- Find the department name that the employee with the highest salary works in.

-- Who is the highest paid employee within each department.



