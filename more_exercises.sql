-- More Drills With The Sakila Database

-- SELECT statements

-- Select all columns from the actor table.
-- Select only the last_name column from the actor table.
-- Select only the film_id, title, and release_year columns from the film table.
-- DISTINCT operator

-- Select all distinct (different) last names from the actor table.
-- Select all distinct (different) postal codes from the address table.
-- Select all distinct (different) ratings from the film table.
-- WHERE clause

-- Select the title, description, rating, and movie length columns from the films table that last 3 hours or longer.
-- Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.
-- Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.
-- Select all columns from the customer table for rows that have last names beginning with "S" and first names ending with "N".
-- Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".
-- Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either "C", "S" or "T".
-- Select all columns minus the password column from the staff table for rows that contain a password.
-- Select all columns minus the password column from the staff table for rows that do not contain a password.
-- IN operator

-- Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.
-- Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)
-- Select all columns from the film table for films rated G, PG-13 or NC-17.
-- BETWEEN operator

-- Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005.
-- Select the film_id, title, and description columns from the film table for films where the length of the description is between 100 and 120.
-- LIKE operator

-- Select the following columns from the film table for rows where the description begins with "A Thoughtful".
-- Select the following columns from the film table for rows where the description ends with the word "Boat".
-- Select the following columns from the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.
-- LIMIT Operator

-- Select all columns from the payment table and only include the first 20 rows.
-- Select the payment date and amount columns from the payment table for rows where the payment amount is greater than 5, and only select rows whose zero-based index in the result set is between 1000-2000.
-- Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200.
-- ORDER BY statement

-- Select all columns from the film table and order rows by the length field in ascending order.
-- Select all distinct ratings from the film table ordered by rating in descending order.
-- Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order.
-- Select the title, description, special features, length, and rental duration columns from the film table for the first 10 films with behind the scenes footage under 2 hours in length and a rental duration between 5 and 7 days, ordered by length in descending order.
-- JOINs

-- Select customer first_name/last_name and actor first_name/last_name columns from performing a left join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- Label customer first_name/last_name columns as customer_first_name/customer_last_name
-- Label actor first_name/last_name columns in a similar fashion.
-- returns correct number of records: 620
-- Select the customer first_name/last_name and actor first_name/last_name columns from performing a right join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 200
-- Select the customer first_name/last_name and actor first_name/last_name columns from performing an inner join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 43
-- Select the city name and country name columns from the city table, performing a left join with the country table to get the country name column.
-- Returns correct records: 600
-- Select the title, description, release year, and language name columns from the film table, performing a left join with the language table to get the "language" column.
-- Label the language.name column as "language"
-- Returns 1000 rows
-- Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table, performing 2 left joins with the address table then the city table to get the address and city related columns.
-- returns correct number of rows: 2
-- Display the first and last names in all lowercase of all the actors.
-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
-- Find all actors whose last name contain the letters "gen":
-- Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
-- Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China.
-- List the last names of all the actors, as well as how many actors have that last name.
-- List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
-- You cannot locate the schema of the address table. Which query would you use to recreate it?
-- Use JOIN to display the first and last names, as well as the address, of each staff member.
-- Use JOIN to display the total amount rung up by each staff member in August of 2005.
-- List each film and the number of actors who are listed for that film.
-- How many copies of the film Hunchback Impossible exist in the inventory system?
-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
-- Use subqueries to display all actors who appear in the film Alone Trip.
-- You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.
-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
-- Write a query to display how much business, in dollars, each store brought in.
-- Write a query to display for each store the store ID, city, and country.
-- List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)
-- What is the average replacement cost of a film? Does this change depending on the rating of the film?


-- +-----------------------+
-- | AVG(replacement_cost) |
-- +-----------------------+
-- |             19.984000 |
-- +-----------------------+
-- 1 row in set (2.39 sec)

-- +--------+-----------------------+
-- | rating | AVG(replacement_cost) |
-- +--------+-----------------------+
-- | G      |             20.124831 |
-- | PG     |             18.959072 |
-- | PG-13  |             20.402556 |
-- | R      |             20.231026 |
-- | NC-17  |             20.137619 |
-- +--------+-----------------------+
-- 5 rows in set (0.09 sec)
-- How many different films of each genre are in the database?


-- +-------------+-------+
-- | name        | count |
-- +-------------+-------+
-- | Action      |    64 |
-- | Animation   |    66 |
-- | Children    |    60 |
-- | Classics    |    57 |
-- | Comedy      |    58 |
-- | Documentary |    68 |
-- | Drama       |    62 |
-- | Family      |    69 |
-- | Foreign     |    73 |
-- | Games       |    61 |
-- | Horror      |    56 |
-- | Music       |    51 |
-- | New         |    63 |
-- | Sci-Fi      |    61 |
-- | Sports      |    74 |
-- | Travel      |    57 |
-- +-------------+-------+
-- 16 rows in set (0.06 sec)
-- What are the 5 frequently rented films?


-- +---------------------+-------+
-- | title               | total |
-- +---------------------+-------+
-- | BUCKET BROTHERHOOD  |    34 |
-- | ROCKETEER MOTHER    |    33 |
-- | GRIT CLOCKWORK      |    32 |
-- | RIDGEMONT SUBMARINE |    32 |
-- | JUGGLER HARDLY      |    32 |
-- +---------------------+-------+
-- 5 rows in set (0.11 sec)
-- What are the most profitable films (in terms of gross revenue)?


-- +-------------------+--------+
-- | title             | total  |
-- +-------------------+--------+
-- | TELEGRAPH VOYAGE  | 231.73 |
-- | WIFE TURN         | 223.69 |
-- | ZORRO ARK         | 214.69 |
-- | GOODFELLAS SALUTE | 209.69 |
-- | SATURDAY LAMBS    | 204.72 |
-- +-------------------+--------+
-- 5 rows in set (0.17 sec)
-- Who is the best customer?


-- +------------+--------+
-- | name       | total  |
-- +------------+--------+
-- | SEAL, KARL | 221.55 |
-- +------------+--------+
-- 1 row in set (0.12 sec)
-- Who are the most popular actors (that have appeared in the most films)?


-- +-----------------+-------+
-- | actor_name      | total |
-- +-----------------+-------+
-- | DEGENERES, GINA |    42 |
-- | TORN, WALTER    |    41 |
-- | KEITEL, MARY    |    40 |
-- | CARREY, MATTHEW |    39 |
-- | KILMER, SANDRA  |    37 |
-- +-----------------+-------+
-- 5 rows in set (0.07 sec)
-- What are the sales of each store for each month in 2005?


-- +---------+----------+----------+
-- | month   | store_id | sales    |
-- +---------+----------+----------+
-- | 2005-05 |        1 |  2459.25 |
-- | 2005-05 |        2 |  2364.19 |
-- | 2005-06 |        1 |  4734.79 |
-- | 2005-06 |        2 |  4895.10 |
-- | 2005-07 |        1 | 14308.66 |
-- | 2005-07 |        2 | 14060.25 |
-- | 2005-08 |        1 | 11933.99 |
-- | 2005-08 |        2 | 12136.15 |
-- +---------+----------+----------+
-- 8 rows in set (0.14 sec)
-- Bonus: Find the film title, customer name, customer phone number, and customer address for all the outstanding DVDs.


-- +------------------------+------------------+--------------+
-- | title                  | customer_name    | phone        |
-- +------------------------+------------------+--------------+
-- | HYDE DOCTOR            | KNIGHT, GAIL     | 904253967161 |
-- | HUNGER ROOF            | MAULDIN, GREGORY | 80303246192  |
-- | FRISCO FORREST         | JENKINS, LOUISE  | 800716535041 |
-- | TITANS JERK            | HOWELL, WILLIE   | 991802825778 |
-- | CONNECTION MICROCOSMOS | DIAZ, EMILY      | 333339908719 |
-- +------------------------+------------------+--------------+
-- 5 rows in set (0.06 sec)
-- 183 rows total, above is just the first 5
-- Employees Database

-- How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?
-- World Database

-- Use the world database for the questions below.

-- What languages are spoken in Santa Monica?


-- +------------+------------+
-- | Language   | Percentage |
-- +------------+------------+
-- | Portuguese |        0.2 |
-- | Vietnamese |        0.2 |
-- | Japanese   |        0.2 |
-- | Korean     |        0.3 |
-- | Polish     |        0.3 |
-- | Tagalog    |        0.4 |
-- | Chinese    |        0.6 |
-- | Italian    |        0.6 |
-- | French     |        0.7 |
-- | German     |        0.7 |
-- | Spanish    |        7.5 |
-- | English    |       86.2 |
-- +------------+------------+
-- 12 rows in set (0.01 sec)
-- How many different countries are in each region?


-- +---------------------------+---------------+
-- | Region                    | num_countries |
-- +---------------------------+---------------+
-- | Micronesia/Caribbean      |             1 |
-- | British Islands           |             2 |
-- | Baltic Countries          |             3 |
-- | Antarctica                |             5 |
-- | North America             |             5 |
-- | Australia and New Zealand |             5 |
-- | Melanesia                 |             5 |
-- | Southern Africa           |             5 |
-- | Northern Africa           |             7 |
-- | Micronesia                |             7 |
-- | Nordic Countries          |             7 |
-- | Central America           |             8 |
-- | Eastern Asia              |             8 |
-- | Central Africa            |             9 |
-- | Western Europe            |             9 |
-- | Eastern Europe            |            10 |
-- | Polynesia                 |            10 |
-- | Southeast Asia            |            11 |
-- | Southern and Central Asia |            14 |
-- | South America             |            14 |
-- | Southern Europe           |            15 |
-- | Western Africa            |            17 |
-- | Middle East               |            18 |
-- | Eastern Africa            |            20 |
-- | Caribbean                 |            24 |
-- +---------------------------+---------------+
-- 25 rows in set (0.00 sec)
-- What is the population for each region?


-- +---------------------------+------------+
-- | Region                    | population |
-- +---------------------------+------------+
-- | Eastern Asia              | 1507328000 |
-- | Southern and Central Asia | 1490776000 |
-- | Southeast Asia            |  518541000 |
-- | South America             |  345780000 |
-- | North America             |  309632000 |
-- | Eastern Europe            |  307026000 |
-- | Eastern Africa            |  246999000 |
-- | Western Africa            |  221672000 |
-- | Middle East               |  188380700 |
-- | Western Europe            |  183247600 |
-- | Northern Africa           |  173266000 |
-- | Southern Europe           |  144674200 |
-- | Central America           |  135221000 |
-- | Central Africa            |   95652000 |
-- | British Islands           |   63398500 |
-- | Southern Africa           |   46886000 |
-- | Caribbean                 |   38140000 |
-- | Nordic Countries          |   24166400 |
-- | Australia and New Zealand |   22753100 |
-- | Baltic Countries          |    7561900 |
-- | Melanesia                 |    6472000 |
-- | Polynesia                 |     633050 |
-- | Micronesia                |     543000 |
-- | Antarctica                |          0 |
-- | Micronesia/Caribbean      |          0 |
-- +---------------------------+------------+
-- 25 rows in set (0.00 sec)
-- What is the population for each continent?


-- +---------------+------------+
-- | Continent     | population |
-- +---------------+------------+
-- | Asia          | 3705025700 |
-- | Africa        |  784475000 |
-- | Europe        |  730074600 |
-- | North America |  482993000 |
-- | South America |  345780000 |
-- | Oceania       |   30401150 |
-- | Antarctica    |          0 |
-- +---------------+------------+
-- 7 rows in set (0.00 sec)
-- What is the average life expectancy globally?


-- +---------------------+
-- | avg(LifeExpectancy) |
-- +---------------------+
-- |            66.48604 |
-- +---------------------+
-- 1 row in set (0.00 sec)
-- What is the average life expectancy for each region, each continent? Sort the results from shortest to longest


-- +---------------+-----------------+
-- | Continent     | life_expectancy |
-- +---------------+-----------------+
-- | Antarctica    |            NULL |
-- | Africa        |        52.57193 |
-- | Asia          |        67.44118 |
-- | Oceania       |        69.71500 |
-- | South America |        70.94615 |
-- | North America |        72.99189 |
-- | Europe        |        75.14773 |
-- +---------------+-----------------+
-- 7 rows in set (0.00 sec)

-- +---------------------------+-----------------+
-- | Region                    | life_expectancy |
-- +---------------------------+-----------------+
-- | Antarctica                |            NULL |
-- | Micronesia/Caribbean      |            NULL |
-- | Southern Africa           |        44.82000 |
-- | Central Africa            |        50.31111 |
-- | Eastern Africa            |        50.81053 |
-- | Western Africa            |        52.74118 |
-- | Southern and Central Asia |        61.35000 |
-- | Southeast Asia            |        64.40000 |
-- | Northern Africa           |        65.38571 |
-- | Melanesia                 |        67.14000 |
-- | Micronesia                |        68.08571 |
-- | Baltic Countries          |        69.00000 |
-- | Eastern Europe            |        69.93000 |
-- | Middle East               |        70.56667 |
-- | Polynesia                 |        70.73333 |
-- | South America             |        70.94615 |
-- | Central America           |        71.02500 |
-- | Caribbean                 |        73.05833 |
-- | Eastern Asia              |        75.25000 |
-- | North America             |        75.82000 |
-- | Southern Europe           |        76.52857 |
-- | British Islands           |        77.25000 |
-- | Western Europe            |        78.25556 |
-- | Nordic Countries          |        78.33333 |
-- | Australia and New Zealand |        78.80000 |
-- +---------------------------+-----------------+
-- 25 rows in set (0.00 sec)
-- Bonus

-- Find all the countries whose local name is different from the official name
-- How many countries have a life expectancy less than x?
-- What state is city x located in?
-- What region of the world is city x located in?
-- What country (use the human readable name) city x located in?
-- What is the life expectancy in city x?
-- Advanced: Pizza Database

-- Use the pizza database to answer the following questions.

-- What information is stored in the toppings table? How does this table relate to the pizzas table?
-- What information is stored in the modifiers table? How does this table relate to the pizzas table?
-- How are the pizzas and sizes tables related?
-- What other tables are in the database?
-- How many unique toppings are there?
-- How many unique orders are in this dataset?
-- Which size of pizza is sold the most?
-- How many pizzas have been sold in total?
-- What is the most common size of pizza ordered?
-- What is the average number of pizzas per order?
-- Find the total price for each order. The total price is the sum of:

-- The price based on pizza size
-- Any modifiers that need to be charged for
-- The sum of the topping prices
-- Topping price is affected by the amount of the topping specified. A light amount is half of the regular price. An extra amount is 1.5 times the regular price, and double the topping is double the price.

-- Additional Questions:

-- What is the average price of pizzas that have no cheese?
-- What is the most common size for pizzas that have extra cheese?
-- What is the most common topping for pizzas that are well done?
-- How many pizzas are only cheese (i.e. have no toppings)?
-- How many orders consist of pizza(s) that are only cheese? What is the average price of these orders? The most common pizza size?
-- How many large pizzas have olives on them?
-- What is the average number of toppings per pizza?
-- What is the average number of pizzas per order?
-- What is the average pizza price?
-- What is the average order total?
-- What is the average number of items per order?
-- What is the average number of toppings per pizza for each size of pizza?
-- What is the average order total for orders that contain more than 1 pizza?
-- What is the most common pizza size for orders that contain only a single pizza?
-- How many orders consist of 3+ pizzas? What is the average number of toppings for these orders?
-- What is the most common topping on large and extra large pizzas?
-- What is the most common topping for orders that consist of 2 pizzas?
-- Which size of pizza most frequently has modifiers?
-- What percentage of pizzas with hot sauce have extra cheese?
-- What is the average order price for orders that have at least 1 pizza with pineapple?