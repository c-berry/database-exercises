USE codeup_test_db;

# a. =>
SELECT name AS 'All albums in the table.' FROM albums;
UPDATE albums
SET sales = sales * 10;
SELECT name, sales AS 'All albums in the table.' FROM albums;

# b. =>
SELECT name AS 'All albums released before 1980.' FROM albums WHERE release_date < 1980;
UPDATE albums
SET release_date = release_date - 100
WHERE release_date < 1980;
SELECT name, release_date AS 'All albums released in the 1800''s' FROM albums WHERE release_date < 1900;

# c. =>
SELECT name AS 'All albums by Michael Jackson' FROM albums WHERE artist = 'Michael Jackson';
UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';
SELECT name, artist AS 'All albums by Peter Jackson' FROM albums WHERE artist = 'Peter Jackson';