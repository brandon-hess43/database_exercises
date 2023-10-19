
-- -- ADVANCED WHERE

-- use employees;
-- /* Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
-- What is the employee number of the top three results? */
-- select database();
-- describe employees;
-- select * from employees;
-- select emp_no, first_name
-- from employees
-- where first_name in ('Irena', 'Vidya', 'Maya');
-- -- 10200, 10397, 10610

-- /*
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
-- What is the employee number of the top three results? Does it match the previous question?
-- */
-- select emp_no, first_name
-- from employees
-- where first_name = 'Irena' OR first_name = 'Vidya'OR first_name = 'Maya';
-- -- 10200, 10397, 10610 , Yes

-- /*
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
-- What is the employee number of the top three results?
-- */
-- select emp_no, first_name, gender
-- from employees
-- where gender = 'M' 
-- AND (first_name = 'Irena' OR first_name = 'Vidya'OR first_name = 'Maya')
-- ;
-- -- 10200, 10397, 10821

-- /*
-- Find all unique last names that start with 'E'.
-- */
-- select distinct last_name
-- from employees 
-- where last_name like 'e%';

-- /*
-- Find all unique last names that start or end with 'E'.
-- */
-- select distinct last_name
-- from employees 
-- where last_name like 'e%'
-- OR last_name like '%e';

-- /*
-- Find all unique last names that end with E, but does not start with E?
-- */
-- select distinct last_name
-- from employees 
-- where last_name like '%e'
-- AND last_name not like 'e%';

-- /*
-- Find all unique last names that start and end with 'E'.
-- */
-- select distinct last_name
-- from employees 
-- where last_name like 'e%'
-- AND last_name like '%e';

-- /*
-- Find all current or previous employees hired in the 90s. 
-- Enter a comment with the top three employee numbers.
-- */
-- select emp_no, hire_date
-- from employees
-- where hire_date between '1990-01-01' AND '1999-12-31';
-- -- 10008, 10011, 10012

-- /*
-- Find all current or previous employees born on Christmas. 
-- Enter a comment with the top three employee numbers.
-- */
-- select emp_no, birth_date
-- from employees
-- where birth_date like  '%-12-25';
-- -- 10078,10115, 10261

-- /*
-- Find all current or previous employees hired in the 90s and born on Christmas. 
-- Enter a comment with the top three employee numbers.
-- */
-- select emp_no, hire_date, birth_date
-- from employees
-- where birth_date like  '%-12-25'
-- AND (hire_date between '1990-01-01' AND '1999-12-31');
-- -- 10261, 10438, 10681

-- /*
-- Find all unique last names that have a 'q' in their last name.
-- */
-- select distinct last_name
-- from employees
-- where last_name like '%q%';

-- /*
-- Find all unique last names that have a 'q' in their last name but not 'qu'
-- */
-- select distinct last_name
-- from employees
-- where last_name like '%q%'
-- AND last_name not like '%qu%';

-- ----------------------------------------------------------
-- -- ORDER


-- -- Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
-- select * from employees;

-- -- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
-- select last_name, first_name
-- from employees
-- where first_name in ('Irena', 'Vidya', 'Maya')
-- order by first_name;
-- /*
-- 'Irena Reutenauer'
-- 'Vidya Simmen'
-- */

-- -- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
-- select first_name, last_name
-- from employees
-- where first_name in ('Irena', 'Vidya', 'Maya')
-- order by first_name ASC, last_name ASC;
-- /*
-- 'Irena Acton'
-- 'Vidya Zweizig'
-- */

-- -- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
-- select first_name, last_name
-- from employees
-- where first_name in ('Irena', 'Vidya', 'Maya')
-- order by last_name ASC, first_name ASC;
-- /*
-- 'Irena Acton'
-- 'Maya Zyda'
-- */

-- -- Write a query to find all employees whose last name starts and ends with 'E'. 
-- -- Sort the results by their employee number. 
-- -- Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
-- select emp_no, first_name, last_name
-- from employees
-- where last_name like 'e%'
-- AND last_name like '%e'
-- ORDER by emp_no;
-- /*
-- 899 employees
-- First Employee: '10021','Ramzi Erde'
-- Last Employee: '499648','Tadahiro Erde'
-- */

-- -- Write a query to find all employees whose last name starts and ends with 'E'. 
-- -- Sort the results by their hire date, so that the newest employees are listed first. 
-- -- Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
-- select hire_date, first_name, last_name
-- from employees
-- where last_name like 'e%'
-- AND last_name like '%e'
-- ORDER by hire_date DESC;
-- /*
-- 899 employees
-- Newest employee: 'Teiji Eldridge'
-- Oldest employee: 'Sergi Erde'
-- */

-- -- Find all employees hired in the 90s and born on Christmas. 
-- -- Sort the results so that the oldest employee who was hired last is the first result. 
-- -- Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
-- select hire_date, birth_date, first_name, last_name
-- from employees
-- where birth_date like  '%-12-25'
-- AND (hire_date between '1990-01-01' AND '1999-12-31')
-- Order by birth_date ASC, hire_date DESC;
-- /*
-- 362 employees
-- Oldest employee who was hired last: 'Khun Bernini'
-- Youngest employee who was hired first: 'Douadi Pettis'
-- */

-- ----------------------------------------------
-- -- LIMIT

-- -- Create a new SQL script named limit_exercises.sql.

-- -- MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. 
-- -- For example, to find all the unique titles within the company, we could run the following query:
-- -- SELECT DISTINCT title FROM titles;
-- -- List the first 10 distinct last names sorted in descending order.
-- select distinct last_name
-- from employees
-- order by last_name DESC
-- Limit 10;

-- -- Find all previous or current employees hired in the 90s and born on Christmas. 
-- -- Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. 
-- -- Write a comment in your code that lists the five names of the employees returned.
-- select first_name, last_name
-- from employees
-- where birth_date like  '%-12-25'
-- AND (hire_date between '1990-01-01' AND '1999-12-31')
-- Order by hire_date ASC
-- Limit 5;
-- /*
-- 'Alselm Cappello'
-- 'Utz Mandell'
-- 'Bouchung Schreiter'
-- 'Baocai Kushner'
-- 'Petter Stroustrup'
-- */

-- -- Try to think of your results as batches, sets, or pages. 
-- -- The first five results are your first page. 
-- -- The five after that would be your second page, etc. 
-- -- Update the query to find the tenth page of results.
-- -- LIMIT and OFFSET can be used to create multiple pages of data. 
-- -- What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?
-- select first_name, last_name
-- from employees
-- where birth_date like  '%-12-25'
-- AND (hire_date between '1990-01-01' AND '1999-12-31')
-- Order by hire_date ASC
-- Limit 5 OFFSET 45;
-- /*
-- 'Pranay Narwekar'
-- 'Marjo Farrow'
-- 'Ennio Karcich'
-- 'Dines Lubachevsky'
-- 'Ipke Fontan'
-- */
-- ---------------------------------------------

-- Using MySQL Functions

-- You may choose to copy the order by exercises and save it as functions_exercises.sql, to save time as you will be editing the queries to answer your functions exercises.
-- Write a query to find all employees whose last name starts and ends with 'E'. 
-- Use concat() to combine their first and last name together as a single column named full_name.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

-- Convert the names produced in your last query to all uppercase.
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

-- Use a function to determine how many results were returned from your previous query.
SELECT Count(UPPER(CONCAT(first_name, ' ', last_name))) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

SELECT COUNT(*) AS result_count
FROM employees
WHERE last_name LIKE '%e%';

-- Find all employees hired in the 90s and born on Christmas. 
-- Use datediff() function to find how many days they have been working at the company 
-- (Hint: You will also need to use NOW() or CURDATE()),
select emp_no, hire_date, birth_date, datediff(NOW(), Hire_date) AS Days_Worked
from employees
where birth_date like  '%-12-25'
AND (hire_date between '1990-01-01' AND '1999-12-31');
  
select database ();
describe employees;
describe salaries;

-- Find the smallest and largest current salary from the salaries table.
Select salary, emp_no
from salaries
order by (salary);
/*
Smallest: 38623
Largest: 39519
*/

-- Use your knowledge of built in SQL functions to generate a username for all of the employees. 
-- 	A username should be all lowercase, 
-- 	and consist of the first character of the employees first name, 
-- 	the first 4 characters of the employees last name, 
-- 	an underscore, 
-- 	the month the employee was born, 
-- 	and the last two digits of the year that they were born. 
-- Below is an example of what the first 10 rows will look like:
-- +------------+------------+-----------+------------+
-- | username   | first_name | last_name | birth_date |
-- +------------+------------+-----------+------------+
-- | gface_0953 | Georgi     | Facello   | 1953-09-02 |
-- | bsimm_0664 | Bezalel    | Simmel    | 1964-06-02 |
-- | pbamf_1259 | Parto      | Bamford   | 1959-12-03 |
-- | ckobl_0554 | Chirstian  | Koblick   | 1954-05-01 |
-- | kmali_0155 | Kyoichi    | Maliniak  | 1955-01-21 |
-- | apreu_0453 | Anneke     | Preusig   | 1953-04-20 |
-- | tziel_0557 | Tzvetan    | Zielinski | 1957-05-23 |
-- | skall_0258 | Saniya     | Kalloufi  | 1958-02-19 |
-- | speac_0452 | Sumant     | Peac      | 1952-04-19 |
-- | dpive_0663 | Duangkaew  | Piveteau  | 1963-06-01 |
-- +------------+------------+-----------+------------+
-- 10 rows in set (0.05 sec)


select LOWER(CONCAT(SUBSTR(first_name,1,1), SUBSTR(last_name,1,4), '_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2))) AS username, First_name, last_name, birth_date
from employees;

