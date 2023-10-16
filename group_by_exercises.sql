use employees;
SELECT * FROM table GROUP BY column_name;
SELECT DISTINCT first_name
FROM employees;
SELECT first_name
FROM employees
GROUP BY first_name;
SELECT first_name
FROM employees
GROUP BY first_name 
ORDER BY first_name DESC;
SELECT last_name, first_name
FROM employees
GROUP BY last_name, first_name
ORDER BY last_name ASC;

use chipotle;
select *
from orders;

select distinct item_name
from orders
where item_name like '%chicken%';

select item_name
from orders
where item_name like '%chicken%'
group by item_name;

select item_name, quantity
from orders
where item_name like '%chicken%'
group by item_name, quantity;

-- Create a new file named group_by_exercises.sql
-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
use employees;
describe employees;
show tables;
select distinct title
from titles;
/*
7
*/

-- Write a query to find a list of all unique last names that start and end with 'E' using GROUP BY.
select last_name
from employees
where last_name like 'e%e' 
group by last_name;

-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
select last_name, first_name
from employees
where last_name like 'e%e' 
group by last_name, first_name;

-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
select last_name
from employees
where last_name like '%q%' 
and last_name not like '%qu%'
group by last_name;

-- Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.
select last_name, count(*)
from employees
where last_name like '%q%' 
and last_name not like '%qu%'
group by last_name;

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.
select first_name, gender, count(*)
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
group by first_name, gender;

-- Using your query that generates a username for all employees, generate a count of employees with each unique username.
select LOWER(CONCAT(SUBSTR(first_name,1,1), SUBSTR(last_name,1,4), '_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2))) AS username, count(*)
from employees
group by username;

-- From your previous query, are there any duplicate usernames? What is the highest number of times a username shows up? Bonus: How many duplicate usernames are there?
select LOWER(CONCAT(SUBSTR(first_name,1,1), SUBSTR(last_name,1,4), '_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2))) AS username, count(*) as num_duplicates
from employees
group by username
having num_duplicates > 1
ORDER BY num_duplicates DESC;

-- 6 is the most number of times it shows up

SELECT COUNT(*) AS total_duplicate_usernames
FROM (
    SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username
    FROM employees
) AS username_subquery
;

SELECT SUM(duplicate_count) AS total_duplicate_usernames
FROM (
    SELECT COUNT(*) AS duplicate_count
    FROM (
        SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username
        FROM employees
    ) AS username_subquery
    GROUP BY username
    HAVING COUNT(*) > 1
) AS duplicates;
-- '27403'


-- Bonus: More practice with aggregate functions:

-- Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
show tables;
describe salaries;

select emp_no, AVG(salary) AS 'Average Salary'
from salaries
group by emp_no;

-- Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.
SELECT dept_no, count(*)
FROM dept_emp
GROUP BY dept_no;

-- Determine how many different salaries each employee has had. This includes both historic and current.
SELECT emp_no, count(*)
FROM salaries
GROUP BY emp_no;

-- Find the maximum salary for each employee.
select emp_no, MAX(salary)
from salaries
group by emp_no;

-- Find the minimum salary for each employee.
select emp_no, MIN(salary)
from salaries
group by emp_no;

-- Find the standard deviation of salaries for each employee.
select emp_no, STD(salary)
from salaries
group by emp_no;

-- Find the max salary for each employee where that max salary is greater than $150,000.
select emp_no, MAX(salary)
from salaries
group by emp_no
HAVING MAX(salary)>150000;

-- Find the average salary for each employee where that average salary is between $80k and $90k.
select emp_no, AVG(salary)
from salaries
group by emp_no
HAVING AVG(salary) between 80000 AND 90000;