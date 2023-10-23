-- use pizza;
-- describe pizza_toppings;

-- show tables;
-- select * from modifiers;
-- /*
-- 3 types of modifiers available: xtra cheese,well done, and no cheese
-- */

-- select * from crust_types;
-- /*
-- 2 types of crust types
-- */

-- select distinct topping_amount from pizza_toppings;
-- /*
-- 4 types 
-- regular, extra, double, light
-- */

-- select * from sizes;
-- /*
-- 4 types
-- small, med, large, xl
-- */

-- select distinct topping_name from toppings;
-- /*
-- 9 types of toppings
-- */
-- describe pizzas;

-- select *
-- from pizzas;

-- select distinct *
-- from pizza_toppings;

-- select distinct *
-- from toppings;

-- -- What's the most/least popular pizza topping in our database?
-- -- what do we need to combine?
-- -- USE AN ASSOCIATIVE TABLE TO COMBINE PIZZA TO TOPPINGS. WILL NEED PIZZA TOPPINGS TABLE
-- SELECT
--     topping_name,
--     COUNT(*) cnt
-- FROM pizzas AS p
-- INNER JOIN pizza_toppings AS pt
-- 	-- ON p.pizza_id=pt.pizza_id -- one way
--     USING(pizza_id)
-- INNER JOIN toppings AS t
-- 	ON pt.topping_id=t.topping_id
-- GROUP BY topping_name
-- ORDER BY cnt DESC;

-- -- most popular pepperoni
-- -- least popular pineapple


-- -- LEFT & RIGHT JOINS

-- CREATE TEMPORARY TABLE classes (
--  id int PRIMARY KEY,
--  name varchar(50)
-- );

-- CREATE TEMPORARY TABLE students (
--  id int PRIMARY KEY,
--  full_name varchar(50),
--  class_id varchar(100)
-- );

-- -- drop table classes;
-- -- drop table students;


-- INSERT INTO classes 
-- (id,name) VALUES
--   (1, 'Intro to Programming'),
--   (2, 'Database Management'),
--   (3, 'Cyber Security Fundamentals'),
--   (4, 'Creative Writing'),
--   (5, 'Ballet I'),
--   (6, NULL);
--   
--   
-- INSERT INTO students
-- (id,full_name,class_id) VALUES
-- (918, 'Deborah Hays', 1),
-- (919, 'Susan Smith', 1),
-- (920, 'Mark Reynolds', 3),
-- (921, 'Maya Thomas', 1),
-- (922, 'Jillian Park', 5),
-- (923, 'Zhu Louis', 3),
-- (924, 'Lauren London', 2),
-- (925, 'Quinten Gill', 1),
-- (926, 'Kiarah Dent', 1),
-- (927, 'Wendigow Smith', NULL),
-- (928, 'Asher Thompson', NULL);

--     
-- select * from classes;
-- select * from students;

-- -- EXERCISE 1:
-- -- Looking for students
-- -- Return all students even if they didn't take a class this semester
-- -- columns = student_id, full_name, class_name
-- select 
-- 	s.id,
-- 	s.full_name,
-- 	c.name
-- from students s
-- left join classes c -- right join keeps all students even if no class
-- 	on c.id=s.class_id; -- left join keeps all classes even if no students



-- -- EXERCISE 2:
-- -- how many students took each type of class?
-- -- columns = class_name, number_of_students
-- select 
-- 	c.name,
--     count(*)
-- from classes c
-- right join students s -- LEFT JOIN RETURNS ALL CLASSES 
-- 	on c.id=s.class_id -- RIGHT JOIN ALL STUDENTS 
-- group by c.name;

-------------------------------------------
-- Exercises

-- Exercise Goals

-- Explore the indexes in the employees database
-- Add a unique constraint to our test database
-- USE your employees database.
use employees;
describe departments;
describe dept_emp;
describe dept_manager;
describe employees;
describe salaries;
describe titles;

-- DESCRIBE each table and inspect the keys and see which columns have indexes and keys.
-- Exercises

-- Exercise Goals

-- Use join, left join, and right join statements on our Join Example DB
-- Integrate aggregate functions and clauses into our queries with JOIN statements
-- Create a file named join_exercises.sql to do your work in.

-- Join Example Database

-- Use the join_example_db. Select all the records from both the users and roles tables.
use join_example_db;
describe roles;
describe users;

-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles
ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles
ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles
ON users.role_id = roles.id;

-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that have the role. Hint: You will also need to use group by in the query.
SELECT roles.name AS role_name, count(*)
FROM users
JOIN roles
ON roles.id = users.role_id
GROUP BY role_name;

/*
USE COUNT (U.ID)
AND LEFT JOIN TO NOT COUNT COMMENTER

*/

-- Employees Database

-- Use the employees database.
USE employees;
describe departments;
describe dept_emp;
describe dept_manager;
describe employees;
describe salaries;
describe titles;

-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT 
	d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', last_name) AS 'Department Manager'
FROM dept_manager AS dm

JOIN departments AS d
	ON d.dept_no = dm.dept_no
	
JOIN employees AS e
	ON e.emp_no = dm.emp_no

WHERE dm.to_date = '9999-01-01';


/*
Question
difference between using and ON
*/

--   Department Name    | Department Manager
--  --------------------+--------------------
--   Customer Service   | Yuchang Weedman
--   Development        | Leon DasSarma
--   Finance            | Isamu Legleitner
--   Human Resources    | Karsten Sigstam
--   Marketing          | Vishwani Minakawa
--   Production         | Oscar Ghazalie
--   Quality Management | Dung Pesch
--   Research           | Hilary Kambil
--   Sales              | Hauke Zhang


-- Find the name of all departments currently managed by women.

SELECT 
	d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', last_name) AS 'Department Manager'
FROM dept_manager AS dm

JOIN departments AS d
	ON d.dept_no = dm.dept_no
	
JOIN employees AS e
	ON e.emp_no = dm.emp_no

WHERE dm.to_date = '9999-01-01' AND e.gender = 'F';

-- Department Name | Manager Name
-- ----------------+-----------------
-- Development     | Leon DasSarma
-- Finance         | Isamu Legleitner
-- Human Resources | Karsetn Sigstam
-- Research        | Hilary Kambil


-- Find the current titles of employees currently working in the Customer Service department.

SELECT t.title AS Title, Count(e.emp_no)
FROM employees AS e
JOIN titles as t
	ON t.emp_no = e.emp_no
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01'
AND de.dept_no = 'd009'
GROUP BY Title;


-- Title              | Count
-- -------------------+------
-- Assistant Engineer |    68
-- Engineer           |   627
-- Manager            |     1
-- Senior Engineer    |  1790
-- Senior Staff       | 11268
-- Staff              |  3574
-- Technique Leader   |   241


-- Find the current salary of all current managers.

SELECT 
d.dept_name AS 'Department Name', 
CONCAT(e.first_name, ' ', last_name) AS 'Name', 
s.salary AS Salary
FROM dept_manager AS dm
JOIN departments AS d
	ON d.dept_no = dm.dept_no
JOIN salaries AS s
	ON s.emp_no = dm.emp_no
JOIN employees AS e
	ON e.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01'
AND s.to_date = '9999-01-01';

-- Department Name    | Name              | Salary
-- -------------------+-------------------+-------
-- Customer Service   | Yuchang Weedman   |  58745
-- Development        | Leon DasSarma     |  74510
-- Finance            | Isamu Legleitner  |  83457
-- Human Resources    | Karsten Sigstam   |  65400
-- Marketing          | Vishwani Minakawa | 106491
-- Production         | Oscar Ghazalie    |  56654
-- Quality Management | Dung Pesch        |  72876
-- Research           | Hilary Kambil     |  79393
-- Sales              | Hauke Zhang       | 101987


-- Find the number of current employees in each department.

select 
	d.dept_no,
    d.dept_name,
    COUNT(de.dept_no) as num_employees
from departments d
join dept_emp de
	on d.dept_no=de.dept_no and
    de.to_date > NOW()
group by d.dept_no,d.dept_name
order by d.dept_no;

-- +---------+--------------------+---------------+
-- | dept_no | dept_name          | num_employees |
-- +---------+--------------------+---------------+
-- | d001    | Marketing          | 14842         |
-- | d002    | Finance            | 12437         |
-- | d003    | Human Resources    | 12898         |
-- | d004    | Production         | 53304         |
-- | d005    | Development        | 61386         |
-- | d006    | Quality Management | 14546         |
-- | d007    | Sales              | 37701         |
-- | d008    | Research           | 15441         |
-- | d009    | Customer Service   | 17569         |
-- +---------+--------------------+---------------+
-- Which department has the highest average salary? Hint: Use current not historic information.
SELECT 
	d.dept_name,
	ROUND(AVG(s.salary),2) as average_salary
FROM departments d
JOIN dept_emp de
	ON d.dept_no=de.dept_no and
    de.to_date > NOW()
JOIN salaries s
	ON s.emp_no=de.emp_no and
    s.to_date > NOW()
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- +-----------+----------------+
-- | dept_name | average_salary |
-- +-----------+----------------+
-- | Sales     | 88852.9695     |
-- +-----------+----------------+
-- Who is the highest paid employee in the Marketing department?
select
	e.first_name,
    e.last_name
from employees e 
join salaries s
	on e.emp_no=s.emp_no
join dept_emp de
	on de.emp_no=e.emp_no 
join departments d 
	on d.dept_no=de.dept_no
where 
	d.dept_name = 'Marketing'
order by s.salary DESC
limit 1;


-- +------------+-----------+
-- | first_name | last_name |
-- +------------+-----------+
-- | Akemi      | Warwick   |
-- +------------+-----------+
-- Which current department manager has the highest salary?
select
	e.first_name,
    e.last_name,
    s.salary,
    d.dept_name
from employees e 
join salaries s
	on e.emp_no=s.emp_no and
    s.to_date > NOW()
join dept_manager dm
	on dm.emp_no=e.emp_no and
    dm.to_date > NOW()
join departments d 
	on d.dept_no=dm.dept_no
order by s.salary DESC
limit 1;


-- +------------+-----------+--------+-----------+
-- | first_name | last_name | salary | dept_name |
-- +------------+-----------+--------+-----------+
-- | Vishwani   | Minakawa  | 106491 | Marketing |
-- +------------+-----------+--------+-----------+
-- Determine the average salary for each department. Use all salary information and round your results.
select 
	d.dept_name,
    ROUND(AVG(s.salary),0) average_salary
from salaries s
join dept_emp de
	on s.emp_no=de.emp_no
join departments d
	on d.dept_no=de.dept_no
group by d.dept_name
order by average_salary desc;

-- +--------------------+----------------+
-- | dept_name          | average_salary | 
-- +--------------------+----------------+
-- | Sales              | 80668          | 
-- +--------------------+----------------+
-- | Marketing          | 71913          |
-- +--------------------+----------------+
-- | Finance            | 70489          |
-- +--------------------+----------------+
-- | Research           | 59665          |
-- +--------------------+----------------+
-- | Production         | 59605          |
-- +--------------------+----------------+
-- | Development        | 59479          |
-- +--------------------+----------------+
-- | Customer Service   | 58770          |
-- +--------------------+----------------+
-- | Quality Management | 57251          |
-- +--------------------+----------------+
-- | Human Resources    | 55575          |
-- +--------------------+----------------+
-- Bonus Find the names of all current employees, their department name, and their current manager's name.
SELECT
	CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name',
	d.dept_name AS 'Department Name',
	m.managers AS 'Manager Name'
FROM employees AS e
JOIN dept_emp AS de ON de.emp_no = e.emp_no
	AND de.to_date > CURDATE()
JOIN departments AS d ON de.dept_no = d.dept_no 
JOIN (SELECT
		 dm.dept_no,
		 CONCAT(e.first_name, ' ', e.last_name) AS managers
	 FROM employees AS e
	 JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
		 AND to_date > CURDATE()) AS m 
	ON m.dept_no = d.dept_no
ORDER BY d.dept_name;

-- 240,124 Rows

-- Employee Name | Department Name  |  Manager Name
-- --------------|------------------|-----------------
--  Huan Lortz   | Customer Service | Yuchang Weedman


/* 
Question: sub query vs self join 
*/


--  .....