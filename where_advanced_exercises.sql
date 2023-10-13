use employees;
/* Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
What is the employee number of the top three results? */
select database();
describe employees;
select * from employees;
select emp_no, first_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya');
-- 10200, 10397, 10610

/*
Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
What is the employee number of the top three results? Does it match the previous question?
*/
select emp_no, first_name
from employees
where first_name = 'Irena' OR first_name = 'Vidya'OR first_name = 'Maya';
-- 10200, 10397, 10610 , Yes

/*
Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
What is the employee number of the top three results?
*/
select emp_no, first_name, gender
from employees
where gender = 'M' 
AND (first_name = 'Irena' OR first_name = 'Vidya'OR first_name = 'Maya')
;
-- 10200, 10397, 10821

/*
Find all unique last names that start with 'E'.
*/
select distinct last_name
from employees 
where last_name like 'e%';

/*
Find all unique last names that start or end with 'E'.
*/
select distinct last_name
from employees 
where last_name like 'e%'
OR last_name like '%e';

/*
Find all unique last names that end with E, but does not start with E?
*/
select distinct last_name
from employees 
where last_name like '%e'
AND last_name not like 'e%';

/*
Find all unique last names that start and end with 'E'.
*/
select distinct last_name
from employees 
where last_name like 'e%'
AND last_name like '%e';

/*
Find all current or previous employees hired in the 90s. 
Enter a comment with the top three employee numbers.
*/
select emp_no, hire_date
from employees
where hire_date between '1990-01-01' AND '1999-12-31';
-- 10008, 10011, 10012

/*
Find all current or previous employees born on Christmas. 
Enter a comment with the top three employee numbers.
*/
select emp_no, birth_date
from employees
where birth_date like  '%-12-25';
-- 10078,10115, 10261

/*
Find all current or previous employees hired in the 90s and born on Christmas. 
Enter a comment with the top three employee numbers.
*/
select emp_no, hire_date, birth_date
from employees
where birth_date like  '%-12-25'
AND (hire_date between '1990-01-01' AND '1999-12-31');
-- 10261, 10438, 10681

/*
Find all unique last names that have a 'q' in their last name.
*/
select distinct last_name
from employees
where last_name like '%q%';

/*
Find all unique last names that have a 'q' in their last name but not 'qu'
*/
select distinct last_name
from employees
where last_name like '%q%'
AND last_name not like '%qu%';