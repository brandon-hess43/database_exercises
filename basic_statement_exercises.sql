-- Use the albums_db database.
use albums_db;
select database ();

-- What is the primary key for the albums table?
describe albums; # id

-- What does the column named 'name' represent?
SELECT * FROM albums_db.albums; # Album Name

-- What do you think the sales column represents?
# Gross sales in millions

-- Find the name of all albums by Pink Floyd.
SELECT * 
FROM albums
WHERE artist = 'Pink Floyd';
# 'The Dark Side of the Moon' and 'The Wall'

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT * FROM albums_db.albums; 
SELECT * 
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
# 1967

-- What is the genre for the album Nevermind?
SELECT * 
FROM albums
WHERE name = "Nevermind";
# Grunge, Alternative rock

-- Which albums were released in the 1990s?
SELECT name 
FROM albums
WHERE release_date >= 1990 AND release_date <= 1999;
/* 'The Bodyguard'
'Jagged Little Pill'
'Come On Over'
'Falling into You'
'Let\'s Talk About Love'
'Dangerous'
'The Immaculate Collection'
'Titanic: Music from the Motion Picture'
'Metallica'
'Nevermind'
'Supernatural' */

-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
SELECT * FROM albums_db.albums; 
SELECT name 
FROM albums
WHERE sales <= 20;
/* 'Grease: The Original Soundtrack from the Motion Picture'
'Bad'
'Sgt. Pepper\'s Lonely Hearts Club Band'
'Dirty Dancing'
'Let\'s Talk About Love'
'Dangerous'
'The Immaculate Collection'
'Abbey Road'
'Born in the U.S.A.'
'Brothers in Arms'
'Titanic: Music from the Motion Picture'
'Nevermind'
'The Wall' */

-- Rename this column as low_selling_albums.
SELECT name AS low_selling_albums
FROM albums
WHERE sales <= 20;




