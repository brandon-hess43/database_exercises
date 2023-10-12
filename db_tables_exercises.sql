SELECT * FROM mysql.user;
show databases;
USE albums_db;
select database ();
use 311_data;
select database();
show tables;
describe source;
Show create table source;
describe source;
show tables;
show databases;
use codeup_db_server;
show databases;
leave database;
select codeup db server;
select database();
show databases;
select database();
use albums_db;
select database ();
show tables;
use employees;
select database();
show tables;
-- Which table(s) do you think contain a numeric type column?
		-- departments, dept_emp, dept_manager, employees, salaries, titles
-- Which table(s) do you think contain a string type column?
		-- departments, employees, titles
-- Which table(s) do you think contain a data type column?
		-- dept_emp, dept_manager, employees, salaries, titles
-- What is the relationship between the employees and the departments tables?
		-- Not much, they both have data that ends up in dept_manager?

select dept_manager;
show create table dept_manager; 
# CREATE TABLE `dept_manager` (
#	`emp_no` int NOT NULL,
#	`dept_no` char(4) NOT NULL,
#	`from_date` date NOT NULL,
#  `to_date` date NOT NULL,
#  PRIMARY KEY (`emp_no`,`dept_no`),
#  KEY `dept_no` (`dept_no`),
# CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
#  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
# ) ENGINE=InnoDB DEFAULT CHARSET=latin1